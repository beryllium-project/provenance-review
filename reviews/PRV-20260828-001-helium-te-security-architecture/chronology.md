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
