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
