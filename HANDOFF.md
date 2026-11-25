# Provenance review handoff

**Last updated:** 2026-11-25 (UTC)

## Overall position

This repository is the independent Beryllium provenance and attribution
workspace. It contains a project-local Copilot orchestrator, write-disabled
code-lineage and research specialists, durable `PRV-*` review artifacts,
classified source storage, hardened read-only Git capture, and contract
validation. Each review now requires a versioned `prior-art-summary.md` as its
human-readable lineage entry point.

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
- Remote: public `origin` at
  `https://github.com/beryllium-project/provenance-review.git`, kept public by
  the responsible human (`PMD-20261012-002`); every push to it publishes
- Repository history: last-fetched `origin/main` is `9bfbab3`; local `main` is
  3 commits ahead with the `PMR-144` and `PMR-122` work and their return, none
  pushed
- Implementation: complete and validated
- Model: every agent profile pins `claude-opus-5.5`; reasoning effort `max`
  and context tier `long_context` are invocation defaults (`PMR-122`)
- Publication gate: adopted (`PMR-144`); see `## Publication gate` in
  `.github/copilot-instructions.md`
- Publication status: the repository is public, so its pushed history,
  including the two review packages classified `Distribution: private`, is
  publicly readable; no release, promotion, or publication approval exists
- Validation: `bash ./tests/validate-agent.sh` and `git diff --check` pass
- Prior-art contract: required for new and current reviews; numbered
  iterations are append-only and the latest projection is explicit
- Known limitation: exact dirty-tree capture assumes the target remains stable
  during the short capture sequence and is rechecked afterward

## Exact next action

The Project Manager verifies the `PMR-144` and `PMR-122` returns below and
closes both requests. Pushing the three local commits publishes them; that
remains a separate responsible-human decision, through the publication gate
and with a same-turn confirmation. Open `PMR-066` (tasking startup adoption)
stays for a separate session.

## Restart commands

From this repository's canonical checkout, whose path the parent
`COMPONENTS.md` records:

```sh
git status --short --branch
sed -n '1,400p' HANDOFF.md
bash ./tests/validate-agent.sh
```

## Project Manager return

Both requests were carried in one direct session, each in its own work
commit, with this single return commit. Facts common to both are under
"Shared carry record".

### PMR-144

| Related IDs | Result | Evidence | Validation | Repository state | Requested Project Manager action |
| --- | --- | --- | --- | --- | --- |
| `PMR-144` | `completed` | Work commit `03bf55e0ea5e7f36486b2a454f8a1769e77f4d7e`; return commit `SELF`; work paths `.github/copilot-instructions.md`, `README.md`, and `tests/validate-agent.sh`; return path `HANDOFF.md` | `bash ./tests/validate-agent.sh`: `validate-agent: OK`, exit 0, at the work commit and again at `22ba536`; `bash -n tests/validate-agent.sh`: passed; `git diff --check`: passed; the new checks fail against the unchanged `9bfbab3` tree (14 errors, all from the new checks); installed gate `audit --repo . --all-refs` at `22ba536`: `PASS`, 3 refs, 187 items, exit 0; known failures: none | `main` / `origin/main`; at `SELF`, 3 ahead and 0 behind last-fetched `origin/main` `9bfbab3`, clean; all three commits local only, no fetch or push; active session is `self` (this human-started direct session) until it ends; no writer lock, reservation, or preflight log was taken | Verify the work and return commits and close `PMR-144`; put the public-repository question for `private` review packages (below) to the responsible human; do not infer a push or any human gate |

- **Result detail:** A `## Publication gate` section in
  `.github/copilot-instructions.md` (this repository has no
  `AGENT-INTERFACE.md`) states that `origin` is public (`PMD-20261012-002`),
  so every push publishes, including any review package whatever its
  `Distribution` classification. Before any push to a public remote, public
  repository creation, visibility change, or public release, pull-request,
  issue, or wiki text, and on `check publication gate` or an obvious variant,
  the agent loads the user-level `beryllium-publication-gate` skill and
  applies the gate's `check --repo . --remote <remote>` command (and, after
  fetching every ref including tags, `audit --repo . --all-refs` before public
  repository creation or a visibility change), each in the row's exact
  `python3 -I -B` form. It continues only on exit 0, stops on exit 1 or 2,
  never bypasses hooks, and calls a non-public model `unlisted` with nothing
  else said about it.
- **Command admission:** The trusted-execution rule now admits both gate
  commands, over this repository, for ordinary repository sessions. The
  `provenance-review` orchestrator's `execute` allowlist, in its profile and
  in `.github/skills/provenance-analysis/SKILL.md`, is unchanged and excludes
  them; on the trigger phrase the orchestrator gives the human the exact
  command.
- **Contract test:** `tests/validate-agent.sh` gains two text helpers and
  checks that the section appears once, gives both exact commands, states
  each required rule, admits the commands in the trusted-execution rule, and
  that the orchestrator profile does not list the gate.
- **Documentation correction:** `README.md` no longer calls `origin` private;
  it states that `origin` is public and points to the section.
- **For a responsible-human decision (no change made):** Both review
  packages, `reviews/PRV-20260828-001-helium-te-security-architecture/` and
  `reviews/PRV-20260901-001-policy-install-readback/`, are
  `Distribution: private` yet already in the public `origin` history, and the
  component rule that reports default to `private` stands. `PMD-20261012-002`
  left open whether such content stays public; `PMD-20261116-002` settled the
  matching threat-modeler question. The owner changed neither the packages
  nor the rule.
- **Gate boundary:** The gate's local `audit --repo . --all-refs` reads local
  refs only; its installed source was read to confirm that it makes no
  network probe. `check --remote origin`, which probes the remote
  anonymously, was not run; the installed pre-push hook runs it at push time.
  Passing the gate is not publication approval.

### PMR-122

| Related IDs | Result | Evidence | Validation | Repository state | Requested Project Manager action |
| --- | --- | --- | --- | --- | --- |
| `PMR-122` | `completed` | Work commit `22ba53657e7fbf1a4d80d6a76182829d0ed71aeb`; return commit `SELF`; work paths `.github/agents/provenance-code-lineage.agent.md`, `.github/agents/provenance-research.agent.md`, `.github/agents/provenance-review.agent.md`, `.github/copilot-instructions.md`, `README.md`, and `tests/validate-agent.sh`; return path `HANDOFF.md` | `bash ./tests/validate-agent.sh`: `validate-agent: OK`, exit 0, at the work commit; `bash -n tests/validate-agent.sh`: passed; `git diff --check`: passed; the new checks fail against the `03bf55e` tree (6 errors, all from the new checks); known failures: none | `main` / `origin/main`; at `SELF`, 3 ahead and 0 behind last-fetched `origin/main` `9bfbab3`, clean; all three commits local only, no fetch or push; active session is `self` (this human-started direct session) until it ends; no writer lock, reservation, or preflight log was taken | Verify the work and return commits and close `PMR-122`; keep `PMR-066` open and separate; do not infer a push or any human gate |

- **Baseline:** The `PMR-144` work commit `03bf55e`, whose profiles were
  unchanged from `9bfbab3`. The row's survey still held: line 5 of each of the
  three profiles was `model: gpt-5.6-sol`, no other profile exists, and no
  instruction, README, handoff, or test text named a model, effort, or
  context tier.
- **Result detail:** The `provenance-review`, `provenance-code-lineage`, and
  `provenance-research` profiles now pin `model: claude-opus-5.5`. Profile
  frontmatter carries only the model, so reasoning effort `max` and context
  tier `long_context` are stated as invocation defaults in a new
  `## Model and invocation defaults` section of
  `.github/copilot-instructions.md` and in the orchestrator profile, which
  passes all three values to each specialist invocation and stops rather than
  substituting. `README.md` replaces its stale "Planned invocation" text with
  the pinned launch command
  `copilot --model claude-opus-5.5 --reasoning-effort max --context long_context --agent provenance-review`.
- **Contract test:** `tests/validate-agent.sh` checks that every
  `.github/agents/*.agent.md` frontmatter pins exactly
  `model: claude-opus-5.5` and that the instructions and orchestrator state
  the defaults.
- **Unchanged by design:** No `reviews/PRV-*` package or its recorded
  provenance changed. No package records the model that produced it; the only
  model names in them are quoted evidence content.

### Shared carry record

- **Carry path:** Direct ordinary component session started by the
  responsible human with
  `--model claude-opus-5.5 --reasoning-effort max --context long_context`
  (observed on the session's process command line) and the instruction to
  carry only `PMR-144` and `PMR-122` per
  `workspace://project-manager/outbox/OWNER-RUNBOOK.md` ("P1-P4
  publication-gate adoption"). No hidden owner exists or was dispatched.
- **Source:** The `open` / `P2` `PMR-144` and `open` / `P3` `PMR-122` rows in
  `workspace://project-manager/outbox/component-requests.md`, read on
  2026-11-25 (UTC) with read-only file tools. No dispatch packet, Project
  Manager commit, request blob, or tasking SOT SHA-256 was bound, and no
  parent or sibling command was run. Read-only file tools also consulted the
  runbook, `workspace://project-manager/templates/owner-return.md`,
  `PMD-20261006-001`, `PMD-20261012-002`, `PMD-20261108-001`,
  `PMD-20261108-003`, the vendored skill
  `workspace://project-manager/user-assets/skills/beryllium-publication-gate/SKILL.md`,
  the parent `SOT.md` and `COMPONENTS.md`, and, as wording precedent, the
  current instructions, profiles, tests, and handoff of
  `component://security-reviewer/` and `component://threat-modeler/`,
  including their closed `PMR-141` and `PMR-142` publication-gate sections.
- **Baseline HEAD:** `9bfbab3d4da7209d45ab4486bc69be3de1a84434` on clean
  `main`, 0 ahead and 0 behind last-fetched `origin/main`, with no Git lock,
  stash, or additional worktree.
- **Return commit:** `SELF`, the commit that adds this record; its full ID is
  reported in the session's final response.
- **Handoff correction:** This return also updates the current state, next
  action, and restart commands above. The remote is recorded as public; the
  former next action, parent coordination changes from the initial
  implementation, is superseded by the parent registry that now records this
  component; and the restart commands no longer change to a former
  workstation location that the parent `SOT.md` marks noncanonical.
- **Backup state:** `origin/main` remains
  `9bfbab3d4da7209d45ab4486bc69be3de1a84434` as last fetched. All three
  commits are local only; no fetch, push, remote, branch, or tag change was
  made. Pushing them publishes them and remains the responsible human's
  action through the gate.
- **Active-session state:** Read-only process inspection at the start and
  again at 2026-11-25T00:46Z found no other process with a working directory
  in this component and no `owner-session.sh`, `owner-recovery.sh`, or
  `maintenance-reservation.sh` process. This session is the sole writer and
  is released when it ends.
- **Explicit exclusions preserved:** No `reviews/PRV-*` package, skill,
  template, `scripts/` file, test fixture, source metadata, sibling, or parent
  file changed. Open `PMR-066` was neither performed nor un-parked, and the
  parent tasking resolver was not run. No push, visibility change,
  publication, release, acceptance, or other human gate changed.
