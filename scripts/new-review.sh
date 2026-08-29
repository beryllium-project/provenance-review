#!/usr/bin/env bash

set -u

usage() {
    printf 'Usage: %s <short-name> <title> [private]\n' "${0##*/}" >&2
}

die() {
    printf 'new-review: ERROR: %s\n' "$*" >&2
    exit 1
}

if (($# != 2 && $# != 3)); then
    usage
    exit 2
fi

short_name=$1
title=$2
initial_distribution=${3:-private}

[[ $initial_distribution == private ]] ||
    die "initial distribution must be private"

if [[ ! $short_name =~ ^[a-z0-9]+(-[a-z0-9]+)*$ ]] ||
    ((${#short_name} > 48)); then
    die "short-name must be a lowercase hyphenated slug of at most 48 characters"
fi

if [[ -z $title ]] || ((${#title} > 120)) ||
    [[ $title == *'@@'* ]] ||
    [[ ! $title =~ ^[[:print:]]+$ ]]; then
    die "title must be 1-120 printable characters and must not contain '@@'"
fi

script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P) ||
    die "cannot resolve script directory"
repository_root=$(CDPATH= cd -- "$script_dir/.." && pwd -P) ||
    die "cannot resolve repository root"
templates_dir=$repository_root/templates
reviews_dir=$repository_root/reviews
lock_dir=$reviews_dir/.new-review.lock
lock_owner=$lock_dir/owner
lock_acquired_epoch=$(date -u +%s)
lock_token=$$-${RANDOM:-0}-$lock_acquired_epoch
stale_lock_seconds=120
lock_held=0
review_dir=
cleanup_review=0

cleanup() {
    if ((cleanup_review)) && [[ -n $review_dir ]]; then
        rm -rf -- "$review_dir"
    fi
    if ((lock_held)) && [[ -f $lock_owner ]] &&
        [[ $(sed -n '1p' "$lock_owner") == "$lock_token" ]]; then
        rm -f -- "$lock_owner"
        rmdir -- "$lock_dir" 2>/dev/null || true
    fi
}

trap cleanup EXIT
trap 'exit 1' HUP INT TERM

[[ -d $templates_dir ]] || die "template directory is missing: $templates_dir"
mkdir -p -- "$reviews_dir" || die "cannot create reviews directory"

acquire_lock() {
    local attempt owner_pid owner_epoch current_epoch lock_age stale_lock

    for ((attempt = 1; attempt <= 400; attempt++)); do
        if mkdir -- "$lock_dir" 2>/dev/null; then
            lock_acquired_epoch=$(date -u +%s)
            printf '%s\n%s\n%s\n' \
                "$lock_token" "$$" "$lock_acquired_epoch" >"$lock_owner" ||
                die "cannot record allocation lock ownership"
            lock_held=1
            return
        fi

        owner_epoch=
        if [[ ! -f $lock_owner ]]; then
            if ((attempt <= 100)); then
                sleep 0.05
                continue
            fi
            owner_pid=
        else
            owner_pid=$(sed -n '2p' "$lock_owner")
            owner_epoch=$(sed -n '3p' "$lock_owner")
        fi
        current_epoch=$(date -u +%s)
        lock_age=0
        if [[ $owner_epoch =~ ^[0-9]+$ ]] &&
            ((current_epoch >= owner_epoch)); then
            lock_age=$((current_epoch - owner_epoch))
        fi
        if [[ ! $owner_pid =~ ^[1-9][0-9]*$ ]] ||
            ! kill -0 "$owner_pid" 2>/dev/null ||
            ((lock_age > stale_lock_seconds)); then
            stale_lock=$reviews_dir/.new-review.lock.stale.$lock_token
            if mv -- "$lock_dir" "$stale_lock" 2>/dev/null; then
                rm -rf -- "$stale_lock"
                continue
            fi
        fi

        sleep 0.05
    done

    die "timed out waiting for the review-ID allocation lock"
}

created_date=$(date -u +%Y-%m-%d) ||
    die "cannot determine UTC creation date"
id_date=${created_date//-/}

acquire_lock

shopt -s nullglob
review_id=
for ((index = 1; index <= 999; index++)); do
    printf -v sequence '%03d' "$index"
    candidate_id=PRV-$id_date-$sequence
    existing=("$reviews_dir/$candidate_id-"*)
    if ((${#existing[@]} > 0)); then
        continue
    fi

    candidate=$reviews_dir/$candidate_id-$short_name
    if mkdir -- "$candidate" 2>/dev/null; then
        review_id=$candidate_id
        review_dir=$candidate
        cleanup_review=1
        break
    fi
    [[ -e $candidate ]] ||
        die "cannot create review directory: $candidate"
done
shopt -u nullglob

[[ -n $review_dir ]] ||
    die "no review ID is available for $created_date (001-999 exhausted)"

required_templates=(
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

escape_sed_replacement() {
    printf '%s' "$1" | sed 's/[\\&|]/\\&/g'
}

escaped_review_id=$(escape_sed_replacement "$review_id")
escaped_short_name=$(escape_sed_replacement "$short_name")
escaped_title=$(escape_sed_replacement "$title")
escaped_created_date=$(escape_sed_replacement "$created_date")

for template_name in "${required_templates[@]}"; do
    source_file=$templates_dir/$template_name
    destination_file=$review_dir/$template_name
    [[ -f $source_file ]] ||
        die "required template is missing: templates/$template_name"
    [[ ! -e $destination_file ]] ||
        die "refusing to overwrite: $destination_file"

    sed \
        -e "s|@@REVIEW_ID@@|$escaped_review_id|g" \
        -e "s|@@SHORT_NAME@@|$escaped_short_name|g" \
        -e "s|@@TITLE@@|$escaped_title|g" \
        -e "s|@@CREATED_DATE@@|$escaped_created_date|g" \
        -- "$source_file" >"$destination_file" ||
        die "failed to instantiate template: templates/$template_name"
done

if grep -ERq '@@[A-Z][A-Z0-9_]*@@' -- "$review_dir"; then
    die "generated review contains an unsubstituted template token"
fi

cleanup_review=0
printf 'reviews/%s\n' "${review_dir##*/}"
