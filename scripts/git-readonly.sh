#!/usr/bin/env bash

set -u

usage() {
    cat >&2 <<'EOF'
Usage:
  git-readonly.sh state <repository>
  git-readonly.sh resolve <repository> <revision>
  git-readonly.sh log <repository> <revision> [max-count]
  git-readonly.sh show <repository> <revision> [relative-path]
  git-readonly.sh blame <repository> <revision> <relative-path>
  git-readonly.sh diff <repository> <old-revision> <new-revision> [relative-path]
  git-readonly.sh diff-worktree <repository> [relative-path]
  git-readonly.sh diff-staged <repository> <base-revision> [relative-path]
  git-readonly.sh hash-file <repository> <relative-path>
  git-readonly.sh ls-tree <repository> <revision> [relative-path]
EOF
}

die() {
    printf 'git-readonly: ERROR: %s\n' "$*" >&2
    exit 1
}

validate_revision() {
    local revision=$1
    [[ -n $revision && $revision != -* &&
        $revision =~ ^[A-Za-z0-9._/@{}^~:+-]+$ ]] ||
        die "invalid revision argument: $revision"
}

validate_path() {
    local path=$1
    [[ -n $path && $path != /* && $path != -* && $path != *\\* &&
        $path != .git && $path != .git/* &&
        $path != .. && $path != ../* && $path != */../* &&
        $path != */.. && $path =~ ^[[:print:]]+$ ]] ||
        die "path must be repository-relative without traversal: $path"
}

(($# >= 2)) || {
    usage
    exit 2
}

mode=$1
repository=$2
shift 2

[[ -d $repository ]] || die "repository is not a directory: $repository"
repository=$(CDPATH= cd -- "$repository" && pwd -P) ||
    die "cannot canonicalize repository: $repository"

clean_environment=(
    env -i
    "PATH=$PATH"
    "HOME=/nonexistent"
    "XDG_CONFIG_HOME=/nonexistent"
    "LC_ALL=C"
    "GIT_TERMINAL_PROMPT=0"
    "GIT_ASKPASS=/bin/false"
    "SSH_ASKPASS=/bin/false"
    "GIT_CONFIG_NOSYSTEM=1"
    "GIT_OPTIONAL_LOCKS=0"
    "GIT_PAGER=cat"
    "PAGER=cat"
)
safe_git_options=(
    git
    -c core.hooksPath=/dev/null
    -c core.fsmonitor=false
    -c core.attributesFile=/dev/null
    -c core.autocrlf=false
    -c core.safecrlf=false
    -c credential.helper=
    -c protocol.allow=never
    -c diff.external=
    -c diff.trustExitCode=false
    -c pager.status=false
    -c pager.log=false
    -c pager.show=false
    -c pager.blame=false
    -c pager.diff=false
)
discovery_git=(
    "${clean_environment[@]}"
    "${safe_git_options[@]}"
    -C "$repository"
)

"${discovery_git[@]}" rev-parse --is-inside-work-tree >/dev/null 2>&1 ||
    die "not a Git work tree: $repository"
repository_root=$("${discovery_git[@]}" rev-parse --show-toplevel) ||
    die "cannot resolve Git repository root"
repository_root=$(CDPATH= cd -- "$repository_root" && pwd -P) ||
    die "cannot canonicalize Git repository root"
target_git_dir=$("${discovery_git[@]}" rev-parse \
    --path-format=absolute --git-dir) ||
    die "cannot resolve Git metadata directory"
target_git_dir=$(CDPATH= cd -- "$target_git_dir" && pwd -P) ||
    die "cannot canonicalize Git metadata directory"
target_common_dir=$("${discovery_git[@]}" rev-parse \
    --path-format=absolute --git-common-dir) ||
    die "cannot resolve common Git metadata directory"
target_common_dir=$(CDPATH= cd -- "$target_common_dir" && pwd -P) ||
    die "cannot canonicalize common Git metadata directory"
target_index=$("${discovery_git[@]}" rev-parse \
    --path-format=absolute --git-path index) ||
    die "cannot resolve Git index path"
for resolved_path in "$repository_root" "$target_git_dir" \
    "$target_common_dir" "$target_index"; do
    [[ $resolved_path =~ ^[[:print:]]+$ &&
        ! $resolved_path =~ [[:cntrl:]] ]] ||
        die "repository paths containing control characters are unsupported"
done
object_format=$("${discovery_git[@]}" rev-parse --show-object-format) ||
    die "cannot determine Git object format"
case $object_format in sha1 | sha256) ;; *)
    die "unsupported Git object format: $object_format"
esac

temporary_view=
cleanup() {
    if [[ -n $temporary_view && -d $temporary_view ]]; then
        rm -rf -- "$temporary_view"
    fi
}
trap cleanup EXIT
trap 'exit 1' HUP INT TERM

temporary_parent=${TMPDIR:-/tmp}
[[ -d $temporary_parent ]] || temporary_parent=/tmp
temporary_view=$(mktemp -d \
    "$temporary_parent/provenance-git-readonly.XXXXXX") ||
    die "cannot create isolated Git metadata view"
temporary_view=$(CDPATH= cd -- "$temporary_view" && pwd -P) ||
    die "cannot canonicalize isolated Git metadata view"
case $temporary_view in
    "$repository_root"|"$repository_root"/*|\
    "$target_git_dir"|"$target_git_dir"/*|\
    "$target_common_dir"|"$target_common_dir"/*)
        cleanup
        temporary_view=$(mktemp -d "/tmp/provenance-git-readonly.XXXXXX") ||
            die "cannot create isolated Git metadata view outside the target"
        temporary_view=$(CDPATH= cd -- "$temporary_view" && pwd -P) ||
            die "cannot canonicalize isolated Git metadata view"
        ;;
esac
case $temporary_view in
    "$repository_root"|"$repository_root"/*|\
    "$target_git_dir"|"$target_git_dir"/*|\
    "$target_common_dir"|"$target_common_dir"/*)
        cleanup
        die "cannot place isolated Git metadata outside the target"
        ;;
esac

isolated_git_dir=$temporary_view/git
mkdir -p -- "$isolated_git_dir/objects/info" "$isolated_git_dir/info" ||
    die "cannot initialize isolated Git metadata view"
printf '%s\n' "$target_common_dir/objects" \
    >"$isolated_git_dir/objects/info/alternates" ||
    die "cannot configure read-only object access"
: >"$isolated_git_dir/info/attributes" ||
    die "cannot create empty isolated info attributes"

repository_format_version=0
if [[ $object_format == sha256 ]]; then
    repository_format_version=1
fi
{
    printf '[core]\n'
    printf '\trepositoryformatversion = %s\n' "$repository_format_version"
    printf '\tbare = false\n'
    printf '\thooksPath = /dev/null\n'
    printf '\tfsmonitor = false\n'
    printf '\tattributesFile = /dev/null\n'
    printf '\tautocrlf = false\n'
    printf '\tsafecrlf = false\n'
    printf '[credential]\n'
    printf '\thelper =\n'
    printf '[protocol]\n'
    printf '\tallow = never\n'
    printf '[diff]\n'
    printf '\texternal =\n'
    printf '\ttrustExitCode = false\n'
    if [[ $object_format == sha256 ]]; then
        printf '[extensions]\n'
        printf '\tobjectFormat = sha256\n'
    fi
} >"$isolated_git_dir/config" ||
    die "cannot write isolated Git configuration"

isolated_index=$isolated_git_dir/index
if [[ -f $target_index ]]; then
    cp -- "$target_index" "$isolated_index" ||
        die "cannot copy Git index into isolated metadata view"
    shopt -s nullglob
    shared_indexes=(
        "$target_git_dir"/sharedindex.*
        "$target_common_dir"/sharedindex.*
    )
    for shared_index in "${shared_indexes[@]}"; do
        cp -- "$shared_index" "$isolated_git_dir/${shared_index##*/}" ||
            die "cannot copy shared Git index into isolated metadata view"
    done
    shopt -u nullglob
else
    : >"$isolated_index" ||
        die "cannot create isolated empty index"
fi
chmod 400 "$isolated_index" "$isolated_git_dir"/sharedindex.* \
    2>/dev/null || true

isolated_environment=(
    "${clean_environment[@]}"
    "GIT_DIR=$isolated_git_dir"
    "GIT_WORK_TREE=$repository_root"
    "GIT_INDEX_FILE=$isolated_index"
)
isolated_git=(
    "${isolated_environment[@]}"
    "${safe_git_options[@]}"
)

if [[ ! -s $target_index ]]; then
    chmod 600 "$isolated_index"
    "${isolated_git[@]}" read-tree --empty ||
        die "cannot initialize isolated empty index"
    chmod 400 "$isolated_index"
fi

empty_tree=$("${isolated_git[@]}" hash-object -t tree --stdin </dev/null) ||
    die "cannot compute the isolated empty-tree identifier"
[[ $empty_tree =~ ^[0-9a-fA-F]{40,64}$ ]] ||
    die "Git returned an invalid empty-tree identifier"
isolated_environment+=("GIT_ATTR_SOURCE=$empty_tree")
isolated_git=(
    "${isolated_environment[@]}"
    "${safe_git_options[@]}"
)

head_symbolic=$("${discovery_git[@]}" symbolic-ref -q HEAD 2>/dev/null || true)
head_oid=$("${discovery_git[@]}" rev-parse --verify HEAD^{commit} \
    2>/dev/null || true)
if [[ -n $head_symbolic ]]; then
    [[ $head_symbolic == refs/heads/* ]] ||
        die "unsupported symbolic HEAD: $head_symbolic"
    printf 'ref: %s\n' "$head_symbolic" >"$isolated_git_dir/HEAD"
    if [[ -n $head_oid ]]; then
        mkdir -p -- "$isolated_git_dir/${head_symbolic%/*}"
        printf '%s\n' "$head_oid" >"$isolated_git_dir/$head_symbolic"
    fi
elif [[ -n $head_oid ]]; then
    printf '%s\n' "$head_oid" >"$isolated_git_dir/HEAD"
else
    die "cannot resolve repository HEAD state"
fi

resolve_commit() {
    local revision=$1
    validate_revision "$revision"
    "${discovery_git[@]}" rev-parse --verify "$revision^{commit}"
}

print_state_header() {
    local branch_name upstream_name upstream_oid counts ahead behind

    if [[ -n $head_symbolic ]]; then
        branch_name=${head_symbolic#refs/heads/}
        if [[ -z $head_oid ]]; then
            printf '## No commits yet on %s\n' "$branch_name"
            return
        fi
        printf '## %s' "$branch_name"
        upstream_name=$("${discovery_git[@]}" rev-parse --abbrev-ref \
            --symbolic-full-name '@{upstream}' 2>/dev/null || true)
        upstream_oid=$("${discovery_git[@]}" rev-parse --verify \
            '@{upstream}^{commit}' 2>/dev/null || true)
        if [[ -n $upstream_name && -n $upstream_oid ]]; then
            counts=$("${isolated_git[@]}" rev-list --left-right --count \
                "$head_oid...$upstream_oid") ||
                die "cannot compare branch with its upstream"
            ahead=${counts%%[[:space:]]*}
            behind=${counts##*[[:space:]]}
            printf '...%s' "$upstream_name"
            if ((ahead > 0 || behind > 0)); then
                printf ' ['
                if ((ahead > 0)); then
                    printf 'ahead %d' "$ahead"
                fi
                if ((ahead > 0 && behind > 0)); then
                    printf ', '
                fi
                if ((behind > 0)); then
                    printf 'behind %d' "$behind"
                fi
                printf ']'
            fi
        fi
        printf '\n'
    else
        printf '## HEAD (no branch)\n'
    fi
}

case $mode in
    state)
        (($# == 0)) || die "state accepts no additional arguments"
        print_state_header
        "${isolated_git[@]}" status --short --untracked-files=all
        ;;
    resolve)
        (($# == 1)) || die "resolve requires exactly one revision"
        resolve_commit "$1"
        ;;
    log)
        (($# == 1 || $# == 2)) ||
            die "log requires a revision and optional max-count"
        resolved_revision=$(resolve_commit "$1") ||
            die "revision does not resolve to a commit: $1"
        max_count=${2:-100}
        [[ $max_count =~ ^[1-9][0-9]{0,3}$ ]] ||
            die "max-count must be an integer from 1 to 9999"
        "${isolated_git[@]}" log --no-ext-diff --no-textconv \
            --format=fuller --date=iso-strict --max-count="$max_count" \
            "$resolved_revision" --
        ;;
    show)
        (($# == 1 || $# == 2)) ||
            die "show requires a revision and optional relative path"
        resolved_revision=$(resolve_commit "$1") ||
            die "revision does not resolve to a commit: $1"
        if (($# == 2)); then
            validate_path "$2"
            "${isolated_git[@]}" show --text --no-ext-diff --no-textconv \
                --no-renames --format=fuller --date=iso-strict \
                "$resolved_revision" -- "$2"
        else
            "${isolated_git[@]}" show --text --no-ext-diff --no-textconv \
                --no-renames --format=fuller --date=iso-strict \
                "$resolved_revision" --
        fi
        ;;
    blame)
        (($# == 2)) || die "blame requires a revision and relative path"
        resolved_revision=$(resolve_commit "$1") ||
            die "revision does not resolve to a commit: $1"
        validate_path "$2"
        "${isolated_git[@]}" blame --no-progress --no-textconv \
            "$resolved_revision" -- "$2"
        ;;
    diff)
        (($# == 2 || $# == 3)) ||
            die "diff requires two revisions and an optional relative path"
        resolved_old=$(resolve_commit "$1") ||
            die "old revision does not resolve to a commit: $1"
        resolved_new=$(resolve_commit "$2") ||
            die "new revision does not resolve to a commit: $2"
        if (($# == 3)); then
            validate_path "$3"
            "${isolated_git[@]}" diff --text --no-ext-diff --no-textconv \
                --no-renames "$resolved_old" "$resolved_new" -- "$3"
        else
            "${isolated_git[@]}" diff --text --no-ext-diff --no-textconv \
                --no-renames "$resolved_old" "$resolved_new" --
        fi
        ;;
    diff-worktree)
        (($# == 0 || $# == 1)) ||
            die "diff-worktree accepts only an optional relative path"
        if (($# == 1)); then
            validate_path "$1"
            "${isolated_git[@]}" diff --text --no-ext-diff --no-textconv \
                --no-renames -- "$1"
        else
            "${isolated_git[@]}" diff --text --no-ext-diff --no-textconv \
                --no-renames --
        fi
        ;;
    diff-staged)
        (($# == 1 || $# == 2)) ||
            die "diff-staged requires a base revision and optional relative path"
        resolved_base=$(resolve_commit "$1") ||
            die "base revision does not resolve to a commit: $1"
        if (($# == 2)); then
            validate_path "$2"
            "${isolated_git[@]}" diff --cached --text --no-ext-diff \
                --no-textconv --no-renames "$resolved_base" -- "$2"
        else
            "${isolated_git[@]}" diff --cached --text --no-ext-diff \
                --no-textconv --no-renames "$resolved_base" --
        fi
        ;;
    hash-file)
        (($# == 1)) || die "hash-file requires exactly one relative path"
        validate_path "$1"
        relative_path=$1
        parent_path=${relative_path%/*}
        file_name=${relative_path##*/}
        if [[ $parent_path == "$relative_path" ]]; then
            parent_path=.
        fi
        file_parent=$(CDPATH= cd -- "$repository_root/$parent_path" &&
            pwd -P) ||
            die "cannot canonicalize file parent: $relative_path"
        case $file_parent in
            "$repository_root" | "$repository_root"/*) ;;
            *) die "file path escapes the repository: $relative_path" ;;
        esac
        file_path=$file_parent/$file_name
        [[ ! -L $file_path ]] ||
            die "symbolic links are not allowed for hash-file: $relative_path"
        canonical_file=$(readlink -f -- "$file_path") ||
            die "cannot canonicalize file: $relative_path"
        case $canonical_file in
            "$repository_root" | "$repository_root"/*) ;;
            *) die "file path escapes the repository: $relative_path" ;;
        esac
        [[ -f $file_path ]] ||
            die "hash-file requires a regular file: $relative_path"

        if command -v sha256sum >/dev/null 2>&1; then
            digest=$(env -i "PATH=$PATH" "LC_ALL=C" \
                sha256sum -- "$file_path") ||
                die "sha256sum failed for: $relative_path"
        elif command -v shasum >/dev/null 2>&1; then
            digest=$(env -i "PATH=$PATH" "LC_ALL=C" \
                shasum -a 256 -- "$file_path") ||
                die "shasum failed for: $relative_path"
        else
            die "no supported SHA-256 tool is available (sha256sum or shasum)"
        fi
        digest=${digest%%[[:space:]]*}
        [[ $digest =~ ^[0-9a-fA-F]{64}$ ]] ||
            die "SHA-256 tool returned an invalid digest"
        printf 'sha256:%s\n' "${digest,,}"
        ;;
    ls-tree)
        (($# == 1 || $# == 2)) ||
            die "ls-tree requires a revision and optional relative path"
        resolved_revision=$(resolve_commit "$1") ||
            die "revision does not resolve to a commit: $1"
        if (($# == 2)); then
            validate_path "$2"
            "${isolated_git[@]}" ls-tree -r --full-tree \
                "$resolved_revision" -- "$2"
        else
            "${isolated_git[@]}" ls-tree -r --full-tree "$resolved_revision"
        fi
        ;;
    *)
        usage
        die "unsupported mode: $mode"
        ;;
esac
