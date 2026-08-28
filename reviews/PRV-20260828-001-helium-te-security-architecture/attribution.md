# Helium TE PoC security architecture provenance - Attribution

Review ID: `PRV-20260828-001`
Short name: `helium-te-security-architecture`
Distribution: `private`
Intended distribution: `public-candidate`
Created: `2026-08-28`
Status: `Complete`

## ATTRIBUTION-001

- Classification: documented influence
- Specific contribution: Source-type, target-type, object-class, and permission tuple used by the fixed Type Enforcement model.
- Candidate source or contributor: The Flask/SELinux architecture lineage explicitly named by the target.
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0012, PRV-20260828-001-E0013, PRV-20260828-001-E0020, PRV-20260828-001-E0039
- Confidence: High
- Evidence basis: The target explicitly states that its tuple follows basic Flask and SELinux TE vocabulary, and primary Flask evidence verifies the earlier architecture. Chronology: CHRON-004 and CHRON-011.
- Credit recommendation: Credit Ray Spencer, Stephen Smalley, Peter Loscocco, Mike Hibler, David Andersen, and Jay Lepreau for the 1999 Flask policy/enforcement architecture and credit the SELinuxProject only for the vocabulary lineage explicitly named by the target; describe the relationship as vocabulary and model influence.
- Alternatives/counter-evidence: The target expressly omits nearly all of Flask, SELinux, and XSM, and no primary source transfers the selected target-specific mechanisms.
- Limitations: Documented influence on the tuple does not establish source lineage for `OPEN`, complete-set checking, or policy-to-hardware reconciliation.

## ATTRIBUTION-002

- Classification: strong prior-art relationship
- Specific contribution: A distinct policy permission that gates whether a mapping or relationship may be established separately from later read, write, or execute authority.
- Candidate source or contributor: DTMach and Flask relationship controls, with Linux SELinux `map` as the closest later implementation precedent.
- Aspect IDs: ASPECT-001
- Evidence IDs: PRV-20260828-001-E0018, PRV-20260828-001-E0020, PRV-20260828-001-E0024
- Confidence: High
- Evidence basis: DTMach permits mapping-purpose use separately from other port operations; Flask controls connection and object-reference relationships; SELinux `map` independently gates memory mapping. Chronology: CHRON-009, CHRON-011, and CHRON-015.
- Credit recommendation: Credit Todd Fine and Spencer E. Minear for the 1993 DTMach possession/use separation, the Flask authors for relationship controls, and Linux commit `3ba4bf5f1e2c58bddd84ba27c5aeaf8ca1d36bff` for a distinct SELinux mapping permission.
- Alternatives/counter-evidence: These mechanisms differ from a policy-only bit named `OPEN` that is deliberately excluded from a second-stage PTE.
- Limitations: Exact `OPEN` terminology, no-PTE representation, and target influence remain unresolved.

## ATTRIBUTION-003

- Classification: strong prior-art relationship
- Specific contribution: Separation of exposure, reachability, possession, preparation, or mapping authority from authority to exercise later operations.
- Candidate source or contributor: Kain-Landwehr capability access checking, DTMach, Flask, and SELinux `map`.
- Aspect IDs: ASPECT-002
- Evidence IDs: PRV-20260828-001-E0017, PRV-20260828-001-E0018, PRV-20260828-001-E0020, PRV-20260828-001-E0024
- Confidence: High
- Evidence basis: Multiple independent primary sources predating the target distinguish preparation or relationship authority from later use authority. Chronology: CHRON-008, CHRON-009, CHRON-011, and CHRON-015.
- Credit recommendation: Credit Richard Y. Kain and Carl E. Landwehr for the preparation-versus-use taxonomy, Fine and Minear for explicit possession, transfer, mapping, and use separation, and the Flask and SELinux projects for relationship and mapping controls.
- Alternatives/counter-evidence: Pure capability designs can make possession itself sufficient authority, and the target's TE-to-G-stage seam is materially different.
- Limitations: No evidence establishes that the target derived its exposure-authority design from any one of these sources.

## ATTRIBUTION-004

- Classification: adjacent precedent
- Specific contribution: Requiring both policy denial and absence of a hardware mapping for selected private resources.
- Candidate source or contributor: Least-privilege, complete-mediation, capability reachability, and defense-in-depth traditions.
- Aspect IDs: ASPECT-002
- Evidence IDs: PRV-20260828-001-E0017, PRV-20260828-001-E0018, PRV-20260828-001-E0020, PRV-20260828-001-E0027
- Confidence: Medium
- Evidence basis: Earlier systems treat reachability or relationship state as security-relevant in addition to operation permission, but no inspected source requires the target's exact two-part denial invariant. Chronology: CHRON-008, CHRON-009, CHRON-011, and CHRON-017.
- Credit recommendation: Describe the invariant as target implementation built from established least-authority and relationship-control ideas; do not attribute the exact combination to a named prior system.
- Alternatives/counter-evidence: The invariant may be ordinary defense in depth, a representation-driven check, or an unrecorded specific influence.
- Limitations: Restricted DTOS reports and unavailable capability literature could contain a closer match.

## ATTRIBUTION-005

- Classification: strong prior-art relationship
- Specific contribution: Deriving policy rights into MMU or layered hardware enforcement and failing closed on denied, malformed, or incomplete permission state.
- Candidate source or contributor: Boebert-Kain Type Enforcement, DTOS, LOCK, and RISC-V SmMTT.
- Aspect IDs: ASPECT-003
- Evidence IDs: PRV-20260828-001-E0016, PRV-20260828-001-E0019, PRV-20260828-001-E0021, PRV-20260828-001-E0026
- Confidence: High
- Evidence basis: Primary sources document successive policy narrowing into MMU rights, security faults on unavailable decisions, policy-derived MMU enforcement, and conjunctive faulting hardware protections. Chronology: CHRON-007, CHRON-010, CHRON-012, and CHRON-016.
- Credit recommendation: Credit Boebert and Kain for the foundational TE-to-MMU path, Spencer Minear for DTOS policy-fault handling, O. Sami Saydjari for the LOCK account, and the RISC-V SmMTT Task Group for the v0.49 layered fail-closed specification.
- Alternatives/counter-evidence: These precedents trust translation or combine distinct mechanisms rather than independently reconciling two observations of one target policy.
- Limitations: Strong prior art applies to the broad derivation and fail-closed shape, not to the target's exact reconciliation algorithm.

## ATTRIBUTION-006

- Classification: unresolved
- Specific contribution: Querying candidate access bits individually and then requiring one matching rule to cover the complete `OPEN|R/W/X` request.
- Candidate source or contributor: No verified source; target implementation at sanitized snapshot commit `30c08e6345f6f0f2e0a716937d3cde6c8ed778c5`.
- Aspect IDs: ASPECT-003
- Evidence IDs: PRV-20260828-001-E0004, PRV-20260828-001-E0005, PRV-20260828-001-E0010, PRV-20260828-001-E0022, PRV-20260828-001-E0025
- Confidence: High
- Evidence basis: The target algorithm is exact, but Policy Machine and SELinux evidence show permission accumulation rather than a requirement that one syntactic rule supply every requested bit. Chronology: CHRON-004, CHRON-013, and CHRON-017.
- Credit recommendation: Credit the exact repository implementation to James Morris at the earliest supported snapshot, with the commit's Copilot co-authorship disclosure; make no conceptual-origin attribution.
- Alternatives/counter-evidence: The check may be an independently selected anti-composition invariant, ordinary defensive programming, or derived from an unavailable source.
- Limitations: The original development history is excluded and the available public evidence contradicts, rather than supports, a SELinux-origin theory.

## ATTRIBUTION-007

- Classification: unresolved
- Specific contribution: Runtime comparison of policy-derived access decisions with encoded G-stage permissions and terminal failure on divergence.
- Candidate source or contributor: No verified source; LOCK, DTOS, Flask, and SmMTT provide only adjacent mechanisms.
- Aspect IDs: ASPECT-003
- Evidence IDs: PRV-20260828-001-E0004, PRV-20260828-001-E0007, PRV-20260828-001-E0019, PRV-20260828-001-E0021, PRV-20260828-001-E0026, PRV-20260828-001-E0027, PRV-20260828-001-E0030
- Confidence: High
- Evidence basis: No inspected primary source independently reads encoded hardware state, compares it with the policy result, and terminates on mismatch. Chronology: CHRON-004, CHRON-010, CHRON-012, CHRON-016, and CHRON-017.
- Credit recommendation: Credit the exact repository implementation to James Morris at the sanitized snapshot, with the recorded Copilot co-authorship trailer; describe LOCK, DTOS, and SmMTT only as adjacent policy/enforcement precedents.
- Alternatives/counter-evidence: The unavailable SAT design report, restricted DTOS specifications, lower-level implementation records, or alternate terminology may reveal a closer predecessor.
- Limitations: A bounded negative search cannot establish novelty or independent creation.

## ATTRIBUTION-008

- Classification: unresolved
- Specific contribution: Conceptual origin of policy-only `OPEN`, separated exposure authority, one-rule non-composition, and policy-to-G-stage reconciliation in the target.
- Candidate source or contributor: James Morris is the supported repository implementation author; broader conceptual source remains unknown.
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0010, PRV-20260828-001-E0011, PRV-20260828-001-E0014, PRV-20260828-001-E0015, PRV-20260828-001-E0027
- Confidence: High
- Evidence basis: Sanitized commit and blame metadata establish repository authorship, while original history is omitted and retained reviews postdate the mechanisms. Chronology: CHRON-004, CHRON-005, and CHRON-006.
- Credit recommendation: Credit James Morris for the implementation present in the 2026-08-04 sanitized snapshot and preserve the snapshot's Copilot co-authorship disclosure; do not credit either with broad conceptual origin beyond the evidence.
- Alternatives/counter-evidence: Pre-snapshot commits, prompts, design notes, collaborators, or external sources may identify earlier implementation or conceptual contributions.
- Limitations: Git metadata, co-authorship trailers, and absence of a found source do not prove conceptual origin, contribution shares, independent convergence, or responsible-human approval.

## ATTRIBUTION-009

- Classification: verified source lineage
- Specific contribution: Exact fixed Sv39x4, address/path validation, table initialization, root encoding, map-validation fragments, and generic runtime/trap source lines inherited by the Beryllium TE pathfinder.
- Candidate source or contributor: Beryllium minimal RISC-V policy pathfinder commit `cc6029acdd5df1fc14157c4faea4cc047e49a90e`.
- Aspect IDs: ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0105, PRV-20260828-001-E0106, PRV-20260828-001-E0107, PRV-20260828-001-E0109
- Confidence: High
- Evidence basis: Direct Git ancestry places TE checkpoint `511187f` immediately after `cc6029a`, and exact blame preserves the enumerated fixed-G-stage and runtime/trap lines. Minimal policy/mechanism and absent-mapping concepts are documented predecessor context, not verified inherited implementation. Chronology: CHRON-018 and CHRON-019.
- Credit recommendation: Credit James Morris for the exact inherited minimal-pathfinder source lines and their adaptation in the TE checkpoint; describe policy/mechanism, identifiers-versus-authority, absent-mapping, and generic fail-closed statements as documented predecessor concepts only.
- Alternatives/counter-evidence: Shared project methodology may also explain similarities, but direct commit ancestry and retained lines establish implementation transfer for the bounded scaffolding.
- Limitations: This verified lineage does not cross the repository boundary into standalone Helium and does not establish conceptual origin.

## ATTRIBUTION-010

- Classification: adjacent precedent
- Specific contribution: Asynchronous independent comparison of protected policy state with live SELinux AVC enforcement-decision state.
- Candidate source or contributor: Nick L. Petroni Jr., Timothy Fraser, Aaron Walters, and William A. Arbaugh.
- Aspect IDs: ASPECT-003
- Evidence IDs: PRV-20260828-001-E0070, PRV-20260828-001-E0124
- Confidence: High
- Evidence basis: The 2006 USENIX Security paper independently and asynchronously recomputes OR-composed expected SELinux permission masks from protected policy tables and compares them with live AVC entries. Chronology: CHRON-026, CHRON-035, and CHRON-046.
- Credit recommendation: Credit the Petroni et al. paper for broadly analogous policy-versus-live-AVC consistency monitoring.
- Alternatives/counter-evidence: It checks a cache asynchronously and notifies rather than validating a PTE at installation or terminating immediately.
- Limitations: It is not mapping reconciliation, PTE readback, admission control, or immediate fail-stop handling; the target's exact sequence remains unresolved.

## ATTRIBUTION-011

- Classification: adjacent precedent
- Specific contribution: Complete selected-grant models that require all relevant rights or deny across a descriptor, capability, or policy-module set.
- Candidate source or contributor: Capsicum, TrustedBSD MAC, seL4, and CHERI.
- Aspect IDs: ASPECT-003
- Evidence IDs: PRV-20260828-001-E0052, PRV-20260828-001-E0061, PRV-20260828-001-E0062, PRV-20260828-001-E0072, PRV-20260828-001-E0071
- Confidence: High
- Evidence basis: Capsicum operations require complete descriptor rights, TrustedBSD denies if any active policy denies, and seL4 or CHERI use complete selected capabilities. Chronology: CHRON-025, CHRON-032, CHRON-036, and CHRON-037.
- Credit recommendation: Credit each system only for its own complete-grant or restrictive-composition model; do not describe any as the source of one-rule TE non-composition.
- Alternatives/counter-evidence: SELinux ordinary allow permissions accumulate, and seL4 may silently downgrade requested rights.
- Limitations: These models differ materially in syntax, authority representation, and failure behavior.

## Attribution boundary

Credit only the specific contribution supported by primary evidence. Git
authorship, style, bulk changes, chronology, or similarity alone do not prove
conceptual origin, copying, intent, or misconduct.
