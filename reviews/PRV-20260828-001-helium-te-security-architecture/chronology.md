# Helium TE PoC security architecture provenance - Chronology

Review ID: `PRV-20260828-001`
Short name: `helium-te-security-architecture`
Distribution: `private`
Intended distribution: `public-candidate`
Created: `2026-08-28`
Status: `Complete`

Chronology is intended to be append-only. Use baseline validation or Git
history review to detect modification or removal of prior entries.

## CHRON-001

- Date: 2026-08-28
- Event: Private draft review package created.
- Aspect IDs: ASPECT-001
- Evidence IDs: PRV-20260828-001-E0001
- Relationship: Administrative chronology only.
- Confidence: High
- Evidence basis: Repository-generated package metadata.
- Alternatives/counter-evidence: Creation does not show that analysis occurred.
- Limitations: This event provides no evidence about target history.

## CHRON-002

- Date: 2026-08-11
- Event: Frozen `for-review` target commit
  `1ab289c066b69acdd8b55c9f77055b0145be1316` was committed at
  `2026-08-11T06:38:20Z`.
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0002
- Relationship: Exact upper bound for target implementation and repository
  chronology assessed by this review.
- Confidence: High
- Evidence basis: Isolated read-only ref resolution and commit metadata.
- Alternatives/counter-evidence: The commit subject concerns documentation;
  selected mechanisms may have entered earlier history.
- Limitations: This event does not identify first introduction or influence.

## CHRON-003

- Date: 2026-08-04
- Event: Commit `b3994e52663dab03d8025db2750a0650aa40e80c` established the external-review landing page at 2026-08-04T08:31:12Z.
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0010
- Relationship: Root of the permitted 19-commit sanitized ancestry; it precedes the imported implementation snapshot by 19 minutes and 59 seconds.
- Confidence: High
- Evidence basis: Isolated target history log.
- Alternatives/counter-evidence: This landing-page root contains no original development chronology.
- Limitations: The earlier local full-history branch was outside confirmed scope and was not inspected.

## CHRON-004

- Date: 2026-08-04
- Event: Commit `30c08e6345f6f0f2e0a716937d3cde6c8ed778c5` imported the sanitized external-review snapshot at 2026-08-04T08:51:11Z with all selected mechanisms already present.
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0010, PRV-20260828-001-E0011
- Relationship: Earliest supported repository occurrence and authorship anchor for the selected implementation.
- Confidence: High
- Evidence basis: Commit message, complete ancestor log, frozen-revision blame, and current source locators.
- Alternatives/counter-evidence: The commit explicitly omitted internal development history, so it cannot establish original implementation or conception dates.
- Limitations: Earlier commits, prompts, and design discussions may exist outside the permitted ancestry.

## CHRON-005

- Date: 2026-08-05
- Event: Five retained agent security-review packages were integrated between 2026-08-05T07:28:19Z and 2026-08-05T09:34:12Z.
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0014
- Relationship: All retained reviews postdate the earliest supported selected mechanisms.
- Confidence: High
- Evidence basis: Isolated commit chronology and frozen blame.
- Alternatives/counter-evidence: A pre-snapshot review or prompt not present in this ancestry remains possible.
- Limitations: Package baseline and model metadata is inconsistent for several retained reviews.

## CHRON-006

- Date: 2026-08-06 to 2026-08-07
- Event: Commit `4155d0b2f94ffd7c4d27a43a7a6604db96738dc6` created the review-remediation plan and commit `ac1ea8fb47821d10939780671af287bbf793afff` integrated adjacent hardening.
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0015
- Relationship: Establishes explicit review influence on adjacent controls while recording the sole linked policy and retained review packages as unmodified.
- Confidence: High
- Evidence basis: Target history and maintained handoff/remediation records.
- Alternatives/counter-evidence: Some coupled implementation or documentation outside the fixed policy changed, but no evidence attributes the selected mechanism origins to these reviews.
- Limitations: Automation-produced remediation is not responsible-human review or release approval.

## CHRON-007

- Date: 1985
- Event: Boebert and Kain published "A Practical Alternative to Hierarchical Integrity Policies," presenting Type Enforcement and successive policy narrowing before MMU enforcement.
- Aspect IDs: ASPECT-001, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0016
- Relationship: Foundational prior art for the target's broad TE vocabulary and policy-derived hardware rights.
- Confidence: High
- Evidence basis: Primary NIST-hosted conference proceedings.
- Alternatives/counter-evidence: No separate exposure permission or runtime hardware readback appears in the reviewed paper.
- Limitations: Foundational ancestry does not establish target influence.

## CHRON-008

- Date: 1987-02
- Event: Kain and Landwehr published "On Access Checking in Capability-Based Systems," separating capability preparation and reachability from actual use.
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0017
- Relationship: Early prior art for delayed rights derivation and preparation-versus-use authority.
- Confidence: High
- Evidence basis: Primary author copy.
- Alternatives/counter-evidence: Capability semantics differ from policy-only exposure and target reconciliation.
- Limitations: No target influence evidence.

## CHRON-009

- Date: 1993-05
- Event: Fine and Minear published "Assuring Distributed Trusted Mach," documenting possession of a port right separately from policy-authorized use, transfer, or mapping-purpose operation.
- Aspect IDs: ASPECT-001, ASPECT-002
- Evidence IDs: PRV-20260828-001-E0018
- Relationship: Strong early prior art for separated relationship or reachability authority and use authority.
- Confidence: High
- Evidence basis: Primary IEEE proceedings paper.
- Alternatives/counter-evidence: Mach port and service permission mechanisms differ from G-stage page-table exposure.
- Limitations: No target transfer relationship is shown.

## CHRON-010

- Date: 1995-06
- Event: Minear published the DTOS policy-control paper, describing SSID and TSID access-vector derivation and blocking security faults when permission information is unavailable.
- Aspect IDs: ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0019
- Relationship: Adjacent precedent for policy/enforcement separation and fail-closed current-decision handling.
- Confidence: High
- Evidence basis: Primary USENIX paper.
- Alternatives/counter-evidence: No hardware-state readback is described.
- Limitations: Prototype and policy-cache architecture differs from the target.

## CHRON-011

- Date: 1999-08
- Event: Spencer and coauthors published the Flask architecture, including source and target security identifiers, requested permission sets, connection controls, and object-reference relationships usable for mapping or exporting memory.
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0020
- Relationship: Strong prior art for the TE tuple and separated relationship controls.
- Confidence: High
- Evidence basis: Official USENIX publication and retained primary HTML.
- Alternatives/counter-evidence: The paper does not define target-style `OPEN`, one-rule non-composition, or policy-to-PTE readback.
- Limitations: Some detailed permission inventory is deferred to another document.

## CHRON-012

- Date: 2002
- Event: Saydjari's LOCK retrospective documented policy-derived access rights loaded into MMU tables for hardware enforcement.
- Aspect IDs: ASPECT-003
- Evidence IDs: PRV-20260828-001-E0021
- Relationship: Adjacent precedent for the policy-to-hardware derivation chain.
- Confidence: High
- Evidence basis: Primary retrospective by a LOCK participant.
- Alternatives/counter-evidence: Translation is trusted; independent readback and divergence handling are not described.
- Limitations: Retrospective source and mechanism gap prevent a stronger relationship.

## CHRON-013

- Date: 2005-06
- Event: Ferraiolo and coauthors published Policy Machine composition semantics that intersect policy classes while unioning contributing permissions within a class.
- Aspect IDs: ASPECT-003
- Evidence IDs: PRV-20260828-001-E0022
- Relationship: Counter-evidence to treating single-rule non-composition as a generic or universal access-control property.
- Confidence: High
- Evidence basis: Primary NIST-hosted SACMAT paper.
- Alternatives/counter-evidence: Policy Machine is not SELinux or the target.
- Limitations: No hardware layer.

## CHRON-014

- Date: 2010-08-02
- Event: Linux commit `49b7b8de46d293113a0a0bb026ff7bd833c73367` placed SELinux `open` in common file permissions.
- Aspect IDs: ASPECT-001
- Evidence IDs: PRV-20260828-001-E0023
- Relationship: Historical terminology collision showing `open` as an ordinary file operation.
- Confidence: High
- Evidence basis: Direct project commit.
- Alternatives/counter-evidence: Shared naming does not imply shared semantics.
- Limitations: No bearing on target influence.

## CHRON-015

- Date: 2017-05-23
- Event: Linux commit `3ba4bf5f1e2c58bddd84ba27c5aeaf8ca1d36bff` added a distinct SELinux `map` permission before `mmap`.
- Aspect IDs: ASPECT-001, ASPECT-002
- Evidence IDs: PRV-20260828-001-E0024
- Relationship: Close prior art for policy authority to establish a mapping separately from later read or write operations.
- Confidence: High
- Evidence basis: Direct project commit and source change.
- Alternatives/counter-evidence: Linux file mapping is not G-stage exposure and the permission is not named `OPEN`.
- Limitations: No evidence that the target adopted this mechanism.

## CHRON-016

- Date: 2026-01-15
- Event: RISC-V Supervisor Domains Access Protection version 0.49 specified conjunctive page-table, PMP, and MPT permission checks with faults for denied, malformed, or reserved states; its release was observed on 2026-01-16.
- Aspect IDs: ASPECT-003
- Evidence IDs: PRV-20260828-001-E0026
- Relationship: Strong prior art for layered fail-closed hardware authorization, but not duplicate derivation or readback.
- Confidence: High
- Evidence basis: Exact retained specification and pinned source.
- Alternatives/counter-evidence: Distinct protection layers differ from policy-versus-hardware reconciliation.
- Limitations: Freshness after the last local public-source observation on 2026-08-18 remains unknown.

## CHRON-017

- Date: 2026-08-28
- Event: The allowlisted public query and primary-source verification pass completed.
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0027
- Relationship: Establishes the public research cutoff, terminology results, and bounded negative findings.
- Confidence: Medium
- Evidence basis: Sixteen exact approved queries and citation-chain inspection.
- Alternatives/counter-evidence: Search coverage and inaccessible archives remain incomplete.
- Limitations: Negative results are not proof of absence.

## CHRON-018

- Date: 2026-07-18
- Event: Beryllium commit `cc6029acdd5df1fc14157c4faea4cc047e49a90e` created the minimal RISC-V policy pathfinder and the direct implementation base later used by the fixed TE pathfinder.
- Aspect IDs: ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0105, PRV-20260828-001-E0106
- Relationship: Establishes exact inherited fixed-G-stage and generic runtime/trap source lines, while separately recording policy/mechanism, identifiers-versus-authority, absent-mapping, and fail-closed predecessor concepts.
- Confidence: High
- Evidence basis: Isolated exact history, planning/evidence records, and successor blame.
- Alternatives/counter-evidence: It contains no selected `OPEN`, TE rule table, complete-request reauthorization, or TE-to-PTE comparison.
- Limitations: Verified source lineage is limited to the exact blamed ranges in E0105; broader concepts are predecessor documentation only.

## CHRON-019

- Date: 2026-07-20
- Event: Beryllium commit `511187f9d1f44c322e3a4a11347584fd8a20dc72` introduced the fixed Type Enforcement pathfinder at 2026-07-20T14:51:03Z.
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0107, PRV-20260828-001-E0108, PRV-20260828-001-E0109, PRV-20260828-001-E0110
- Relationship: Earliest supported implementation of policy-only `OPEN`, complete-request authorization, separate hardware R/W/X, mapping-state denial checks, and policy/PTE reconciliation.
- Confidence: High
- Evidence basis: Exact helper log, historical plan/evidence, tree, and blame metadata.
- Alternatives/counter-evidence: Same-commit planning and implementation cannot establish pre-commit conceptual chronology.
- Limitations: Does not prove direct import into the standalone repository.

## CHRON-020

- Date: 2026-07-20
- Event: Beryllium commits `4b6892b9ca2ac7bdf694647c6f92156168324248` at 19:27:57Z and `b4b6fb7dfd28943cce0a6352e1870974e3be8bdf` at 20:02:05Z preserved policy research and session transcripts after the 14:51:03Z TE implementation.
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0111
- Relationship: Establishes the preserved sessions as retrospective analysis rather than pre-implementation direction.
- Confidence: High
- Evidence basis: Exact commit timestamps and self-described post-pathfinder status.
- Alternatives/counter-evidence: An earlier unretained prompt or working-tree discussion may still have influenced the implementation.
- Limitations: Session metadata does not allocate conceptual authorship.

## CHRON-021

- Date: 2026-07-21
- Event: Beryllium commit `ecbcfefedb2815b26476dbe38e3f5b0ad74c0871` recorded the Beryllium and Helium identity split at 2026-07-21T04:29:57Z.
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0112
- Relationship: Documents intended `be_` to `he_` naming continuity before standalone repository creation.
- Confidence: Medium
- Evidence basis: Exact commit metadata and identity statement.
- Alternatives/counter-evidence: No cross-repository rename, import, patch-identity, parent, or source-hash evidence was supplied.
- Limitations: Naming continuity is not proof of implementation transfer.

## CHRON-022

- Date: 2026-07-21 to 2026-07-25
- Event: Models 0.1 and 0.2, the accepted runtime plan, and the R0 freeze preserved policy-neutral mapping, sealed-authority, derived-enforcement, and fail-closed concepts while excluding TE from the accepted runtime profile.
- Aspect IDs: ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0113
- Relationship: Later pre-cutoff context generalizes or constrains selected ideas without establishing their earlier origin.
- Confidence: High
- Evidence basis: Exact pre-cutoff model and planning checkpoints.
- Alternatives/counter-evidence: The records may reflect lessons from the TE experiment.
- Limitations: They do not continue one uninterrupted TE implementation lineage.

## CHRON-023

- Date: 2026-08-04
- Event: Standalone Helium creation anchor `b3994e52663dab03d8025db2750a0650aa40e80c` was committed at 2026-08-04T08:31:12Z.
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0042, PRV-20260828-001-E0112
- Relationship: Strict upper bound for supplemental Beryllium evidence and lower bound for the standalone-repository chronology.
- Confidence: High
- Evidence basis: Maintained isolated helper metadata and explicit amended scope.
- Alternatives/counter-evidence: The unavailable former `local-history` anchor may contain an earlier local repository event.
- Limitations: Creation order alone cannot distinguish snapshot migration, selective port, or independent rewrite.

## CHRON-024

- Date: 1981-08
- Event: David L. Golber published "The SDC Communications Kernel," describing capability acquisition, hardware mapping, later use, transfer, unmapping, and release as distinct lifecycle operations.
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0051
- Relationship: Moves concrete capability-to-MMU mapping and lifecycle prior art to 1981.
- Confidence: High
- Evidence basis: Complete NIST-hosted proceedings, retained PDF, extraction, and manifest metadata.
- Alternatives/counter-evidence: The same capability supplies mapping and later access rights, so no separate policy-only map permission is shown.
- Limitations: No independent post-install hardware readback.

## CHRON-025

- Date: 2003-06
- Event: Watson and coauthors published the TrustedBSD MAC Framework with rights-intersection composition across policy modules.
- Aspect IDs: ASPECT-003
- Evidence IDs: PRV-20260828-001-E0052
- Relationship: Strong prior art for deliberate fail-closed conjunction across independently loaded policies.
- Confidence: High
- Evidence basis: Official USENIX ATC paper and event record.
- Alternatives/counter-evidence: It does not require one syntactic rule to cover the complete permission set.
- Limitations: Framework composition differs from target rule semantics.

## CHRON-026

- Date: 2006-07
- Event: Petroni and coauthors published an independent SELinux semantic-integrity monitor that compares live AVC authorization state with protected full-policy state.
- Aspect IDs: ASPECT-003
- Evidence IDs: PRV-20260828-001-E0124
- Relationship: Adjacent, broadly analogous precedent for asynchronous policy-versus-live-AVC consistency monitoring.
- Confidence: High
- Evidence basis: Primary USENIX Security paper, implementation, and experiment.
- Alternatives/counter-evidence: The checked state is an authorization cache, expected masks use OR composition, and the configured response is notification rather than immediate denial or termination.
- Limitations: It is not mapping reconciliation, PTE readback, admission control, or immediate fail-stop handling.

## CHRON-027

- Date: 2013-03
- Event: Hofmann and coauthors published InkTag, in which a hypervisor validates trusted application mapping intent against an untrusted OS's proposed PTE update before installation.
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0054
- Relationship: Strong prior art for intent-authorized fail-closed page-table installation.
- Confidence: High
- Evidence basis: Primary author manuscript and implementation description.
- Alternatives/counter-evidence: It validates before installation and does not independently read back a TE-derived mapping.
- Limitations: No target-style `OPEN` bit or one-rule TE semantics.

## CHRON-028

- Date: 2006 to 2019
- Event: NetBSD kauth design records established deny-dominant composition with a no-security-model exception, and NetBSD `PROT_MPROTECT` later reserved future mapping authority separately from current R/W/X.
- Aspect IDs: ASPECT-001, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0056, PRV-20260828-001-E0057
- Relationship: Supplies both mapping-authority prior art and counter-evidence to universal fail-closed authorization.
- Confidence: High
- Evidence basis: Official NetBSD manual and primary `tech-security` discussion.
- Alternatives/counter-evidence: Active security models still preserve deny-dominant behavior.
- Limitations: No dedicated target-style exposure permission or original mapping-design thread was recovered.

## CHRON-029

- Date: 2017 to 2022
- Event: OpenBSD exposed process-level `prot_exec` policy and later immutable-mapping controls beyond ordinary R/W/X.
- Aspect IDs: ASPECT-001, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0058
- Relationship: Adjacent mapping-policy and fail-closed modification precedent.
- Confidence: High
- Evidence basis: Official manuals and maintainer discussion.
- Alternatives/counter-evidence: Ordinary mappings remain substantially R/W/X and file-mode driven.
- Limitations: No general relationship permission or policy/hardware reconciliation.

## CHRON-030

- Date: 2018 to 2025
- Event: SELinux `file:map`, FreeBSD Capsicum mapping rights, and Xen FLASK grant-map authorization separately represented mapping authority and complete requested access masks.
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0024, PRV-20260828-001-E0055, PRV-20260828-001-E0059
- Relationship: Strong close prior art for map-specific authority and adjacent complete-grant models.
- Confidence: High
- Evidence basis: Version or release-pinned project source.
- Alternatives/counter-evidence: SELinux rule permissions accumulate, and capability or grant descriptors differ from one target TE rule.
- Limitations: Original mailing-list and first-introduction histories remain incomplete.

## CHRON-031

- Date: 2024 to 2025
- Event: seL4 version 13.0.0 and Linux pKVM documentation described capability or ownership authority governing mappings and sharing transitions.
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0061, PRV-20260828-001-E0115
- Relationship: Strong structural prior art for mapping and reachability authority with important reconciliation and fail-closed limitations.
- Confidence: High
- Evidence basis: Release-pinned seL4 manual and official Linux documentation.
- Alternatives/counter-evidence: seL4 silently downgrades excessive requested rights, and pKVM documents possible mapping incoherency.
- Limitations: No target-style independent policy bit or continuous readback.

## CHRON-032

- Date: 2023-09
- Event: CHERI ISA version 9 specified tagged, bounded, permission-bearing capabilities with monotonic authority reduction alongside paged virtual memory.
- Aspect IDs: ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0062
- Relationship: Strong capability-authority precedent and counter-evidence to treating possession as distinct from use in all systems.
- Confidence: High
- Evidence basis: Primary CHERI specification.
- Alternatives/counter-evidence: CHERI does not define target-style map authority or TE rule composition.
- Limitations: Capability monotonicity is not general relationship revocation.

## CHRON-033

- Date: 2016 to 2024
- Event: Hyper-V TLFS, IBM PR/SM, PowerVM PAPR, and Oracle or Sun LDoms documented management, assignment, reachability, and protection authority distinct from guest operation rights.
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0063, PRV-20260828-001-E0064, PRV-20260828-001-E0065, PRV-20260828-001-E0066
- Relationship: Strong industry platform precedent for resource-assignment and mapping authority.
- Confidence: Medium
- Evidence basis: Primary vendor manuals and platform specifications.
- Alternatives/counter-evidence: Pending and active configurations may intentionally differ, and exact mapping APIs or invalidation semantics were not uniformly available.
- Limitations: Vendor-controlled descriptions do not establish target influence or exact reconciliation.

## CHRON-034

- Date: 2020-01 to 2020-02
- Event: Bao and Jailhouse published static-partitioning designs that tightly couple resource assignment, mapping, and access rights in authoritative configuration.
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0067, PRV-20260828-001-E0068
- Relationship: Counter-evidence to universal separate mapping authority and universal fail-closed invalid-configuration handling.
- Confidence: High
- Evidence basis: Peer-reviewed Bao paper and version-pinned Jailhouse source.
- Alternatives/counter-evidence: Lifecycle and management authority remain separate even when one record couples mapping and R/W/X.
- Limitations: Dynamic revocation and transaction rollback require further source history.

## CHRON-035

- Date: 2026-08-28
- Event: Public-query compliance review retained SDC 1981, TrustedBSD 2003, and Petroni 2006 but excluded InkTag 2013 from the amendment.
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0070
- Relationship: Corrects the admissible proceedings evidence set without changing the underlying source's public existence.
- Confidence: High
- Evidence basis: Exact compliant query rerun and approved local-source verification.
- Alternatives/counter-evidence: A future separately confirmed query scope may reach InkTag through an authorized route.
- Limitations: CHRON-027 remains a historical draft-discovery event but must not support current conclusions.

## CHRON-036

- Date: 2010 to 2024
- Event: Compliant ecosystem routes established Capsicum descriptor authority, FreeBSD and NetBSD future-permission ceilings, OpenBSD immutable mappings, Xen FLASK broad mapping control, and Xen permissive-default counter-evidence.
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0056, PRV-20260828-001-E0072, PRV-20260828-001-E0073, PRV-20260828-001-E0074, PRV-20260828-001-E0075, PRV-20260828-001-E0076
- Relationship: Strengthens mapping, complete-capability, and restrictive-composition prior art while showing fail-closed behavior is configuration-specific.
- Confidence: High
- Evidence basis: Primary papers, project records, manuals, and mailing-list patch reached through exact approved queries.
- Alternatives/counter-evidence: Exact FreeBSD split mmap rights and Xen combined grant masks were not re-established and are excluded.
- Limitations: Does not resolve target one-rule syntax or exact `OPEN`.

## CHRON-037

- Date: 2023 to 2026
- Event: Compliant project routes established seL4, CHERI, CHERIoT, CheriBSD, and pKVM capability, ownership, reachability, and mapping-state precedents before the cutoff.
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0061, PRV-20260828-001-E0062, PRV-20260828-001-E0077, PRV-20260828-001-E0078, PRV-20260828-001-E0115
- Relationship: Strong structural prior art with counter-evidence that possession may itself be authority and stronger requested rights may be silently downgraded.
- Confidence: High
- Evidence basis: Official versioned manuals, specifications, architecture papers, and pre-cutoff pKVM documentation.
- Alternatives/counter-evidence: No target-style policy-only map bit or continuous policy/hardware readback.
- Limitations: Exact CheriBSD mapping source and CHERIoT cutoff-pinned source remain unavailable.

## CHRON-038

- Date: 2012 to 2024
- Event: Compliant industry routes established LDoms, PR/SM, broad PowerVM, Hyper-V, VBS, and ESXi management, assignment, reachability, and isolation precedents.
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0080, PRV-20260828-001-E0081, PRV-20260828-001-E0082, PRV-20260828-001-E0083, PRV-20260828-001-E0084, PRV-20260828-001-E0100
- Relationship: Strong platform-level evidence that management or higher-trust authority controls resource assignment and lower-trust access.
- Confidence: Medium
- Evidence basis: Primary vendor manuals, security targets, and engineering records with pre-cutoff dates.
- Alternatives/counter-evidence: Exact PAPR, TLFS, sun4v, and DirectPath mapping semantics were not reached compliantly.
- Limitations: Vendor-controlled sources support their own architecture descriptions and do not establish target influence.

## CHRON-039

- Date: 2026-08-28
- Event: Ecosystem public-query compliance rerun superseded or withdrew source-level claims that depended on unapproved identifiers or title searches.
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0071
- Relationship: Defines the final admissible ecosystem evidence set.
- Confidence: High
- Evidence basis: Fifty-two exact approved queries and candidate-by-candidate route verification.
- Alternatives/counter-evidence: Excluded public sources may be reconsidered under a future confirmed query scope.
- Limitations: Earlier CHRON-028 through CHRON-034 entries record initial discovery and must be interpreted through this correction where their cited evidence was superseded or withdrawn.

## CHRON-040

- Date: 2026-08-28
- Event: Current-status index for initial expanded-source chronology records.
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0070, PRV-20260828-001-E0071
- Relationship: Marks CHRON-027 InkTag as withdrawn; CHRON-028 NetBSD kauth as inadmissible; CHRON-030 exact FreeBSD split-right and Xen combined-mask details as superseded by broader compliant records; CHRON-033 PAPR TCE and TLFS field details as superseded or inaccessible; and CHRON-034 Bao warning-path and Jailhouse layout details as withdrawn.
- Confidence: High
- Evidence basis: Proceedings and ecosystem query-compliance reruns.
- Alternatives/counter-evidence: The underlying public sources may be reconsidered under a future confirmed discovery scope or supplied directly.
- Limitations: Historical chronology entries remain for append-only audit but are non-conclusion-bearing where identified here.

## CHRON-041

- Date: 2026-08-28
- Event: Amendment corrected baseline earliest-occurrence and no-lineage wording.
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0098
- Relationship: `30c08e6345f6f0f2e0a716937d3cde6c8ed778c5` remains the earliest supported standalone-repository occurrence; Beryllium `511187f9d1f44c322e3a4a11347584fd8a20dc72` is the earlier supported internal implementation; verified lineage is limited to exact generic source lines inherited from minimal `cc6029a`.
- Confidence: High
- Evidence basis: Confirmed pre-creation history and exact blame.
- Alternatives/counter-evidence: Direct Beryllium-to-standalone transfer and conceptual origin remain unresolved.
- Limitations: Corrects the present interpretation without deleting baseline historical records.

## CHRON-042

- Date: 2015-05
- Event: Oracle VM Server for SPARC 3.2 documented logical-domain resource allocation and CPU or memory mapping.
- Aspect IDs: ASPECT-001, ASPECT-002
- Evidence IDs: PRV-20260828-001-E0100
- Relationship: Exact pre-cutoff platform-assignment precedent superseding the earlier unpinned LDoms record.
- Confidence: High
- Evidence basis: Versioned Oracle administration guide and mapping example.
- Alternatives/counter-evidence: The lower-level sun4v hypervisor API remains unavailable.
- Limitations: No continuous reconciliation or exact policy-to-PTE semantics.

## CHRON-043

- Date: 2026-05-24
- Event: Android common-kernel commit `c747c018510514875d9d790dde177c52bba7b679` pinned the pKVM documentation used by this review.
- Aspect IDs: ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0115
- Relationship: Immutable pre-cutoff evidence for ownership-driven stage-2 isolation, fixed post-start mapping state, unavailable DMA isolation, and possible VMM or guest mapping incoherency.
- Confidence: High
- Evidence basis: Exact public commit and documentation blob reached through compliant pKVM queries.
- Alternatives/counter-evidence: Original patch-series chronology remains unavailable.
- Limitations: Supports transition-time authority and counter-evidence to continuous reconciliation, not target-style TE policy.

## CHRON-044

- Date: 2014 to 2022
- Event: Xen-devel and NetBSD archive records documented grant-to-mapping transitions, grant-map robustness, permission-versus-mapping defects, and separate-address-space mitigation.
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0116, PRV-20260828-001-E0117, PRV-20260828-001-E0118, PRV-20260828-001-E0119
- Relationship: Primary mailing-list precedent for mapping relationships, stale-state defects, and policy-driven mapping absence.
- Confidence: High
- Evidence basis: Original archive posts reached through exact compliant queries.
- Alternatives/counter-evidence: These records do not define target one-rule TE semantics or exact policy/PTE readback.
- Limitations: Generic KVM, SELinux, FreeBSD, `cap-talk`, seL4, and CHERI original design threads remain unavailable.

## CHRON-045

- Date: 2026-08-28
- Event: Mandatory archive-specific compliant rerun completed for all confirmed Linux, BSD, Xen, capability, seL4, and CHERI archives.
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0120
- Relationship: Closes the public-landscape audit gap while preserving exact negative archive results.
- Confidence: High
- Evidence basis: Forty-six exact approved archive-name-plus-phrase queries with primary URLs and cutoff assessment.
- Alternatives/counter-evidence: Archive indexing is incomplete.
- Limitations: Bounded negative results do not prove missing discussions never existed.

## CHRON-046

- Date: 2026-08-28
- Event: Petroni evidence was narrowed from strong reconciliation prior art to adjacent asynchronous live-AVC consistency-monitoring precedent.
- Aspect IDs: ASPECT-003
- Evidence IDs: PRV-20260828-001-E0124
- Relationship: Corrects CHRON-026's broad relationship without altering the 2006 publication event.
- Confidence: High
- Evidence basis: Independent final audit and the paper's exact mechanism and response.
- Alternatives/counter-evidence: The paper remains strong evidence that independent policy-versus-live-decision consistency monitoring predates the target.
- Limitations: It does not inspect PTEs, mediate mapping admission, or immediately fail stop on mismatch.
