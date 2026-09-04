# Coding agent policy installation readback rationale - Search Log

Review ID: `PRV-20260901-001`
Short name: `policy-install-readback`
Distribution: `private`
Intended distribution: `public-candidate`
Created: `2026-09-01`
Status: `Complete`

Search activity is intended to be append-only. Preserve exact negative
queries, terminology collisions, source dates, and access limitations.

## SEARCH-001

- Date: 2026-09-01
- Pass: Review initialization
- Aspect IDs: ASPECT-001
- Query or action: Administrative creation event before substantive searching began.
- Sources searched: Repository-generated review metadata.
- Result: The package existed and substantive analysis was still pending at this historical event.
- Evidence IDs: PRV-20260901-001-E0001
- Negative result: No substantive search result is attributed to this administrative event.
- Terminology collisions: Assessment occurred in later search records.
- Limitations: This record preserves initialization history only.

## SEARCH-002

- Date: 2026-09-01
- Pass: Target mechanism discovery
- Aspect IDs: ASPECT-001
- Query or action: Searched the frozen target for `readback`, `policy ... install`, `install ... policy`, `he_map_or_fail`, `policy-to-PTE`, `permissions diverged`, and G-stage permission inspection.
- Sources searched: `target://helium-te-poc` source, tests, documentation, and retained agent-review material.
- Result: Located the selected sequence in `src/main.c` and `src/memory.c`, its maintained rationale in engineering/code-tour/security documents, and later reviewer characterizations.
- Evidence IDs: PRV-20260901-001-E0005, PRV-20260901-001-E0012
- Negative result: No maintained test directly forces the terminal `TE and G-stage permissions diverged` branch.
- Terminology collisions: Target material also uses `readback` for HGATP and other CSR state; those mechanisms are distinct.
- Limitations: Text search and exact source inspection do not expose hidden reasoning.

## SEARCH-003

- Date: 2026-09-01
- Pass: Read-only repository chronology
- Aspect IDs: ASPECT-001
- Query or action: Used only `scripts/git-readonly.sh` state, resolve, log, show, blame, and ls-tree operations for the target, canonical Beryllium source repository, and current provenance-review baseline.
- Sources searched: Frozen Helium `for-review`; Beryllium commits `cc6029a`, `511187f`, `ecbcfef`, and current checked state; standalone commit `30c08e6`.
- Result: Bound the target to `1ab289c`, placed the selected implementation at `511187f`, separated inherited scaffolding through blame, and found one exact cross-repository `src/memory.c` blob bridge after the identity split.
- Evidence IDs: PRV-20260901-001-E0003, PRV-20260901-001-E0004, PRV-20260901-001-E0006, PRV-20260901-001-E0010, PRV-20260901-001-E0018
- Negative result: Former full-history commits `8ba7182` and `c8d1032` no longer resolve in either current repository.
- Terminology collisions: Git blame after the identity refactor attributes renamed lines to `ecbcfef`; this is not conceptual-origin evidence.
- Limitations: No direct Git fallback or reconstruction was attempted.

## SEARCH-004

- Date: 2026-09-01
- Pass: Complete associated-agent-history audit
- Aspect IDs: ASPECT-001
- Query or action: Indexed every available associated session and turn, then searched exact and broader families including `policy-to-PTE`, policy plus PTE, selected map symbols, divergence text, mapping permissions, correspondence, and `readback`.
- Sources searched: Cloud session history for the origin session and all canonical Beryllium-associated sessions; local session history for this provenance-review repository.
- Result: Covered 18 Beryllium/origin sessions with 586 turns and 8 provenance-review sessions with 12 turns. Exact selected-mechanism rationale occurs only in the origin session and prior review result.
- Evidence IDs: PRV-20260901-001-E0007, PRV-20260901-001-E0008, PRV-20260901-001-E0009, PRV-20260901-001-E0010, PRV-20260901-001-E0011, PRV-20260901-001-E0013
- Negative result: Thirty-seven later `readback` turns contain no selected map symbol or divergence string; 36 concern CSR/root/fence transitions and one summarizes a later exact-byte proof.
- Terminology collisions: `readback` is heavily used by later R3-R8 work for architectural CSR and root-switch checks.
- Limitations: Available indexed history may omit deleted, unsynchronized, or differently named sessions.

## SEARCH-005

- Date: 2026-09-01
- Pass: Registered local research
- Aspect IDs: ASPECT-001
- Query or action: Read `RESEARCH-SOURCES.md`, the current instructions and handoffs for Helium and Beryllium, the completed `PRV-20260828-001` package, and relevant retained primary materials in approved OS-security and formal-verification sources.
- Sources searched: Registered `../helium-te-poc/`, `../beryllium-repo/`, `../osr-claude/` at `f2edd17c6ed70f09a9b3db98eec27e54e185612a`, `../formal-verification-research/` at `eaa497b`, and current provenance-review artifacts.
- Result: Reused the earlier landscape, added DTOS, Flask, LOCK, seL4 integrity, and translation-validation evidence for constituent rationale, and identified new extraction-session evidence that changes direct transfer from unresolved to verified source lineage.
- Evidence IDs: PRV-20260901-001-E0004, PRV-20260901-001-E0010, PRV-20260901-001-E0013, PRV-20260901-001-E0016, PRV-20260901-001-E0019, PRV-20260901-001-E0020, PRV-20260901-001-E0021, PRV-20260901-001-E0022
- Negative result: Other registered local research components were not needed to establish the agent's reason; no new restricted source was accessed.
- Terminology collisions: Earlier review label `dual permission derivation` overlaps but is broader than this reason-focused aspect.
- Limitations: Local syntheses are not substitutes for the public primary sources retained below.

## SEARCH-006

- Date: 2026-09-01
- Pass: Public landscape and deep provenance
- Aspect IDs: ASPECT-001
- Query or action: Exact queries included `"policy installation readback mechanism"`, `site:usenix.org policy enforcement state consistency SELinux AVC semantic integrity`, and `site:nist.gov fail-safe defaults complete mediation reference monitor verification`; follow-up opened official NIST and USENIX primary pages.
- Sources searched: NIST publications and glossary; official USENIX and SELinux/Flask publication pages.
- Result: Reached NIST's decision/enforcement and verifiability framework and Petroni et al.'s policy-versus-live-AVC consistency monitor; retained primary sources additionally established DTOS fail-closed startup, Flask mapped-memory validation, LOCK policy-to-MMU translation, seL4 policy/protection refinement, translation validation, and pKVM incoherency counter-evidence.
- Evidence IDs: PRV-20260901-001-E0014, PRV-20260901-001-E0015, PRV-20260901-001-E0016, PRV-20260901-001-E0017, PRV-20260901-001-E0019, PRV-20260901-001-E0020, PRV-20260901-001-E0021, PRV-20260901-001-E0022, PRV-20260901-001-E0023
- Negative result: The exact phrase produced no direct named mechanism, and no reached primary source matched the full derive-install-PTE-inspect-compare-immediate-fail sequence.
- Terminology collisions: Relevant work appears under reference validation, mediated access, semantic integrity, policy change, retained permissions, and revalidation rather than `installation readback`.
- Limitations: Search indexing is incomplete; exact external conceptual origin remains unresolved.

## SEARCH-007

- Date: 2026-09-01
- Pass: Falsification and counter-evidence
- Aspect IDs: ASPECT-001
- Query or action: Tested hypotheses that the mechanism was user-specified, reviewer-triggered, continuous, hardware-observed, fully independent, directly negative-tested, uniquely sourced, or universally required by high-assurance practice.
- Sources searched: Origin prompt/tool chronology, target source/tests, all associated session matches, prior review, and public primary sources.
- Result: The exact user prompt did not request readback; the first patch predates retained independent review; the check is boot-time software page-table reconciliation with same-TCB dependencies; LOCK, proof-based seL4 refinement, asynchronous monitoring, and pKVM provide alternative assurance choices; exact external source remains unresolved.
- Evidence IDs: PRV-20260901-001-E0005, PRV-20260901-001-E0007, PRV-20260901-001-E0008, PRV-20260901-001-E0011, PRV-20260901-001-E0012, PRV-20260901-001-E0017, PRV-20260901-001-E0020, PRV-20260901-001-E0021, PRV-20260901-001-E0022, PRV-20260901-001-E0023
- Negative result: No evidence supports a defect-triggered addition, continuous runtime monitor, hardware/TLB observation, or direct negative test of the divergence branch.
- Terminology collisions: Later HGATP/fence/readback and proof-package uses are separate mechanisms.
- Limitations: Absence of retained evidence does not prove absence of unrecorded influence.
