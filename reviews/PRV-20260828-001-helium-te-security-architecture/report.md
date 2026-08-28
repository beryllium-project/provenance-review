# Helium TE PoC security architecture provenance - Report

Review ID: `PRV-20260828-001`
Short name: `helium-te-security-architecture`
Distribution: `private`
Intended distribution: `public-candidate`
Created: `2026-08-28`
Status: `Complete`

## Executive summary

Internal lineage is complete within the confirmed history-sanitized
`for-review` ancestry. All selected mechanisms are already present in the
2026-08-04 sanitized snapshot, which omits the original development history.
The target explicitly documents FLASK/SELinux-shaped TE vocabulary and broad
security-principle influences, but it does not identify a source for the
policy-only `OPEN` permission, separated exposure authority, complete-request
non-composition, per-bit-plus-combined derivation, policy-to-hardware
reconciliation, or denial-plus-absent-mapping invariant.
Evidence: PRV-20260828-001-E0010, PRV-20260828-001-E0012,
PRV-20260828-001-E0039. Chronology: CHRON-004.

Primary-source research establishes strong prior art for a distinct policy
permission to create a mapping or relationship separately from later access,
led by DTMach, Flask relationship controls, and Linux SELinux `map`.
Foundational Type Enforcement, LOCK, DTOS, and SmMTT establish strong or
adjacent precedent for deriving rights into hardware enforcement and failing
closed on denied or malformed states. None of the inspected sources confirms
the target's exact `OPEN` name and no-PTE representation, its requirement that
one rule cover the complete request, or runtime TE-to-G-stage readback with
terminal handling on divergence.
Evidence: PRV-20260828-001-E0016, PRV-20260828-001-E0018,
PRV-20260828-001-E0020, PRV-20260828-001-E0021,
PRV-20260828-001-E0024, PRV-20260828-001-E0026,
PRV-20260828-001-E0027. Chronology: CHRON-007, CHRON-009,
CHRON-011, CHRON-012, CHRON-015, CHRON-016, CHRON-017.

The strongest final determinations are therefore contribution-specific:
documented influence for the general FLASK/SELinux TE tuple; strong prior-art
relationships for policy-gated mapping/exposure, separated relationship and
use authority, and policy-derived fail-closed hardware permissions; and
unresolved origin for the exact `OPEN` mechanism, one-rule non-composition,
and runtime policy-to-hardware reconciliation. No verified source lineage or
affirmative independent-convergence evidence was found.
Evidence: PRV-20260828-001-E0025, PRV-20260828-001-E0027,
PRV-20260828-001-E0038, PRV-20260828-001-E0039.
Chronology: CHRON-004, CHRON-013, CHRON-017.

## OBS-001

- Observation: At package creation on 2026-08-28, the private draft existed and analysis had not started.
- Aspect IDs: ASPECT-001
- Evidence IDs: PRV-20260828-001-E0001
- Chronology IDs: CHRON-001
- Confidence: Low
- Evidence basis: Repository-generated administrative metadata only.
- Alternatives/counter-evidence: The scope may change or the review may not proceed.
- Limitations: Historical initialization record only; OBS-002 through OBS-014 contain the completed assessment.

## OBS-002

- Observation: The permitted `for-review` ancestry contains 19 commits and begins with an external-review landing page followed by a sanitized source snapshot that explicitly omits internal development history.
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0010
- Chronology IDs: CHRON-003, CHRON-004
- Confidence: High
- Evidence basis: Complete isolated ancestor log and the snapshot commit message.
- Alternatives/counter-evidence: The original implementation may predate the sanitized branch and may have different authorship, terminology, or source records.
- Limitations: The earliest supported repository occurrence is not an original creation date.

## OBS-003

- Observation: Every selected mechanism is present at snapshot commit `30c08e6345f6f0f2e0a716937d3cde6c8ed778c5`, and frozen-revision blame attributes the selected implementation and core explanatory documentation to that commit.
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0010, PRV-20260828-001-E0011
- Chronology IDs: CHRON-004
- Confidence: High
- Evidence basis: Isolated blame for the TE interface and mechanism, fixed policy, runtime, G-stage implementation, and maintained concept, architecture, and security documentation.
- Alternatives/counter-evidence: Snapshot import can preserve content authored earlier by the same or other contributors; Git attribution does not establish conceptual origin.
- Limitations: No pre-snapshot commit or authorship chain is available within scope.

## OBS-004

- Observation: Target records attribute the sanitized implementation to James Morris as Git author and committer and disclose a Copilot co-authorship trailer, but they do not establish conceptual authorship or completed responsible-human approval.
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0011, PRV-20260828-001-E0015
- Chronology IDs: CHRON-004, CHRON-006
- Confidence: High
- Evidence basis: Isolated commit/blame metadata and target handoff statements.
- Alternatives/counter-evidence: Earlier human or automated contributions may exist outside the sanitized history; the trailer does not allocate contribution by mechanism.
- Limitations: No PR review, H6 exact-source review, H7 approval, or original design record is available in the permitted evidence.

## OBS-005

- Observation: The target explicitly documents FLASK and SELinux influence on the source-type, target-type, object-class, and permission vocabulary and cites XSM/FLASK as hypervisor prior art.
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0012, PRV-20260828-001-E0013
- Chronology IDs: CHRON-004
- Confidence: High
- Evidence basis: Frozen maintained policy-model documentation and target bibliography.
- Alternatives/counter-evidence: The target wording may describe analogy or vocabulary adoption rather than transfer of the selected algorithms. It expressly disclaims being SELinux, XSM, or FLASK.
- Limitations: No target record attributes `OPEN`, the exposure/use split, complete-request non-composition, per-bit-plus-combined authorization, TE-to-G-stage reconciliation, or denial-plus-absence to those systems.

## OBS-006

- Observation: All five retained agent security reviews postdate the selected mechanisms and are explicitly connected only to adjacent remediation work, not to introduction of ASPECT-001 through ASPECT-003.
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0014, PRV-20260828-001-E0015
- Chronology IDs: CHRON-005, CHRON-006
- Confidence: High
- Evidence basis: Review integration commit chronology, frozen blame, and the maintained remediation handoff identifying unchanged retained packages and fixed policy.
- Alternatives/counter-evidence: A pre-snapshot review, prompt, or discussion outside the sanitized ancestry could still have influenced the original implementation.
- Limitations: Several retained packages have incomplete or conflicting self-reported baseline or model metadata.

## OBS-007

- Observation: Internal evidence supports documented influence only for the general TE tuple and vocabulary. Conceptual origin remains unresolved for policy-only `OPEN`, separated exposure authority, per-bit-plus-combined authorization, policy-to-hardware reconciliation, and denial-plus-absent-mapping.
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0010, PRV-20260828-001-E0012, PRV-20260828-001-E0013, PRV-20260828-001-E0014, PRV-20260828-001-E0015
- Chronology IDs: CHRON-004, CHRON-005, CHRON-006
- Confidence: High
- Evidence basis: Explicit target source statements, complete permitted chronology, review postdating, and absence of a mechanism-specific source record.
- Alternatives/counter-evidence: Generic fail-safe defaults, least privilege, complete mediation, hardware representation constraints, ordinary exact-key/subset authorization, defense in depth, or an unavailable earlier source may explain the design.
- Limitations: This observation records the internal-lineage stage. Completed external comparison appears in OBS-008 through OBS-014; absence of a target record remains insufficient to prove independent creation.

## OBS-008

- Observation: Policy-gated mapping or relationship creation separate from later data access substantially predates the target.
- Aspect IDs: ASPECT-001
- Evidence IDs: PRV-20260828-001-E0018, PRV-20260828-001-E0020, PRV-20260828-001-E0024
- Chronology IDs: CHRON-009, CHRON-011, CHRON-015
- Confidence: High
- Evidence basis: DTMach permits mapping-purpose use distinct from other port operations; Flask separately controls connections and references usable for mapping or export; SELinux added a distinct `map` permission before `mmap`.
- Alternatives/counter-evidence: These systems use Mach relationships, Flask reference controls, or Linux file mappings rather than a TE permission named `OPEN` that is excluded from a second-stage PTE.
- Limitations: Strong prior art does not establish target influence or derivation. The exact target name and representation remain unresolved.

## OBS-009

- Observation: Separating reachability, possession, preparation, or mapping authority from subsequent operation authority is established prior art.
- Aspect IDs: ASPECT-002
- Evidence IDs: PRV-20260828-001-E0017, PRV-20260828-001-E0018, PRV-20260828-001-E0020, PRV-20260828-001-E0024
- Chronology IDs: CHRON-008, CHRON-009, CHRON-011, CHRON-015
- Confidence: High
- Evidence basis: Kain-Landwehr separates preparation from use; DTMach separates port-right possession, transfer, mapping, and other operations; Flask and SELinux provide distinct relationship or mapping checks.
- Alternatives/counter-evidence: Pure capability systems may intentionally make possession itself sufficient authority, and none of these sources requires the target's exact combination of policy denial and absent mapping.
- Limitations: The target's two-part denial invariant is best treated as adjacent defense-in-depth precedent with unresolved specific origin.

## OBS-010

- Observation: Deriving policy rights into MMU or layered hardware enforcement and failing closed on denied or malformed states also predates the target.
- Aspect IDs: ASPECT-003
- Evidence IDs: PRV-20260828-001-E0016, PRV-20260828-001-E0019, PRV-20260828-001-E0021, PRV-20260828-001-E0026
- Chronology IDs: CHRON-007, CHRON-010, CHRON-012, CHRON-016
- Confidence: High
- Evidence basis: Foundational Type Enforcement narrows rights before MMU loading; DTOS blocks on unavailable current decisions; LOCK computes rights for MMU enforcement; SmMTT conjunctively checks protection layers and faults on invalid or denied states.
- Alternatives/counter-evidence: The prior systems trust translation or combine distinct mechanisms; they do not demonstrate the target's independent policy-versus-hardware readback comparison.
- Limitations: Supports a strong prior-art relationship for the broad derivation and fail-closed shape, not verified lineage for the exact algorithm.

## OBS-011

- Observation: The hypothesis that target one-rule non-composition was inherited from SELinux is contradicted by primary SELinuxProject source.
- Aspect IDs: ASPECT-003
- Evidence IDs: PRV-20260828-001-E0022, PRV-20260828-001-E0025
- Chronology IDs: CHRON-013, CHRON-017
- Confidence: High
- Evidence basis: Policy Machine shows union within a policy class, and `libsepol` accumulates ordinary matching SELinux allow-rule permission masks with bitwise OR.
- Alternatives/counter-evidence: The target may have selected one-rule coverage independently, from another source, or as a local anti-composition invariant.
- Limitations: Compiler rule expansion does not prove every SELinux runtime detail, but it directly defeats the proposed single-rule inheritance claim.

## OBS-012

- Observation: No inspected primary source matches the target's complete runtime sequence of policy derivation, hardware permission encoding, independent hardware-state inspection, comparison, and terminal failure on divergence.
- Aspect IDs: ASPECT-003
- Evidence IDs: PRV-20260828-001-E0019, PRV-20260828-001-E0021, PRV-20260828-001-E0026, PRV-20260828-001-E0027, PRV-20260828-001-E0030
- Chronology IDs: CHRON-010, CHRON-012, CHRON-016, CHRON-017
- Confidence: Medium
- Evidence basis: DTOS, LOCK, and SmMTT cover policy decisions, translation, layered enforcement, or fail-closed faults but not independent runtime readback; exact public queries found no closer source.
- Alternatives/counter-evidence: The unavailable SAT design report, restricted DTOS specifications, lower-level implementation records, or alternate terminology may contain a closer mechanism.
- Limitations: This is a bounded negative result, so the exact reconciliation origin remains unresolved rather than unique.

## OBS-013

- Observation: The phrases `exposure authority`, `separated exposure authority`, `dual permission derivation`, and `dual-source authorization` were not established as historical OS-security terms by the approved public search.
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0023, PRV-20260828-001-E0027
- Chronology IDs: CHRON-014, CHRON-017
- Confidence: Medium
- Evidence basis: Sixteen exact allowlisted public queries found unrelated environmental, medical, procurement, two-person-control, browser, IAM, and programming-language uses; SELinux `open` is an ordinary file-operation permission.
- Alternatives/counter-evidence: Search engines and archives are incomplete, and the concepts may appear under different terms.
- Limitations: Terminology novelty is not conceptual novelty and does not establish origin.

## OBS-014

- Observation: The evidence supports no verified source lineage and no affirmative independent-convergence classification for any selected mechanism.
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0010, PRV-20260828-001-E0012, PRV-20260828-001-E0014, PRV-20260828-001-E0018, PRV-20260828-001-E0020, PRV-20260828-001-E0024, PRV-20260828-001-E0027
- Chronology IDs: CHRON-004, CHRON-005, CHRON-009, CHRON-011, CHRON-015, CHRON-017
- Confidence: High
- Evidence basis: The target records broad vocabulary influence but no mechanism-specific transfer; the original history is absent; retained reviewers postdate the mechanisms; and public sources establish prior art without target linkage.
- Alternatives/counter-evidence: A pre-snapshot design record, participant statement, prompt, inaccessible source, or original-history commit could establish documented influence, source lineage, or independent development.
- Limitations: Unresolved does not imply originality, copying, or misconduct.

## Overall alternatives and limitations

The available evidence supports several simultaneous explanations. The target
may have adopted general TE vocabulary while independently selecting a local
mapping permission and reconciliation invariant; it may have drawn on an
unrecorded specific source; or the sanitized branch may have omitted the
original influence record. Generic fail-safe defaults, least privilege,
complete mediation, representation constraints, exact-key access-vector
matching, and defense in depth explain substantial parts of the design without
requiring one direct conceptual source.

The permitted target history begins with a sanitized snapshot, public search
was limited to user-approved generic terms, several primary resources remain
unavailable or restricted, SmMTT freshness after 2026-08-18 is unresolved, and
most retained local paper copies lack redistribution approval. This review
does not establish legal ownership, patent validity, licence compatibility,
plagiarism, misconduct, intent, AI generation, responsible-human approval,
publication readiness, or broad originality.
Evidence: PRV-20260828-001-E0010, PRV-20260828-001-E0027,
PRV-20260828-001-E0028, PRV-20260828-001-E0029,
PRV-20260828-001-E0030, PRV-20260828-001-E0033,
PRV-20260828-001-E0038. Chronology: CHRON-004, CHRON-017.
