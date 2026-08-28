# Provenance review handoff

## Overall position

This repository is the independent Beryllium provenance and attribution
workspace. It contains a project-local Copilot orchestrator, write-disabled
code-lineage and research specialists, durable `PRV-*` review artifacts,
classified source storage, hardened read-only Git capture, and contract
validation.

## Boundaries

- Write only in this repository.
- Treat every sibling Beryllium component as read-only unless its owner
  separately authorizes a change.
- Do not copy private component source into review artifacts.
- Do not copy or publish
  `../osr-claude/sources/restricted-microsoft/`.
- Do not infer human acceptance, originality, misconduct, or publication
  readiness.
- Keep component and parent Git operations separate.

## Current state

- Branch: `main`
- Remote: private `origin` at
  `https://github.com/beryllium-project/provenance-review.git`
- Repository history: initial implementation pushed to `origin/main`
- Implementation: complete and validated
- Publication status: private, not approved for release
- Validation: `bash ./tests/validate-agent.sh` and `git diff --check` pass
- Known limitation: exact dirty-tree capture assumes the target remains stable
  during the short capture sequence and is rechecked afterward

## Exact next action

Review the parent coordination changes in `../.gitignore`, `../COMPONENTS.md`,
and `../HANDOFF.md`; commit them separately if accepted.

## Restart commands

```sh
cd /home/jmorris/src/l1/src/beryllium-project/provenance-review
git status --short --branch
sed -n '1,220p' HANDOFF.md
bash ./tests/validate-agent.sh
```
