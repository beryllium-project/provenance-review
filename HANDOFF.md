# Provenance review handoff

**Last updated:** 2026-11-26 (UTC)

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
- Repository history: `origin/main` is `5238a90`, which holds the `PMR-144`
  and `PMR-122` work and return (pushed 2026-11-25 UTC; an anonymous read at
  2026-11-25T01:23:26Z confirmed it); local `main` is 5 commits ahead, not
  pushed: the package-inventory return below and its two addenda, then the
  `PMR-162` work and return
- Implementation: complete and validated
- Model: every agent profile pins `claude-opus-5.5`; reasoning effort `max`
  and context tier `long_context` are invocation defaults (`PMR-122`)
- Publication gate: adopted (`PMR-144`); see `## Publication gate` in
  `.github/copilot-instructions.md`, whose publication wording is aligned
  with `PMD-20261125-002` (`PMR-162`)
- Publication status: the repository is public, so its pushed history,
  including the two review packages classified `Distribution: private`, is
  publicly readable. Under `PMD-20261125-002` those two packages stay public
  as they are, and future packages may be published, each public push
  passing the gate with the responsible human's explicit same-turn
  confirmation. No release, promotion, evidence clearance, or approval of a
  specific push exists
- Validation: `bash ./tests/validate-agent.sh` and `git diff --check` pass
- Prior-art contract: required for new and current reviews; numbered
  iterations are append-only and the latest projection is explicit
- Known limitation: exact dirty-tree capture assumes the target remains stable
  during the short capture sequence and is rechecked afterward

## Exact next action

The Project Manager verifies the `PMR-162` work and return commits recorded
below and closes `PMR-162`. It has already recorded the responsible human's
handling decision for the two public packages as `PMD-20261125-002` and
closed `PMR-144` and `PMR-122`. Pushing the five local commits publishes
them; that remains a separate responsible-human decision, through the
publication gate and with a same-turn confirmation. Open `PMR-066` (tasking
startup adoption) stays for a separate session.

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

### Package inventory (`PMD-20261125-001`)

A later direct session, separate from the `PMR-144` and `PMR-122` carry
above, made this return. The decision allocated no request ID.

| Related IDs | Result | Evidence | Validation | Repository state | Requested Project Manager action |
| --- | --- | --- | --- | --- | --- |
| `PMD-20261125-001`; packages `PRV-20260828-001` and `PRV-20260901-001` | `completed` | Inventory bound to commit `5238a9034cec92050d4c28beb3c053ecc58cbf5e`, package trees `a9387ac0c37734212a2e4384db6673a08e04029e` and `375a93677596d12064e19b0a625c7596245c6203`; return commit `SELF`; return path `HANDOFF.md` | `bash ./tests/validate-agent.sh`: `validate-agent: OK`, exit 0; `git diff --check`: passed; `python3 -I -B ./scripts/render-review.py --check reviews/PRV-20260828-001-helium-te-security-architecture`: OK, exit 0; known failures: none | `main` / `origin/main`; at `SELF`, 1 ahead and 0 behind `origin/main` `5238a90`, clean; an anonymous read of `origin` at 2026-11-25T01:23:26Z showed `HEAD` and `main`, its only branch, at `5238a90` and no tags; no fetch or push; active session is `self` until it ends | Record the inventory and put the handling of both packages to the responsible human, who holds the private details; do not infer clearance, promotion, licensing, containment, a push, or any other human gate |

- **Publicly reachable:** All 38 package files at `5238a90`: 26 in
  `reviews/PRV-20260828-001-helium-te-security-architecture/` (12 Markdown
  files plus 13 HTML pages and a stylesheet under `html/`) and 12 Markdown
  files in `reviews/PRV-20260901-001-policy-install-readback/`. Earlier
  package states in `684d9bf`, `20bc43e`, and `d698e75` (first package) and
  `86d9260` (second) are also readable. Text that later commits removed holds
  earlier wording, locators, and ID lists, no class of material absent at
  `5238a90`. This history has never deleted or renamed a file, and
  `sources/`, `inbox/`, and `scratch/` have only ever held their `README.md`
  files. The first package's `html/` pages are an exact rendering of its
  Markdown; the second package has no HTML. When the packages first became
  publicly readable, and whether forks, clones, caches, or indexes hold
  copies, cannot be determined from local evidence.
- **Present in the public text (classes only):** bibliographic data,
  canonical URLs, and section locators for public sources, with paper titles
  the only quotations from them; SHA-256 digests of retained source copies
  and of the private capture helper; private-source locators, namely
  repository and component names, commit and blob IDs, branch names, file
  paths, line ranges, symbol names, commit times, and authorship and
  co-authorship metadata; private Copilot session metadata in the second
  package (session IDs, turn and event indices, tool times, a task title, and
  session counts); a small number of short verbatim fragments, a few words
  each, from private commits, target documents, target code, and session
  records; analytical paraphrase of private code, planning, and session
  content, including threat and limitation analysis of the private target
  (`assurance-practices.md` and `report.md` in the second package); and
  restricted-report titles and cover-page restriction notes only
  (`PRV-20260828-001-E0029` and the matching inaccessible-resource records).
- **Not found:** source or document text beyond those fragments, code bodies,
  session transcripts, retained source copies, restricted-report content,
  credentials or tokens, email addresses, or absolute local filesystem paths.
- **Only referenced, not present:** the private Helium target's source,
  documents, tests, history, and retained agent reviews; private Beryllium
  source, planning records, and history; Copilot session records in the cloud
  and local session stores; retained paper copies held in sibling research
  corpora; restricted reports, which were not accessed; former full-history
  commits that no longer resolve; the private capture bundle under ignored
  `scratch/` and the private helper-isolation manifest; and restricted
  Microsoft material, which the packages state was neither opened nor copied.
- **Still needing clearance (unchanged):** `PRV-20260828-001`, 98 of 127
  evidence records: every `E0001`-`E0127` record except the 29 listed in its
  `publication-checklist.md` amendment. By class: private target 16, private
  Beryllium research 17 (8 superseded), private review metadata 17,
  restricted-report metadata 1, public papers with retained copies of unknown
  redistribution 8, public inaccessible-resource metadata with unknown or
  not-approved redistribution 26, and superseded or withdrawn public records
  kept for traceability 13. `PRV-20260901-001`, 21 of 26: `E0001`-`E0013`,
  `E0016`, `E0018`-`E0021`, and `E0024`-`E0026`. By class: private session
  records 5, private target 3, private Beryllium 2, an unresolvable
  former-history record 1, public papers with retained copies of unknown
  redistribution 4, and private review metadata including the earlier review
  6. Both checklists still record `Distribution: private`, blocked
  publication and licensing decisions, and no human promotion record.
- **Bearing on handling (nothing decided):** The first package's scope
  excludes public disclosure of private identifiers and source excerpts, and
  the second approves no target-derived identifier or private phrase for
  public disclosure beyond one query phrase (each package's `scope.md`
  `SCOPE-001`). The public text nonetheless carries the private locators,
  metadata, and fragments listed above. Removing anything already published
  would need a history rewrite or a visibility change; neither is decided
  here.
- **Private notification:** During the inventory the owner paused once under
  the decision's disclosure rule and notified the responsible human privately
  in the session; the human directed the read-only inventory to continue.
  Items needing the human's judgment were given privately and are deliberately
  not identified in this record.
- **Responsible-human judgment (2026-11-25 UTC):** After return commit
  `535a591189bee5ca59dea4e582d3aebd9e0b1514`, the responsible human reviewed
  the privately reported items and judged both acceptable to remain public;
  no containment is requested for them. The overall handling of the two
  packages, including their `Distribution: private` classification and
  uncleared dependencies, remains the human's open decision.
- **Responsible-human handling decision (2026-11-25T04:47Z):** Offered one
  choice for the two packages already public ((a) keep them public as they
  are, (b) delete them in a new commit, or (c) contain them) and one for
  future provenance packages ((a) they may be published, each push through
  the publication gate with the responsible human's confirmation, (b) keep
  them off the public remote, or (c) make the repository private), the
  responsible human answered exactly `"a and a"`. Both packages therefore
  stay public as they are, and future packages may be published, each push
  passing the gate with a same-turn confirmation. This settles the open
  handling question in the previous bullet. It is the human's statement
  recorded for the Project Manager, not a Project Manager decision record or
  a `HUMAN-PROMOTION-NNN` record; it changes no `Distribution` field, rule,
  or package here, clears no evidence dependency, decides no licensing or
  redistribution, and approves no specific push.
- **Carry record:** A direct ordinary session started by the responsible
  human with the runbook command
  (`workspace://project-manager/outbox/OWNER-RUNBOOK.md`, "P1 Inventory
  public provenance packages"); the session's process command line showed
  `--model claude-opus-5.5 --reasoning-effort max --context long_context`.
  Read-only file tools consulted the decision record, that runbook section,
  `workspace://project-manager/templates/owner-return.md`, and the parent
  `SOT.md` and `COMPONENTS.md`. Two read-only shell commands read sibling
  paths, contrary to the instruction to run no parent or sibling command: a
  directory listing of `workspace://project-manager/templates/` and a text
  search of `workspace://project-manager/outbox/OWNER-RUNBOOK.md`. Neither
  made a Git call or a write, and no other parent or sibling command ran. In
  this repository the session ran
  only read-only Git inspection, text extraction over the bound package files,
  `render-review.py --check`, one anonymous `git ls-remote` of the `origin`
  URL with user Git configuration and credential helpers disabled, process
  inspection, and the validation above.
- **Baseline and session state:** `5238a9034cec92050d4c28beb3c053ecc58cbf5e`
  on clean `main`, 0 ahead and 0 behind `origin/main`, with no Git lock,
  stash, or additional worktree. At the start, the only other process in this
  component was the terminal shell that launched this session; this session
  is the sole writer until it ends.
- **Handoff correction:** This return also updates the repository-history
  line and the exact next action above, which predated the push of `5238a90`.
- **Exclusions preserved:** No package, rule, template, script, test, source
  metadata, remote, branch, tag, or visibility changed; existing history was
  not rewritten; nothing was pushed; no parent or sibling file was written.
  No retained source copy, quarantine or inbox content, session store, or
  other non-public source material was opened; outside this repository only
  the Project Manager coordination files listed above were read. This return
  grants no clearance, promotion, licensing, publication, containment, or
  other human gate.

### PMR-162

A later session, separate from every carry above, made this return. The
Project Manager started it unattended under `PMD-20261126-002`, after the
responsible human said `run the batch`; no human was present during it.

| Related IDs | Result | Evidence | Validation | Repository state | Requested Project Manager action |
| --- | --- | --- | --- | --- | --- |
| `PMR-162`; `PMD-20261125-002` | `completed` | Work commit `7e95bdf8c1dbe719bd2aaa11ec2643d7f1ed7926`; return commit `SELF`; work paths `.github/agents/provenance-review.agent.md`, `.github/copilot-instructions.md`, `.github/skills/provenance-analysis/SKILL.md`, `README.md`, `reviews/README.md`, `templates/publication-checklist.md`, and `tests/validate-agent.sh`; return path `HANDOFF.md` | `bash ./tests/validate-agent.sh`: `validate-agent: OK`, exit 0, on the work tree before commit, at the work commit, and at `SELF`; `bash -n tests/validate-agent.sh`: passed; `git diff --check`: passed; the new checks fail against the unchanged `b249346` tree (39 errors, all from the new checks, and no other failure); no publication-gate command was run (see below); known failures: none | `main` / `origin/main`; at `SELF`, 5 ahead and 0 behind last-fetched `origin/main` `5238a90`, clean; no fetch or push; active session is `self` (this Project Manager-started unattended session) until it ends; it took no writer lock or reservation, so it releases none | Verify the work and return commits and close `PMR-162`; keep `PMR-066` open and separate; do not infer a push, promotion, evidence clearance, licensing, or any other human gate |

- **Result detail:** The `## Publication gate` section of
  `.github/copilot-instructions.md` now records that under
  `PMD-20261125-002` the two packages already public, `PRV-20260828-001` and
  `PRV-20260901-001`, stay public as they are; that the decision calls for no
  package edit, relabelling, removal, history change, or visibility change
  and covers those packages only as already published; that future packages
  may be published push by push, each public push passing the gate and
  receiving the responsible human's explicit same-turn confirmation for that
  push; and that the decision is not a `HUMAN-PROMOTION-NNN` record and
  approves no specific push. A second paragraph keeps distribution,
  promotion, evidence clearance, and actual visibility distinct: a package's
  `Distribution` does not determine its remote visibility or grant
  permission to push, private-by-default intake and the existing promotion,
  evidence-clearance, licensing, and redistribution checks remain in force,
  and a push changes no classification and satisfies none of those checks.
  `## Sources and distribution` points to the section.
- **Other paths:** The orchestrator states the same rule at intake, says
  that it and its specialists never push, create a repository, change
  visibility, or submit public text, and adds a `publication boundary` item
  to the `EFFECTIVE PROVENANCE SCOPE`; its `execute` allowlist is unchanged.
  The skill opens its `## Publication gate` section with the distinction and
  the decision, and its intake and evidence-handling text now say that
  `Distribution` is not a visibility or push choice. `README.md` and
  `reviews/README.md` state the rule, and the `README.md` validation
  paragraph adds the same-turn confirmation. Of the new-package templates,
  only `templates/publication-checklist.md` carries publication wording; it
  now tells each new package that a push changes no classification or
  checklist field and satisfies no check. Every new package still scaffolds
  as `private`.
- **Contract test:** `tests/validate-agent.sh` gains a `require_flat_text`
  helper and a `PMR-162` block: four shared statements in all six policy
  files, the two-package statement in four of them, the four-way
  distinction in the instructions and skill, five statements inside the
  instructions' gate section, the orchestrator's no-push statement and scope
  item, the skill's no-push statement, and the template's no-field-change
  statement.
- **Unchanged by design:** No `reviews/PRV-*` package or its checklist, no
  `Distribution` field, test fixture, script, or source metadata, and no
  remote, branch, tag, visibility, or history changed. No promotion,
  clearance, licensing, or redistribution decision was made or recorded, and
  no inventory detail was copied into rules or tests. No responsible-human
  question arose, so none is open from this request.
- **Publication gate:** No gate command was run, because nothing was pushed
  and the packet states that this session's Git-level push block rewrites
  GitHub push addresses, so a gate run here would not be evidence about a
  push. The responsible human's later push needs its own gate run and
  same-turn confirmation.
- **Carry record:** The packet
  `workspace://project-manager/scratch/owner-unattended/20261126T093730Z-provenance-review-PMR-162.packet.md`
  matched its given SHA-256
  `ea35f6f76b77e1a3276085119c325ab84d78736056b3277b7904c878d477e1cc`, and
  this repository's `HEAD` matched its expected
  `b249346962523a8b7df702039fb1254664ccfde1`. The session's process command
  line showed
  `--model claude-opus-5.5 --reasoning-effort max --context long_context`
  and deny rules for push, fetch, pull, remote, tag, and `gh`. The local
  trusted-execution rule admits no sibling script (`PMR-066` is open), so,
  as the packet directs, the parent tasking resolver was not run.
  Read-only file reads instead found that
  `workspace://project-manager/outbox/tasking/provenance-review.md` binds the
  packet's Project Manager commit `af7340dcb87bb47d0474006f202f5733a1c5b79a`,
  request blob `01e0358ad249149fc906545f7c404a8ae0a70659`, and startup
  SHA-256
  `76961c4a434e159c6874348dd74837da54c9c5e77002ba0ec2b151c558e0acfe`, and
  that its `PMR-162` row matches the packet's action, basis, and note
  exactly. `workspace://SOT.md` hashed to that SHA-256, and a
  `git hash-object --no-filters` run from this repository over
  `workspace://project-manager/outbox/component-requests.md`, which wrote
  nothing, gave that request blob.
- **Inputs outside this repository:** Read-only file reads (one of them a
  Python text comparison of the packet with the tasking view), listings,
  text searches, and hashes covered only the packet, `workspace://SOT.md`,
  this component's entry in `workspace://COMPONENTS.md`, the tasking view
  and request table above,
  `workspace://project-manager/components/provenance-review.md`,
  `workspace://project-manager/templates/owner-return.md`, `PMD-20261125-002`,
  `PMD-20261126-002`, a listing of the decision records, and, for context
  only, the "P2 PMR-162" section of
  `workspace://project-manager/outbox/OWNER-RUNBOOK.md`. No Git command or
  script ran in a parent or sibling repository, and no parent or sibling
  file was written. The `cross-repo-collaboration` skill was not loaded: the
  work applies a Project Manager decision record and consumes no sibling
  research or analysis.
- **Commands in this repository:** Read-only Git inspection, a
  `git archive` of `b249346` extracted to a temporary directory outside the
  repository for the baseline run (removed afterwards), the maintained
  validation, read-only process inspection, and the two local commits.
- **Baseline and session state:**
  `b249346962523a8b7df702039fb1254664ccfde1` on clean `main`, 3 ahead and 0
  behind last-fetched `origin/main` `5238a90`, with no Git lock, stash, or
  additional worktree. Read-only process inspection at 2026-11-26T09:38:45Z
  found only this session's own processes with a working directory in this
  component; the other batch sessions observed ran in other components, and
  no `owner-session.sh`, `owner-recovery.sh`, or `maintenance-reservation.sh`
  process ran. This session is the sole writer until it ends. Any launcher
  lock or reservation belongs to the Project Manager.
- **Backup state:** `origin/main` remains
  `5238a9034cec92050d4c28beb3c053ecc58cbf5e` as last fetched. The five local
  commits `535a591`, `5b2ef38`, `b249346`, `7e95bdf`, and `SELF` have no
  backup. `PMD-20261125-002` does not cover them, since it covers the two
  packages only as already published; pushing them publishes them and needs
  its own gate run and the responsible human's same-turn confirmation.
- **Return commit:** `SELF`, the commit that adds this record; its full ID
  is reported in the session's final response.
- **Handoff correction:** This return also updates the last-updated date,
  the current state, and the exact next action above.
