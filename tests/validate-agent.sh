#!/usr/bin/env bash

set -u

script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P) || exit 1
repository_root=$(CDPATH= cd -- "$script_dir/.." && pwd -P) || exit 1
test_root=$repository_root/.test-output/validate-agent
failures=0

fail() {
    printf 'validate-agent: ERROR: %s\n' "$*" >&2
    failures=$((failures + 1))
}

require_file() {
    local relative_path=$1
    [[ -f $repository_root/$relative_path ]] ||
        fail "missing required file: $relative_path"
}

require_text() {
    local relative_path=$1
    local text=$2
    if [[ ! -f $repository_root/$relative_path ]] ||
        ! grep -Fq -- "$text" "$repository_root/$relative_path"; then
        fail "$relative_path must contain: $text"
    fi
}

expect_failure() {
    local description=$1
    local expected_text=$2
    shift 2
    local output
    if output=$("$@" 2>&1); then
        fail "$description unexpectedly succeeded"
    elif [[ -n $expected_text ]] &&
        ! printf '%s\n' "$output" | grep -Fq -- "$expected_text"; then
        fail "$description did not report: $expected_text"
    fi
}

copy_fixture() {
    local destination_parent=$1
    mkdir -p -- "$destination_parent" || return 1
    cp -R -- "$fixture" "$destination_parent/" || return 1
    printf '%s/%s' "$destination_parent" "${fixture##*/}"
}

promote_fixture() {
    local review_path=$1
    local target_distribution=$2
    local publication_file=$review_path/publication-checklist.md

    find "$review_path" -type f -name '*.md' -exec \
        sed -i \
            -e "s/^Distribution: \`private\`\$/Distribution: \`$target_distribution\`/" \
            -e "s/^Intended distribution: \`private\`\$/Intended distribution: \`$target_distribution\`/" \
            {} +
    sed -i \
        -e 's/^- \[ \] Scope and exact target revision are confirmed\.$/- [x] Scope and exact target revision are confirmed./' \
        -e 's/^- \[ \] Evidence sensitivity and redistribution status are reviewed\.$/- [x] Evidence sensitivity and redistribution status are reviewed./' \
        -e 's/^- \[ \] Citations, alternatives, chronology, confidence, and limitations are verified\.$/- [x] Citations, alternatives, chronology, confidence, and limitations are verified./' \
        -e 's/^- \[ \] Restricted, private, licensed, and user-supplied material is excluded or cleared\.$/- [x] Restricted, private, licensed, and user-supplied material is excluded or cleared./' \
        -e 's/^- \[ \] A responsible human has separately reviewed the proposed promotion\.$/- [x] A responsible human has separately reviewed the proposed promotion./' \
        -e 's/^- Human promotion record: None$/- Human promotion record: HUMAN-PROMOTION-001/' \
        "$publication_file"
    if [[ $target_distribution == public-candidate ]]; then
        sed -i \
            's/^- Publication decision: not-requested$/- Publication decision: pending/' \
            "$publication_file"
    fi
    cat >>"$publication_file" <<EOF

## HUMAN-PROMOTION-001

- Actor/role: Synthetic responsible human reviewer
- UTC timestamp: 2000-01-01T00:00:00Z
- From classification: private
- To classification: $target_distribution
- Decision: promote
- Checklist basis: Every structured promotion prerequisite is checked in this synthetic test.
- Evidence IDs: PRV-20000101-001-E0001
- Limitations: Synthetic promotion metadata grants no publication or licensing approval.
EOF
}

transition_evidence() {
    local ledger=$1
    local evidence_id=$2
    local new_status=$3
    local superseded_by=$4
    awk -v header="## $evidence_id" \
        -v new_status="$new_status" \
        -v superseded_by="$superseded_by" '
        $0 == header {
            active = 1
            print
            next
        }
        active && /^## / {
            active = 0
        }
        active && /^- Status: / {
            print "- Status: " new_status
            next
        }
        active && /^- Superseded by: / {
            print "- Superseded by: " superseded_by
            next
        }
        {
            print
        }
    ' "$ledger" >"$ledger.tmp" &&
        mv -- "$ledger.tmp" "$ledger"
}

append_superseding_evidence() {
    local ledger=$1
    cat >>"$ledger" <<'EOF'

## PRV-20000101-001-E0004

- Status: active
- Aspect IDs: ASPECT-001
- Source type: target code or tracked target document
- Evidentiary role: direct implementation evidence
- Title/description: Corrected fictional boundary marker target record.
- Canonical locator: fixture:corrected-synthetic-boundary-marker
- Logical locator: `target://synthetic-fixture/corrected-marker.txt`
- Commit/version/date: synthetic-revision-0002
- Checked date: 2000-01-02
- Precise location: corrected-marker.txt line 1 fixture_boundary
- Relationship: Supersedes the earlier synthetic marker evidence.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: High
- Evidence basis: The fixture intentionally defines a corrected marker record.
- Alternatives/counter-evidence: The correction remains arbitrary synthetic text.
- Limitations: It has no evidentiary value outside validator testing.
- Sensitivity: private
- Redistribution status: not-approved
- Licence: fixture-only; no redistribution approval
- Hash: not-applicable
- Supersedes: PRV-20000101-001-E0002
- Superseded by: None
- Administrative: no
EOF
}

append_prior_art_iteration() {
    local summary=$1
    local iteration_id=$2
    local iteration_date=$3
    local supersedes=$4
    local evidence_id=${5:-PRV-20000101-001-E0002}
    cat >>"$summary" <<EOF

## $iteration_id

- Date: $iteration_date
- Supersedes: $supersedes
- Change reason: Synthetic appended iteration.
- Bottom line: The fixture still records only a fictional predecessor relationship.
- Implementation lineage: The synthetic marker is defined by the fixture rather than inherited from real code.
- Documented influence: None documented.
- Distinct or unresolved: No real conceptual-origin question is resolved.
- Credit framing: Credit only the synthetic fixture author for the test record.
- Aspect IDs: ASPECT-001
- Evidence IDs: $evidence_id
- Chronology IDs: CHRON-001
- Confidence: High
- Evidence basis: The fixture intentionally defines the marker and chronology.
- Alternatives/counter-evidence: Any arbitrary fixture text could exercise the same contract.
- Limitations: Synthetic evidence cannot establish real provenance.
- Administrative: no
EOF
}

refresh_prior_art_after_supersession() {
    local summary=$1
    awk '
        BEGIN {
            before_iterations = 1
        }
        /^## PRIOR-ART-ITERATION-001$/ {
            before_iterations = 0
        }
        before_iterations && /^Latest iteration: `PRIOR-ART-ITERATION-001`$/ {
            print "Latest iteration: `PRIOR-ART-ITERATION-002`"
            next
        }
        before_iterations && /^Latest updated: `2000-01-01`$/ {
            print "Latest updated: `2000-01-02`"
            next
        }
        before_iterations && /^- Based on iteration: PRIOR-ART-ITERATION-001$/ {
            print "- Based on iteration: PRIOR-ART-ITERATION-002"
            next
        }
        before_iterations && /^- Evidence IDs: PRV-20000101-001-E0002$/ {
            print "- Evidence IDs: PRV-20000101-001-E0004"
            next
        }
        before_iterations && /^\| Fictional private predecessor \| None \|/ {
            sub(/PRV-20000101-001-E0002/, "PRV-20000101-001-E0004")
        }
        {
            print
        }
    ' "$summary" >"$summary.tmp" &&
        mv -- "$summary.tmp" "$summary"
    append_prior_art_iteration "$summary" PRIOR-ART-ITERATION-002 \
        2000-01-02 PRIOR-ART-ITERATION-001 PRV-20000101-001-E0004
}

required_repository_files=(
    README.md
    HANDOFF.md
    .gitignore
    .github/copilot-instructions.md
    SOURCE-LINEAGE.md
    RESEARCH-SOURCES.md
    reviews/README.md
    scripts/new-review.sh
    scripts/validate-review.sh
    scripts/git-readonly.sh
    scripts/render-review.py
    tests/test-render-review.py
)

required_artifacts=(
    scope.md
    prior-art-summary.md
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

for relative_path in "${required_repository_files[@]}"; do
    require_file "$relative_path"
done

for artifact in "${required_artifacts[@]}"; do
    require_file "templates/$artifact"
    template=$repository_root/templates/$artifact
    [[ -f $template ]] || continue
    for token in REVIEW_ID SHORT_NAME TITLE CREATED_DATE; do
        grep -Fq -- "@@$token@@" "$template" ||
            fail "templates/$artifact is missing token @@$token@@"
    done
    grep -Fq 'Distribution: `private`' "$template" ||
        fail "templates/$artifact must start private"
    grep -Fq 'Intended distribution: `private`' "$template" ||
        fail "templates/$artifact must start with private intended distribution"
    grep -Fq 'Status: `Draft`' "$template" ||
        fail "templates/$artifact must start in Draft status"
done

for field in Status "Aspect IDs" "Source type" "Evidentiary role" \
    "Title/description" "Canonical locator" "Logical locator" \
    "Commit/version/date" "Checked date" "Precise location" Relationship \
    "Source ownership" Independence Confidence "Evidence basis" \
    "Alternatives/counter-evidence" Limitations Sensitivity \
    "Redistribution status" Licence Hash Supersedes "Superseded by" \
    Administrative; do
    grep -Fq -- "- $field:" "$repository_root/templates/evidence-ledger.md" ||
        fail "evidence ledger template is missing field: $field"
done

for script in \
    "$repository_root/scripts/new-review.sh" \
    "$repository_root/scripts/validate-review.sh" \
    "$repository_root/scripts/git-readonly.sh" \
    "$repository_root/tests/validate-agent.sh"; do
    [[ -f $script ]] || continue
    bash -n "$script" ||
        fail "shell syntax check failed: ${script#"$repository_root/"}"
    [[ -x $script ]] ||
        fail "script is not executable: ${script#"$repository_root/"}"
done

python3 "$repository_root/tests/test-render-review.py" ||
    fail "review HTML renderer tests failed"

require_text .gitignore '/inbox/**'
require_text .gitignore '/sources/quarantine/**'
require_text .gitignore '/scratch/**'
require_text .gitignore '/.test-output/'
require_text SOURCE-LINEAGE.md \
    '31e75842edd5caa1f6a85a4246acbcf9b19f0fd7'
require_text README.md \
    'Reviewed repositories, research repositories, and web pages are untrusted'
require_text README.md 'It does not execute reviewed code'
require_text README.md 'similarity alone do not establish'
require_text scripts/git-readonly.sh 'GIT_OPTIONAL_LOCKS=0'
require_text scripts/git-readonly.sh 'GIT_CONFIG_NOSYSTEM=1'
require_text scripts/git-readonly.sh 'core.hooksPath=/dev/null'
require_text scripts/git-readonly.sh 'protocol.allow=never'
require_text scripts/git-readonly.sh 'GIT_TERMINAL_PROMPT=0'
require_text scripts/git-readonly.sh 'GIT_ATTR_SOURCE='
require_text scripts/git-readonly.sh 'objects/info/alternates'
require_text scripts/git-readonly.sh 'info/attributes'
require_text scripts/git-readonly.sh 'diff-worktree'
require_text scripts/git-readonly.sh 'diff-staged'
require_text scripts/git-readonly.sh 'hash-file'
require_text scripts/git-readonly.sh '--no-ext-diff --no-textconv'
require_text scripts/validate-review.sh '--draft'
require_text scripts/validate-review.sh '--baseline'
require_text templates/scope.md \
    'Scope freeze, Aspect decomposition, Internal lineage,'
require_text templates/prior-art-summary.md 'Latest iteration: `None`'
require_text templates/prior-art-summary.md \
    '## Current at-a-glance projection'
require_text templates/prior-art-summary.md \
    'PRIOR-ART-ITERATION-NNN'
require_text templates/publication-checklist.md \
    '## HUMAN-PROMOTION-NNN'
require_text reviews/README.md \
    'Promoted completed packages must check every promotion prerequisite'

validate_frontmatter() {
    local relative_path=$1
    local expected_name=$2
    local file_path=$repository_root/$relative_path
    local fence_count

    [[ -f $file_path ]] || return
    [[ $(sed -n '1p' "$file_path") == '---' ]] ||
        fail "$relative_path must begin with YAML frontmatter"
    fence_count=$(grep -c '^---$' "$file_path")
    ((fence_count >= 2)) ||
        fail "$relative_path must close its YAML frontmatter"
    grep -Eq "^name:[[:space:]]*$expected_name[[:space:]]*$" "$file_path" ||
        fail "$relative_path has the wrong or missing name"
    grep -Eq '^description:[[:space:]]*[^[:space:]].*$' "$file_path" ||
        fail "$relative_path is missing a non-empty description"
}

agent_files=(
    .github/agents/provenance-review.agent.md
    .github/agents/provenance-code-lineage.agent.md
    .github/agents/provenance-research.agent.md
)
skill_file=.github/skills/provenance-analysis/SKILL.md

for relative_path in "${agent_files[@]}" "$skill_file"; do
    require_file "$relative_path"
done

validate_frontmatter .github/agents/provenance-review.agent.md provenance-review
validate_frontmatter \
    .github/agents/provenance-code-lineage.agent.md provenance-code-lineage
validate_frontmatter .github/agents/provenance-research.agent.md provenance-research
validate_frontmatter "$skill_file" provenance-analysis

orchestrator=$repository_root/.github/agents/provenance-review.agent.md
if [[ -f $orchestrator ]]; then
    grep -Eq '^user-invocable:[[:space:]]*true[[:space:]]*$' "$orchestrator" ||
        fail "orchestrator must be explicitly user-invocable"
    grep -Fq 'provenance-code-lineage' "$orchestrator" ||
        fail "orchestrator must invoke provenance-code-lineage"
    grep -Fq 'provenance-research' "$orchestrator" ||
        fail "orchestrator must invoke provenance-research"
    grep -Fq 'scripts/git-readonly.sh' "$orchestrator" ||
        fail "orchestrator must require the guarded Git wrapper"
    grep -Eiq 'sanitized[^.]{0,80}history bundle' "$orchestrator" ||
        fail "orchestrator must persist a sanitized history bundle for code-lineage analysis"
    grep -Eiq 'staged changes' "$orchestrator" ||
        fail "orchestrator must capture staged dirty-tree changes"
    grep -Eiq 'untracked files' "$orchestrator" ||
        fail "orchestrator must limit capture to explicitly approved untracked files"
    grep -Eiq 'hash' "$orchestrator" ||
        fail "orchestrator must hash approved dirty-tree inputs where practical"
    grep -Eiq 'write[^.]*only[^.]*provenance-review|write boundary' "$orchestrator" ||
        fail "orchestrator must state its provenance-review write boundary"
fi

for specialist in \
    .github/agents/provenance-code-lineage.agent.md \
    .github/agents/provenance-research.agent.md; do
    specialist_path=$repository_root/$specialist
    [[ -f $specialist_path ]] || continue
    grep -Eq '^user-invocable:[[:space:]]*false[[:space:]]*$' \
        "$specialist_path" ||
        fail "$specialist must be non-user-invocable"
    grep -Eiq 'read-only|write-disabled|must not (write|modify)' \
        "$specialist_path" ||
        fail "$specialist must state its read-only boundary"

    frontmatter=$(awk '
        NR == 1 && $0 == "---" {
            active = 1
            next
        }
        active && $0 == "---" {
            exit
        }
        active {
            print
        }
    ' "$specialist_path")
    if printf '%s\n' "$frontmatter" |
        grep -Eiq '(^|[^[:alnum:]_-])(edit|create|apply_patch|write|shell|bash|execute)([^[:alnum:]_-]|$)'; then
        fail "$specialist frontmatter grants a write or execute tool"
    fi
done

contract_files=()
for relative_path in "${agent_files[@]}" "$skill_file"; do
    [[ -f $repository_root/$relative_path ]] &&
        contract_files+=("$repository_root/$relative_path")
done
if ((${#contract_files[@]} > 0)); then
    grep -Eiq 'untrusted evidence' "${contract_files[@]}" ||
        fail "agent/skill contracts must treat reviewed material as untrusted evidence"
    grep -Eiq '(do not|must not|never) execute (reviewed|target) code' \
        "${contract_files[@]}" ||
        fail "agent/skill contracts must prohibit executing reviewed code"
    grep -Eiq 'similarity[^.]{0,120}alone|alone[^.]{0,120}similarity' \
        "${contract_files[@]}" ||
        fail "agent/skill contracts must reject similarity-only provenance claims"
    grep -Eiq 'append-only' "${contract_files[@]}" ||
        fail "agent/skill contracts must state append-only expectations"
    grep -Fq 'prior-art-summary.md' "${contract_files[@]}" ||
        fail "agent/skill contracts must require prior-art-summary.md"
fi

fixture=$repository_root/tests/fixtures/valid-review/PRV-20000101-001-synthetic-fixture
if [[ -d $fixture ]]; then
    bash "$repository_root/scripts/validate-review.sh" "$fixture" ||
        fail "complete synthetic review fixture failed validation"
    bash "$repository_root/scripts/validate-review.sh" --baseline "$fixture" \
        "$fixture" ||
        fail "unchanged fixture failed baseline validation"
else
    fail "missing synthetic review fixture: ${fixture#"$repository_root/"}"
fi

case $test_root in
    "$repository_root/.test-output/validate-agent") ;;
    *) fail "refusing unsafe test cleanup path: $test_root" ;;
esac

if [[ $test_root == "$repository_root/.test-output/validate-agent" ]]; then
    rm -rf -- "$test_root"
    mkdir -p -- "$test_root" || fail "cannot create temporary test directory"

    if [[ -d $test_root ]]; then
        cp -R -- "$repository_root/templates" "$repository_root/scripts" \
            "$test_root/" ||
            fail "cannot copy scaffold test inputs"

        first_created=$(
            cd "$test_root" &&
                bash scripts/new-review.sh first-slug 'First draft'
        ) || {
            fail "new-review.sh failed its first cross-slug run"
            first_created=
        }
        second_created=$(
            cd "$test_root" &&
                bash scripts/new-review.sh second-slug 'Second draft'
        ) || {
            fail "new-review.sh failed its second cross-slug run"
            second_created=
        }
        if [[ -n $first_created && -n $second_created &&
            ${first_created##*/} == PRV-*-* &&
            ${second_created##*/} == PRV-*-* ]]; then
            first_id=${first_created##*/}
            first_id=${first_id:0:16}
            second_id=${second_created##*/}
            second_id=${second_id:0:16}
            [[ $first_id != "$second_id" ]] ||
                fail "cross-slug sequential allocation reused $first_id"
        fi

        for created in "$first_created" "$second_created"; do
            [[ -n $created ]] || continue
            [[ -f $test_root/$created/prior-art-summary.md ]] ||
                fail "generated scaffold is missing prior-art-summary.md: $created"
            grep -Fqx 'Latest iteration: `None`' \
                "$test_root/$created/prior-art-summary.md" ||
                fail "generated scaffold has an invalid prior-art latest pointer: $created"
            if grep -Eq '^## PRIOR-ART-ITERATION-[0-9]{3}$' \
                "$test_root/$created/prior-art-summary.md"; then
                fail "generated scaffold unexpectedly contains a prior-art iteration: $created"
            fi
            bash "$repository_root/scripts/validate-review.sh" --draft \
                "$test_root/$created" ||
                fail "generated scaffold failed draft validation: $created"
            expect_failure \
                "generated scaffold completion validation ($created)" \
                "completion validation requires Status: Complete" \
                bash "$repository_root/scripts/validate-review.sh" \
                "$test_root/$created"
        done

        concurrent_count=8
        pids=()
        for ((index = 1; index <= concurrent_count; index++)); do
            (
                cd "$test_root" &&
                    bash scripts/new-review.sh "parallel-$index" \
                        "Parallel draft $index" \
                        >"parallel-$index.out"
            ) &
            pids+=("$!")
        done
        for pid in "${pids[@]}"; do
            wait "$pid" || fail "concurrent new-review.sh process failed"
        done

        concurrent_ids=$(grep -Eho 'PRV-[0-9]{8}-[0-9]{3}' \
            "$test_root"/parallel-*.out | LC_ALL=C sort)
        concurrent_total=$(printf '%s\n' "$concurrent_ids" |
            sed '/^$/d' | wc -l)
        concurrent_unique=$(printf '%s\n' "$concurrent_ids" |
            sed '/^$/d' | uniq | wc -l)
        ((concurrent_total == concurrent_count)) ||
            fail "concurrent allocation produced $concurrent_total of $concurrent_count IDs"
        ((concurrent_unique == concurrent_count)) ||
            fail "concurrent allocation produced duplicate IDs"
        for output_file in "$test_root"/parallel-*.out; do
            created=$(sed -n '1p' "$output_file")
            [[ -n $created ]] || continue
            bash "$repository_root/scripts/validate-review.sh" --draft \
                "$test_root/$created" >/dev/null ||
                fail "concurrently generated draft failed validation: $created"
        done
        if find "$test_root/reviews" -maxdepth 1 -name '.new-review.lock*' |
            grep -q .; then
            fail "review allocation left lock residue"
        fi

        mkdir -p -- "$test_root/reviews/.new-review.lock"
        printf 'stale-token\n99999999\n' \
            >"$test_root/reviews/.new-review.lock/owner"
        (
            cd "$test_root" &&
                bash scripts/new-review.sh stale-recovery \
                    'Stale lock recovery' >/dev/null
        ) || fail "new-review.sh did not recover a stale lock"
        [[ ! -e $test_root/reviews/.new-review.lock ]] ||
            fail "stale-lock recovery left lock residue"

        old_lock_epoch=$(($(date -u +%s) - 300))
        mkdir -p -- "$test_root/reviews/.new-review.lock"
        printf 'old-live-token\n%s\n%s\n' "$$" "$old_lock_epoch" \
            >"$test_root/reviews/.new-review.lock/owner"
        (
            cd "$test_root" &&
                bash scripts/new-review.sh old-live-lock \
                    'Old live-PID lock recovery' >/dev/null
        ) || fail "new-review.sh did not reclaim an old lock with a live PID"
        [[ ! -e $test_root/reviews/.new-review.lock ]] ||
            fail "old live-PID lock recovery left lock residue"

        expect_failure "invalid slug" "short-name must be" \
            bash "$test_root/scripts/new-review.sh" 'Invalid Slug' Bad
        expect_failure "non-private creation argument" \
            "initial distribution must be private" \
            bash "$test_root/scripts/new-review.sh" extra-arg Bad internal

        invalid_parent=$test_root/invalid

        invalid_path=$(copy_fixture "$invalid_parent/attribution")
        sed -i 's/^- Classification: unresolved$/- Classification: copied/' \
            "$invalid_path/attribution.md"
        expect_failure "invalid attribution classification" \
            "invalid Classification: copied" \
            bash "$repository_root/scripts/validate-review.sh" "$invalid_path"

        invalid_path=$(copy_fixture "$invalid_parent/evidence-none")
        sed -i \
            '0,/^- Evidence IDs: PRV-20000101-001-E0002$/s//- Evidence IDs: None/' \
            "$invalid_path/report.md"
        expect_failure "None evidence reference" \
            "must contain actual evidence references" \
            bash "$repository_root/scripts/validate-review.sh" "$invalid_path"

        invalid_path=$(copy_fixture "$invalid_parent/publication-approved")
        sed -i \
            's/^- Publication decision: not-requested$/- Publication decision: Approved/' \
            "$invalid_path/publication-checklist.md"
        expect_failure "unsafe publication approval" \
            "unsafe Publication decision: Approved" \
            bash "$repository_root/scripts/validate-review.sh" "$invalid_path"

        invalid_path=$(copy_fixture "$invalid_parent/sensitive-value")
        printf '\napi_key="fixture-secret"\n' \
            >>"$invalid_path/report.md"
        expect_failure "credential pattern" \
            "credential or sensitive-value pattern" \
            bash "$repository_root/scripts/validate-review.sh" "$invalid_path"

        invalid_path=$(copy_fixture "$invalid_parent/absolute-path")
        printf '\n/home/example/private\n' >>"$invalid_path/report.md"
        expect_failure "absolute workstation path" \
            "absolute workstation path" \
            bash "$repository_root/scripts/validate-review.sh" "$invalid_path"

        invalid_path=$(copy_fixture "$invalid_parent/prior-art-missing")
        rm -- "$invalid_path/prior-art-summary.md"
        expect_failure "missing prior-art summary" \
            "missing required artifact: prior-art-summary.md" \
            bash "$repository_root/scripts/validate-review.sh" "$invalid_path"

        invalid_path=$(copy_fixture "$invalid_parent/prior-art-latest")
        sed -i \
            's/^Latest iteration: `PRIOR-ART-ITERATION-001`$/Latest iteration: `PRIOR-ART-ITERATION-002`/' \
            "$invalid_path/prior-art-summary.md"
        expect_failure "malformed prior-art latest pointer" \
            "Latest iteration must identify highest iteration PRIOR-ART-ITERATION-001" \
            bash "$repository_root/scripts/validate-review.sh" "$invalid_path"

        invalid_path=$(copy_fixture "$invalid_parent/prior-art-latest-date")
        sed -i 's/^Latest updated: `2000-01-01`$/Latest updated: `2000-01-02`/' \
            "$invalid_path/prior-art-summary.md"
        expect_failure "mismatched prior-art latest date" \
            "Latest updated must equal PRIOR-ART-ITERATION-001 Date 2000-01-01" \
            bash "$repository_root/scripts/validate-review.sh" "$invalid_path"

        invalid_path=$(copy_fixture "$invalid_parent/prior-art-duplicate-latest")
        printf '\nLatest iteration: `PRIOR-ART-ITERATION-001`\n' \
            >>"$invalid_path/prior-art-summary.md"
        expect_failure "duplicate prior-art latest pointer" \
            "must contain exactly one 'Latest iteration' field" \
            bash "$repository_root/scripts/validate-review.sh" "$invalid_path"

        invalid_path=$(copy_fixture "$invalid_parent/prior-art-duplicate-date")
        printf '\nLatest updated: `2000-01-01`\n' \
            >>"$invalid_path/prior-art-summary.md"
        expect_failure "duplicate prior-art latest date" \
            "must contain exactly one 'Latest updated' field" \
            bash "$repository_root/scripts/validate-review.sh" "$invalid_path"

        invalid_path=$(copy_fixture "$invalid_parent/prior-art-date")
        sed -i \
            '/^## PRIOR-ART-ITERATION-001$/,$s/^- Date: 2000-01-01$/- Date: 2000-13-01/' \
            "$invalid_path/prior-art-summary.md"
        expect_failure "malformed prior-art iteration date" \
            "PRIOR-ART-ITERATION-001 has invalid Date: 2000-13-01" \
            bash "$repository_root/scripts/validate-review.sh" "$invalid_path"

        invalid_path=$(copy_fixture "$invalid_parent/prior-art-id")
        sed -i \
            -e 's/^Latest iteration: `PRIOR-ART-ITERATION-001`$/Latest iteration: `PRIOR-ART-ITERATION-002`/' \
            -e 's/^- Based on iteration: PRIOR-ART-ITERATION-001$/- Based on iteration: PRIOR-ART-ITERATION-002/' \
            -e 's/^## PRIOR-ART-ITERATION-001$/## PRIOR-ART-ITERATION-002/' \
            "$invalid_path/prior-art-summary.md"
        expect_failure "noncontiguous prior-art iteration ID" \
            "expected PRIOR-ART-ITERATION-001, found PRIOR-ART-ITERATION-002" \
            bash "$repository_root/scripts/validate-review.sh" "$invalid_path"

        invalid_path=$(copy_fixture "$invalid_parent/prior-art-supersedes")
        sed -i \
            '/^## PRIOR-ART-ITERATION-001$/,$s/^- Supersedes: None$/- Supersedes: PRIOR-ART-ITERATION-000/' \
            "$invalid_path/prior-art-summary.md"
        expect_failure "invalid first prior-art supersedes" \
            "PRIOR-ART-ITERATION-001 must supersede None" \
            bash "$repository_root/scripts/validate-review.sh" "$invalid_path"

        invalid_path=$(copy_fixture "$invalid_parent/prior-art-reference")
        sed -i \
            '/^## PRIOR-ART-ITERATION-001$/,$s/^- Evidence IDs: PRV-20000101-001-E0002$/- Evidence IDs: PRV-20000101-001-E9999/' \
            "$invalid_path/prior-art-summary.md"
        expect_failure "invalid prior-art evidence reference" \
            "unresolved evidence reference: PRV-20000101-001-E9999" \
            bash "$repository_root/scripts/validate-review.sh" "$invalid_path"

        invalid_path=$(copy_fixture "$invalid_parent/prior-art-confidence")
        sed -i \
            '/^## PRIOR-ART-ITERATION-001$/,$s/^- Confidence: High$/- Confidence: Certain/' \
            "$invalid_path/prior-art-summary.md"
        expect_failure "invalid prior-art confidence" \
            "PRIOR-ART-ITERATION-001 has invalid Confidence: Certain" \
            bash "$repository_root/scripts/validate-review.sh" "$invalid_path"

        invalid_path=$(copy_fixture "$invalid_parent/prior-art-administrative")
        sed -i \
            '/^## PRIOR-ART-ITERATION-001$/,$s/^- Administrative: no$/- Administrative: maybe/' \
            "$invalid_path/prior-art-summary.md"
        expect_failure "invalid prior-art administrative value" \
            "PRIOR-ART-ITERATION-001 has invalid Administrative value: maybe" \
            bash "$repository_root/scripts/validate-review.sh" "$invalid_path"

        invalid_path=$(copy_fixture "$invalid_parent/prior-art-current")
        sed -i \
            's/^- Based on iteration: PRIOR-ART-ITERATION-001$/- Based on iteration: None/' \
            "$invalid_path/prior-art-summary.md"
        expect_failure "prior-art current/latest mismatch" \
            "current projection Based on iteration must equal PRIOR-ART-ITERATION-001" \
            bash "$repository_root/scripts/validate-review.sh" "$invalid_path"

        invalid_path=$(copy_fixture "$invalid_parent/prior-art-classification")
        sed -i \
            's/| unresolved | Exercises valid unlinked private-source handling/| copied | Exercises valid unlinked private-source handling/' \
            "$invalid_path/prior-art-summary.md"
        expect_failure "invalid prior-art classification" \
            "invalid Relationship/classification: copied" \
            bash "$repository_root/scripts/validate-review.sh" "$invalid_path"

        invalid_path=$(copy_fixture "$invalid_parent/prior-art-public-unlinked")
        awk '
            $0 == "## PRV-20000101-001-E0002" {
                active = 1
            }
            active && /^- Sensitivity: private$/ {
                print "- Sensitivity: public"
                active = 0
                next
            }
            {
                print
            }
        ' "$invalid_path/evidence-ledger.md" \
            >"$invalid_path/evidence-ledger.md.tmp" &&
            mv -- "$invalid_path/evidence-ledger.md.tmp" \
                "$invalid_path/evidence-ledger.md"
        expect_failure "unlinked public prior art" \
            "unlinked prior art requires only internal, private, or restricted evidence" \
            bash "$repository_root/scripts/validate-review.sh" "$invalid_path"

        invalid_path=$(copy_fixture "$invalid_parent/prior-art-private-linked")
        sed -i \
            's#| Fictional private predecessor | None |#| Fictional private predecessor | [Reserved example](https://example.invalid/prior-art) |#' \
            "$invalid_path/prior-art-summary.md"
        expect_failure "linked private prior art" \
            "linked prior art requires only public evidence" \
            bash "$repository_root/scripts/validate-review.sh" "$invalid_path"

        internal_prior=$(copy_fixture "$test_root/prior-art/internal-unlinked")
        awk '
            $0 == "## PRV-20000101-001-E0002" {
                active = 1
            }
            active && /^- Sensitivity: private$/ {
                print "- Sensitivity: internal"
                active = 0
                next
            }
            {
                print
            }
        ' "$internal_prior/evidence-ledger.md" \
            >"$internal_prior/evidence-ledger.md.tmp" &&
            mv -- "$internal_prior/evidence-ledger.md.tmp" \
                "$internal_prior/evidence-ledger.md"
        bash "$repository_root/scripts/validate-review.sh" "$internal_prior" ||
            fail "unlinked internal prior art failed validation"

        invalid_path=$(copy_fixture "$invalid_parent/prior-art-nonactive")
        awk '
            $0 == "## PRV-20000101-001-E0002" {
                active = 1
            }
            active && /^- Status: active$/ {
                print "- Status: withdrawn"
                active = 0
                next
            }
            {
                print
            }
        ' "$invalid_path/evidence-ledger.md" \
            >"$invalid_path/evidence-ledger.md.tmp" &&
            mv -- "$invalid_path/evidence-ledger.md.tmp" \
                "$invalid_path/evidence-ledger.md"
        expect_failure "current prior art uses non-active evidence" \
            "references non-active evidence: PRV-20000101-001-E0002" \
            bash "$repository_root/scripts/validate-review.sh" "$invalid_path"

        invalid_path=$(copy_fixture "$invalid_parent/retained-hash")
        sed -i \
            's|^- Logical locator: `target://synthetic-fixture/marker.txt`$|- Logical locator: `source://public/marker.txt`|' \
            "$invalid_path/evidence-ledger.md"
        expect_failure "retained source without hash" \
            "requires a SHA-256 Hash" \
            bash "$repository_root/scripts/validate-review.sh" "$invalid_path"

        invalid_path=$(copy_fixture "$invalid_parent/duplicate-field")
        sed -i \
            '0,/^- Sensitivity: private$/s//- Sensitivity: private\n- Sensitivity: public/' \
            "$invalid_path/evidence-ledger.md"
        expect_failure "duplicate conflicting field" \
            "must contain exactly one 'Sensitivity' field" \
            bash "$repository_root/scripts/validate-review.sh" "$invalid_path"

        invalid_path=$(copy_fixture "$invalid_parent/unknown-field")
        sed -i \
            '0,/^- Administrative: yes$/s//- Administrative: yes\n- Unexpected field: value/' \
            "$invalid_path/evidence-ledger.md"
        expect_failure "unknown extra field" \
            "contains unknown field 'Unexpected field'" \
            bash "$repository_root/scripts/validate-review.sh" "$invalid_path"

        invalid_path=$(copy_fixture "$invalid_parent/core-phase")
        sed -i \
            's/^- Internal lineage: Complete$/- Internal lineage: Not applicable - skipped./' \
            "$invalid_path/scope.md"
        expect_failure "skipped core phase" \
            "core phase 'Internal lineage' to be exactly Complete" \
            bash "$repository_root/scripts/validate-review.sh" "$invalid_path"

        invalid_path=$(copy_fixture "$invalid_parent/local-phase")
        sed -i \
            's/^- Local research: Not applicable - .*$/- Local research: Not applicable - skipped for convenience./' \
            "$invalid_path/scope.md"
        expect_failure "unreasoned local research phase" \
            "local inputs are not relevant or available" \
            bash "$repository_root/scripts/validate-review.sh" "$invalid_path"

        invalid_path=$(copy_fixture "$invalid_parent/public-permitted-phase")
        sed -i \
            -e 's/^- Public research: not-permitted$/- Public research: permitted/' \
            -e 's/^- Public query permission: not-permitted$/- Public query permission: permitted/' \
            -e 's/^- Public query terms: No public terms authorized/- Public query terms: fixture_boundary/' \
            "$invalid_path/scope.md"
        expect_failure "permitted public research without landscape" \
            "Public landscape must be Complete" \
            bash "$repository_root/scripts/validate-review.sh" "$invalid_path"

        invalid_path=$(copy_fixture "$invalid_parent/public-disabled-phase")
        sed -i \
            's/^- Public landscape: Not applicable - .*$/- Public landscape: Complete/' \
            "$invalid_path/scope.md"
        expect_failure "disabled public research with completed landscape" \
            "Public landscape must be reasoned N/A" \
            bash "$repository_root/scripts/validate-review.sh" "$invalid_path"

        invalid_path=$(copy_fixture "$invalid_parent/deep-phase")
        sed -i 's/^- Depth: Focused$/- Depth: Deep/' "$invalid_path/scope.md"
        expect_failure "Deep review without deep provenance" \
            "Deep provenance must be Complete" \
            bash "$repository_root/scripts/validate-review.sh" "$invalid_path"

        phase_positive=$(copy_fixture "$test_root/phases/conditional-complete")
        sed -i \
            -e 's/^- Local research: Not applicable - .*$/- Local research: Complete/' \
            -e 's/^- Public research: not-permitted$/- Public research: permitted/' \
            -e 's/^- Public query permission: not-permitted$/- Public query permission: permitted/' \
            -e 's/^- Public query terms: No public terms authorized/- Public query terms: fixture_boundary/' \
            -e 's/^- Public landscape: Not applicable - .*$/- Public landscape: Complete/' \
            -e 's/^- Depth: Focused$/- Depth: Deep/' \
            -e 's/^- Deep provenance: Not applicable - .*$/- Deep provenance: Complete/' \
            "$phase_positive/scope.md"
        bash "$repository_root/scripts/validate-review.sh" "$phase_positive" ||
            fail "consistent completed conditional phases failed validation"

        invalid_path=$(copy_fixture "$invalid_parent/source-traversal")
        sed -i \
            's|^- Logical locator: `target://synthetic-fixture/marker.txt`$|- Logical locator: `source://public/../quarantine/marker.txt`|' \
            "$invalid_path/evidence-ledger.md"
        expect_failure "logical source traversal" \
            "invalid Logical locator" \
            bash "$repository_root/scripts/validate-review.sh" "$invalid_path"

        invalid_path=$(copy_fixture "$invalid_parent/mnt-absolute")
        printf '\n/mnt/private/research.txt\n' >>"$invalid_path/report.md"
        expect_failure "general Unix absolute path" \
            "absolute workstation path" \
            bash "$repository_root/scripts/validate-review.sh" "$invalid_path"

        invalid_path=$(copy_fixture "$invalid_parent/target-locator")
        sed -i \
            's|^- Target identity: target://synthetic-fixture$|- Target identity: target:///private|' \
            "$invalid_path/scope.md"
        expect_failure "malformed target identity" \
            "valid target:// logical locator" \
            bash "$repository_root/scripts/validate-review.sh" "$invalid_path"

        invalid_path=$(copy_fixture "$invalid_parent/backslash-locator")
        awk '
            !changed && /^- Logical locator: `target:\/\/synthetic-fixture\/marker.txt`$/ {
                print "- Logical locator: `target://synthetic\\\\fixture`"
                changed = 1
                next
            }
            {
                print
            }
        ' "$invalid_path/evidence-ledger.md" \
            >"$invalid_path/evidence-ledger.md.tmp" &&
            mv -- "$invalid_path/evidence-ledger.md.tmp" \
                "$invalid_path/evidence-ledger.md"
        expect_failure "backslash logical locator" \
            "invalid Logical locator" \
            bash "$repository_root/scripts/validate-review.sh" "$invalid_path"

        invalid_path=$(copy_fixture "$invalid_parent/control-locator")
        awk -v replacement=$'- Logical locator: `target://synthetic\tfixture`' '
            !changed && /^- Logical locator: `target:\/\/synthetic-fixture\/marker.txt`$/ {
                print replacement
                changed = 1
                next
            }
            {
                print
            }
        ' "$invalid_path/evidence-ledger.md" \
            >"$invalid_path/evidence-ledger.md.tmp" &&
            mv -- "$invalid_path/evidence-ledger.md.tmp" \
                "$invalid_path/evidence-ledger.md"
        expect_failure "control-character logical locator" \
            "invalid Logical locator" \
            bash "$repository_root/scripts/validate-review.sh" "$invalid_path"

        invalid_path=$(copy_fixture "$invalid_parent/baseline")
        current_path=$(copy_fixture "$invalid_parent/current")
        sed -i \
            '0,/Fictional boundary marker target record/s//Modified prior record/' \
            "$current_path/evidence-ledger.md"
        expect_failure "modified append-only baseline" \
            "append-only baseline record has an invalid transition" \
            bash "$repository_root/scripts/validate-review.sh" \
            --baseline "$invalid_path" "$current_path"

        prior_baseline=$(copy_fixture "$test_root/prior-art/baseline")
        prior_modified=$(copy_fixture "$test_root/prior-art/modified")
        awk '
            $0 == "## PRIOR-ART-ITERATION-001" {
                active = 1
            }
            active && /^- Bottom line: / {
                print "- Bottom line: Modified immutable prior-art history."
                active = 0
                next
            }
            {
                print
            }
        ' "$prior_modified/prior-art-summary.md" \
            >"$prior_modified/prior-art-summary.md.tmp" &&
            mv -- "$prior_modified/prior-art-summary.md.tmp" \
                "$prior_modified/prior-art-summary.md"
        expect_failure "modified prior-art iteration" \
            "append-only baseline record was modified: prior-art-summary.md PRIOR-ART-ITERATION-001" \
            bash "$repository_root/scripts/validate-review.sh" \
            --baseline "$prior_baseline" "$prior_modified"

        prior_projection_changed=$(
            copy_fixture "$test_root/prior-art/projection-without-iteration"
        )
        sed -i \
            's/^- Bottom line: The fixture records only a fictional predecessor relationship.$/- Bottom line: Changed without a new iteration./' \
            "$prior_projection_changed/prior-art-summary.md"
        expect_failure "prior-art projection changed without iteration" \
            "current projection or table changed without appending a new latest iteration" \
            bash "$repository_root/scripts/validate-review.sh" \
            --baseline "$prior_baseline" "$prior_projection_changed"

        prior_table_changed=$(
            copy_fixture "$test_root/prior-art/table-without-iteration"
        )
        sed -i \
            's/Exercises valid unlinked private-source handling/Changed table without a new iteration/' \
            "$prior_table_changed/prior-art-summary.md"
        expect_failure "prior-art table changed without iteration" \
            "current projection or table changed without appending a new latest iteration" \
            bash "$repository_root/scripts/validate-review.sh" \
            --baseline "$prior_baseline" "$prior_table_changed"

        prior_removed=$(copy_fixture "$test_root/prior-art/removed")
        sed -i '/^## PRIOR-ART-ITERATION-001$/,$d' \
            "$prior_removed/prior-art-summary.md"
        expect_failure "removed prior-art iteration" \
            "append-only baseline record was removed: prior-art-summary.md PRIOR-ART-ITERATION-001" \
            bash "$repository_root/scripts/validate-review.sh" \
            --baseline "$prior_baseline" "$prior_removed"

        prior_appended=$(copy_fixture "$test_root/prior-art/appended")
        sed -i \
            -e 's/^Latest iteration: `PRIOR-ART-ITERATION-001`$/Latest iteration: `PRIOR-ART-ITERATION-002`/' \
            -e 's/^Latest updated: `2000-01-01`$/Latest updated: `2000-01-02`/' \
            -e 's/^- Based on iteration: PRIOR-ART-ITERATION-001$/- Based on iteration: PRIOR-ART-ITERATION-002/' \
            "$prior_appended/prior-art-summary.md"
        append_prior_art_iteration "$prior_appended/prior-art-summary.md" \
            PRIOR-ART-ITERATION-002 2000-01-02 PRIOR-ART-ITERATION-001
        bash "$repository_root/scripts/validate-review.sh" \
            --baseline "$prior_baseline" "$prior_appended" ||
            fail "valid appended prior-art iteration failed"

        legacy_prior_baseline=$(copy_fixture "$test_root/prior-art/legacy")
        rm -- "$legacy_prior_baseline/prior-art-summary.md"
        legacy_output=$(
            bash "$repository_root/scripts/validate-review.sh" \
                --baseline "$legacy_prior_baseline" "$fixture" 2>&1
        ) || fail "legacy baseline without prior-art summary failed"
        printf '%s\n' "$legacy_output" |
            grep -Fq \
                'baseline lacks prior-art-summary.md; skipping prior-art history comparison only.' ||
            fail "legacy baseline compatibility did not emit its prior-art note"

        baseline_path=$(copy_fixture "$test_root/supersession/baseline")
        superseded_path=$(copy_fixture "$test_root/supersession/valid")
        append_superseding_evidence "$superseded_path/evidence-ledger.md"
        transition_evidence "$superseded_path/evidence-ledger.md" \
            PRV-20000101-001-E0002 superseded PRV-20000101-001-E0004
        refresh_prior_art_after_supersession \
            "$superseded_path/prior-art-summary.md"
        bash "$repository_root/scripts/validate-review.sh" \
            --baseline "$baseline_path" "$superseded_path" ||
            fail "valid append-only evidence supersession failed"

        invalid_path=$(copy_fixture "$test_root/supersession/modified")
        append_superseding_evidence "$invalid_path/evidence-ledger.md"
        transition_evidence "$invalid_path/evidence-ledger.md" \
            PRV-20000101-001-E0002 superseded PRV-20000101-001-E0004
        sed -i \
            '0,/Fictional boundary marker target record/s//Changed old title/' \
            "$invalid_path/evidence-ledger.md"
        expect_failure "supersession changed another old field" \
            "supersession modified baseline evidence beyond" \
            bash "$repository_root/scripts/validate-review.sh" \
            --baseline "$baseline_path" "$invalid_path"

        invalid_path=$(copy_fixture "$test_root/supersession/reciprocal")
        append_superseding_evidence "$invalid_path/evidence-ledger.md"
        transition_evidence "$invalid_path/evidence-ledger.md" \
            PRV-20000101-001-E0002 superseded PRV-20000101-001-E0004
        sed -i \
            's/^- Supersedes: PRV-20000101-001-E0002$/- Supersedes: None/' \
            "$invalid_path/evidence-ledger.md"
        expect_failure "supersession without reciprocal new link" \
            "supersession link is not symmetric" \
            bash "$repository_root/scripts/validate-review.sh" \
            --baseline "$baseline_path" "$invalid_path"

        internal_path=$(copy_fixture "$test_root/distribution/internal")
        promote_fixture "$internal_path" internal
        bash "$repository_root/scripts/validate-review.sh" "$internal_path" ||
            fail "internal package rejected private evidence sensitivity"

        promotion_bare=$(copy_fixture "$test_root/distribution/bare")
        find "$promotion_bare" -type f -name '*.md' -exec \
            sed -i \
                -e 's/^Distribution: `private`$/Distribution: `internal`/' \
                -e 's/^Intended distribution: `private`$/Intended distribution: `internal`/' \
                {} +
        sed -i \
            's/^- Human promotion record: None$/- Human promotion record: HUMAN-PROMOTION-001/' \
            "$promotion_bare/publication-checklist.md"
        expect_failure "bare promotion identifier" \
            "Human promotion record does not resolve" \
            bash "$repository_root/scripts/validate-review.sh" "$promotion_bare"

        promotion_unchecked=$(copy_fixture "$test_root/distribution/unchecked")
        promote_fixture "$promotion_unchecked" internal
        sed -i \
            's/^- \[x\] Evidence sensitivity/- [ ] Evidence sensitivity/' \
            "$promotion_unchecked/publication-checklist.md"
        expect_failure "unchecked promotion prerequisite" \
            "promotion prerequisite is not checked" \
            bash "$repository_root/scripts/validate-review.sh" \
            "$promotion_unchecked"

        promotion_mismatch=$(copy_fixture "$test_root/distribution/mismatch")
        promote_fixture "$promotion_mismatch" internal
        sed -i \
            's/^- To classification: internal$/- To classification: public-candidate/' \
            "$promotion_mismatch/publication-checklist.md"
        expect_failure "promotion target mismatch" \
            "does not match HUMAN-PROMOTION-001 To classification" \
            bash "$repository_root/scripts/validate-review.sh" \
            "$promotion_mismatch"

        public_bad=$(copy_fixture "$test_root/distribution/public-bad")
        promote_fixture "$public_bad" public-candidate
        expect_failure "public-candidate private evidence" \
            "must have public Sensitivity" \
            bash "$repository_root/scripts/validate-review.sh" "$public_bad"

        public_good=$(copy_fixture "$test_root/distribution/public-good")
        promote_fixture "$public_good" public-candidate
        find "$public_good" -type f -name '*.md' -exec \
            sed -i \
                -e 's/^- Sensitivity: private$/- Sensitivity: public/' \
                -e 's/^- Redistribution status: not-approved$/- Redistribution status: approved/' \
                -e 's/^- Licence: unknown$/- Licence: not-applicable/' \
                {} +
        sed -i \
            's#| Fictional private predecessor | None |#| Fictional private predecessor | [Reserved example](https://example.invalid/prior-art) |#' \
            "$public_good/prior-art-summary.md"
        bash "$repository_root/scripts/validate-review.sh" "$public_good" ||
            fail "safe public-candidate package failed validation"

        git_fixture=$test_root/git-fixture
        mkdir -p -- "$git_fixture"
        git -C "$git_fixture" init -q
        git -C "$git_fixture" config user.name Fixture
        git -C "$git_fixture" config user.email fixture@example.invalid
        printf 'one\n' >"$git_fixture/file.txt"
        git -C "$git_fixture" add file.txt
        git -C "$git_fixture" commit -q -m one
        first_commit=$(git -C "$git_fixture" rev-parse HEAD)
        printf 'two\n' >>"$git_fixture/file.txt"
        git -C "$git_fixture" commit -q -am two
        second_commit=$(git -C "$git_fixture" rev-parse HEAD)
        printf 'file.txt -diff filter=hostile diff=hostile\n' \
            >"$git_fixture/.gitattributes"
        git -C "$git_fixture" add .gitattributes
        git -C "$git_fixture" commit -q -m attributes
        attribute_commit=$(git -C "$git_fixture" rev-parse HEAD)
        linked_fixture=$test_root/linked-worktree
        git -C "$git_fixture" worktree add -q -b linked-fixture \
            "$linked_fixture" "$attribute_commit"
        wrapper=$repository_root/scripts/git-readonly.sh
        "$wrapper" state "$git_fixture" >/dev/null ||
            fail "git-readonly state failed"
        "$wrapper" resolve "$git_fixture" HEAD >/dev/null ||
            fail "git-readonly resolve failed"
        "$wrapper" log "$git_fixture" HEAD 2 >/dev/null ||
            fail "git-readonly log failed"
        "$wrapper" show "$git_fixture" HEAD file.txt >/dev/null ||
            fail "git-readonly show failed"
        "$wrapper" blame "$git_fixture" HEAD file.txt >/dev/null ||
            fail "git-readonly blame failed"
        "$wrapper" diff "$git_fixture" "$first_commit" "$second_commit" \
            file.txt >/dev/null ||
            fail "git-readonly diff failed"
        "$wrapper" ls-tree "$git_fixture" HEAD file.txt >/dev/null ||
            fail "git-readonly ls-tree failed"

        printf 'staged\n' >>"$git_fixture/file.txt"
        git -C "$git_fixture" add file.txt
        printf 'unstaged\n' >>"$git_fixture/file.txt"
        printf 'approved untracked\n' >"$git_fixture/approved-untracked.txt"

        hostile_marker=$test_root/hostile-filter-ran
        hostile_driver=$git_fixture/hostile-driver.sh
        {
            printf '%s\n' '#!/bin/sh'
            printf 'printf "%%s\\n" "$1" >>"%s"\n' "$hostile_marker"
            printf '%s\n' 'if [ "$1" = clean ]; then cat; fi'
        } >"$hostile_driver"
        chmod +x "$hostile_driver"
        info_attributes=$(git -C "$git_fixture" rev-parse \
            --path-format=absolute --git-path info/attributes)
        mkdir -p -- "${info_attributes%/*}"
        printf 'file.txt -diff filter=hostile diff=hostile\n' \
            >"$info_attributes"
        global_attributes=$git_fixture/global-attributes
        printf 'file.txt -diff filter=hostile diff=hostile\n' \
            >"$global_attributes"
        git -C "$git_fixture" config core.attributesFile "$global_attributes"
        git -C "$git_fixture" config filter.hostile.clean \
            "$hostile_driver clean"
        git -C "$git_fixture" config filter.hostile.required true
        git -C "$git_fixture" config diff.hostile.command \
            "$hostile_driver external-diff"
        git -C "$git_fixture" config diff.hostile.textconv \
            "$hostile_driver textconv"
        git -C "$git_fixture" config core.fsmonitor \
            "$hostile_driver fsmonitor"
        rm -f -- "$hostile_marker"
        printf 'linked-unstaged\n' >>"$linked_fixture/file.txt"

        status_before=$("$wrapper" state "$git_fixture") ||
            fail "git-readonly state failed with hostile attributes configured"
        metadata_manifest_before=$(
            find "$git_fixture/.git" -type f -print0 |
                LC_ALL=C sort -z |
                xargs -0 sha256sum
        )
        worktree_manifest_before=$(
            find "$git_fixture" "$linked_fixture" -type f \
                ! -path "$git_fixture/.git/*" -print0 |
                LC_ALL=C sort -z |
                xargs -0 sha256sum
        )
        index_before=$(sha256sum "$git_fixture/.git/index")
        config_before=$(sha256sum "$git_fixture/.git/config")
        info_attributes_before=$(sha256sum "$info_attributes")
        global_attributes_before=$(sha256sum "$global_attributes")
        tracked_before=$(sha256sum "$git_fixture/file.txt")
        untracked_before=$(sha256sum "$git_fixture/approved-untracked.txt")

        raw_show=$("$wrapper" show "$git_fixture" "$second_commit" file.txt) ||
            fail "git-readonly show failed with hostile attributes"
        raw_diff=$("$wrapper" diff "$git_fixture" "$first_commit" \
            "$second_commit" file.txt) ||
            fail "git-readonly diff failed with hostile attributes"
        printf '%s\n' "$raw_show" | grep -Fq '+two' ||
            fail "show content was suppressed by a target attribute source"
        printf '%s\n' "$raw_diff" | grep -Fq '+two' ||
            fail "diff content was suppressed by a target attribute source"

        worktree_diff=$("$wrapper" diff-worktree "$git_fixture" file.txt) ||
            fail "git-readonly diff-worktree failed"
        worktree_diff_all=$("$wrapper" diff-worktree "$git_fixture") ||
            fail "git-readonly diff-worktree without a path failed"
        staged_diff=$("$wrapper" diff-staged "$git_fixture" HEAD file.txt) ||
            fail "git-readonly diff-staged failed"
        staged_diff_all=$("$wrapper" diff-staged "$git_fixture" HEAD) ||
            fail "git-readonly diff-staged without a path failed"
        printf '%s\n' "$worktree_diff" | grep -Fq '+unstaged' ||
            fail "diff-worktree did not capture the unstaged tracked change"
        printf '%s\n' "$worktree_diff_all" | grep -Fq '+unstaged' ||
            fail "pathless diff-worktree did not capture the unstaged change"
        if printf '%s\n' "$worktree_diff" | grep -Fq '+staged'; then
            fail "diff-worktree incorrectly included the staged-only change"
        fi
        printf '%s\n' "$staged_diff" | grep -Fq '+staged' ||
            fail "diff-staged did not capture the staged change"
        printf '%s\n' "$staged_diff_all" | grep -Fq '+staged' ||
            fail "pathless diff-staged did not capture the staged change"
        if printf '%s\n' "$staged_diff" | grep -Fq '+unstaged'; then
            fail "diff-staged incorrectly included the unstaged change"
        fi

        expected_hash=sha256:$(sha256sum \
            "$git_fixture/approved-untracked.txt" | awk '{print $1}')
        actual_hash=$("$wrapper" hash-file "$git_fixture" \
            approved-untracked.txt) ||
            fail "git-readonly hash-file failed"
        [[ $actual_hash == "$expected_hash" ]] ||
            fail "hash-file returned the wrong SHA-256 digest"

        index_after=$(sha256sum "$git_fixture/.git/index")
        config_after=$(sha256sum "$git_fixture/.git/config")
        info_attributes_after=$(sha256sum "$info_attributes")
        global_attributes_after=$(sha256sum "$global_attributes")
        tracked_after=$(sha256sum "$git_fixture/file.txt")
        untracked_after=$(sha256sum "$git_fixture/approved-untracked.txt")
        [[ $index_after == "$index_before" ]] ||
            fail "new git-readonly modes changed the Git index"
        [[ $config_after == "$config_before" ]] ||
            fail "git-readonly changed target Git configuration"
        [[ $info_attributes_after == "$info_attributes_before" ]] ||
            fail "git-readonly changed target info attributes"
        [[ $global_attributes_after == "$global_attributes_before" ]] ||
            fail "git-readonly changed configured global attributes"
        [[ $tracked_after == "$tracked_before" ]] ||
            fail "new git-readonly modes changed the tracked worktree file"
        [[ $untracked_after == "$untracked_before" ]] ||
            fail "hash-file changed the selected untracked file"
        status_after=$("$wrapper" state "$git_fixture") ||
            fail "git-readonly state failed after dirty-tree capture"
        [[ $status_after == "$status_before" ]] ||
            fail "new git-readonly modes changed repository status"
        [[ ! -e $hostile_marker ]] ||
            fail "git-readonly invoked a repository-defined filter or diff driver"

        linked_git_dir=$(git -C "$linked_fixture" rev-parse --absolute-git-dir)
        linked_index=$linked_git_dir/index
        linked_index_before=$(sha256sum "$linked_index")
        linked_file_before=$(sha256sum "$linked_fixture/file.txt")
        common_config_before=$(sha256sum "$git_fixture/.git/config")
        common_info_before=$(sha256sum "$info_attributes")
        rm -f -- "$hostile_marker"
        linked_diff=$("$wrapper" diff-worktree "$linked_fixture" file.txt) ||
            fail "git-readonly diff-worktree failed for a linked worktree"
        linked_state=$("$wrapper" state "$linked_fixture") ||
            fail "git-readonly state failed for a linked worktree"
        linked_show=$("$wrapper" show "$linked_fixture" \
            "$second_commit" file.txt) ||
            fail "git-readonly show failed for a linked worktree"
        printf '%s\n' "$linked_diff" | grep -Fq '+linked-unstaged' ||
            fail "linked-worktree diff omitted unstaged content"
        printf '%s\n' "$linked_state" | grep -Fq ' M file.txt' ||
            fail "linked-worktree state omitted the modified file"
        printf '%s\n' "$linked_show" | grep -Fq '+two' ||
            fail "linked-worktree show content was suppressed by attributes"
        [[ ! -e $hostile_marker ]] ||
            fail "linked-worktree inspection invoked a target executable"
        [[ $(sha256sum "$linked_index") == "$linked_index_before" ]] ||
            fail "linked-worktree inspection changed its Git index"
        [[ $(sha256sum "$linked_fixture/file.txt") == "$linked_file_before" ]] ||
            fail "linked-worktree inspection changed its worktree"
        [[ $(sha256sum "$git_fixture/.git/config") == "$common_config_before" ]] ||
            fail "linked-worktree inspection changed common Git configuration"
        [[ $(sha256sum "$info_attributes") == "$common_info_before" ]] ||
            fail "linked-worktree inspection changed common info attributes"
        metadata_manifest_after=$(
            find "$git_fixture/.git" -type f -print0 |
                LC_ALL=C sort -z |
                xargs -0 sha256sum
        )
        worktree_manifest_after=$(
            find "$git_fixture" "$linked_fixture" -type f \
                ! -path "$git_fixture/.git/*" -print0 |
                LC_ALL=C sort -z |
                xargs -0 sha256sum
        )
        [[ $metadata_manifest_after == "$metadata_manifest_before" ]] ||
            fail "git-readonly changed target Git metadata"
        [[ $worktree_manifest_after == "$worktree_manifest_before" ]] ||
            fail "git-readonly changed target worktree files"

        outside_dir=$test_root/hash-outside
        mkdir -p -- "$outside_dir"
        printf 'outside\n' >"$outside_dir/outside.txt"
        ln -s -- "$outside_dir/outside.txt" "$git_fixture/escape-file"
        ln -s -- "$outside_dir" "$git_fixture/escape-dir"
        mkfifo -- "$git_fixture/special-file"
        expect_failure "hash-file final symlink escape" \
            "symbolic links are not allowed" \
            "$wrapper" hash-file "$git_fixture" escape-file
        expect_failure "hash-file parent symlink escape" \
            "file path escapes the repository" \
            "$wrapper" hash-file "$git_fixture" escape-dir/outside.txt
        expect_failure "hash-file directory" \
            "requires a regular file" \
            "$wrapper" hash-file "$git_fixture" .
        expect_failure "hash-file special file" \
            "requires a regular file" \
            "$wrapper" hash-file "$git_fixture" special-file
        expect_failure "git-readonly invalid mode" "unsupported mode" \
            "$wrapper" fetch "$git_fixture"
        expect_failure "git-readonly path traversal" "without traversal" \
            "$wrapper" show "$git_fixture" HEAD ../file.txt
        expect_failure "diff-worktree path traversal" "without traversal" \
            "$wrapper" diff-worktree "$git_fixture" ../file.txt
        expect_failure "diff-staged invalid base" \
            "base revision does not resolve" \
            "$wrapper" diff-staged "$git_fixture" missing-revision
        expect_failure "hash-file path traversal" "without traversal" \
            "$wrapper" hash-file "$git_fixture" ../approved-untracked.txt
        expect_failure "hash-file Git metadata" "without traversal" \
            "$wrapper" hash-file "$git_fixture" .git/config
        [[ ! -e $git_fixture/.git/index.lock ]] ||
            fail "git-readonly left an index lock"

        baseline_repo=$test_root/baseline-git
        mkdir -p -- "$baseline_repo/scripts" "$baseline_repo/reviews"
        cp -- "$repository_root/scripts/validate-review.sh" \
            "$baseline_repo/scripts/"
        cp -R -- "$fixture" "$baseline_repo/reviews/"
        git -C "$baseline_repo" init -q
        git -C "$baseline_repo" config user.name Fixture
        git -C "$baseline_repo" config user.email fixture@example.invalid
        git -C "$baseline_repo" add scripts reviews
        git -C "$baseline_repo" commit -q -m baseline
        bash "$baseline_repo/scripts/validate-review.sh" --baseline HEAD \
            "$baseline_repo/reviews/${fixture##*/}" ||
            fail "Git-ref baseline export validation failed"

        rm -rf -- "$test_root"
    fi
fi

if ((failures > 0)); then
    printf 'validate-agent: FAILED with %d error(s)\n' "$failures" >&2
    exit 1
fi

printf 'validate-agent: OK\n'
