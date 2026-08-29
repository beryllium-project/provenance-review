# Helium TE PoC security architecture provenance - Review Handoff

Review ID: `PRV-20260828-001`
Short name: `helium-te-security-architecture`
Distribution: `private`
Intended distribution: `public-candidate`
Created: `2026-08-28`
Status: `Complete`

## Overall position

The private amendment is complete and validated for Helium `for-review` commit
`1ab289c066b69acdd8b55c9f77055b0145be1316` under confirmed scope evidence
PRV-20260828-001-E0042. The committed baseline at `684d9bf` remains the
historical amendment comparison point; current baseline validation uses
`20bc43ef8131ccfc23d4cc3c7f135ead7f77f251`. All independent audit findings
are resolved.
The human-readable prior-art entry point is `prior-art-summary.md`, latest
`PRIOR-ART-ITERATION-001` dated 2026-08-29.

The strongest amended relationships are:

- verified source lineage from Beryllium minimal pathfinder `cc6029a` into
  exact fixed Sv39x4, validation, table-initialization, root-encoding, and
  generic runtime/trap source lines at TE checkpoint `511187f`;
- documented minimal-pathfinder predecessor concepts for policy/mechanism
  separation, identifiers versus authority, absent mappings, and fail-closed
  handling, without claiming those broader concepts as inherited source lines;
- documented Flask, SELinux, Xen XSM/FLASK, and RISC-V influence on the
  Beryllium TE framing and vocabulary at `511187f`;
- strong prior-art relationships for policy-gated mapping or exposure,
  separation of relationship or reachability authority from later use, and
  policy-derived fail-closed hardware permissions;
- adjacent, broadly analogous precedent from Petroni et al. for asynchronous
  policy-versus-live-AVC consistency monitoring; and
- unresolved origin for the exact policy-only `OPEN` name and no-PTE
  representation, one-rule non-composition, direct Beryllium-to-standalone
  transfer, and exact post-install TE-to-G-stage readback with terminal
  divergence handling.

The earliest supported selected-mechanism implementation is Beryllium
`511187f9d1f44c322e3a4a11347584fd8a20dc72` at
`2026-07-20T14:51:03Z`. James Morris is the supported Beryllium
implementation author, and the commit records Copilot co-authorship. James
Morris is also the supported author and committer of the later standalone
snapshot, but underlying standalone line authorship, direct transfer, and
conceptual origin remain unresolved.

## Exact target state

- Target: `target://helium-te-poc`
- Branch: `for-review`, tracking `origin/for-review`
- Revision: `1ab289c066b69acdd8b55c9f77055b0145be1316`
- State: exact clean committed revision; dirty-tree evidence excluded
- Target chronology boundary: 19 sanitized ancestor commits from
  `b3994e52663dab03d8025db2750a0650aa40e80c`; original internal development
  history intentionally absent
- Supplemental Beryllium cutoff: only evidence authored or committed no later
  than `2026-08-04T08:31:12Z`
- Earliest selected-mechanism predecessor:
  `workspace://beryllium-repo` commit
  `511187f9d1f44c322e3a4a11347584fd8a20dc72`
- Distribution: `private`
- Intended distribution: request `public-candidate`

## Completed phases

Scope freeze, aspect decomposition, internal lineage, local research, public
landscape, deep provenance, falsification, attribution assessment, and durable
output are complete.

## Blockers

- No analytical blocker remains for the private amendment.
- Promotion to `public-candidate` is blocked: private target evidence and
  retained sources with restricted, not-approved, or unknown redistribution
  remain evidence dependencies, and no responsible-human promotion record
  exists.
- High-priority retrieval gaps now also include original SELinux `file:map`,
  FreeBSD mapping-right and maximum-permission, Xen grant-map, and pKVM patch
  discussions; `cap-talk`; the sun4v hypervisor API; and pre-cutoff VMware
  DirectPath documentation.
- Original seL4 and CHERI discussion-archive records remain unavailable; the
  versioned manuals and specifications remain the substantive evidence.
- The former standalone `local-history` ref and `c8d1032` anchor remain
  unavailable, preventing direct proof of Beryllium-to-standalone transfer.

## Validation status

- Baseline completion validation passed on 2026-08-28 at evidence
  PRV-20260828-001-E0041.
- `bash ./scripts/validate-review.sh --baseline 684d9bf1fcb4030f5d3ace69b2364d431805db14 reviews/PRV-20260828-001-helium-te-security-architecture` - PASS in completion mode on 2026-08-28.
- `bash ./tests/validate-agent.sh` - PASS on 2026-08-28.
- `git --no-pager diff --check` - PASS on 2026-08-28.
- Evidence ID: PRV-20260828-001-E0126.
- The committed baseline at `684d9bf1fcb4030f5d3ace69b2364d431805db14`
  remains the historical amendment comparison point.
- `bash ./scripts/validate-review.sh --baseline 20bc43ef8131ccfc23d4cc3c7f135ead7f77f251 reviews/PRV-20260828-001-helium-te-security-architecture` - PASS in completion mode on 2026-08-29; the validator noted that the older baseline predates `prior-art-summary.md` and skipped only that history comparison.
- `python3 ./scripts/render-review.py --check reviews/PRV-20260828-001-helium-te-security-architecture` - PASS on 2026-08-29.
- `python3 -m unittest tests/test-render-review.py` - PASS on 2026-08-29.
- `bash ./tests/validate-agent.sh` - PASS on 2026-08-29.
- `git --no-pager diff --check` - PASS on 2026-08-29.
- Evidence ID: PRV-20260828-001-E0127.

## Exact next action

A responsible human should review `prior-art-summary.md` first, followed by
`source-scope-summary.md`, `report.md`, `attribution.md`, and
`publication-checklist.md`. Keep the package private unless every uncleared
dependency is resolved and the responsible human personally records a valid
promotion.

## Continuation paths

- Scope: `scope.md`
- Prior-art summary and latest iteration: `prior-art-summary.md`
- Report: `report.md`
- Aspect map: `aspect-map.md`
- Chronology: `chronology.md`
- Evidence ledger: `evidence-ledger.md`
- Attribution: `attribution.md`
- Search record: `search-log.md`
- Inaccessible resources: `inaccessible-resources.md`
- Publication gate: `publication-checklist.md`
- Quick source scope: `source-scope-summary.md`

## History integrity

Activity and evidence are intended to be append-only. Structural validation
does not prove this without `--baseline` comparison or Git-history review.
