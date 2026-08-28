# Helium TE PoC security architecture provenance - Report

Review ID: `PRV-20260828-001`
Short name: `helium-te-security-architecture`
Distribution: `private`
Intended distribution: `public-candidate`
Created: `2026-08-28`
Status: `Complete`

## Executive summary

The selected mechanisms have a concrete pre-standalone Beryllium history.
Commit `511187f9d1f44c322e3a4a11347584fd8a20dc72` on 2026-07-20 is the
earliest supported implementation of policy-only `OPEN`, separate R/W/X
derivation, one-rule complete-request authorization, G-stage rejection of
`OPEN`, policy/PTE comparison, mapping-state denial checks, and fail-closed
divergence. It directly descends from minimal pathfinder
`cc6029acdd5df1fc14157c4faea4cc047e49a90e`. Exact blame verifies inherited
fixed Sv39x4, address/path validation, table initialization, root encoding,
and generic runtime/trap lines; the minimal plan and evidence separately
document policy/mechanism, identifiers-versus-authority, absent-mapping, and
fail-closed predecessor concepts. The evidence does not prove that this
checkpoint was directly imported into the standalone repository; snapshot
migration, selective porting, and independent rewrite by the same author
remain plausible.
Evidence: PRV-20260828-001-E0105, PRV-20260828-001-E0106,
PRV-20260828-001-E0107, PRV-20260828-001-E0108,
PRV-20260828-001-E0109, PRV-20260828-001-E0112.
Chronology: CHRON-018, CHRON-019, CHRON-021, CHRON-023.

The expanded primary-source pass covered the confirmed USENIX, ACM, IEEE,
NCSC/NISSC, BSD, Linux, Xen, seL4, CHERI, static-partitioner, and industry
hypervisor landscapes. It substantially strengthens prior art for capability
or policy-controlled mapping, relationship and use separation, complete
selected grants, policy-derived enforcement, and fail-closed isolation.
Load-bearing additions include the SDC Communications Kernel, TrustedBSD MAC,
Petroni's independent asynchronous SELinux authorization-state monitor, Capsicum,
FreeBSD/NetBSD maximum permissions, Xen FLASK, pKVM, seL4, CHERI, LDoms,
PR/SM, VBS, and ESXi. Petroni narrows the earlier negative by providing
broadly analogous policy-versus-live-AVC consistency monitoring, but not the
target's exact PTE readback, admission control, or immediate fail-stop
sequence.
Evidence: PRV-20260828-001-E0051, PRV-20260828-001-E0052,
PRV-20260828-001-E0124, PRV-20260828-001-E0056,
PRV-20260828-001-E0061, PRV-20260828-001-E0062,
PRV-20260828-001-E0072, PRV-20260828-001-E0073,
PRV-20260828-001-E0075, PRV-20260828-001-E0080,
PRV-20260828-001-E0083, PRV-20260828-001-E0084,
PRV-20260828-001-E0100, PRV-20260828-001-E0115.
Chronology: CHRON-024, CHRON-025, CHRON-026, CHRON-036,
CHRON-037, CHRON-038.

The final determinations remain contribution-specific: verified source lineage
for generic minimal-pathfinder scaffolding into the Beryllium TE checkpoint;
documented Flask/SELinux/XSM influence on TE framing and vocabulary; strong
prior-art relationships for policy-gated mapping, separated relationship or
reachability authority, broad complete-grant models, and policy-derived
fail-closed enforcement; and unresolved origin for the exact policy-only
`OPEN` representation, one-rule TE non-composition, direct Beryllium-to-
standalone transfer, and post-install TE-to-G-stage readback with immediate
terminal divergence handling. No affirmative independent-convergence evidence
was found.
Evidence: PRV-20260828-001-E0110, PRV-20260828-001-E0112,
PRV-20260828-001-E0070, PRV-20260828-001-E0124,
PRV-20260828-001-E0071. Chronology: CHRON-019, CHRON-023,
CHRON-026, CHRON-035, CHRON-039, CHRON-046.

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

## OBS-015

- Observation: The selected mechanisms have a concrete pre-standalone Beryllium implementation checkpoint at `511187f9d1f44c322e3a4a11347584fd8a20dc72` on 2026-07-20.
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0107, PRV-20260828-001-E0108, PRV-20260828-001-E0109
- Chronology IDs: CHRON-019, CHRON-023
- Confidence: High
- Evidence basis: Exact pre-cutoff history, plan/evidence, tree, and blame records place policy-only `OPEN`, complete-request authorization, separate R/W/X mapping, policy/PTE comparison, mapping-state denial checks, and fail-closed divergence in Beryllium before standalone repository creation.
- Alternatives/counter-evidence: The checkpoint may have been ported, rewritten, or selectively copied into standalone Helium.
- Limitations: The records establish an internal predecessor, not a proven cross-repository transfer.

## OBS-016

- Observation: Beryllium's TE checkpoint directly inherits exact fixed-G-stage and generic runtime/trap source lines from minimal pathfinder `cc6029acdd5df1fc14157c4faea4cc047e49a90e`; the minimal records separately document policy/mechanism, identifiers-versus-authority, absent-mapping, and fail-closed predecessor concepts, while the exact TE semantics first appear at `511187f`.
- Aspect IDs: ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0105, PRV-20260828-001-E0106, PRV-20260828-001-E0107, PRV-20260828-001-E0108, PRV-20260828-001-E0109
- Chronology IDs: CHRON-018, CHRON-019
- Confidence: High
- Evidence basis: Direct commit ancestry and successor blame preserve enumerated fixed-G-stage and runtime/trap lines while assigning the TE API, rule table, `OPEN`, complete-set recheck, and policy/PTE reconciliation to the successor checkpoint.
- Alternatives/counter-evidence: Shared methodology and common author do not show where the new TE ideas originated.
- Limitations: The exact-proof branch is a sibling, not a demonstrated ancestor of the TE checkpoint.

## OBS-017

- Observation: The preserved Beryllium session transcripts and policy research postdate the fixed TE implementation by several hours and are retrospective analysis rather than pre-implementation prompts.
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0111
- Chronology IDs: CHRON-019, CHRON-020
- Confidence: High
- Evidence basis: The implementation checkpoint is timestamped 14:51:03Z; post-pathfinder research and transcript commits are timestamped 19:27:57Z and 20:02:05Z and describe the completed experiment.
- Alternatives/counter-evidence: An earlier unretained prompt or working-tree discussion may have influenced the implementation.
- Limitations: Session IDs and co-authorship trailers do not allocate conceptual contribution shares.

## OBS-018

- Observation: The Beryllium identity transition makes `511187f` a plausible close internal predecessor to standalone Helium, but direct same-implementation lineage and underlying standalone implementation authorship remain unresolved.
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0112
- Chronology IDs: CHRON-021, CHRON-023
- Confidence: Medium
- Evidence basis: Beryllium records intended `be_` to `he_` naming continuity before standalone creation, but no import, parent, patch identity, rename diff, source-hash bridge, or surviving local-history anchor was supplied.
- Alternatives/counter-evidence: Snapshot migration, selective porting, and independent rewrite by the same author all remain plausible.
- Limitations: The former standalone `local-history` anchor is unavailable.

## OBS-019

- Observation: The SDC Communications Kernel strengthens prior art for separating capability acquisition, hardware mapping, later use, transfer, unmapping, and release while deriving hardware mapping rights from capability state.
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0051, PRV-20260828-001-E0070
- Chronology IDs: CHRON-024, CHRON-035
- Confidence: High
- Evidence basis: Complete approved local proceedings evidence; the proceedings compliance rerun confirmed that no public query route is required.
- Alternatives/counter-evidence: The same capability authorizes mapping and later access, so it does not define a separate policy-only mapping permission.
- Limitations: InkTag was withdrawn from the amendment because no compliant query or citation chain reached it; SDC alone does not resolve the exact `OPEN` origin.

## OBS-020

- Observation: TrustedBSD supplies strong prior art for fail-closed rights intersection across independently loaded policy modules but does not support target one-rule complete-set inheritance.
- Aspect IDs: ASPECT-003
- Evidence IDs: PRV-20260828-001-E0052
- Chronology IDs: CHRON-025
- Confidence: High
- Evidence basis: Any TrustedBSD MAC module denial causes framework denial.
- Alternatives/counter-evidence: An individual module may still aggregate rights, and module conjunction is not one-rule syntax.
- Limitations: This strengthens restrictive-composition precedent without resolving the target's exact algorithm.

## OBS-021

- Observation: Petroni et al. provide broadly analogous prior art for asynchronous independent comparison of protected policy state with live AVC enforcement-decision state, narrowing the baseline reconciliation negative.
- Aspect IDs: ASPECT-003
- Evidence IDs: PRV-20260828-001-E0124
- Chronology IDs: CHRON-026
- Confidence: High
- Evidence basis: An independent monitor asynchronously recomputes SELinux permission masks from protected policy tables, compares them with live AVC entries, and reports inconsistencies.
- Alternatives/counter-evidence: The checked state is an authorization cache, comparison is asynchronous, and the implemented response is notification rather than immediate fail-stop mapping denial.
- Limitations: The mechanism checks an authorization cache, uses OR-composed policy masks, and notifies rather than mediating PTE installation or immediately failing closed; the target's exact post-install TE-to-G-stage sequence remains unresolved.

## OBS-022

- Observation: Capsicum descriptor rights, FreeBSD maximum permissions, and Xen FLASK broad mapping control strengthen prior art for selected authority and mapping constraints.
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0072, PRV-20260828-001-E0073, PRV-20260828-001-E0075, PRV-20260828-001-E0071
- Chronology IDs: CHRON-036, CHRON-039
- Confidence: High
- Evidence basis: Capsicum treats descriptors as rights-bearing authority and supports complete operation-right sets; FreeBSD separates current and maximum mapping permissions; Xen FLASK controls communication, grants, device passthrough, and cross-domain mapping.
- Alternatives/counter-evidence: The compliant rerun did not reach exact FreeBSD split mmap rights or Xen combined grant-mask source, and capability or relationship controls differ from one TE rule.
- Limitations: Exact source-level rights splits, first-introduction discussions, and target influence remain unresolved.

## OBS-023

- Observation: seL4, CHERI, pKVM, LDoms, PR/SM, PowerVM, and Hyper-V independently establish broad separation among possession, assignment, relationship, mapping, and later use authority.
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0061, PRV-20260828-001-E0062, PRV-20260828-001-E0077, PRV-20260828-001-E0078, PRV-20260828-001-E0080, PRV-20260828-001-E0081, PRV-20260828-001-E0082, PRV-20260828-001-E0083, PRV-20260828-001-E0084, PRV-20260828-001-E0100, PRV-20260828-001-E0115
- Chronology IDs: CHRON-037, CHRON-038, CHRON-039
- Confidence: High
- Evidence basis: Primary specifications, manuals, architecture papers, and security targets describe capability-controlled mappings, ownership and sharing transitions, compartment reachability, partition resource assignment, control-domain allocation, VBS isolation, and VMkernel separation.
- Alternatives/counter-evidence: In capability systems possession of a valid capability intentionally is authority, and platform assignment may be closely coupled to later use.
- Limitations: Exact PAPR, TLFS, sun4v, DirectPath, CheriBSD mapping, and CHERIoT source semantics remain unavailable; the evidence shows multiple independent precedents, not one source.

## OBS-024

- Observation: Complete selected grants have substantial adjacent precedent, but target one-rule complete-set authorization remains contribution-specific and unresolved.
- Aspect IDs: ASPECT-003
- Evidence IDs: PRV-20260828-001-E0025, PRV-20260828-001-E0052, PRV-20260828-001-E0061, PRV-20260828-001-E0062, PRV-20260828-001-E0072, PRV-20260828-001-E0071
- Chronology IDs: CHRON-013, CHRON-025, CHRON-036, CHRON-037, CHRON-039
- Confidence: High
- Evidence basis: Capsicum operations require complete rights on one descriptor, TrustedBSD intersects module decisions, and seL4 or CHERI use complete selected capabilities; independently verified baseline SELinux source accumulates permission bits across matching rules.
- Alternatives/counter-evidence: The compliant ecosystem rerun could not re-establish exact Xen combined-mask or FreeBSD split-right source claims.
- Limitations: None of the admissible adjacent models requires one syntactic TE rule to contain the complete requested set.

## OBS-025

- Observation: Exact-or-fail and fail-closed authorization are strong but non-universal design patterns.
- Aspect IDs: ASPECT-003
- Evidence IDs: PRV-20260828-001-E0061, PRV-20260828-001-E0076, PRV-20260828-001-E0071
- Chronology IDs: CHRON-036, CHRON-037, CHRON-039
- Confidence: High
- Evidence basis: seL4 silently downgrades excessive requested mapping rights, while Xen FLASK historically defaulted to permissive boot behavior unless enforcing or force mode was selected.
- Alternatives/counter-evidence: Both systems reject many invalid states, and configured Xen enforcing mode fails closed.
- Limitations: NetBSD kauth and Bao source-level counterexamples from the initial pass were not reached compliantly and are withdrawn.

## OBS-026

- Observation: The expanded ecosystem found no continuous target-style policy-to-hardware reconciliation, and several systems explicitly tolerate or document divergence between desired, pending, or active mapping state.
- Aspect IDs: ASPECT-003
- Evidence IDs: PRV-20260828-001-E0071, PRV-20260828-001-E0100, PRV-20260828-001-E0115, PRV-20260828-001-E0118, PRV-20260828-001-E0120, PRV-20260828-001-E0124
- Chronology IDs: CHRON-026, CHRON-037, CHRON-038, CHRON-039
- Confidence: High
- Evidence basis: Petroni supplies asynchronous live-AVC consistency monitoring; immutable pKVM documentation records possible VMM or guest incoherency and unavailable DMA isolation; Xen and LDoms records show realized mappings or active configuration can diverge from permission or pending state.
- Alternatives/counter-evidence: Unavailable lower-level sun4v, pKVM, Xen, or other implementation records may show stronger transition-time checks.
- Limitations: The exact policy derivation, encoded PTE readback, comparison, and immediate fail-stop sequence remains unresolved.

## OBS-027

- Observation: OpenBSD ordinary mapping behavior and Bao static assignment provide limiting counterexamples to an overbroad claim that mapping authority is always separately represented.
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0074, PRV-20260828-001-E0079, PRV-20260828-001-E0071
- Chronology IDs: CHRON-036, CHRON-039
- Confidence: High
- Evidence basis: OpenBSD's additional immutable-map policy overlays ordinary R/W/X-centric mapping, while Bao's static configuration directly determines assigned resources and stage-2 mappings.
- Alternatives/counter-evidence: These systems may still separate management or lifecycle authority from guest use.
- Limitations: Exact Jailhouse configuration-layout claims were not re-established compliantly; the target's policy-only `OPEN` formulation remains narrower than the broad mapping lifecycle.

## OBS-028

- Observation: Public-query compliance review excluded InkTag while preserving the SDC, TrustedBSD, and Petroni proceedings findings.
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0051, PRV-20260828-001-E0052, PRV-20260828-001-E0070, PRV-20260828-001-E0124
- Chronology IDs: CHRON-024, CHRON-025, CHRON-026, CHRON-035
- Confidence: High
- Evidence basis: Approved local SDC source and exact compliant USENIX queries independently reached TrustedBSD and Petroni; compliant ASPLOS queries did not reach InkTag.
- Alternatives/counter-evidence: InkTag remains publicly known but is inadmissible under the confirmed discovery boundary.
- Limitations: Withdrawn evidence cannot support final classifications.

## OBS-029

- Observation: The ecosystem amendment conclusions rely only on candidates independently re-established through approved project-name and generic-term queries; source-level claims reached solely through unapproved identifiers are withdrawn or superseded.
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0071, PRV-20260828-001-E0072, PRV-20260828-001-E0073, PRV-20260828-001-E0074, PRV-20260828-001-E0075, PRV-20260828-001-E0076, PRV-20260828-001-E0077, PRV-20260828-001-E0078, PRV-20260828-001-E0079, PRV-20260828-001-E0080, PRV-20260828-001-E0081, PRV-20260828-001-E0082, PRV-20260828-001-E0083, PRV-20260828-001-E0084
- Chronology IDs: CHRON-036, CHRON-037, CHRON-038, CHRON-039
- Confidence: High
- Evidence basis: Fifty-two exact compliant queries and candidate-by-candidate route mapping.
- Alternatives/counter-evidence: Withdrawn public sources may still be technically relevant, but the confirmed query boundary does not permit their discovery route to support this amendment.
- Limitations: Search-engine indexing and public archive coverage remain incomplete.

## OBS-030

- Observation: Baseline earliest-occurrence and no-lineage statements are now limited to the standalone repository and exact selected semantics.
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0098
- Chronology IDs: CHRON-041
- Confidence: High
- Evidence basis: Beryllium `511187f` predates the standalone snapshot, and exact minimal-to-TE inherited source lines establish bounded internal lineage.
- Alternatives/counter-evidence: No evidence proves direct Beryllium-to-standalone transfer or conceptual lineage for `OPEN`, one-rule checking, or exact reconciliation.
- Limitations: Baseline records remain append-only historical observations and must be interpreted through this correction.

## OBS-031

- Observation: The exact pre-cutoff Oracle VM Server for SPARC 3.2 guide supports broad LDoms resource-assignment and mapping precedent.
- Aspect IDs: ASPECT-001, ASPECT-002
- Evidence IDs: PRV-20260828-001-E0100
- Chronology IDs: CHRON-042
- Confidence: High
- Evidence basis: Versioned Oracle administration guide and CPU or memory mapping example.
- Alternatives/counter-evidence: Exact sun4v hypervisor mapping APIs and failure semantics remain unavailable.
- Limitations: Platform assignment precedent only; no target influence or continuous reconciliation.

## Overall alternatives and limitations

The available evidence supports several simultaneous explanations. Beryllium
may have adopted general TE and FLASK vocabulary while selecting local
`OPEN`, complete-request, and reconciliation invariants; the implementation
may have been ported or rewritten into standalone Helium; or an unretained
prompt, working tree, or source may explain the exact combination. Generic
fail-safe defaults, least privilege, complete mediation, capability and
relationship authority, representation constraints, access-vector matching,
and defense in depth explain substantial parts of the design without requiring
one direct conceptual source.

The amended review uses exact pre-creation Beryllium commits and a conservative
standalone creation anchor because the former `local-history` ref is
unavailable. Public discovery was limited to confirmed names and phrases;
initial out-of-bound searches were preserved, excluded, and rerun compliantly.
Several primary resources and first-introduction discussions remain
unavailable, SmMTT freshness after 2026-08-18 is unresolved, and most retained
local paper copies lack redistribution approval. This review does not
establish legal ownership, patent validity, licence compatibility, plagiarism,
misconduct, intent, AI generation, responsible-human approval, publication
readiness, or broad originality.
Evidence: PRV-20260828-001-E0042, PRV-20260828-001-E0107,
PRV-20260828-001-E0112, PRV-20260828-001-E0070,
PRV-20260828-001-E0071, PRV-20260828-001-E0085,
PRV-20260828-001-E0088, PRV-20260828-001-E0089,
PRV-20260828-001-E0090, PRV-20260828-001-E0091,
PRV-20260828-001-E0092, PRV-20260828-001-E0093,
PRV-20260828-001-E0094, PRV-20260828-001-E0095,
PRV-20260828-001-E0096. Chronology: CHRON-019, CHRON-023,
CHRON-035, CHRON-039.

## OBS-032

- Observation: Beryllium implementation authorship, standalone snapshot attribution, and underlying standalone implementation authorship are distinct questions.
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0011, PRV-20260828-001-E0107, PRV-20260828-001-E0108, PRV-20260828-001-E0109, PRV-20260828-001-E0112
- Chronology IDs: CHRON-004, CHRON-019, CHRON-021, CHRON-023
- Confidence: High
- Evidence basis: `511187f` commit metadata and blame support James Morris as Beryllium implementation author; `30c08e63` supports James Morris as standalone snapshot author and committer; the standalone snapshot intentionally omits underlying development history.
- Alternatives/counter-evidence: The same author and naming transition are consistent with porting, selective rewrite, or fresh reimplementation.
- Limitations: Underlying standalone line authorship, direct transfer, and conceptual contribution allocation remain unresolved.

## OBS-033

- Observation: The mandatory archive-specific rerun recovered Xen and NetBSD primary discussions, pinned pKVM immutably, and left explicit bounded negatives for the remaining Linux, BSD, capability, seL4, and CHERI archives.
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0115, PRV-20260828-001-E0116, PRV-20260828-001-E0117, PRV-20260828-001-E0118, PRV-20260828-001-E0119, PRV-20260828-001-E0120, PRV-20260828-001-E0121, PRV-20260828-001-E0122
- Chronology IDs: CHRON-043, CHRON-044, CHRON-045
- Confidence: High
- Evidence basis: Forty-six exact compliant archive-specific queries and primary archive records.
- Alternatives/counter-evidence: Missing original SELinux, FreeBSD, pKVM, `cap-talk`, seL4, and CHERI discussions may contain additional chronology or rationale.
- Limitations: Archive null results are bounded and do not prove absence.
