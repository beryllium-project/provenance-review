# Coding agent policy installation readback rationale - Evidence Ledger

Review ID: `PRV-20260901-001`
Short name: `policy-install-readback`
Distribution: `private`
Intended distribution: `public-candidate`
Created: `2026-09-01`
Status: `Complete`

Evidence IDs are stable. Evidence history is intended to be append-only, but
this requires baseline or Git-history comparison; structural validation alone
does not mechanically guarantee it.

## PRV-20260901-001-E0001

- Status: active
- Aspect IDs: ASPECT-001
- Source type: review metadata
- Evidentiary role: administrative record
- Title/description: Private package creation metadata.
- Canonical locator: review:scope
- Logical locator: `scope.md`
- Commit/version/date: 2026-09-01
- Checked date: 2026-09-01
- Precise location: scope.md ACTIVITY-001
- Relationship: Establishes package creation only.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: High
- Evidence basis: Deterministically generated review metadata.
- Alternatives/counter-evidence: Package creation does not establish completed analysis.
- Limitations: No external source or target implementation has been examined.
- Sensitivity: private
- Redistribution status: not-applicable
- Licence: not-applicable
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: yes

## PRV-20260901-001-E0002

- Status: active
- Aspect IDs: ASPECT-001
- Source type: user-supplied or inaccessible resource metadata
- Evidentiary role: administrative record
- Title/description: Repeatedly confirmed effective scope for the policy installation readback rationale review.
- Canonical locator: review:confirmed-scope
- Logical locator: `scope.md`
- Commit/version/date: 2026-09-01
- Checked date: 2026-09-01
- Precise location: scope.md SCOPE-001 and ACTIVITY-002
- Relationship: Establishes the selected mechanism, complete associated-agent-history boundary, Deep depth, exclusions, and public-query permission.
- Source ownership: unknown
- Independence: not-independent
- Confidence: High
- Evidence basis: Explicit structured confirmations after correction of two nonexistent supplied paths.
- Alternatives/counter-evidence: Scope confirmation does not establish any substantive rationale or lineage conclusion.
- Limitations: The user approved eventual public-candidate consideration, not promotion or publication.
- Sensitivity: private
- Redistribution status: not-approved
- Licence: not-applicable
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: yes

## PRV-20260901-001-E0003

- Status: active
- Aspect IDs: ASPECT-001
- Source type: target Git commit, blame, tag, branch, or diff
- Evidentiary role: repository chronology
- Title/description: Frozen Helium `for-review` target state.
- Canonical locator: frozen target Git state
- Logical locator: `target://helium-te-poc@1ab289c066b69acdd8b55c9f77055b0145be1316`
- Commit/version/date: `1ab289c066b69acdd8b55c9f77055b0145be1316`; 2026-08-11 UTC
- Checked date: 2026-09-01
- Precise location: isolated helper `state` and `resolve` captures for `for-review` and `HEAD`
- Relationship: Binds all target-code observations to one exact clean commit with no dirty or untracked evidence.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: High
- Evidence basis: The maintained isolated helper resolved `for-review` and `HEAD` to the same commit and emitted only the clean branch header.
- Alternatives/counter-evidence: A historical local full-history branch may contain additional chronology but is not the selected target state.
- Limitations: Exact source contents require separate locators; this record establishes state only.
- Sensitivity: private
- Redistribution status: not-approved
- Licence: GPL-3.0-only repository metadata; no source copy retained
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260901-001-E0005

- Status: active
- Aspect IDs: ASPECT-001
- Source type: target code or tracked target document
- Evidentiary role: direct implementation evidence
- Title/description: Frozen Helium post-install policy-to-G-stage permission comparison.
- Canonical locator: frozen target source
- Logical locator: `target://helium-te-poc/src/main.c`
- Commit/version/date: `1ab289c066b69acdd8b55c9f77055b0145be1316`; 2026-08-11 UTC
- Checked date: 2026-09-01
- Precise location: `he_mapping_permissions()` lines 142-176; `he_map_or_fail()` lines 179-204; `he_gstage_map()` and `he_gstage_allows()` in `src/memory.c` lines 201-272
- Relationship: The runtime derives R/W/X from TE, installs the leaf, re-queries policy and the stored PTE for each access bit, and terminates before first VS entry on any mismatch.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: High
- Evidence basis: Exact frozen source and maintained code-tour/security documentation agree on the sequence and terminal failure behavior.
- Alternatives/counter-evidence: The source calls the second value `hardware_allows`, but the check reads the software page-table representation rather than a hardware TLB or architectural translation result.
- Limitations: This record establishes behavior, not the agent's subjective intent or the mechanism's external conceptual source.
- Sensitivity: private
- Redistribution status: not-approved
- Licence: GPL-3.0-only; no source copy retained
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260901-001-E0006

- Status: active
- Aspect IDs: ASPECT-001
- Source type: external repository or maintainer record
- Evidentiary role: repository chronology
- Title/description: Earliest supported Beryllium implementation of the selected reconciliation.
- Canonical locator: Beryllium commit `511187f9d1f44c322e3a4a11347584fd8a20dc72`
- Logical locator: `workspace://beryllium-repo/pathfinder/src/main.c`
- Commit/version/date: `511187f9d1f44c322e3a4a11347584fd8a20dc72`; 2026-07-20T14:51:03Z
- Checked date: 2026-09-01
- Precise location: `be_mapping_permissions()` and `be_map_or_fail()` at the exact commit; isolated blame of the corresponding range
- Relationship: This commit first supports the TE-specific per-bit reauthorization, post-map PTE-bit comparison, and terminal divergence handling. Generic function shape and map-failure scaffolding retain lines from minimal predecessor `cc6029acdd5df1fc14157c4faea4cc047e49a90e`.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: High
- Evidence basis: Isolated commit log, exact source-at-commit introduction, and blame distinguish the new TE logic from inherited minimal-pathfinder scaffolding.
- Alternatives/counter-evidence: The plan, implementation, tests, and documentation entered the repository in one commit, so Git alone cannot order the design decisions inside that working session.
- Limitations: Repository chronology alone does not establish why the agent chose the mechanism.
- Sensitivity: private
- Redistribution status: not-approved
- Licence: GPL-3.0-only; no source copy retained
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260901-001-E0007

- Status: active
- Aspect IDs: ASPECT-001
- Source type: target issue, pull request, discussion, prompt, or handoff
- Evidentiary role: implementation-authorship evidence
- Title/description: Origin coding session, initial plan, and first mechanism patch.
- Canonical locator: Copilot session `dbbcf000-98cc-4056-a389-e02370d0561b`
- Logical locator: `search-log.md`
- Commit/version/date: Session 2026-07-20; linked commit `511187f9d1f44c322e3a4a11347584fd8a20dc72`
- Checked date: 2026-09-01
- Precise location: User turn 6; plan tool execution at 07:15:40Z; mechanism patch at 07:22:45Z; commit reference at session event index 4411
- Relationship: The user requested fixed TE labeling, asymmetric shared-memory policy enforcement, and tests but did not specify readback. The coding agent's pre-code plan required verification of required mappings and denials before first VS entry, then its first runtime patch added the selected post-install comparison.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: High
- Evidence basis: Direct prompt, timestamped tool request, patch metadata, and commit linkage in one session.
- Alternatives/counter-evidence: The records show what the agent produced and stated, not hidden model reasoning or precise contribution shares between the recorded human author and Copilot co-author.
- Limitations: Session metadata is private and cannot support public-candidate promotion without clearance or redaction.
- Sensitivity: private
- Redistribution status: not-approved
- Licence: not-applicable
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260901-001-E0008

- Status: active
- Aspect IDs: ASPECT-001
- Source type: target issue, pull request, discussion, prompt, or handoff
- Evidentiary role: counter-evidence
- Title/description: Independent design review occurred after the mechanism already existed.
- Canonical locator: Origin-session task `Review TE core design`
- Logical locator: `search-log.md`
- Commit/version/date: Review launched 2026-07-20T07:26:43Z and completed 2026-07-20T07:41:53Z
- Checked date: 2026-09-01
- Precise location: Origin-session tool request and corresponding task result
- Relationship: The readback patch predates the review by approximately four minutes. The review later confirmed the policy-to-PTE derivation as fail-closed and found no blocking core defect.
- Source ownership: project-controlled
- Independence: partially-independent
- Confidence: High
- Evidence basis: Timestamped patch and review-tool records.
- Alternatives/counter-evidence: An earlier unrecorded reviewer or source could still have influenced the coding agent, but the retained reviewer did not trigger the mechanism.
- Limitations: The reviewer executed target code in the historical session; this provenance review treats only the retained text and timestamps as untrusted evidence and did not repeat that execution.
- Sensitivity: private
- Redistribution status: not-approved
- Licence: not-applicable
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260901-001-E0009

- Status: active
- Aspect IDs: ASPECT-001
- Source type: vendor or project-controlled statement
- Evidentiary role: direct implementation evidence
- Title/description: Contemporaneous project rationale of exact policy-to-PTE correspondence.
- Canonical locator: Origin-session plan, engineering SOP, evidence, and follow-up analysis
- Logical locator: `workspace://beryllium-repo/planning/type-enforcement-pathfinder-plan.md`
- Commit/version/date: `511187f9d1f44c322e3a4a11347584fd8a20dc72`; session statements on 2026-07-20
- Checked date: 2026-09-01
- Precise location: Plan initialization steps 6-8; engineering SOP design rule; evidence conclusion; origin-session turn 4538
- Relationship: The records identify the desired assurance property as exact policy-to-PTE correspondence and later formulate `policy-to-PTE soundness` as every installed PTE being no more permissive than TE.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: High
- Evidence basis: Multiple consistent same-session records, including one plan statement created before the runtime patch and one explicit proof-target formulation later the same day.
- Alternatives/counter-evidence: The most explicit `every installed PTE` formulation was retrospective after commit; it corroborates rather than proves the agent's private pre-code reasoning.
- Limitations: These records support the engineering rationale, not external conceptual origin.
- Sensitivity: private
- Redistribution status: not-approved
- Licence: GPL-3.0-only documents and private session metadata; no copy retained
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260901-001-E0010

- Status: active
- Aspect IDs: ASPECT-001
- Source type: target issue, pull request, discussion, prompt, or handoff
- Evidentiary role: explicit source lineage
- Title/description: Documented Beryllium-to-standalone Helium extraction and history sanitization.
- Canonical locator: Sessions `dbced89e-8cf1-4d7b-be4c-36fc945704dd` and `4a87f405-c6ae-4524-8eea-3ebc2ab3431e`
- Logical locator: `search-log.md`
- Commit/version/date: Extraction 2026-08-04; sanitized snapshot `30c08e6345f6f0f2e0a716937d3cde6c8ed778c5`
- Checked date: 2026-09-01
- Precise location: Extraction user turn 4849 and assistant turn 4859; sanitization turns 105, 749, 2122, and 2164; exact `src/memory.c` blob `20cba2acb2755e30cac8af7a07f9d3854044c9ca` at Beryllium identity commit `ecbcfefedb2815b26476dbe38e3f5b0ad74c0871` and standalone snapshot `30c08e6345f6f0f2e0a716937d3cde6c8ed778c5`
- Relationship: A Beryllium-associated worktree was explicitly flattened into the standalone Helium fixed-TE repository, moving the fixed-TE source from `pathfinder/` to repository root. The full-history state was preserved locally before the source tree was committed onto a separate sanitized history.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: High
- Evidence basis: Direct user instruction, agent action record, session repository identity, commit linkage, and one exact cross-repository blob identity corroborate transfer.
- Alternatives/counter-evidence: The whole `main.c` blob changed through identity/flattening work, so this is not a claim that every byte was copied unchanged.
- Limitations: Former full-history commits `8ba7182` and `c8d1032` no longer resolve through the isolated helper, preventing a complete byte-level bridge for every selected file.
- Sensitivity: private
- Redistribution status: not-approved
- Licence: GPL-3.0-only source lineage; no source copy retained
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260901-001-E0011

- Status: active
- Aspect IDs: ASPECT-001
- Source type: target issue, pull request, discussion, prompt, or handoff
- Evidentiary role: negative search result
- Title/description: Complete available associated-agent-history audit.
- Canonical locator: Configured cloud and local session stores
- Logical locator: `search-log.md`
- Commit/version/date: Coverage through 2026-09-01
- Checked date: 2026-09-01
- Precise location: Eighteen Beryllium/origin sessions with 586 turns; eight provenance-review sessions with 12 turns
- Relationship: Exact selected-mechanism terms occur only in the origin session and the earlier provenance-review result. Thirty-seven later Beryllium `readback` turns concern CSR/root/fence or exact-byte proof work and contain no selected map symbol or divergence string.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: High
- Evidence basis: Exact session inventory, per-session turn counts, exact-term queries, broader policy/PTE queries, and review of every later readback match.
- Alternatives/counter-evidence: Relevant rationale may use vocabulary not captured by the query families, or may exist in unavailable sessions.
- Limitations: This is an exhaustive audit of available indexed history, not proof that no unrecorded influence existed.
- Sensitivity: private
- Redistribution status: not-approved
- Licence: not-applicable
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260901-001-E0012

- Status: active
- Aspect IDs: ASPECT-001
- Source type: target code or tracked target document
- Evidentiary role: direct implementation evidence
- Title/description: Maintained documentation, tests, and retained reviews characterize the check and its coverage.
- Canonical locator: Frozen target documentation and tests
- Logical locator: `target://helium-te-poc/docs/engineering-sop.md`
- Commit/version/date: `1ab289c066b69acdd8b55c9f77055b0145be1316`; 2026-08-11 UTC
- Checked date: 2026-09-01
- Precise location: Engineering SOP lines 7-21; code tour lines 225-232; security-and-limits fail-closed list; `tests/unit/test_main.c` G-stage cases; retained agent-review positive observations
- Relationship: The maintained record calls exact policy-to-PTE correspondence a design objective and describes a two-sided comparison intended to catch over-mapping and under-mapping before any subject runs.
- Source ownership: project-controlled
- Independence: partially-independent
- Confidence: High
- Evidence basis: Current source, tests, project documentation, and later independent review descriptions are consistent.
- Alternatives/counter-evidence: Unit tests exercise the encoder and permission reader, but no maintained negative test directly forces the `TE and G-stage permissions diverged` branch.
- Limitations: The comparison reuses the same policy API, PTE constants, software page-table memory, compiler, and trusted image. It is neither diverse verification nor continuous runtime integrity monitoring.
- Sensitivity: private
- Redistribution status: not-approved
- Licence: GPL-3.0-only; no source copy retained
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260901-001-E0013

- Status: active
- Aspect IDs: ASPECT-001
- Source type: approved local research
- Evidentiary role: counter-evidence
- Title/description: Earlier completed Helium security-architecture provenance review.
- Canonical locator: Review `PRV-20260828-001`
- Logical locator: `search-log.md`
- Commit/version/date: Provenance-review commit `d698e7598e44928e4a64d7ebc3de7655cfbefb29`; 2026-08-29
- Checked date: 2026-09-01
- Precise location: Prior-art summary, report, attribution, evidence E0124, and local session `5b085609-d54f-433d-858a-97fb89c4c2fc`
- Relationship: The earlier review established `511187f` as the first supported internal implementation and found adjacent policy-versus-enforcement precedent, but left direct standalone transfer and the exact reconciliation origin unresolved.
- Source ownership: project-controlled
- Independence: partially-independent
- Confidence: High
- Evidence basis: Completed validated local review package and its associated session summary.
- Alternatives/counter-evidence: Newly available extraction-session records and blob corroboration now support direct standalone source lineage; they do not identify an external source for the exact algorithm.
- Limitations: This review reuses the earlier public landscape as a lead and records where new primary evidence changes only the transfer conclusion.
- Sensitivity: private
- Redistribution status: not-approved
- Licence: project review metadata; not-applicable
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260901-001-E0014

- Status: active
- Aspect IDs: ASPECT-001
- Source type: standard or specification
- Evidentiary role: prior art
- Title/description: NIST SP 800-160 Vol. 1 Rev. 1, "Engineering Trustworthy Secure Systems."
- Canonical locator: https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-160v1r1.pdf
- Logical locator: `search-log.md`
- Commit/version/date: NIST SP 800-160 Vol. 1 Rev. 1; November 2022
- Checked date: 2026-09-01
- Precise location: Sections D.4.2-D.4.3, E.19, E.20, E.24, and integration activities H.8
- Relationship: Separates policy-based access decisions from enforcement, requires rigor and verifiability commensurate with trust, calls for protective failure, and requires checkpoints for correct secure activation and interface conformance.
- Source ownership: independent
- Independence: independent
- Confidence: High
- Evidence basis: Official NIST publication predating the target.
- Alternatives/counter-evidence: The publication does not prescribe post-install PTE readback or the target's exact fail-stop loop.
- Limitations: Supports the general assurance rationale, not source-specific influence or implementation lineage.
- Sensitivity: public
- Redistribution status: not-applicable
- Licence: United States government publication; no copy retained
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260901-001-E0015

- Status: active
- Aspect IDs: ASPECT-001
- Source type: paper, proceedings item, dataset, or replication artifact
- Evidentiary role: adjacent precedent
- Title/description: Nick L. Petroni Jr., Timothy Fraser, Aaron Walters, and William A. Arbaugh, "An Architecture for Specification-Based Detection of Semantic Integrity Violations in Kernel Dynamic Data."
- Canonical locator: https://www.usenix.org/legacy/event/sec06/tech/full_papers/petroni/petroni_html/main.html
- Logical locator: `search-log.md`
- Commit/version/date: 15th USENIX Security Symposium; July 2006
- Checked date: 2026-09-01
- Precise location: Sections 2.2, 3, 4.2, and 5
- Relationship: Recomputes policy-derived expectations and compares them with live SELinux AVC enforcement-decision state to detect semantic integrity violations.
- Source ownership: independent
- Independence: independent
- Confidence: High
- Evidence basis: Primary paper with an implemented prototype and attack experiment.
- Alternatives/counter-evidence: The monitor is asynchronous and oriented to detection and response rather than mediating page-table installation.
- Limitations: It is not PTE reconciliation, boot admission control, or immediate terminal failure; it supplies adjacent consistency-monitoring precedent only.
- Sensitivity: public
- Redistribution status: not-applicable
- Licence: USENIX and paper-author terms; no copy retained
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260901-001-E0016

- Status: active
- Aspect IDs: ASPECT-001
- Source type: paper, proceedings item, dataset, or replication artifact
- Evidentiary role: adjacent precedent
- Title/description: Ray Spencer, Stephen Smalley, Peter Loscocco, Mike Hibler, David Andersen, and Jay Lepreau, "The Flask Security Architecture: System Support for Diverse Security Policies."
- Canonical locator: https://www.usenix.org/conference/8th-usenix-security-symposium/flask-security-architecture-system-support-diverse-security
- Logical locator: `workspace://osr-claude/sources/flask-node14.html`
- Commit/version/date: 8th USENIX Security Symposium; August 1999
- Checked date: 2026-09-01
- Precise location: Section 5.3.3 mapped-memory checks and Section 5.4 revocation-support material
- Relationship: Requires policy authorization for mapped-memory access modes, explains why interface interception alone is insufficient, and revalidates retained enforcement decisions after policy change.
- Source ownership: affiliated
- Independence: partially-independent
- Confidence: High
- Evidence basis: Contemporaneous primary conference paper retained in the approved local source corpus.
- Alternatives/counter-evidence: The target has fixed sealed boot-time policy and no runtime policy replacement, cache, relabeling, or page-fault-time policy server.
- Limitations: Supports mapped-memory enforcement-point validation and lifecycle revalidation, not an independent post-install PTE decoder or immediate boot fail-stop.
- Sensitivity: public
- Redistribution status: unknown
- Licence: USENIX/project publication terms; retained source remains in its owning local corpus
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260901-001-E0017

- Status: active
- Aspect IDs: ASPECT-001
- Source type: review metadata
- Evidentiary role: negative search result
- Title/description: Exact and generic public-query pass for the selected rationale.
- Canonical locator: 2026-09-01 public search record
- Logical locator: `search-log.md`
- Commit/version/date: Queries executed 2026-09-01
- Checked date: 2026-09-01
- Precise location: SEARCH-006
- Relationship: The exact phrase `policy installation readback mechanism` produced no direct named primary mechanism; generic queries reached broad reference-monitor assurance, SELinux retained-permission revalidation, and policy-versus-live-enforcement consistency monitoring.
- Source ownership: unknown
- Independence: unknown
- Confidence: Medium
- Evidence basis: Exact recorded queries and retained primary-source results.
- Alternatives/counter-evidence: Search indexing and terminology vary; a closer source may use different language or remain inaccessible.
- Limitations: A negative search result does not prove absence or originality.
- Sensitivity: public
- Redistribution status: not-applicable
- Licence: not-applicable
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260901-001-E0018

- Status: active
- Aspect IDs: ASPECT-001
- Source type: user-supplied or inaccessible resource metadata
- Evidentiary role: unresolved lead
- Title/description: Former standalone full-history commits no longer resolvable through the isolated helper.
- Canonical locator: Session-recorded commits `8ba7182` and `c8d1032`
- Logical locator: `inaccessible-resources.md`
- Commit/version/date: 2026-08-04 historical records
- Checked date: 2026-09-01
- Precise location: Extraction/sanitization session refs and failed isolated `resolve`/`log` attempts
- Relationship: A recovered full-history object set could provide a complete byte-level bridge between the Beryllium-associated flattened worktree and sanitized standalone snapshot.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: Medium
- Evidence basis: Direct session references establish that the commits existed; both current repositories reject them as unresolved revisions.
- Alternatives/counter-evidence: Direct transfer is already supported by the extraction sessions and one exact blob bridge, so these objects are not required for the principal lineage classification.
- Limitations: Contents and parentage must not be guessed or reconstructed.
- Sensitivity: private
- Redistribution status: unknown
- Licence: likely GPL-3.0-only repository history; not re-established
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260901-001-E0019

- Status: active
- Aspect IDs: ASPECT-001
- Source type: paper, proceedings item, dataset, or replication artifact
- Evidentiary role: prior art
- Title/description: Spencer E. Minear, "Providing Policy Control Over Object Operations in a Mach Based System."
- Canonical locator: https://www-old.cs.utah.edu/flux/fluke/html/dtos/DOCS/usenix95.pdf
- Logical locator: `workspace://osr-claude/sources/dtos-usenix95.txt`
- Commit/version/date: Fifth USENIX UNIX Security Symposium; June 1995; manuscript 1995-04-28
- Checked date: 2026-09-01
- Precise location: Introduction and Sections 4.2-4.4 on current access vectors, security faults, startup cache initialization, and stale bindings
- Relationship: Requires enforcement points to obtain current policy information, blocks the initiating thread when it is unavailable, and treats secure startup integrity as preferable to disabling checks.
- Source ownership: affiliated
- Independence: partially-independent
- Confidence: High
- Evidence basis: Primary retained conference text in the approved OS-security corpus at commit `f2edd17c6ed70f09a9b3db98eec27e54e185612a`.
- Alternatives/counter-evidence: DTOS trusts kernel binding and access-vector machinery rather than inspecting encoded PTE permissions.
- Limitations: Strong prior art for fail-closed initialization and current policy/enforcement correspondence, but only adjacent to the exact readback.
- Sensitivity: public
- Redistribution status: unknown
- Licence: Public paper; retained-copy redistribution status remains with the owning corpus
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260901-001-E0020

- Status: active
- Aspect IDs: ASPECT-001
- Source type: paper, proceedings item, dataset, or replication artifact
- Evidentiary role: prior art
- Title/description: O. Sami Saydjari, "LOCK: An Historical Perspective."
- Canonical locator: https://www.acsac.org/2002/papers/classic-lock.pdf
- Logical locator: `workspace://osr-claude/sources/lock-historical-perspective-acsac2002.txt`
- Commit/version/date: Annual Computer Security Applications Conference; 2002
- Checked date: 2026-09-01
- Precise location: Architecture requirements, Figures 1-3, and verification approach
- Relationship: Separates an access decider from the MMU enforcer and loads policy-derived access vectors into MMU tables while explicitly identifying privileged translation software as a trusted seam.
- Source ownership: affiliated
- Independence: partially-independent
- Confidence: High
- Evidence basis: Primary participant retrospective retained in the approved OS-security corpus at commit `f2edd17c6ed70f09a9b3db98eec27e54e185612a`.
- Alternatives/counter-evidence: LOCK is also counter-evidence to readback being universal because it trusts the translation path rather than comparing the installed entry.
- Limitations: No target-style post-install equality check or immediate terminal failure is shown.
- Sensitivity: public
- Redistribution status: unknown
- Licence: Public paper; retained-copy redistribution status remains with the owning corpus
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260901-001-E0021

- Status: active
- Aspect IDs: ASPECT-001
- Source type: paper, proceedings item, dataset, or replication artifact
- Evidentiary role: prior art
- Title/description: Thomas Sewell, Simon Winwood, Peter Gammie, Toby Murray, June Andronick, and Gerwin Klein, "seL4 Enforces Integrity."
- Canonical locator: https://doi.org/10.1007/978-3-642-22863-6_24
- Logical locator: `workspace://osr-claude/sources/integrity.txt`
- Commit/version/date: Interactive Theorem Proving, LNCS 6898; 2011
- Checked date: 2026-09-01
- Precise location: Sections 2.3 and 3.3-3.5
- Relationship: Distinguishes abstract policy from concrete protection state, treats page-table links as concrete authority, and proves extracted concrete authority is a subset of policy.
- Source ownership: affiliated
- Independence: partially-independent
- Confidence: High
- Evidence basis: Primary retained paper in the approved OS-security corpus at commit `f2edd17c6ed70f09a9b3db98eec27e54e185612a`.
- Alternatives/counter-evidence: Proof-based refinement can establish correspondence without a runtime readback loop.
- Limitations: Assumes certified setup and does not inspect runtime PTEs after installation.
- Sensitivity: public
- Redistribution status: unknown
- Licence: Publisher and author-copy terms; retained-copy status remains with the owning corpus
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260901-001-E0022

- Status: active
- Aspect IDs: ASPECT-001
- Source type: paper, proceedings item, dataset, or replication artifact
- Evidentiary role: adjacent precedent
- Title/description: Thomas Sewell, Magnus O. Myreen, and Gerwin Klein, "Translation Validation for a Verified OS Kernel."
- Canonical locator: https://www.cl.cam.ac.uk/~mom22/pldi13.pdf
- Logical locator: `workspace://formal-verification-research/sources/bibliography.md`
- Commit/version/date: PLDI 2013
- Checked date: 2026-09-01
- Precise location: Paper-level translation-validation method and Beryllium research bibliography entry
- Relationship: Validates the produced binary against proved source semantics rather than trusting the translator, closely matching the rationale of checking a produced enforcement artifact after translation.
- Source ownership: affiliated
- Independence: partially-independent
- Confidence: High
- Evidence basis: Primary publication metadata in the approved formal-verification corpus at commit `eaa497b` plus a current retained seL4 project account.
- Alternatives/counter-evidence: Offline whole-binary validation is broader and materially different from a small runtime permission comparison.
- Limitations: Supports post-translation validation rationale, not policy-specific influence or the exact PTE sequence.
- Sensitivity: public
- Redistribution status: not-applicable
- Licence: Public author copy; no copy retained in this review
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260901-001-E0023

- Status: active
- Aspect IDs: ASPECT-001
- Source type: external repository or maintainer record
- Evidentiary role: counter-evidence
- Title/description: Linux/Android common-kernel, "Protected KVM on arm64."
- Canonical locator: https://android.googlesource.com/kernel/common/+/c747c018510514875d9d790dde177c52bba7b679/Documentation/virt/kvm/arm/pkvm.rst
- Logical locator: `search-log.md`
- Commit/version/date: `c747c018510514875d9d790dde177c52bba7b679`; 2026-05-24
- Checked date: 2026-09-01
- Precise location: Immutable project documentation on ownership-driven mappings and possible VMM/guest mapping incoherency
- Relationship: Shows a contemporary high-assurance design that controls mapping lifecycle but acknowledges possible incoherency rather than continuously reconciling policy with every live mapping.
- Source ownership: independent
- Independence: independent
- Confidence: High
- Evidence basis: Immutable primary project documentation established in prior review evidence and rechecked by the research specialist.
- Alternatives/counter-evidence: Different ownership and threat model; no target-style TE evaluator.
- Limitations: Counter-evidence to universal necessity, not a source for the target mechanism.
- Sensitivity: public
- Redistribution status: approved
- Licence: Project documentation terms
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260901-001-E0024

- Status: active
- Aspect IDs: ASPECT-001
- Source type: review metadata
- Evidentiary role: administrative record
- Title/description: Maintained completion, agent-contract, and whitespace validation record.
- Canonical locator: review:validation
- Logical locator: `HANDOFF.md`
- Commit/version/date: 2026-09-01
- Checked date: 2026-09-01
- Precise location: HANDOFF.md Validation status
- Relationship: Records that the completed private package and repository-level provenance contracts satisfy the maintained checks.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: High
- Evidence basis: Successful maintained completion validation, agent-contract test suite, and read-only whitespace inspection after final synthesis.
- Alternatives/counter-evidence: Structural validation does not prove append-only history integrity without a supplied prior baseline.
- Limitations: Validation does not approve publication, licensing, release, responsible-human review, or the substantive correctness of external sources beyond the recorded evidence.
- Sensitivity: private
- Redistribution status: not-applicable
- Licence: not-applicable
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: yes

## PRV-20260901-001-E0025

- Status: active
- Aspect IDs: ASPECT-001
- Source type: review metadata
- Evidentiary role: administrative record
- Title/description: Cross-agent assurance-practices projection for threat-modeler and analysis-workbook consumption.
- Canonical locator: review:cross-agent-input
- Logical locator: `assurance-practices.md`
- Commit/version/date: 2026-09-01
- Checked date: 2026-09-01
- Precise location: assurance-practices.md
- Relationship: Reorganizes existing active evidence into consumer classifications, example practices, candidate threats, controls, mitigations, and existing-package delta notes without adding a new substantive conclusion.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: High
- Evidence basis: Derived entirely from the completed report, prior-art projection, and active evidence records E0005 through E0023.
- Alternatives/counter-evidence: Consumers may cite the normative PRV records directly and ignore this convenience projection.
- Limitations: This file allocates no threat-model or analysis-workbook IDs and grants no decision, approval, risk acceptance, or implementation authority.
- Sensitivity: private
- Redistribution status: not-approved
- Licence: not-applicable
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: yes

## PRV-20260901-001-E0026

- Status: active
- Aspect IDs: ASPECT-001
- Source type: review metadata
- Evidentiary role: administrative record
- Title/description: Post-handoff maintained validation record.
- Canonical locator: review:cross-agent-validation
- Logical locator: `HANDOFF.md`
- Commit/version/date: 2026-09-01
- Checked date: 2026-09-01
- Precise location: HANDOFF.md Validation status
- Relationship: Records successful completion validation after adding the consumer-neutral assurance-practices artifact and its traceability records.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: High
- Evidence basis: Successful maintained package, repository-contract, and whitespace checks after the cross-agent projection was added.
- Alternatives/counter-evidence: Structural validation does not prove append-only history integrity without a supplied prior baseline.
- Limitations: Validation grants no threat-model approval, analysis decision, publication, licensing, release, or responsible-human acceptance.
- Sensitivity: private
- Redistribution status: not-applicable
- Licence: not-applicable
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: yes

## PRV-20260901-001-E0004

- Status: active
- Aspect IDs: ASPECT-001
- Source type: approved local research
- Evidentiary role: repository chronology
- Title/description: Canonical Beryllium source-repository state and workspace identity.
- Canonical locator: Beryllium workspace registry and isolated Git state
- Logical locator: `workspace://beryllium-repo/planning/HANDOFF.md`
- Commit/version/date: `65f6d895a2007e8e093582cc48726375fd23b563`; checked 2026-09-01
- Checked date: 2026-09-01
- Precise location: `workspace://COMPONENTS.md` Beryllium row; isolated helper `state` and `resolve` captures
- Relationship: Establishes the canonical private implementation repository from which the predecessor TE pathfinder and associated agent history are examined.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: High
- Evidence basis: Workspace source-of-truth registry plus successful isolated state capture on `beryllium/single-hart-runtime-r0`.
- Alternatives/counter-evidence: The user-supplied `../beryllium` path did not exist; the confirmed corrected path is the registered `../beryllium-repo` entry.
- Limitations: Current HEAD postdates the selected mechanism; historical conclusions require exact earlier commits and sessions.
- Sensitivity: private
- Redistribution status: not-approved
- Licence: GPL-3.0-only repository metadata; no source copy retained
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no
