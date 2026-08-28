#!/usr/bin/env bash

set -u

usage() {
    printf 'Usage: %s [--draft] [--baseline <directory-or-git-ref>] <review-directory>\n' \
        "${0##*/}" >&2
}

failures=0
validation_mode=completion
baseline_spec=
temporary_baseline=

fail() {
    printf 'validate-review: ERROR: %s\n' "$*" >&2
    failures=$((failures + 1))
}

cleanup() {
    if [[ -n $temporary_baseline && -d $temporary_baseline ]]; then
        rm -rf -- "$temporary_baseline"
    fi
}
trap cleanup EXIT

while (($# > 0)); do
    case $1 in
        --draft)
            validation_mode=draft
            shift
            ;;
        --baseline)
            (($# >= 2)) || {
                usage
                exit 2
            }
            baseline_spec=$2
            shift 2
            ;;
        --)
            shift
            break
            ;;
        -*)
            usage
            exit 2
            ;;
        *)
            break
            ;;
    esac
done

if (($# != 1)); then
    usage
    exit 2
fi

review_dir=${1%/}
[[ -d $review_dir ]] || {
    printf 'validate-review: ERROR: not a directory: %s\n' "$review_dir" >&2
    exit 1
}

script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P) || exit 1
repository_root=$(CDPATH= cd -- "$script_dir/.." && pwd -P) || exit 1
review_abs=$(CDPATH= cd -- "$review_dir" && pwd -P) || exit 1
review_base=${review_abs##*/}

if [[ $review_base =~ ^(PRV-[0-9]{8}-[0-9]{3})-[a-z0-9]+(-[a-z0-9]+)*$ ]]; then
    review_id=${BASH_REMATCH[1]}
else
    fail "directory basename must be PRV-YYYYMMDD-NNN-short-name: $review_base"
    review_id=
fi

required_files=(
    scope.md
    report.md
    aspect-map.md
    chronology.md
    evidence-ledger.md
    attribution.md
    search-log.md
    inaccessible-resources.md
    publication-checklist.md
    HANDOFF.md
)

existing_files=()
for file_name in "${required_files[@]}"; do
    file_path=$review_abs/$file_name
    if [[ -f $file_path ]]; then
        existing_files+=("$file_path")
    else
        fail "missing required artifact: $file_name"
    fi
done

if ((${#existing_files[@]} == 0)); then
    fail "no review artifacts are available to validate"
    printf 'validate-review: FAILED with %d error(s)\n' "$failures" >&2
    exit 1
fi

metadata_value() {
    local file_path=$1
    local key=$2
    local line
    line=$(grep -F -- "$key: \`" "$file_path" | head -n 1)
    line=${line#"$key: \`"}
    line=${line%\`}
    printf '%s' "$line"
}

scope_file=$review_abs/scope.md
distribution=$(metadata_value "$scope_file" Distribution)
intended_distribution=$(metadata_value "$scope_file" "Intended distribution")
package_status=$(metadata_value "$scope_file" Status)
absolute_path_pattern='(^|[[:space:]`"'"'"'=<(])/[A-Za-z0-9._-]|file:/+'

case $distribution in
    private | internal | public-candidate) ;;
    '') fail "scope.md is missing an exact Distribution metadata line" ;;
    *) fail "invalid package distribution: $distribution" ;;
esac
case $intended_distribution in
    private | internal | public-candidate) ;;
    '') fail "scope.md is missing an exact Intended distribution metadata line" ;;
    *) fail "invalid intended distribution: $intended_distribution" ;;
esac
case $package_status in
    Draft | "In progress" | Complete) ;;
    '') fail "scope.md is missing an exact Status metadata line" ;;
    *) fail "invalid package status: $package_status" ;;
esac

for file_path in "${existing_files[@]}"; do
    file_name=${file_path##*/}

    for key in "Review ID" Distribution "Intended distribution" Status; do
        count=$(grep -c "^$key: " "$file_path" || true)
        ((count == 1)) ||
            fail "$file_name must contain exactly one $key metadata line"
    done

    if [[ -n $review_id ]] &&
        ! grep -Fqx -- "Review ID: \`$review_id\`" "$file_path"; then
        fail "$file_name does not contain the exact Review ID $review_id"
    fi
    if [[ -n $distribution ]] &&
        ! grep -Fqx -- "Distribution: \`$distribution\`" "$file_path"; then
        fail "$file_name does not contain the exact Distribution $distribution"
    fi
    if [[ -n $intended_distribution ]] &&
        ! grep -Fqx -- \
            "Intended distribution: \`$intended_distribution\`" "$file_path"; then
        fail "$file_name does not contain the exact intended distribution $intended_distribution"
    fi
    if [[ -n $package_status ]] &&
        ! grep -Fqx -- "Status: \`$package_status\`" "$file_path"; then
        fail "$file_name does not contain the exact Status $package_status"
    fi

    if grep -Eq '@@[A-Z][A-Z0-9_]*@@' "$file_path"; then
        fail "$file_name contains an unsubstituted template token"
    fi
    if grep -Eq "$absolute_path_pattern|[A-Za-z]:\\\\" \
        "$file_path"; then
        fail "$file_name contains an absolute workstation path"
    fi
    if grep -Eiq -- \
        '-----BEGIN ([A-Z ]+ )?PRIVATE KEY-----|github_pat_[A-Za-z0-9_]{10,}|gh[pousr]_[A-Za-z0-9]{20,}|AKIA[0-9A-Z]{16}|xox[baprs]-[A-Za-z0-9-]{10,}|(api[_-]?key|password|client_secret)[[:space:]]*=[[:space:]]*["'\''][^"'\'']+["'\'']' \
        "$file_path"; then
        fail "$file_name contains an obvious credential or sensitive-value pattern"
    fi
done

record_block() {
    local file_path=$1
    local record_id=$2
    awk -v header="## $record_id" '
        $0 == header {
            active = 1
            print
            next
        }
        active && /^## / {
            exit
        }
        active {
            print
        }
    ' "$file_path"
}

field_value() {
    local block=$1
    local field=$2
    printf '%s\n' "$block" |
        awk -v prefix="- $field: " '
            index($0, prefix) == 1 {
                print substr($0, length(prefix) + 1)
                exit
            }
        '
}

trim_value() {
    local value=$1
    value=${value#\`}
    value=${value%\`}
    value=${value#"${value%%[![:space:]]*}"}
    value=${value%"${value##*[![:space:]]}"}
    printf '%s' "$value"
}

declare -A evidence_set aspect_set chronology_set
mapfile -t evidence_ids < <(
    grep -E '^## PRV-[0-9]{8}-[0-9]{3}-E[0-9]{4}$' \
        "$review_abs/evidence-ledger.md" | sed 's/^## //'
)
mapfile -t aspect_ids < <(
    grep -E '^## ASPECT-[0-9]{3}$' "$review_abs/aspect-map.md" |
        sed 's/^## //'
)
mapfile -t chronology_ids < <(
    grep -E '^## CHRON-[0-9]{3}$' "$review_abs/chronology.md" |
        sed 's/^## //'
)

((${#evidence_ids[@]} > 0)) ||
    fail "evidence-ledger.md must contain review-scoped evidence records"
((${#aspect_ids[@]} > 0)) ||
    fail "aspect-map.md must contain ASPECT-NNN records"
((${#chronology_ids[@]} > 0)) ||
    fail "chronology.md must contain CHRON-NNN records"

for id in "${evidence_ids[@]}"; do
    evidence_set[$id]=1
    [[ -z $review_id || $id == "$review_id"-E[0-9][0-9][0-9][0-9] ]] ||
        fail "evidence ID belongs to another review: $id"
done
for id in "${aspect_ids[@]}"; do aspect_set[$id]=1; done
for id in "${chronology_ids[@]}"; do chronology_set[$id]=1; done

check_duplicates() {
    local label=$1
    shift
    local duplicates
    duplicates=$(printf '%s\n' "$@" | LC_ALL=C sort | uniq -d)
    [[ -z $duplicates ]] || fail "$label contains duplicate IDs: $duplicates"
}
check_duplicates "evidence-ledger.md" "${evidence_ids[@]}"
check_duplicates "aspect-map.md" "${aspect_ids[@]}"
check_duplicates "chronology.md" "${chronology_ids[@]}"

require_fields() {
    local file_path=$1
    local record_id=$2
    shift 2
    local block field value count observed_field known
    block=$(record_block "$file_path" "$record_id")

    while IFS= read -r observed_field; do
        [[ -n $observed_field ]] || continue
        known=0
        for field in "$@"; do
            if [[ $observed_field == "$field" ]]; then
                known=1
                break
            fi
        done
        ((known)) ||
            fail "${file_path##*/} $record_id contains unknown field '$observed_field'"
    done < <(
        printf '%s\n' "$block" |
            sed -n 's/^- \([^:][^:]*\):.*/\1/p'
    )

    for field in "$@"; do
        count=$(printf '%s\n' "$block" |
            awk -v prefix="- $field:" '
                index($0, prefix) == 1 {
                    count++
                }
                END {
                    print count + 0
                }
            ')
        if ((count != 1)); then
            fail "${file_path##*/} $record_id must contain exactly one '$field' field"
            continue
        fi
        value=$(trim_value "$(field_value "$block" "$field")")
        if [[ -z $value ]]; then
            fail "${file_path##*/} $record_id has an empty '$field' field"
        fi
    done
}

require_references() {
    local value=$1
    local kind=$2
    local context=$3
    local reference
    local -a references

    value=$(trim_value "$value")
    if [[ -z $value || $value == None || $value == "Not applicable" ]]; then
        fail "$context must contain actual $kind references"
        return
    fi
    IFS=',' read -r -a references <<<"$value"
    for reference in "${references[@]}"; do
        reference=$(trim_value "$reference")
        case $kind in
            evidence)
                if [[ -z $review_id ||
                    ! $reference =~ ^${review_id}-E[0-9]{4}$ ]]; then
                    fail "$context contains invalid review-scoped evidence reference: $reference"
                    continue
                fi
                [[ ${evidence_set[$reference]+present} ]] ||
                    fail "$context contains unresolved evidence reference: $reference"
                ;;
            aspect)
                if [[ ! $reference =~ ^ASPECT-[0-9]{3}$ ]]; then
                    fail "$context contains invalid aspect reference: $reference"
                    continue
                fi
                [[ ${aspect_set[$reference]+present} ]] ||
                    fail "$context contains unresolved aspect reference: $reference"
                ;;
            chronology)
                if [[ ! $reference =~ ^CHRON-[0-9]{3}$ ]]; then
                    fail "$context contains invalid chronology reference: $reference"
                    continue
                fi
                [[ ${chronology_set[$reference]+present} ]] ||
                    fail "$context contains unresolved chronology reference: $reference"
                ;;
        esac
    done
}

valid_locator_suffix() {
    local suffix=$1
    local component
    local -a components

    [[ -n $suffix && $suffix != /* && $suffix != ~ && $suffix != ~/* &&
        $suffix != */ &&
        $suffix != *//* && $suffix != *\\* &&
        $suffix =~ ^[[:print:]]+$ && ! $suffix =~ [[:cntrl:]] &&
        ! $suffix =~ ^[A-Za-z]: ]] || return 1
    IFS='/' read -r -a components <<<"$suffix"
    ((${#components[@]} > 0)) || return 1
    for component in "${components[@]}"; do
        [[ -n $component && $component != . && $component != .. &&
            ! $component =~ ^[A-Za-z]: ]] || return 1
    done
}

valid_logical_locator() {
    local locator scheme suffix source_class workspace_name workspace_rest
    locator=$(trim_value "$1")
    [[ -n $locator && $locator =~ ^[[:print:]]+$ &&
        ! $locator =~ [[:cntrl:]] && $locator != *\\* ]] || return 1

    if [[ $locator == *://* ]]; then
        scheme=${locator%%://*}
        suffix=${locator#*://}
        valid_locator_suffix "$suffix" || return 1
        case $scheme in
            target | inbox)
                return 0
                ;;
            source)
                [[ $suffix == */* ]] || return 1
                source_class=${suffix%%/*}
                case $source_class in public | quarantine) return 0 ;; esac
                return 1
                ;;
            workspace)
                [[ $suffix == */* ]] || return 1
                workspace_name=${suffix%%/*}
                workspace_rest=${suffix#*/}
                [[ -n $workspace_rest ]] || return 1
                case $workspace_name in
                    formal-verification-research|osr-claude|\
                    cheri-riscv-notes-repo|xrv-research-repo|\
                    helium-te-poc|beryllium-repo)
                        return 0
                        ;;
                esac
                return 1
                ;;
            *)
                return 1
                ;;
        esac
    fi

    valid_locator_suffix "$locator"
}

valid_target_locator() {
    local locator
    locator=$(trim_value "$1")
    [[ $locator == target://* ]] && valid_logical_locator "$locator"
}

evidence_fields=(
    Status
    "Aspect IDs"
    "Source type"
    "Evidentiary role"
    "Title/description"
    "Canonical locator"
    "Logical locator"
    "Commit/version/date"
    "Checked date"
    "Precise location"
    Relationship
    "Source ownership"
    Independence
    Confidence
    "Evidence basis"
    "Alternatives/counter-evidence"
    Limitations
    Sensitivity
    "Redistribution status"
    Licence
    Hash
    Supersedes
    "Superseded by"
    Administrative
)

non_administrative=0
for evidence_id in "${evidence_ids[@]}"; do
    require_fields "$review_abs/evidence-ledger.md" "$evidence_id" \
        "${evidence_fields[@]}"
    block=$(record_block "$review_abs/evidence-ledger.md" "$evidence_id")
    evidence_status=$(trim_value "$(field_value "$block" Status)")
    aspect_refs=$(field_value "$block" "Aspect IDs")
    source_type=$(trim_value "$(field_value "$block" "Source type")")
    evidentiary_role=$(trim_value "$(field_value "$block" "Evidentiary role")")
    ownership=$(trim_value "$(field_value "$block" "Source ownership")")
    independence=$(trim_value "$(field_value "$block" Independence)")
    confidence=$(trim_value "$(field_value "$block" Confidence)")
    sensitivity=$(trim_value "$(field_value "$block" Sensitivity)")
    redistribution=$(trim_value "$(field_value "$block" "Redistribution status")")
    hash_value=$(trim_value "$(field_value "$block" Hash)")
    supersedes=$(trim_value "$(field_value "$block" Supersedes)")
    superseded_by=$(trim_value "$(field_value "$block" "Superseded by")")
    administrative=$(trim_value "$(field_value "$block" Administrative)")
    logical_locator=$(field_value "$block" "Logical locator")

    case $evidence_status in active | superseded | withdrawn) ;; *)
        fail "evidence-ledger.md $evidence_id has invalid Status: $evidence_status"
    esac
    case $source_type in
        "review metadata"|\
        "target code or tracked target document"|\
        "target Git commit, blame, tag, branch, or diff"|\
        "target issue, pull request, discussion, prompt, or handoff"|\
        "dependency source, manifest, notice, or upstream history"|\
        "approved local research"|\
        "standard or specification"|\
        "paper, proceedings item, dataset, or replication artifact"|\
        "external repository or maintainer record"|\
        "mailing-list or archive record"|\
        "talk, slides, recording, or event record"|\
        "patent record"|\
        "vendor or project-controlled statement"|\
        "independent secondary source"|\
        "user-supplied or inaccessible resource metadata") ;;
        *) fail "evidence-ledger.md $evidence_id has invalid Source type: $source_type" ;;
    esac
    case $evidentiary_role in
        "administrative record"|\
        "direct implementation evidence"|\
        "implementation-authorship evidence"|\
        "repository chronology"|\
        "explicit source lineage"|\
        "documented influence"|\
        "dependency inheritance"|\
        "prior art"|\
        "adjacent precedent"|\
        "independent convergence"|\
        "counter-evidence"|\
        "negative search result"|\
        "unresolved lead") ;;
        *) fail "evidence-ledger.md $evidence_id has invalid Evidentiary role: $evidentiary_role" ;;
    esac
    case $ownership in
        project-controlled | affiliated | independent | unknown) ;;
        *) fail "evidence-ledger.md $evidence_id has invalid Source ownership: $ownership" ;;
    esac
    case $independence in
        independent | not-independent | partially-independent | unknown) ;;
        *) fail "evidence-ledger.md $evidence_id has invalid Independence: $independence" ;;
    esac
    case $confidence in High | Medium | Low) ;; *)
        fail "evidence-ledger.md $evidence_id has invalid Confidence: $confidence"
    esac
    case $sensitivity in public | internal | private | restricted) ;; *)
        fail "evidence-ledger.md $evidence_id has invalid Sensitivity: $sensitivity"
    esac
    case $redistribution in
        approved | not-approved | unknown | not-applicable) ;;
        *) fail "evidence-ledger.md $evidence_id has invalid Redistribution status: $redistribution" ;;
    esac
    case $administrative in
        yes) ;;
        no) non_administrative=$((non_administrative + 1)) ;;
        *) fail "evidence-ledger.md $evidence_id has invalid Administrative value: $administrative" ;;
    esac
    if [[ $hash_value != not-applicable &&
        ! $hash_value =~ ^sha256:[0-9a-f]{64}$ ]]; then
        fail "evidence-ledger.md $evidence_id has invalid Hash: $hash_value"
    fi
    locator_value=$(trim_value "$logical_locator")
    case $locator_value in
        source://public/* | source://quarantine/* | inbox://*)
            [[ $hash_value =~ ^sha256:[0-9a-f]{64}$ ]] ||
                fail "retained evidence $evidence_id requires a SHA-256 Hash"
            ;;
    esac
    valid_logical_locator "$logical_locator" ||
        fail "evidence-ledger.md $evidence_id has invalid Logical locator: $(trim_value "$logical_locator")"
    require_references "$aspect_refs" aspect \
        "evidence-ledger.md $evidence_id Aspect IDs"

    for link_name in Supersedes "Superseded by"; do
        link=$(trim_value "$(field_value "$block" "$link_name")")
        if [[ $link != None ]]; then
            if [[ -z $review_id || ! $link =~ ^${review_id}-E[0-9]{4}$ ]]; then
                fail "evidence-ledger.md $evidence_id has invalid $link_name link: $link"
            elif [[ ! ${evidence_set[$link]+present} ]]; then
                fail "evidence-ledger.md $evidence_id has unresolved $link_name link: $link"
            fi
            [[ $link != "$evidence_id" ]] ||
                fail "evidence-ledger.md $evidence_id cannot link $link_name to itself"
        fi
    done
    if [[ $evidence_status == active && $superseded_by != None ]]; then
        fail "active evidence $evidence_id cannot have a Superseded by link"
    fi
    if [[ $evidence_status == superseded && $superseded_by == None ]]; then
        fail "superseded evidence $evidence_id requires a Superseded by link"
    fi

    if [[ $validation_mode == completion &&
        $distribution == public-candidate ]]; then
        [[ $sensitivity == public ]] ||
            fail "public-candidate evidence $evidence_id must have public Sensitivity"
        case $redistribution in approved | not-applicable) ;; *)
            fail "public-candidate evidence $evidence_id lacks approved or not-applicable redistribution"
        esac
        [[ $(trim_value "$(field_value "$block" Licence)") != unknown ]] ||
            fail "public-candidate evidence $evidence_id cannot retain unknown Licence"
    fi
done

for evidence_id in "${evidence_ids[@]}"; do
    block=$(record_block "$review_abs/evidence-ledger.md" "$evidence_id")
    supersedes=$(trim_value "$(field_value "$block" Supersedes)")
    superseded_by=$(trim_value "$(field_value "$block" "Superseded by")")
    if [[ $supersedes != None &&
        $supersedes =~ ^${review_id}-E[0-9]{4}$ ]]; then
        if [[ ${evidence_set[$supersedes]+present} ]]; then
            linked_block=$(record_block "$review_abs/evidence-ledger.md" "$supersedes")
            reverse_link=$(trim_value "$(field_value "$linked_block" "Superseded by")")
            [[ $reverse_link == "$evidence_id" ]] ||
                fail "supersession link is not symmetric: $evidence_id supersedes $supersedes"
        fi
    fi
    if [[ $superseded_by != None &&
        $superseded_by =~ ^${review_id}-E[0-9]{4}$ ]]; then
        if [[ ${evidence_set[$superseded_by]+present} ]]; then
            linked_block=$(record_block "$review_abs/evidence-ledger.md" "$superseded_by")
            reverse_link=$(trim_value "$(field_value "$linked_block" Supersedes)")
            [[ $reverse_link == "$evidence_id" ]] ||
                fail "supersession link is not symmetric: $evidence_id superseded by $superseded_by"
        fi
    fi
done

aspect_fields=(
    Title
    Description
    "Code paths/symbols"
    "Behavior/claims"
    Dependencies
    "Tests/documentation"
    "Evidence IDs"
    Confidence
    "Evidence basis"
    "Alternatives/counter-evidence"
    Limitations
)
for aspect_id in "${aspect_ids[@]}"; do
    require_fields "$review_abs/aspect-map.md" "$aspect_id" "${aspect_fields[@]}"
    block=$(record_block "$review_abs/aspect-map.md" "$aspect_id")
    require_references "$(field_value "$block" "Evidence IDs")" evidence \
        "aspect-map.md $aspect_id Evidence IDs"
    confidence=$(trim_value "$(field_value "$block" Confidence)")
    case $confidence in High | Medium | Low) ;; *)
        fail "aspect-map.md $aspect_id has invalid Confidence: $confidence"
    esac
done

chronology_fields=(
    Date
    Event
    "Aspect IDs"
    "Evidence IDs"
    Relationship
    Confidence
    "Evidence basis"
    "Alternatives/counter-evidence"
    Limitations
)
for chronology_id in "${chronology_ids[@]}"; do
    require_fields "$review_abs/chronology.md" "$chronology_id" \
        "${chronology_fields[@]}"
    block=$(record_block "$review_abs/chronology.md" "$chronology_id")
    require_references "$(field_value "$block" "Aspect IDs")" aspect \
        "chronology.md $chronology_id Aspect IDs"
    require_references "$(field_value "$block" "Evidence IDs")" evidence \
        "chronology.md $chronology_id Evidence IDs"
    confidence=$(trim_value "$(field_value "$block" Confidence)")
    case $confidence in High | Medium | Low) ;; *)
        fail "chronology.md $chronology_id has invalid Confidence: $confidence"
    esac
done

validate_record_file() {
    local file_name=$1
    local id_pattern=$2
    shift 2
    local file_path=$review_abs/$file_name
    local -a ids
    mapfile -t ids < <(grep -E "^## $id_pattern$" "$file_path" | sed 's/^## //')
    ((${#ids[@]} > 0)) || {
        fail "$file_name must contain at least one record"
        return
    }
    check_duplicates "$file_name" "${ids[@]}"
    for record_id in "${ids[@]}"; do
        require_fields "$file_path" "$record_id" "$@"
    done
}

validate_record_file report.md 'OBS-[0-9]{3}' \
    Observation "Aspect IDs" "Evidence IDs" "Chronology IDs" Confidence \
    "Evidence basis" "Alternatives/counter-evidence" Limitations
validate_record_file attribution.md 'ATTRIBUTION-[0-9]{3}' \
    Classification "Specific contribution" "Candidate source or contributor" \
    "Aspect IDs" "Evidence IDs" Confidence "Evidence basis" \
    "Credit recommendation" "Alternatives/counter-evidence" Limitations
validate_record_file search-log.md 'SEARCH-[0-9]{3}' \
    Date Pass "Aspect IDs" "Query or action" "Sources searched" Result \
    "Evidence IDs" "Negative result" "Terminology collisions" Limitations
validate_record_file inaccessible-resources.md 'INACCESSIBLE-[0-9]{3}' \
    Resource "Canonical locator" "Logical locator" "Source category" \
    "Aspect IDs" Relevance "Access result" "Date checked" \
    "Alternatives checked" Priority "What a user-provided copy could confirm" \
    "Evidence IDs" Confidence "Evidence basis" Limitations Sensitivity \
    "Redistribution status"

for file_name in report.md attribution.md search-log.md \
    inaccessible-resources.md; do
    file_path=$review_abs/$file_name
    mapfile -t ids < <(grep -E '^## [A-Z]+-[0-9]{3}$' "$file_path" |
        sed 's/^## //')
    for record_id in "${ids[@]}"; do
        block=$(record_block "$file_path" "$record_id")
        require_references "$(field_value "$block" "Aspect IDs")" aspect \
            "$file_name $record_id Aspect IDs"
        require_references "$(field_value "$block" "Evidence IDs")" evidence \
            "$file_name $record_id Evidence IDs"
        if [[ $file_name == report.md ]]; then
            require_references "$(field_value "$block" "Chronology IDs")" \
                chronology "$file_name $record_id Chronology IDs"
        fi
        confidence=$(trim_value "$(field_value "$block" Confidence)")
        if [[ -n $confidence ]]; then
            case $confidence in High | Medium | Low) ;; *)
                fail "$file_name $record_id has invalid Confidence: $confidence"
            esac
        fi
        if [[ $file_name == attribution.md ]]; then
            classification=$(trim_value "$(field_value "$block" Classification)")
            case $classification in
                "verified source lineage"|\
                "documented influence"|\
                "strong prior-art relationship"|\
                "adjacent precedent"|\
                "independent convergence"|\
                unresolved) ;;
                *) fail "attribution.md $record_id has invalid Classification: $classification" ;;
            esac
        fi
        if [[ $file_name == inaccessible-resources.md ]]; then
            access_result=$(trim_value "$(field_value "$block" "Access result")")
            priority=$(trim_value "$(field_value "$block" Priority)")
            sensitivity=$(trim_value "$(field_value "$block" Sensitivity)")
            redistribution=$(trim_value "$(field_value "$block" "Redistribution status")")
            logical_locator=$(field_value "$block" "Logical locator")
            case $priority in high | medium | low | none) ;; *)
                fail "inaccessible-resources.md $record_id has invalid Priority: $priority"
            esac
            case $access_result in
                "authentication required"|\
                paywall|\
                "robots restriction"|\
                removed|\
                unavailable*|\
                timeout|\
                "network-policy denial"|\
                "unsupported format") ;;
                "No access attempt has been made.")
                    [[ $validation_mode == draft ]] ||
                        fail "completed inaccessible-resource record cannot retain initialization access status"
                    ;;
                *) fail "inaccessible-resources.md $record_id has invalid Access result: $access_result" ;;
            esac
            case $sensitivity in public | internal | private | restricted) ;; *)
                fail "inaccessible-resources.md $record_id has invalid Sensitivity: $sensitivity"
            esac
            case $redistribution in
                approved | not-approved | unknown | not-applicable) ;;
                *) fail "inaccessible-resources.md $record_id has invalid Redistribution status: $redistribution" ;;
            esac
            valid_logical_locator "$logical_locator" ||
                fail "inaccessible-resources.md $record_id has invalid Logical locator: $(trim_value "$logical_locator")"
            if [[ $validation_mode == completion &&
                $distribution == public-candidate ]]; then
                [[ $sensitivity == public ]] ||
                    fail "public-candidate inaccessible source $record_id must have public Sensitivity"
                case $redistribution in approved | not-applicable) ;; *)
                    fail "public-candidate inaccessible source $record_id lacks approved or not-applicable redistribution"
                esac
            fi
        fi
    done
done

publication_file=$review_abs/publication-checklist.md
validate_record_file publication-checklist.md 'PUBLICATION-[0-9]{3}' \
    "Publication decision" "Licensing decision" "Sign-off decision" \
    "Human promotion record" "Aspect IDs" "Evidence IDs" Confidence \
    "Evidence basis" "Alternatives/counter-evidence" Limitations
mapfile -t publication_ids < <(
    grep -E '^## PUBLICATION-[0-9]{3}$' "$publication_file" | sed 's/^## //'
)
(( ${#publication_ids[@]} == 1 )) ||
    fail "publication-checklist.md must contain exactly one PUBLICATION-NNN record"

promotion_fields=(
    "Actor/role"
    "UTC timestamp"
    "From classification"
    "To classification"
    Decision
    "Checklist basis"
    "Evidence IDs"
    Limitations
)
mapfile -t promotion_ids < <(
    grep -E '^## HUMAN-PROMOTION-[0-9]{3}$' "$publication_file" |
        sed 's/^## //'
)
check_duplicates "publication-checklist.md promotion records" \
    "${promotion_ids[@]}"
declare -A promotion_set
for promotion_id in "${promotion_ids[@]}"; do
    promotion_set[$promotion_id]=1
    require_fields "$publication_file" "$promotion_id" \
        "${promotion_fields[@]}"
    promotion_block=$(record_block "$publication_file" "$promotion_id")
    promotion_actor=$(trim_value \
        "$(field_value "$promotion_block" "Actor/role")")
    promotion_timestamp=$(trim_value \
        "$(field_value "$promotion_block" "UTC timestamp")")
    promotion_from=$(trim_value \
        "$(field_value "$promotion_block" "From classification")")
    promotion_to=$(trim_value \
        "$(field_value "$promotion_block" "To classification")")
    promotion_decision=$(trim_value \
        "$(field_value "$promotion_block" Decision)")

    [[ $promotion_timestamp =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}Z$ ]] ||
        fail "publication-checklist.md $promotion_id requires a UTC timestamp"
    case $promotion_from in private | internal) ;; *)
        fail "publication-checklist.md $promotion_id has invalid From classification: $promotion_from"
    esac
    case $promotion_to in internal | public-candidate) ;; *)
        fail "publication-checklist.md $promotion_id has invalid To classification: $promotion_to"
    esac
    [[ $promotion_from != "$promotion_to" ]] ||
        fail "publication-checklist.md $promotion_id must change classification"
    [[ $promotion_decision == promote ]] ||
        fail "publication-checklist.md $promotion_id Decision must be promote"
    if [[ $promotion_actor =~ [Aa]gent|[Mm]odel|[Bb]ot ]]; then
        fail "publication-checklist.md $promotion_id Actor/role must identify a human role"
    fi
    require_references "$(field_value "$promotion_block" "Evidence IDs")" \
        evidence "publication-checklist.md $promotion_id Evidence IDs"
done

promotion_checkboxes=(
    "Scope and exact target revision are confirmed."
    "Evidence sensitivity and redistribution status are reviewed."
    "Citations, alternatives, chronology, confidence, and limitations are verified."
    "Restricted, private, licensed, and user-supplied material is excluded or cleared."
    "A responsible human has separately reviewed the proposed promotion."
)

for publication_id in "${publication_ids[@]}"; do
    block=$(record_block "$publication_file" "$publication_id")
    for decision_field in "Publication decision" "Licensing decision" \
        "Sign-off decision"; do
        decision=$(trim_value "$(field_value "$block" "$decision_field")")
        case $decision in pending | blocked | not-requested) ;; *)
            fail "publication-checklist.md $publication_id has unsafe $decision_field: $decision"
        esac
    done
    require_references "$(field_value "$block" "Aspect IDs")" aspect \
        "publication-checklist.md $publication_id Aspect IDs"
    require_references "$(field_value "$block" "Evidence IDs")" evidence \
        "publication-checklist.md $publication_id Evidence IDs"
    confidence=$(trim_value "$(field_value "$block" Confidence)")
    case $confidence in High | Medium | Low) ;; *)
        fail "publication-checklist.md $publication_id has invalid Confidence: $confidence"
    esac
    promotion_record=$(trim_value "$(field_value "$block" "Human promotion record")")
    if [[ $validation_mode == completion && $distribution != private ]]; then
        [[ $promotion_record =~ ^HUMAN-PROMOTION-[0-9]{3}$ ]] ||
            fail "completed promoted package requires a structured human promotion record"
        if [[ $promotion_record =~ ^HUMAN-PROMOTION-[0-9]{3}$ ]]; then
            if [[ ! ${promotion_set[$promotion_record]+present} ]]; then
                fail "Human promotion record does not resolve: $promotion_record"
            else
                promotion_block=$(record_block "$publication_file" \
                    "$promotion_record")
                promotion_to=$(trim_value \
                    "$(field_value "$promotion_block" "To classification")")
                [[ $promotion_to == "$distribution" ]] ||
                    fail "Distribution $distribution does not match $promotion_record To classification $promotion_to"
            fi
        fi
        [[ $intended_distribution == "$distribution" ]] ||
            fail "promoted package Distribution must match Intended distribution"
        for checkbox in "${promotion_checkboxes[@]}"; do
            grep -Fqx -- "- [x] $checkbox" "$publication_file" ||
                fail "promotion prerequisite is not checked: $checkbox"
        done
    fi
    if [[ $validation_mode == completion &&
        $distribution == public-candidate ]]; then
        publication_decision=$(trim_value "$(field_value "$block" "Publication decision")")
        [[ $publication_decision == pending ]] ||
            fail "public-candidate publication decision must remain pending"
    fi
done

if grep -Eiq \
    '^- (Publication decision|Licensing decision|Sign-off decision):[[:space:]]*Approved[[:space:]]*$' \
    "$publication_file"; then
    fail "publication checklist must never contain agent-generated Approved decisions"
fi

scope_block=$(record_block "$scope_file" SCOPE-001)
scope_fields=(
    "Target identity"
    "Target state"
    "Target revision/state descriptor"
    "Aspect IDs"
    Exclusions
    "Chronology window"
    Depth
    "Public research"
    "Public query permission"
    "Public query terms"
    Limitations
)
require_fields "$scope_file" SCOPE-001 "${scope_fields[@]}"
require_references "$(field_value "$scope_block" "Aspect IDs")" aspect \
    "scope.md SCOPE-001 Aspect IDs"

target_state=$(trim_value "$(field_value "$scope_block" "Target state")")
depth=$(trim_value "$(field_value "$scope_block" Depth)")
public_research=$(trim_value "$(field_value "$scope_block" "Public research")")
public_query_permission=$(trim_value "$(field_value "$scope_block" "Public query permission")")
case $target_state in
    "exact revision" | "approved working tree") ;;
    "not yet supplied") [[ $validation_mode == draft ]] ||
        fail "completion requires an exact revision or approved working-tree state" ;;
    *) fail "scope.md SCOPE-001 has invalid Target state: $target_state" ;;
esac
case $depth in Focused | Standard | Deep) ;; "not yet supplied")
    [[ $validation_mode == draft ]] || fail "completion requires a review depth" ;;
    *) fail "scope.md SCOPE-001 has invalid Depth: $depth" ;;
esac
case $public_research in permitted | not-permitted) ;; "not yet supplied")
    [[ $validation_mode == draft ]] ||
        fail "completion requires a public-research permission" ;;
    *) fail "scope.md SCOPE-001 has invalid Public research value: $public_research" ;;
esac
case $public_query_permission in permitted | not-permitted) ;;
    "not yet supplied") [[ $validation_mode == draft ]] ||
        fail "completion requires a public-query permission" ;;
    *) fail "scope.md SCOPE-001 has invalid Public query permission: $public_query_permission" ;;
esac

phase_fields=(
    "Scope freeze"
    "Aspect decomposition"
    "Internal lineage"
    "Local research"
    "Public landscape"
    "Deep provenance"
    Falsification
    "Attribution assessment"
    "Durable output"
)
phases_block=$(record_block "$scope_file" PHASES-001)
require_fields "$scope_file" PHASES-001 "${phase_fields[@]}"
for phase_field in "${phase_fields[@]}"; do
    phase_value=$(trim_value "$(field_value "$phases_block" "$phase_field")")
    if [[ $validation_mode == draft &&
        $phase_value != Incomplete && $phase_value != Complete &&
        ! $phase_value =~ ^Not[[:space:]]applicable[[:space:]]-[[:space:]].+ ]]; then
        fail "scope.md PHASES-001 has invalid phase value for $phase_field: $phase_value"
    fi
done

if [[ $validation_mode == completion ]]; then
    for core_phase in "Scope freeze" "Aspect decomposition" \
        "Internal lineage" Falsification "Attribution assessment" \
        "Durable output"; do
        core_value=$(trim_value "$(field_value "$phases_block" "$core_phase")")
        [[ $core_value == Complete ]] ||
            fail "completion requires core phase '$core_phase' to be exactly Complete"
    done

    local_research_value=$(trim_value \
        "$(field_value "$phases_block" "Local research")")
    if [[ $local_research_value != Complete &&
        ! $local_research_value =~ ^Not[[:space:]]applicable[[:space:]]-[[:space:]].*(local[[:space:]]inputs?.*(not[[:space:]]relevant|not[[:space:]]available|unavailable)|(not[[:space:]]relevant|not[[:space:]]available|unavailable).*(local[[:space:]]inputs?)) ]]; then
        fail "Local research must be Complete or reasoned N/A because local inputs are not relevant or available"
    fi

    public_landscape_value=$(trim_value \
        "$(field_value "$phases_block" "Public landscape")")
    if [[ $public_research == permitted ]]; then
        [[ $public_landscape_value == Complete ]] ||
            fail "Public landscape must be Complete when Public research is permitted"
        [[ $public_query_permission == permitted ]] ||
            fail "Public query permission must be permitted when Public research is permitted"
    else
        [[ $public_landscape_value =~ ^Not[[:space:]]applicable[[:space:]]-[[:space:]].+ ]] ||
            fail "Public landscape must be reasoned N/A when Public research is not permitted"
        [[ $public_query_permission == not-permitted ]] ||
            fail "Public query permission must be not-permitted when Public research is not permitted"
    fi

    deep_provenance_value=$(trim_value \
        "$(field_value "$phases_block" "Deep provenance")")
    if [[ $depth == Deep ]]; then
        [[ $deep_provenance_value == Complete ]] ||
            fail "Deep provenance must be Complete for Deep review depth"
    elif [[ $deep_provenance_value != Complete &&
        ! $deep_provenance_value =~ ^Not[[:space:]]applicable[[:space:]]-[[:space:]].+ ]]; then
        fail "Deep provenance may be N/A only with a reason when depth does not require it"
    fi

    [[ $package_status == Complete ]] ||
        fail "completion validation requires Status: Complete"
    ((non_administrative > 0)) ||
        fail "completion requires at least one non-administrative evidence record"
    if grep -Eiq \
        'Not yet supplied|Review setup only|Analysis has not started|No search performed|None assessed|at review creation' \
        "${existing_files[@]}"; then
        fail "completion contains scaffold placeholder or setup-only values"
    fi
    target_identity=$(trim_value "$(field_value "$scope_block" "Target identity")")
    target_descriptor=$(trim_value "$(field_value "$scope_block" "Target revision/state descriptor")")
    chronology_window=$(trim_value "$(field_value "$scope_block" "Chronology window")")
    [[ ! $target_identity =~ ^(not[[:space:]]yet[[:space:]]supplied|None|unknown|TBD|N/A)$ ]] ||
        fail "completion requires an exact target identity"
    valid_target_locator "$target_identity" ||
        fail "completion Target identity must be a valid target:// logical locator"
    [[ ! $target_descriptor =~ ^(not[[:space:]]yet[[:space:]]supplied|None|unknown|TBD|N/A)$ ]] ||
        fail "completion requires an exact target revision/state descriptor"
    [[ ! $chronology_window =~ ^(not[[:space:]]yet[[:space:]]supplied|None|unknown|TBD|N/A)$ ]] ||
        fail "completion requires a chronology window"
    public_query_terms=$(trim_value "$(field_value "$scope_block" "Public query terms")")
    if [[ $public_query_permission == permitted &&
        $public_query_terms =~ ^(None|unknown|TBD|N/A|No[[:space:]]public[[:space:]]terms[[:space:]]authorized\.)$ ]]; then
        fail "permitted public queries require explicit sanitized query terms"
    fi
fi

export_git_baseline() {
    local ref=$1
    local review_relative file_name
    [[ $ref != -* && $ref =~ ^[A-Za-z0-9._/@{}^~:+-]+$ ]] ||
        {
            fail "invalid Git baseline ref: $ref"
            return 1
        }
    case $review_abs in
        "$repository_root"/*) review_relative=${review_abs#"$repository_root"/} ;;
        *)
            fail "Git baseline comparison requires a review inside this repository"
            return 1
            ;;
    esac
    git -C "$repository_root" rev-parse --verify "$ref^{commit}" >/dev/null 2>&1 ||
        {
            fail "Git baseline ref does not resolve to a commit: $ref"
            return 1
        }
    mkdir -p -- "$repository_root/.test-output" || return 1
    temporary_baseline=$(mktemp -d \
        "$repository_root/.test-output/validate-review-baseline.XXXXXX") ||
        return 1
    for file_name in "${required_files[@]}"; do
        git -C "$repository_root" show \
            "$ref:$review_relative/$file_name" \
            >"$temporary_baseline/$file_name" 2>/dev/null ||
            {
                fail "baseline ref lacks $review_relative/$file_name"
                return 1
            }
    done
    baseline_dir=$temporary_baseline
}

compare_record_file() {
    local baseline_dir=$1
    local file_name=$2
    local id_pattern=$3
    local baseline_file=$baseline_dir/$file_name
    local current_file=$review_abs/$file_name
    local -a baseline_ids
    local id old_block new_block old_status new_status old_superseded_by
    local new_superseded_by normalized_new

    [[ -f $baseline_file ]] || {
        fail "baseline is missing $file_name"
        return
    }
    mapfile -t baseline_ids < <(
        grep -E "^## $id_pattern$" "$baseline_file" | sed 's/^## //'
    )
    for id in "${baseline_ids[@]}"; do
        grep -Fqx -- "## $id" "$current_file" ||
            {
                fail "append-only baseline record was removed: $file_name $id"
                continue
            }
        old_block=$(record_block "$baseline_file" "$id")
        new_block=$(record_block "$current_file" "$id")
        if [[ $old_block == "$new_block" ]]; then
            continue
        fi
        if [[ $file_name != evidence-ledger.md ]]; then
            fail "append-only baseline record was modified: $file_name $id"
            continue
        fi

        old_status=$(trim_value "$(field_value "$old_block" Status)")
        new_status=$(trim_value "$(field_value "$new_block" Status)")
        old_superseded_by=$(trim_value \
            "$(field_value "$old_block" "Superseded by")")
        new_superseded_by=$(trim_value \
            "$(field_value "$new_block" "Superseded by")")

        if [[ $old_status == active && $new_status == withdrawn &&
            $old_superseded_by == None && $new_superseded_by == None ]]; then
            normalized_new=$(printf '%s\n' "$new_block" |
                sed 's/^- Status: withdrawn$/- Status: active/')
            [[ $normalized_new == "$old_block" ]] ||
                fail "withdrawal modified baseline evidence beyond Status: $id"
            continue
        fi

        if [[ $old_status == active && $new_status == superseded &&
            $old_superseded_by == None &&
            $new_superseded_by =~ ^${review_id}-E[0-9]{4}$ ]]; then
            if [[ ! ${evidence_set[$new_superseded_by]+present} ]]; then
                fail "baseline evidence $id has an unresolved Superseded by transition"
                continue
            fi
            if grep -Fqx -- "## $new_superseded_by" "$baseline_file"; then
                fail "baseline evidence $id must be superseded by a newly appended evidence ID"
                continue
            fi
            normalized_new=$(printf '%s\n' "$new_block" |
                sed \
                    -e 's/^- Status: superseded$/- Status: active/' \
                    -e "s/^- Superseded by: $new_superseded_by\$/- Superseded by: None/")
            [[ $normalized_new == "$old_block" ]] ||
                fail "supersession modified baseline evidence beyond Status and Superseded by: $id"
            continue
        fi

        fail "append-only baseline record has an invalid transition: $file_name $id"
    done
}

if [[ -n $baseline_spec ]]; then
    if [[ -d $baseline_spec ]]; then
        baseline_dir=$(CDPATH= cd -- "$baseline_spec" && pwd -P)
    else
        baseline_dir=
        export_git_baseline "$baseline_spec"
    fi
    if [[ -n ${baseline_dir:-} && -d $baseline_dir ]]; then
        compare_record_file "$baseline_dir" evidence-ledger.md \
            'PRV-[0-9]{8}-[0-9]{3}-E[0-9]{4}'
        compare_record_file "$baseline_dir" chronology.md 'CHRON-[0-9]{3}'
        compare_record_file "$baseline_dir" search-log.md 'SEARCH-[0-9]{3}'
        compare_record_file "$baseline_dir" inaccessible-resources.md \
            'INACCESSIBLE-[0-9]{3}'
        compare_record_file "$baseline_dir" report.md 'OBS-[0-9]{3}'
        compare_record_file "$baseline_dir" attribution.md \
            'ATTRIBUTION-[0-9]{3}'
        while IFS= read -r activity_line; do
            [[ -z $activity_line ]] && continue
            grep -Fqx -- "$activity_line" "$scope_file" ||
                fail "append-only activity entry was removed or modified: $activity_line"
        done < <(grep -E '^\| ACTIVITY-[0-9]{3} \|' \
            "$baseline_dir/scope.md" || true)
    fi
else
    printf '%s\n' \
        'validate-review: NOTE: append-only history integrity was not compared; use --baseline <directory-or-git-ref> or review Git history.' \
        >&2
fi

if ((failures > 0)); then
    printf 'validate-review: FAILED with %d error(s): %s\n' \
        "$failures" "$review_abs" >&2
    exit 1
fi

printf 'validate-review: OK (%s): %s\n' "$validation_mode" "$review_abs"
