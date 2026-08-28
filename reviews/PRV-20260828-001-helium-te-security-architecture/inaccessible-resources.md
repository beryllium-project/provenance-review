# Helium TE PoC security architecture provenance - Inaccessible Resources

Review ID: `PRV-20260828-001`
Short name: `helium-te-security-architecture`
Distribution: `private`
Intended distribution: `public-candidate`
Created: `2026-08-28`
Status: `Complete`

Resource history is intended to be append-only. Later access or corrected
metadata should add a superseding evidence record rather than erase the prior
access result.

## INACCESSIBLE-001

- Resource: Administrative initialization record; substantive resources are recorded below.
- Canonical locator: review:inaccessible-initialization
- Logical locator: `inaccessible-resources.md`
- Source category: user-supplied or inaccessible resource metadata
- Aspect IDs: ASPECT-001
- Relevance: Administrative initialization only.
- Access result: unavailable - administrative initialization record; substantive resources begin at INACCESSIBLE-002.
- Date checked: 2026-08-28
- Alternatives checked: None required during initialization.
- Priority: none
- What a user-provided copy could confirm: No source is currently requested.
- Evidence IDs: PRV-20260828-001-E0001
- Confidence: High
- Evidence basis: Repository-generated initialization record.
- Limitations: This record does not establish source availability.
- Sensitivity: private
- Redistribution status: not-applicable

## INACCESSIBLE-002

- Resource: Flask Security Policy Module, section 3, cited by the 1999 Flask paper.
- Canonical locator: Precise citation in the Flask paper reference inventory; definitive public copy not located.
- Logical locator: `inaccessible-resources.md`
- Source category: standard or specification
- Aspect IDs: ASPECT-001, ASPECT-002
- Relevance: May contain the exact map, export, connection, and relationship permission inventory needed to compare with policy-only exposure authority.
- Access result: unavailable - not present in approved local sources or located through the allowlisted public query and citation pass.
- Date checked: 2026-08-28
- Alternatives checked: Flask 1999 relationship-control sections, DTMach 1993, DTOS 1995, and Linux SELinux `map` history.
- Priority: high
- What a user-provided copy could confirm: Whether Flask or Fluke defined a permission closely matching policy-only exposure and whether its rule semantics match the target.
- Evidence IDs: PRV-20260828-001-E0028
- Confidence: High
- Evidence basis: The primary Flask paper explicitly defers detailed relationship permissions to this module document.
- Limitations: Licence, sensitivity of any surviving copy, and redistribution terms are unknown.
- Sensitivity: public
- Redistribution status: unknown

## INACCESSIBLE-003

- Resource: DTOS Generalized Security Policy Specification and General System Security and Assurability Assessment Report.
- Canonical locator: Utah DTOS archive metadata; June 1997 reports.
- Logical locator: `inaccessible-resources.md`
- Source category: standard or specification
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Relevance: Could define exact object classes, relationship permissions, access-vector composition, and policy-to-enforcement consistency mechanisms.
- Access result: unavailable - restrictive distribution notice prevents use beyond public cover metadata.
- Date checked: 2026-08-28
- Alternatives checked: DTOS 1995 and Flask 1999 public papers.
- Priority: high
- What a user-provided copy could confirm: Exact class and permission inventory, rule composition, and any enforcement-consistency mechanism.
- Evidence IDs: PRV-20260828-001-E0029
- Confidence: High
- Evidence basis: The public primary papers cite these reports and accessible covers state the restriction.
- Limitations: Restricted material cannot support a public-candidate package without separate clearance; distribution restrictions are a licensing concern.
- Sensitivity: restricted
- Redistribution status: not-approved

## INACCESSIBLE-004

- Resource: T. M. Chen, "SAT Design Overview," MITRE Bedford Working Paper 25867.
- Canonical locator: MITRE Bedford Working Paper 25867, 1984-12-18.
- Logical locator: `inaccessible-resources.md`
- Source category: paper, proceedings item, dataset, or replication artifact
- Aspect IDs: ASPECT-003
- Relevance: Could clarify lower-level delayed-binding, rights calculation, MMU loading, and fail-closed behavior behind later SAT and LOCK descriptions.
- Access result: unavailable - no public or approved local copy identified.
- Date checked: 2026-08-28
- Alternatives checked: Boebert-Kain 1985, Kain-Landwehr 1987, and LOCK 2002.
- Priority: high
- What a user-provided copy could confirm: Whether SAT independently inspected encoded hardware rights or specified terminal handling for policy-to-MMU divergence.
- Evidence IDs: PRV-20260828-001-E0030
- Confidence: Medium
- Evidence basis: Later primary sources identify this report as part of the SAT design lineage.
- Limitations: Rights and redistribution terms are unknown; a supplied copy would remain private pending review.
- Sensitivity: public
- Redistribution status: unknown

## INACCESSIBLE-005

- Resource: Gligor and coauthors, "Traditional Capability-Based Systems: An Analysis of Their Ability to Meet TCSEC," IDA P-1935.
- Canonical locator: IDA P-1935, October 1986.
- Logical locator: `inaccessible-resources.md`
- Source category: paper, proceedings item, dataset, or replication artifact
- Aspect IDs: ASPECT-001, ASPECT-002
- Relevance: May provide a contemporary government assessment of capability reachability, preparation, transfer, and use distinctions.
- Access result: unavailable - no open copy located.
- Date checked: 2026-08-28
- Alternatives checked: Kain-Landwehr 1987, DTMach 1993, and Flask 1999.
- Priority: medium
- What a user-provided copy could confirm: Whether contemporary capability analysis distinguished install or reachability authority from later operation authority in a closer way.
- Evidence IDs: PRV-20260828-001-E0031
- Confidence: Medium
- Evidence basis: The report is cited by inspected capability access-checking literature.
- Limitations: IDA rights, sensitivity, and redistribution status are unknown.
- Sensitivity: public
- Redistribution status: unknown

## INACCESSIBLE-006

- Resource: 18th National Information Systems Security Conference proceedings, volume 2, pages 384-761.
- Canonical locator: CERIAS hard-copy proceedings holding; 1995 volume 2.
- Logical locator: `inaccessible-resources.md`
- Source category: paper, proceedings item, dataset, or replication artifact
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Relevance: May contain missing DTOS or Type Enforcement bridge material between the accessible 1995 DTOS and 1999 Flask publications.
- Access result: unavailable - hard-copy holding identified but no open digital volume located.
- Date checked: 2026-08-28
- Alternatives checked: Digitized volume 1 and the accessible DTOS and Flask papers.
- Priority: medium
- What a user-provided copy could confirm: Whether the missing volume contains a closer map, relationship, rule-composition, or enforcement-consistency precedent.
- Evidence IDs: PRV-20260828-001-E0032
- Confidence: Medium
- Evidence basis: Public bibliographic metadata and library holding.
- Limitations: Scanning, copyright, and redistribution rights are unknown.
- Sensitivity: public
- Redistribution status: unknown

## INACCESSIBLE-007

- Resource: SmMTT public repository and release activity after 2026-08-18.
- Canonical locator: https://github.com/riscv/riscv-smmtt
- Logical locator: `inaccessible-resources.md`
- Source category: standard or specification
- Aspect IDs: ASPECT-003
- Relevance: Would establish whether version 0.49 remained the latest public draft at the 2026-08-28 evidence cutoff.
- Access result: unavailable - fresh repository state was not established within the approved public-query navigation path.
- Date checked: 2026-08-28
- Alternatives checked: Retained v0.49 PDF, pinned source commit, v0.49 release metadata, and local source activity through 2026-08-18.
- Priority: high
- What a user-provided copy could confirm: Exact release, main-branch commit, and relevant proposal state on 2026-08-28.
- Evidence IDs: PRV-20260828-001-E0033
- Confidence: High
- Evidence basis: The retained version and 2026-08-18 local observation are exact; only the final ten-day freshness window is unresolved.
- Limitations: Freshness only; the cited v0.49 mechanism remains verified. Source is CC-BY-4.0.
- Sensitivity: public
- Redistribution status: approved

## INACCESSIBLE-008

- Resource: Official publisher copy and canonical identifier for "Security in KeyKOS."
- Canonical locator: IEEE Symposium on Security and Privacy 1986, pages 78-85.
- Logical locator: `inaccessible-resources.md`
- Source category: paper, proceedings item, dataset, or replication artifact
- Aspect IDs: ASPECT-002
- Relevance: Could confirm canonical publisher metadata for supplementary capability-system counter-evidence.
- Access result: unavailable - candidate official publisher route returned HTTP 403.
- Date checked: 2026-08-28
- Alternatives checked: Retained primary copy and the Flask bibliography.
- Priority: medium
- What a user-provided copy could confirm: Canonical identifier, publisher metadata, and final pagination.
- Evidence IDs: PRV-20260828-001-E0034
- Confidence: Medium
- Evidence basis: Retained primary content is available, but official publisher access is denied.
- Limitations: Publisher redistribution is not approved; this source is not load-bearing for the final classification.
- Sensitivity: public
- Redistribution status: not-approved

## INACCESSIBLE-009

- Resource: Historical canonical publication page for "seL4 Enforces Integrity."
- Canonical locator: https://ts.data61.csiro.au/publications/nictaabstracts/Sewell_WB_11.abstract.pml
- Logical locator: `inaccessible-resources.md`
- Source category: paper, proceedings item, dataset, or replication artifact
- Aspect IDs: ASPECT-002, ASPECT-003
- Relevance: Could confirm final public bibliographic metadata and copy licensing for supplementary formal policy-to-concrete-state precedent.
- Access result: removed
- Date checked: 2026-08-28
- Alternatives checked: Retained primary paper and current seL4 research references.
- Priority: medium
- What a user-provided copy could confirm: Canonical metadata and public-copy licensing.
- Evidence IDs: PRV-20260828-001-E0035
- Confidence: Medium
- Evidence basis: The publication is established by the retained primary paper, but its historical canonical host is unavailable.
- Limitations: Supplementary source; it does not show runtime policy-to-hardware reconciliation.
- Sensitivity: public
- Redistribution status: unknown

## INACCESSIBLE-010

- Resource: Canonical publication record for "Security-Enhanced Darwin: Porting SELinux to Mac OS X."
- Canonical locator: Former TrustedBSD publication host; retained draft dated 2007-01-22.
- Logical locator: `inaccessible-resources.md`
- Source category: paper, proceedings item, dataset, or replication artifact
- Aspect IDs: ASPECT-002
- Relevance: Could confirm final publication status for supplementary separation of port-right ownership from operation permissions.
- Access result: removed
- Date checked: 2026-08-28
- Alternatives checked: Retained January 22, 2007 primary draft, DTMach 1993, and Flask 1999.
- Priority: medium
- What a user-provided copy could confirm: Final venue, version, pagination, and redistribution status.
- Evidence IDs: PRV-20260828-001-E0036
- Confidence: Medium
- Evidence basis: The retained draft establishes the mechanism, while canonical publication metadata remains unavailable.
- Limitations: Supplementary source; DTMach and Flask are stronger load-bearing evidence.
- Sensitivity: public
- Redistribution status: unknown

## INACCESSIBLE-011

- Resource: Post-2016 `cap-talk` mailing-list archive.
- Canonical locator: Google Groups `cap-talk` archive.
- Logical locator: `inaccessible-resources.md`
- Source category: mailing-list or archive record
- Aspect IDs: ASPECT-001, ASPECT-002
- Relevance: Could contain later terminology collisions or explicit historical commentary on mapping, reachability, and use authority.
- Access result: unavailable - archive-wide searching would require public queries outside the approved term boundary.
- Date checked: 2026-08-28
- Alternatives checked: Foundational capability papers, DTMach, Flask, and public exact-term queries.
- Priority: low
- What a user-provided copy could confirm: Later terminology usage or commentary; it would not by itself prove target influence.
- Evidence IDs: PRV-20260828-001-E0037
- Confidence: Low
- Evidence basis: Public landing metadata shows activity through at least 2026-04-23.
- Limitations: Archive redistribution terms are unclear and the expected evidentiary gain is low.
- Sensitivity: public
- Redistribution status: unknown

## INACCESSIBLE-012

- Resource: Original SELinux `file:map` LKML or SELinux mailing-list posting and review series.
- Canonical locator: Linux commit `3ba4bf5f1e2c58bddd84ba27c5aeaf8ca1d36bff`; original public message ID unresolved.
- Logical locator: `inaccessible-resources.md`
- Source category: mailing-list or archive record
- Aspect IDs: ASPECT-001, ASPECT-003
- Relevance: Could establish first proposal date, rationale, revisions, reviewers, and whether permission accumulation or revocation was discussed.
- Access result: unavailable - exact compliant LKML, LSM, and SELinux archive queries returned no original thread.
- Date checked: 2026-08-28
- Alternatives checked: Verified Linux implementation commit and baseline SELinux source records.
- Priority: high
- What a user-provided copy could confirm: Message ID, chronology, design alternatives, reviewer influence, and intended interaction with accumulated allow masks.
- Evidence IDs: PRV-20260828-001-E0085
- Confidence: High
- Evidence basis: The implementation is established but discussion provenance remains absent.
- Limitations: Mailing-list copyright and redistribution terms are unknown.
- Sensitivity: public
- Redistribution status: unknown

## INACCESSIBLE-013

- Resource: First FreeBSD Capsicum mapping-right commit and design discussion.
- Canonical locator: FreeBSD source and review archives; exact revision and message unresolved.
- Logical locator: `inaccessible-resources.md`
- Source category: external repository or maintainer record
- Aspect IDs: ASPECT-001, ASPECT-003
- Relevance: Could show whether split mapping rights were part of original Capsicum or added later.
- Access result: unavailable - compliant Capsicum and FreeBSD queries reached the general paper and maximum-permission work but not the exact split-right introduction.
- Date checked: 2026-08-28
- Alternatives checked: Capsicum USENIX 2010 paper and 2019 FreeBSD maximum-permission report.
- Priority: high
- What a user-provided copy could confirm: First date, author, design rationale, exact rights split, and review alternatives.
- Evidence IDs: PRV-20260828-001-E0086
- Confidence: High
- Evidence basis: The general descriptor-right architecture is established; source-level mapping-right chronology is not.
- Limitations: Source likely uses BSD-family terms; mailing-list redistribution remains unknown.
- Sensitivity: public
- Redistribution status: unknown

## INACCESSIBLE-014

- Resource: FreeBSD maximum-permission architecture and review discussion for the June 2019 integration.
- Canonical locator: FreeBSD revision `r349240`; original review body and architecture-list discussion unresolved.
- Logical locator: `inaccessible-resources.md`
- Source category: external repository or maintainer record
- Aspect IDs: ASPECT-001, ASPECT-003
- Relevance: Could establish motivation, authorship, policy-to-VM invariants, rollback, and error behavior.
- Access result: unavailable - compliant query reached the FreeBSD Foundation report but not the original review or architecture thread.
- Date checked: 2026-08-28
- Alternatives checked: FreeBSD report and NetBSD `PROT_MPROTECT` manual.
- Priority: high
- What a user-provided copy could confirm: Exact change chronology, reviewer discussion, and rejected alternatives.
- Evidence IDs: PRV-20260828-001-E0087
- Confidence: High
- Evidence basis: The mechanism is verified independently of the missing discussion.
- Limitations: Review-page and mailing-list redistribution terms are unknown.
- Sensitivity: public
- Redistribution status: unknown

## INACCESSIBLE-015

- Resource: Original Xen grant-table mapping and XSM or FLASK patch series.
- Canonical locator: Xen-devel archive and Xen source history; exact original series unresolved.
- Logical locator: `inaccessible-resources.md`
- Source category: mailing-list or archive record
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Relevance: Could establish first implementation chronology, intended relationship semantics, combined authorization, policy-rule aggregation, and rejected alternatives.
- Access result: unavailable - compliant Xen queries reached broad FLASK mapping documentation and a boot-mode patch but not the original grant-map series.
- Date checked: 2026-08-28
- Alternatives checked: Xen 4.4 FLASK documentation and 2015 Xen-devel boot-mode patch.
- Priority: high
- What a user-provided copy could confirm: Original commit series, exact access-vector masks, composition semantics, and reviewer rationale.
- Evidence IDs: PRV-20260828-001-E0088
- Confidence: High
- Evidence basis: Broad Xen mapping control is established, but exact implementation ancestry is absent.
- Limitations: Xen source likely has GPL-compatible licensing; archive-message rights are unknown.
- Sensitivity: public
- Redistribution status: unknown

## INACCESSIBLE-016

- Resource: Original pKVM ownership, donation, share, and unshare patch series.
- Canonical locator: Linux KVM or kvmarm mailing-list archive; exact series unresolved.
- Logical locator: `inaccessible-resources.md`
- Source category: mailing-list or archive record
- Aspect IDs: ASPECT-002, ASPECT-003
- Relevance: Could establish first proposal, authorship, transition ordering, rejected alternatives, and stale-map or DMA-isolation discussion.
- Access result: unavailable - compliant pKVM queries reached official documentation but not the original public patch series.
- Date checked: 2026-08-28
- Alternatives checked: Official pKVM architecture and hypercall documentation.
- Priority: high
- What a user-provided copy could confirm: Exact design chronology, transition invariants, and discussion of mapping coherence.
- Evidence IDs: PRV-20260828-001-E0089
- Confidence: High
- Evidence basis: Broad ownership and mapping-state semantics are verified; original discussion provenance is missing.
- Limitations: Archive-message redistribution terms are unknown.
- Sensitivity: public
- Redistribution status: unknown

## INACCESSIBLE-017

- Resource: Capability-system `cap-talk` archive and post corpus.
- Canonical locator: Google Groups and historical EROS `cap-talk` archives.
- Logical locator: `inaccessible-resources.md`
- Source category: mailing-list or archive record
- Aspect IDs: ASPECT-001, ASPECT-002
- Relevance: Could contain original terminology and debates about possession, designation, authority, attenuation, amplification, mapping, and revocation.
- Access result: unavailable - exact approved queries returned no relevant indexed post and multiple geographic terminology collisions.
- Date checked: 2026-08-28
- Alternatives checked: Kain-Landwehr, DTMach, SDC, Capsicum, seL4, and CHERI primary sources.
- Priority: high
- What a user-provided copy could confirm: Original capability-community terminology, historical relationships among mapping and use authority, and source citations.
- Evidence IDs: PRV-20260828-001-E0090
- Confidence: Medium
- Evidence basis: The expanded ecosystem pass raised the expected value above the earlier low-priority assessment in INACCESSIBLE-011.
- Limitations: Canonical message URLs, archive completeness, copyright, and redistribution remain unresolved.
- Sensitivity: public
- Redistribution status: unknown

## INACCESSIBLE-018

- Resource: Oracle or Sun sun4v and UltraSPARC virtual-machine hypervisor API specification.
- Canonical locator: Legacy Sun or Oracle hypervisor API documentation; exact surviving normative URL unresolved.
- Logical locator: `inaccessible-resources.md`
- Source category: standard or specification
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Relevance: Could define ownership checks for IOMMU map and unmap, access attributes, invalidation, and exact error returns beneath LDoms management.
- Access result: unavailable - compliant LDoms queries reached administration guides but not the normative hypervisor API.
- Date checked: 2026-08-28
- Alternatives checked: Oracle VM Server for SPARC administration and mapping examples.
- Priority: high
- What a user-provided copy could confirm: Exact low-level mapping authority, invalidation ordering, and failure semantics.
- Evidence IDs: PRV-20260828-001-E0091
- Confidence: High
- Evidence basis: Platform assignment is verified while the normative enforcement interface is absent.
- Limitations: Legacy documentation licensing and redistribution status are unknown.
- Sensitivity: public
- Redistribution status: unknown

## INACCESSIBLE-019

- Resource: Immutable pre-cutoff VMware DirectPath and IOMMU assignment documentation.
- Canonical locator: VMware or Broadcom technical documentation; exact pre-2026-08-04 edition unresolved.
- Logical locator: `inaccessible-resources.md`
- Source category: vendor or project-controlled statement
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Relevance: Could establish assignment prerequisites, collective device-group requirements, teardown ordering, IOTLB invalidation, and reassignment safety.
- Access result: unavailable - compliant VMware queries reached broad ESXi separation evidence but no version-pinned DirectPath technical record.
- Date checked: 2026-08-28
- Alternatives checked: VMware vSphere 5.5 Update 2 Security Target.
- Priority: high
- What a user-provided copy could confirm: Exact device-mapping authority and fail-closed teardown or reassignment behavior.
- Evidence IDs: PRV-20260828-001-E0092
- Confidence: High
- Evidence basis: Current vendor pages may be post-cutoff and were excluded from substantive use.
- Limitations: Vendor-document redistribution terms are unknown.
- Sensitivity: public
- Redistribution status: unknown

## INACCESSIBLE-020

- Resource: Cutoff-pinned CheriBSD `mmap` implementation and history.
- Canonical locator: CheriBSD public repository; exact pre-cutoff commit and path chain unresolved.
- Logical locator: `inaccessible-resources.md`
- Source category: external repository or maintainer record
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Relevance: Could define returned capability bounds and permissions, maximum VM protections, page-table interaction, and revocation behavior.
- Access result: unavailable - compliant CheriBSD queries reached versioned architecture material but not source-level mapping derivation.
- Date checked: 2026-08-28
- Alternatives checked: CheriBSD 23.11 guide, CHERI ISA, and seL4 mapping authority.
- Priority: medium
- What a user-provided copy could confirm: Exact implementation semantics and chronology for hybrid capability and page-table mapping.
- Evidence IDs: PRV-20260828-001-E0093
- Confidence: Medium
- Evidence basis: Broad architecture is established, but an exact cutoff-pinned source path is absent.
- Limitations: Preserve mixed FreeBSD and CHERI licensing.
- Sensitivity: public
- Redistribution status: unknown

## INACCESSIBLE-021

- Resource: Cutoff-pinned CHERIoT book and source snapshot.
- Canonical locator: CHERIoT public book and source repositories; immutable pre-cutoff snapshot unresolved.
- Logical locator: `inaccessible-resources.md`
- Source category: standard or specification
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Relevance: Could establish exact import permission encoding, linker materialization, compartment reachability, and revocation semantics.
- Access result: unavailable - compliant query reached the 2023 architecture paper but current book and source were not cutoff-version pinned.
- Date checked: 2026-08-28
- Alternatives checked: CHERIoT architecture paper, CHERI ISA, and CheriBSD guide.
- Priority: medium
- What a user-provided copy could confirm: Exact pre-cutoff source and documentation semantics for compartment authority.
- Evidence IDs: PRV-20260828-001-E0094
- Confidence: Medium
- Evidence basis: Architecture-level authority is established; exact source materialization remains unverified.
- Limitations: Project documentation and source redistribution terms require review.
- Sensitivity: public
- Redistribution status: unknown

## INACCESSIBLE-022

- Resource: Exact pre-cutoff PAPR TCE and logical I/O mapping specification sections.
- Canonical locator: OpenPOWER PAPR specification archive; exact admissible PDF route unresolved.
- Logical locator: `inaccessible-resources.md`
- Source category: standard or specification
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Relevance: Could confirm separation between logical I/O assignment, mapping authority, translation entries, invalidation, and error handling.
- Access result: unavailable - compliant PAPR and PowerVM queries established broad partition authority but did not reach normative TCE sections.
- Date checked: 2026-08-28
- Alternatives checked: PowerVM broad partition documentation, LDoms, PR/SM, pKVM, and Hyper-V.
- Priority: medium
- What a user-provided copy could confirm: Exact TCE or LIOBN authority and failure semantics at a pre-cutoff version.
- Evidence IDs: PRV-20260828-001-E0095
- Confidence: Medium
- Evidence basis: Broad architecture is established; exact mapping specification remains absent.
- Limitations: Specification version and redistribution terms must be verified.
- Sensitivity: public
- Redistribution status: unknown

## INACCESSIBLE-023

- Resource: Exact pre-cutoff Hyper-V TLFS VTL protection-mask hierarchy.
- Canonical locator: Microsoft Virtualization Documentation TLFS archive; compliant route did not reach the exact specification.
- Logical locator: `inaccessible-resources.md`
- Source category: standard or specification
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Relevance: Could establish exact higher-VTL protection authority, default masks, write-once enablement, and transition or failure semantics.
- Access result: unavailable - compliant Hyper-V and VBS queries reached broad guidance and a VBS engineering record but not the exact TLFS source.
- Date checked: 2026-08-28
- Alternatives checked: Hyper-V security guidance and 2018 VBS enclave engineering record.
- Priority: medium
- What a user-provided copy could confirm: Exact field-level protection hierarchy and error behavior.
- Evidence IDs: PRV-20260828-001-E0096
- Confidence: Medium
- Evidence basis: Broad layered isolation is established while the detailed specification remains outside the compliant source set.
- Limitations: Microsoft specification terms and cutoff version must be verified.
- Sensitivity: public
- Redistribution status: unknown

## INACCESSIBLE-024

- Resource: NetBSD kauth decision-composition source and design discussion.
- Canonical locator: NetBSD `kauth(9)` and `tech-security` archives; compliant route did not re-establish the record.
- Logical locator: `inaccessible-resources.md`
- Source category: mailing-list or archive record
- Aspect IDs: ASPECT-003
- Relevance: Could confirm allow, deny, defer, and no-security-model behavior as counter-evidence to universal fail-closed authorization.
- Access result: unavailable - the compliant `NetBSD deny by default` query did not reach the earlier kauth record.
- Date checked: 2026-08-28
- Alternatives checked: seL4 rights downgrade and Xen permissive-default records.
- Priority: medium
- What a user-provided copy could confirm: Exact kauth decision semantics, configuration conditions, and design chronology.
- Evidence IDs: PRV-20260828-001-E0101
- Confidence: Medium
- Evidence basis: Initial discovery identified the source, but it is excluded from amendment conclusions pending compliant retrieval.
- Limitations: NetBSD documentation and mailing-list redistribution terms apply.
- Sensitivity: public
- Redistribution status: unknown

## INACCESSIBLE-025

- Resource: Bao malformed shared-memory configuration warning or truncation implementation paths.
- Canonical locator: Bao public source repository; exact path unresolved under the compliant query boundary.
- Logical locator: `inaccessible-resources.md`
- Source category: external repository or maintainer record
- Aspect IDs: ASPECT-003
- Relevance: Could determine whether invalid static configuration always fails closed or may warn, truncate, or continue.
- Access result: unavailable - compliant Bao query reached only the broad architecture.
- Date checked: 2026-08-28
- Alternatives checked: Bao architecture paper, Xen permissive-default record, and seL4 rights downgrade.
- Priority: medium
- What a user-provided copy could confirm: Exact source path, version, malformed-input conditions, and runtime effect.
- Evidence IDs: PRV-20260828-001-E0102
- Confidence: Medium
- Evidence basis: Initial source inspection reported the behavior, but the discovery route was excluded.
- Limitations: Bao source and publication licensing must be preserved.
- Sensitivity: public
- Redistribution status: unknown

## INACCESSIBLE-026

- Resource: Jailhouse v0.12 exact cell memory-region, DMA, PCI, IOMMU, sharing, and R/W/X configuration layout.
- Canonical locator: Jailhouse public repository; exact header was not reached by the compliant query.
- Logical locator: `inaccessible-resources.md`
- Source category: external repository or maintainer record
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Relevance: Could show precisely how one authoritative record couples resource assignment, mapping, R/W/X, DMA, devices, and IOMMU authority.
- Access result: unavailable - compliant Jailhouse query reached broad cell-assignment architecture only.
- Date checked: 2026-08-28
- Alternatives checked: Bao broad static assignment and Jailhouse repository overview.
- Priority: medium
- What a user-provided copy could confirm: Exact v0.12 structures, flags, lifecycle, and rollback behavior.
- Evidence IDs: PRV-20260828-001-E0103
- Confidence: Medium
- Evidence basis: Initial source-level route was excluded during query-compliance review.
- Limitations: Preserve GPL-2.0-only or BSD alternative licensing as applicable.
- Sensitivity: public
- Redistribution status: unknown

## INACCESSIBLE-027

- Resource: Detailed AWS Nitro Cards, Controller, hypervisor mapping, and I/O-assignment architecture.
- Canonical locator: AWS Nitro security-design whitepaper dated 2024-02-15.
- Logical locator: `inaccessible-resources.md`
- Source category: vendor or project-controlled statement
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Relevance: Could establish mapping-level control separation, device assignment, and policy or hardware consistency beyond broad enclave partitioning.
- Access result: unavailable - compliant AWS Nitro query reached only the Nitro Enclaves overview.
- Date checked: 2026-08-28
- Alternatives checked: Nitro Enclaves overview, Firecracker design, ESXi security target, and VBS engineering record.
- Priority: medium
- What a user-provided copy could confirm: Exact subsystem authority, mapping operations, enforcement boundaries, and stale-state handling.
- Evidence IDs: PRV-20260828-001-E0104
- Confidence: Medium
- Evidence basis: The detailed paper was reached only by an excluded exact-title route.
- Limitations: AWS whitepaper redistribution terms require review.
- Sensitivity: public
- Redistribution status: unknown

## INACCESSIBLE-028

- Resource: Public seL4 mailing-list or discussion record for mapping-capability semantics and rights downgrade.
- Canonical locator: seL4 public archives; no stable message URL located.
- Logical locator: `inaccessible-resources.md`
- Source category: mailing-list or archive record
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Relevance: Could establish historical rationale, alternatives, and chronology for mapping-capability authority and silent rights downgrade.
- Access result: unavailable - compliant seL4 queries reached manuals, proof assumptions, FAQ, and the integrity paper but no mailing-list message.
- Date checked: 2026-08-28
- Alternatives checked: seL4 Reference Manual 12.1.0, proof assumptions, FAQ, and integrity paper.
- Priority: medium
- What a user-provided copy could confirm: Original discussion date, participants, rejected alternatives, and intended failure behavior.
- Evidence IDs: PRV-20260828-001-E0121
- Confidence: Medium
- Evidence basis: Versioned specifications establish the mechanism while discussion provenance remains absent.
- Limitations: Archive location and redistribution terms remain unresolved.
- Sensitivity: public
- Redistribution status: unknown

## INACCESSIBLE-029

- Resource: Public CHERI mailing-list or discussion record for capability and paged-memory composition.
- Canonical locator: CHERI public project archives; no stable discussion URL located.
- Logical locator: `inaccessible-resources.md`
- Source category: mailing-list or archive record
- Aspect IDs: ASPECT-002, ASPECT-003
- Relevance: Could establish chronology and alternatives for capability/MMU composition, mapping authority, and consistency assumptions.
- Access result: unavailable - compliant CHERI queries reached specifications, programming guides, and DMA-composition material but no discussion archive.
- Date checked: 2026-08-28
- Alternatives checked: CHERI ISAv9, CHERI C/C++ guide, CheriBSD background, and CHERIoT architecture paper.
- Priority: medium
- What a user-provided copy could confirm: Original design rationale, mapping discussions, and rejected alternatives.
- Evidence IDs: PRV-20260828-001-E0122
- Confidence: Medium
- Evidence basis: Primary architecture sources establish the design while archive provenance remains absent.
- Limitations: Archive location, completeness, and redistribution terms remain unresolved.
- Sensitivity: public
- Redistribution status: unknown
