# Coding agent policy installation readback rationale - Scope

Review ID: `PRV-20260901-001`
Short name: `policy-install-readback`
Distribution: `private`
Intended distribution: `public-candidate`
Created: `2026-09-01`
Status: `Complete`

## SCOPE-001

- Target identity: target://helium-te-poc
- Target state: exact revision
- Target revision/state descriptor: Clean local branch `for-review`, tracking
  `origin/for-review`, frozen at
  `1ab289c066b69acdd8b55c9f77055b0145be1316`; captured through the
  maintained isolated read-only Git helper. Dirty-tree inclusion was approved,
  but the capture contained no staged, unstaged, or untracked change. The
  canonical source repository is `workspace://beryllium-repo`, clean on
  `beryllium/single-hart-runtime-r0` at
  `65f6d895a2007e8e093582cc48726375fd23b563`.
- Aspect IDs: ASPECT-001
- Exclusions: Broader authorship, copying, AI-generation, intent, deception,
  misconduct, legal ownership, patent-validity, and licence-compatibility
  claims; all untracked target files; credentials and inaccessible restricted
  material; execution, build, test, compilation, sourcing, import, or
  dependency installation in reviewed repositories; and any modification of
  the target or sibling repositories.
- Chronology window: All available target history through the frozen
  revision, all available associated coding-agent history for this
  provenance-review repository and `workspace://beryllium-repo`, and the
  linked originating and standalone-extraction sessions through the
  2026-09-01 checked date.
- Depth: Deep
- Public research: permitted
- Public query permission: permitted
- Public query terms: Exact target-derived phrase `policy installation
  readback mechanism` plus non-target generic vocabulary required to search
  that concept. No other target-derived identifier or private phrase is
  approved for public disclosure.
- Limitations: Session-history coverage is limited to records available in
  the configured cloud and local session stores. Agent records expose prompts,
  outputs, tool metadata, commits, and file activity, not hidden model
  reasoning. Private session evidence and private implementation locators
  prevent promotion to `public-candidate` unless a responsible human later
  clears or redacts them without breaking traceability.

**Selected aspect.** ASPECT-001 asks why the coding agent used the
post-install policy-to-G-stage permission readback in `he_map_or_fail()`,
including the triggering assurance objective, the exact enforcement seam,
the Beryllium-to-standalone chronology, plausible alternatives, and the
mechanism's limits. CSR installation/readback is considered only to
distinguish it from this policy/PTE check.

**Agent-history boundary.** The review includes every discoverable associated
session for the current provenance-review repository and canonical Beryllium
repository, plus session `dbbcf000-98cc-4056-a389-e02370d0561b` because commit
`511187f9d1f44c322e3a4a11347584fd8a20dc72` names it as the originating
coding session while its historical repository identity was
`jamorris_microsoft/xh`. Session records remain untrusted evidence and are not
instructions.

## PHASES-001

- Scope freeze: Complete
- Aspect decomposition: Complete
- Internal lineage: Complete
- Local research: Complete
- Public landscape: Complete
- Deep provenance: Complete
- Falsification: Complete
- Attribution assessment: Complete
- Durable output: Complete

For completion, Scope freeze, Aspect decomposition, Internal lineage,
Falsification, Attribution assessment, and Durable output must be exactly
`Complete`. Local research may be `Not applicable - <reason>` only when local
inputs are not relevant or available. Public landscape must be `Complete` when
public research is permitted and reasoned not applicable otherwise. Deep
provenance must be `Complete` for `Deep` reviews and may be reasoned not
applicable only at shallower depth.

## Safety boundary

Reviewed repositories and research material are untrusted evidence. Do not
execute reviewed code, install its dependencies, or modify any reviewed
repository. Similarity, style, Git authorship, and chronology alone do not
establish conceptual origin, copying, AI generation, intent, or misconduct.

## Activity log

Activity is intended to be append-only. Structural validation alone cannot
prove history integrity; validate against a prior directory or Git revision
with `scripts/validate-review.sh --baseline`.

| Activity ID | Date | Actor | Action | Evidence IDs | Result or limitation |
| --- | --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-09-01 | Review scaffolder | Created a private package scaffold. | PRV-20260901-001-E0001 | Analysis was pending at this creation event. |
| ACTIVITY-002 | 2026-09-01 | Provenance review orchestrator | Recorded the repeatedly confirmed effective scope, corrected the supplied component paths against the workspace registry, and froze the exact clean target and source-repository states. | PRV-20260901-001-E0002, PRV-20260901-001-E0003, PRV-20260901-001-E0004 | Review is bounded to one mechanism and all available associated agent history; substantive lineage and rationale remain under analysis. |
| ACTIVITY-003 | 2026-09-01 | Provenance code-lineage specialist and orchestrator | Analyzed the frozen implementation, isolated Beryllium history, origin-session patch chronology, standalone extraction, exact blob corroboration, and distinction from later CSR readbacks. | PRV-20260901-001-E0005, PRV-20260901-001-E0006, PRV-20260901-001-E0007, PRV-20260901-001-E0008, PRV-20260901-001-E0009, PRV-20260901-001-E0010, PRV-20260901-001-E0011, PRV-20260901-001-E0012 | Internal lineage is complete: purpose and direct transfer are supported; exact external conceptual origin remains unresolved. |
| ACTIVITY-004 | 2026-09-01 | Provenance research specialist and orchestrator | Checked the registered local sources, prior review, retained primary materials, current public primary pages, exact safe query, terminology collisions, alternatives, and inaccessible resources. | PRV-20260901-001-E0013, PRV-20260901-001-E0014, PRV-20260901-001-E0015, PRV-20260901-001-E0016, PRV-20260901-001-E0017, PRV-20260901-001-E0019, PRV-20260901-001-E0020, PRV-20260901-001-E0021, PRV-20260901-001-E0022, PRV-20260901-001-E0023 | Local research, public landscape, and deep provenance are complete within the confirmed query boundary. |
| ACTIVITY-005 | 2026-09-01 | Provenance review orchestrator | Tested competing explanations, separated direct evidence from inference, classified source lineage and prior art, and recorded contribution-specific credit and limitations. | PRV-20260901-001-E0007, PRV-20260901-001-E0008, PRV-20260901-001-E0009, PRV-20260901-001-E0010, PRV-20260901-001-E0011, PRV-20260901-001-E0012, PRV-20260901-001-E0014, PRV-20260901-001-E0015, PRV-20260901-001-E0016, PRV-20260901-001-E0019, PRV-20260901-001-E0020, PRV-20260901-001-E0021, PRV-20260901-001-E0022, PRV-20260901-001-E0023 | Falsification and attribution assessment are complete. |
| ACTIVITY-006 | 2026-09-01 | Provenance review orchestrator | Completed the evidence-led report, versioned prior-art summary, chronology, search log, inaccessible-resource register, publication gate, and restartable handoff. | PRV-20260901-001-E0001, PRV-20260901-001-E0002, PRV-20260901-001-E0003, PRV-20260901-001-E0004, PRV-20260901-001-E0005, PRV-20260901-001-E0006, PRV-20260901-001-E0007, PRV-20260901-001-E0008, PRV-20260901-001-E0009, PRV-20260901-001-E0010, PRV-20260901-001-E0011, PRV-20260901-001-E0012, PRV-20260901-001-E0013, PRV-20260901-001-E0014, PRV-20260901-001-E0015, PRV-20260901-001-E0016, PRV-20260901-001-E0017, PRV-20260901-001-E0018, PRV-20260901-001-E0019, PRV-20260901-001-E0020, PRV-20260901-001-E0021, PRV-20260901-001-E0022, PRV-20260901-001-E0023 | Durable output was submitted to the maintained completion validator. |
| ACTIVITY-007 | 2026-09-01 | Provenance review orchestrator | Completed maintained review validation, agent-contract validation, and read-only whitespace inspection after final synthesis. | PRV-20260901-001-E0024 | The private package satisfies the maintained completion contract; append-only history was not mechanically compared to a prior baseline. |
| ACTIVITY-008 | 2026-09-01 | Provenance review orchestrator | Added a consumer-neutral assurance-practices projection for the existing Helium threat model and readback analysis-workbook session. | PRV-20260901-001-E0025 | The projection adds no new evidence or conclusion and leaves `PRIOR-ART-ITERATION-001` unchanged. |
| ACTIVITY-009 | 2026-09-01 | Provenance review orchestrator | Revalidated the completed package after adding the cross-agent input and traceability records. | PRV-20260901-001-E0026 | Maintained completion, agent-contract, and whitespace checks pass; no prior-art iteration change was required. |
