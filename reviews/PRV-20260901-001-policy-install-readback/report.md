# Coding agent policy installation readback rationale - Report

Review ID: `PRV-20260901-001`
Short name: `policy-install-readback`
Distribution: `private`
Intended distribution: `public-candidate`
Created: `2026-09-01`
Status: `Complete`

## Executive summary

The strongest supported reason is **policy-to-PTE soundness at the
initialization boundary**. The coding agent treated the abstract TE decision
and the concrete G-stage leaf as separate representations that had to agree
before either subject could run. It therefore derived R/W/X from policy,
installed the leaf, re-queried policy and the stored PTE one bit at a time,
and terminated on either over-mapping or under-mapping. The purpose and
chronology are High confidence; the claim that this was the agent's sole
reason for selecting the precise per-bit algorithm is Medium confidence.

This was an agent-selected assurance mechanism, not an exact user
requirement and not a response to the retained independent review. The
pre-code plan required verification of mappings and denials before first VS
entry; the first runtime patch then implemented the comparison; later
same-session records named the objective `exact policy-to-PTE correspondence`
and formulated the proof target as every installed PTE being no more
permissive than TE.

The mechanism originated in the Beryllium fixed-TE pathfinder at
`511187f9d1f44c322e3a4a11347584fd8a20dc72` and was directly transferred
through a documented standalone extraction and later history-sanitized
snapshot. Its external conceptual source remains unresolved. General
reference-monitor assurance and older policy-versus-enforcement consistency
work explain why this is a recognizable high-assurance pattern, but no
reached primary source matches the exact derive-install-read-PTE-compare-
immediate-fail sequence.

## OBS-001

- Observation: The coding agent used the readback to close the assurance gap between a policy decision and the enforcement state produced from it before activation.
- Aspect IDs: ASPECT-001
- Evidence IDs: PRV-20260901-001-E0007, PRV-20260901-001-E0009
- Chronology IDs: CHRON-006, CHRON-007, CHRON-010
- Confidence: High
- Evidence basis: The pre-code plan requires mapping/denial verification before first VS entry; same-session project records call exact policy-to-PTE correspondence a design objective and define policy-to-PTE soundness as preventing installed PTEs from exceeding TE.
- Alternatives/counter-evidence: The exact per-bit re-read algorithm was not specified in the initial user request or pre-code plan, so the final implementation detail remains an agent engineering choice.
- Limitations: Retained records establish the stated engineering rationale, not hidden model reasoning or subjective intent.

## OBS-002

- Observation: The selected check compares both directions of the R/W/X relationship and fails before subject execution.
- Aspect IDs: ASPECT-001
- Evidence IDs: PRV-20260901-001-E0005, PRV-20260901-001-E0012
- Chronology IDs: CHRON-014
- Confidence: High
- Evidence basis: `he_map_or_fail()` installs a leaf, re-evaluates each policy bit, queries the corresponding stored PTE bit, and invokes terminal failure whenever the boolean results differ.
- Alternatives/counter-evidence: Required-private-absence and final shared-asymmetry checks also contribute to initialization assurance; the readback is not the sole consistency mechanism.
- Limitations: The function checks R/W/X correspondence, not every PTE field, HPA identity, TLB contents, or later mutation.

## OBS-003

- Observation: The readback was present in the first retained runtime patch and therefore was not added in response to the later independent design review.
- Aspect IDs: ASPECT-001
- Evidence IDs: PRV-20260901-001-E0007, PRV-20260901-001-E0008
- Chronology IDs: CHRON-007, CHRON-008, CHRON-009
- Confidence: High
- Evidence basis: The patch was applied at 07:22:45Z; the review was launched at 07:26:43Z and completed at 07:41:53Z; the commit followed at 14:51:03Z.
- Alternatives/counter-evidence: An unrecorded earlier source or review may have influenced the agent.
- Limitations: The chronology falsifies only the retained-review-trigger hypothesis.

## OBS-004

- Observation: Direct Beryllium-to-standalone source lineage is now supported for the mechanism.
- Aspect IDs: ASPECT-001
- Evidence IDs: PRV-20260901-001-E0006, PRV-20260901-001-E0010, PRV-20260901-001-E0013
- Chronology IDs: CHRON-009, CHRON-011, CHRON-012, CHRON-013, CHRON-015
- Confidence: High
- Evidence basis: A Beryllium-associated session explicitly flattened the fixed-TE pathfinder into standalone Helium and moved the implementation to repository root; the next session preserved full history and committed the sanitized snapshot; one exact source blob bridges the repositories.
- Alternatives/counter-evidence: Structural and identity edits changed some files, including the whole `main.c` blob.
- Limitations: Unavailable intermediate commits prevent complete file-by-file byte reconstruction.

## OBS-005

- Observation: The mechanism is an initialization-time software-state reconciliation, not a continuous or independent hardware readback.
- Aspect IDs: ASPECT-001
- Evidence IDs: PRV-20260901-001-E0005, PRV-20260901-001-E0012
- Chronology IDs: CHRON-014
- Confidence: High
- Evidence basis: `he_gstage_allows()` reads ordinary page-table memory immediately after `he_gstage_map()` during root construction; later HGATP CSR readback is a separate path.
- Alternatives/counter-evidence: The separate functions and two-sided comparison can still catch classes of mapper, argument, or stored-bit divergence.
- Limitations: Encoder and checker share one trusted image, policy API, PTE constants, compiler, and memory. Common-mode defects or post-check mutation can escape it.

## OBS-006

- Observation: Available agent history supplies no evidence that a known defect triggered the check or that later readback work explains its origin.
- Aspect IDs: ASPECT-001
- Evidence IDs: PRV-20260901-001-E0011
- Chronology IDs: CHRON-016
- Confidence: High
- Evidence basis: All 18 Beryllium/origin sessions and 8 provenance-review sessions were indexed. Exact selected-mechanism rationale appears in the origin session; later readback matches concern CSR/root/fence or proof-package work.
- Alternatives/counter-evidence: Unavailable or differently indexed history may use other terminology.
- Limitations: A negative history search cannot prove no unrecorded trigger existed.

## OBS-007

- Observation: Public primary sources establish a general high-assurance rationale but not direct source-specific influence for the exact algorithm.
- Aspect IDs: ASPECT-001
- Evidence IDs: PRV-20260901-001-E0014, PRV-20260901-001-E0015, PRV-20260901-001-E0016, PRV-20260901-001-E0017, PRV-20260901-001-E0019, PRV-20260901-001-E0020, PRV-20260901-001-E0021, PRV-20260901-001-E0022, PRV-20260901-001-E0023
- Chronology IDs: CHRON-002, CHRON-003, CHRON-004, CHRON-017, CHRON-018, CHRON-019, CHRON-020, CHRON-021
- Confidence: High
- Evidence basis: NIST separates access decisions from enforcement and requires verifiable, protectively failing control; DTOS requires current policy at enforcement points and secure startup; Flask validates mapped-memory access and revalidation; LOCK identifies the trusted policy-to-MMU translation seam; Petroni compares policy-derived expectations with live enforcement state; seL4 supplies proof and translation-validation alternatives.
- Alternatives/counter-evidence: LOCK trusts translation, seL4 proves correspondence, Petroni monitors asynchronously, and pKVM acknowledges possible incoherency; runtime readback is defensible but not universal.
- Limitations: No reached source matches the complete target sequence, so exact external conceptual origin remains unresolved.

## Falsification summary

| Hypothesis | Result | Evidence |
| --- | --- | --- |
| The user explicitly required a readback loop | Weakened: the user required policy enforcement and tests, not this algorithm | PRV-20260901-001-E0007 |
| A later reviewer requested the mechanism | Falsified for the retained review by timestamp order | PRV-20260901-001-E0008 |
| The mechanism reads hardware-enforced translation state | Falsified: it reads stored software PTE state; HGATP readback is separate | PRV-20260901-001-E0005 |
| The mechanism continuously protects against later mutation | Falsified: it runs during fixed initialization | PRV-20260901-001-E0005, PRV-20260901-001-E0012 |
| It is a fully independent checker | Weakened by shared policy, constants, code image, compiler, and memory | PRV-20260901-001-E0012 |
| It was transferred from Beryllium into standalone Helium | Supported by direct session and blob evidence | PRV-20260901-001-E0010 |
| A specific public predecessor supplied the exact algorithm | Unresolved; strong constituent prior art and adjacent precedent were found, but not the complete sequence | PRV-20260901-001-E0014, PRV-20260901-001-E0015, PRV-20260901-001-E0016, PRV-20260901-001-E0017, PRV-20260901-001-E0019, PRV-20260901-001-E0020, PRV-20260901-001-E0021, PRV-20260901-001-E0022 |
| Runtime readback is required in every high-assurance design | Weakened: trusted translation, proof-based refinement, asynchronous monitoring, and acknowledged incoherency are documented alternatives | PRV-20260901-001-E0020, PRV-20260901-001-E0021, PRV-20260901-001-E0022, PRV-20260901-001-E0023 |

## Overall alternatives and limitations

The best-supported explanation is ordinary high-assurance defensive design:
the agent wanted a small, explicit, fail-closed checkpoint at the boundary
where policy becomes hardware-consumed page-table state. A secondary
motivation was proof and review visibility: the finite fixed experiment could
state and inspect a policy-to-PTE correspondence invariant.

The evidence does not establish that this exact pattern was novel,
independently invented, copied from a public source, or sufficient for a
production reference monitor. It also does not establish hardware validation,
formal verification, source-to-binary correspondence, continuous integrity,
or protection against a compromised trusted monitor. The former standalone
full-history objects remain unavailable, and the direct divergence branch has
no maintained negative test.
