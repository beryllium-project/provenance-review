# Helium TE PoC security architecture provenance - Evidence Ledger

Review ID: `PRV-20260828-001`
Short name: `helium-te-security-architecture`
Distribution: `private`
Intended distribution: `public-candidate`
Created: `2026-08-28`
Status: `Complete`

Evidence IDs are stable. Evidence history is intended to be append-only, but
this requires baseline or Git-history comparison; structural validation alone
does not mechanically guarantee it.

## PRV-20260828-001-E0001

- Status: active
- Aspect IDs: ASPECT-001
- Source type: review metadata
- Evidentiary role: administrative record
- Title/description: Private draft package creation metadata.
- Canonical locator: review:scope
- Logical locator: `scope.md`
- Commit/version/date: 2026-08-28
- Checked date: 2026-08-28
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

## PRV-20260828-001-E0002

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: target Git commit, blame, tag, branch, or diff
- Evidentiary role: repository chronology
- Title/description: Frozen clean Helium TE PoC target state for the confirmed
  provenance review.
- Canonical locator: target revision
- Logical locator: `target://helium-te-poc/HEAD`
- Commit/version/date: `1ab289c066b69acdd8b55c9f77055b0145be1316`; `2026-08-10T23:38:20-07:00` (`2026-08-11T06:38:20Z`)
- Checked date: 2026-08-28
- Precise location: Local branch `for-review`, tracking
  `origin/for-review`; isolated read-only status output contained no staged,
  unstaged, or untracked entries.
- Relationship: Binds every target-specific observation in this review to the
  exact committed state selected by the user.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: High
- Evidence basis: The maintained `scripts/git-readonly.sh` helper resolved the
  selected ref to the exact commit, captured the clean branch state, and
  returned the commit metadata under isolated Git configuration.
- Alternatives/counter-evidence: The parent component registry recorded a
  different observed branch and revision on 2026-08-27; that coordination
  snapshot does not override the user-selected `for-review` ref resolved on
  2026-08-28.
- Limitations: Establishes target identity, chronology anchor, and clean state
  only. It does not establish implementation authorship, conceptual origin,
  influence, or correctness. Remote state was not refreshed.
- Sensitivity: private
- Redistribution status: not-applicable
- Licence: not-applicable
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0003

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002
- Source type: target code or tracked target document
- Evidentiary role: direct implementation evidence
- Title/description: Separate policy permission for G-stage exposure.
- Canonical locator: frozen target source
- Logical locator: `target://helium-te-poc/include/he/te.h`
- Commit/version/date: `1ab289c066b69acdd8b55c9f77055b0145be1316`; 2026-08-11 UTC
- Checked date: 2026-08-28
- Precise location: lines 33-48
- Relationship: Defines `OPEN` separately from read, write, and execute and
  describes it as permission for G-stage exposure.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: High
- Evidence basis: Exact frozen interface declaration and contract.
- Alternatives/counter-evidence: The declaration establishes target semantics,
  not the origin of the name or concept.
- Limitations: Runtime enforcement and chronology require separate evidence.
- Sensitivity: private
- Redistribution status: unknown
- Licence: GPL-3.0-only
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0004

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: target code or tracked target document
- Evidentiary role: direct implementation evidence
- Title/description: Runtime exposure gate, access derivation, complete-set
  authorization, hardware reconciliation, and private-resource denial.
- Canonical locator: frozen target source
- Logical locator: `target://helium-te-poc/src/main.c`
- Commit/version/date: `1ab289c066b69acdd8b55c9f77055b0145be1316`; 2026-08-11 UTC
- Checked date: 2026-08-28
- Precise location: `he_mapping_permissions()` lines 142-176;
  `he_map_or_fail()` lines 179-204; `he_require_private_denial()` lines
  207-221
- Relationship: Implements the selected policy-to-hardware authorization
  dataflow and its terminal failure conditions.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: High
- Evidence basis: Exact frozen implementation locators.
- Alternatives/counter-evidence: The implementation does not identify the
  conceptual source and may represent ordinary defensive composition.
- Limitations: Authorship, first introduction, and external precedent remain
  to be established.
- Sensitivity: private
- Redistribution status: unknown
- Licence: GPL-3.0-only
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0005

- Status: active
- Aspect IDs: ASPECT-003
- Source type: target code or tracked target document
- Evidentiary role: direct implementation evidence
- Title/description: Exact complete-request TE authorization with
  fail-closed input and rule validation.
- Canonical locator: frozen target source
- Logical locator: `target://helium-te-poc/src/te.c`
- Commit/version/date: `1ab289c066b69acdd8b55c9f77055b0145be1316`; 2026-08-11 UTC
- Checked date: 2026-08-28
- Precise location: mechanism boundary lines 7-12;
  `he_te_authorize()` lines 139-181
- Relationship: Requires one valid exact-key rule to contain every requested
  permission and denies malformed or incomplete inputs.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: High
- Evidence basis: Exact frozen mechanism implementation and function contract.
- Alternatives/counter-evidence: Subset containment within one matched rule is
  common access-control logic and does not itself identify conceptual origin.
- Limitations: No chronology or influence conclusion follows from this code
  alone.
- Sensitivity: private
- Redistribution status: unknown
- Licence: GPL-3.0-only
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0006

- Status: superseded
- Aspect IDs: ASPECT-001, ASPECT-003
- Source type: target code or tracked target document
- Evidentiary role: direct implementation evidence
- Title/description: Fixed TE rule table containing complete exposure and
  access permission sets.
- Canonical locator: frozen target source
- Logical locator: `target://helium-te-poc/src/policy/te.c`
- Commit/version/date: `1ab289c066b69acdd8b55c9f77055b0145be1316`; 2026-08-11 UTC
- Checked date: 2026-08-28
- Precise location: label tables and six fixed rules lines 18-81;
  direct authorization wrapper lines 112-118
- Relationship: Supplies the only linked policy inputs consumed by the
  selected derivation path.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: High
- Evidence basis: Exact frozen policy implementation.
- Alternatives/counter-evidence: Fixed rules show the target's use of the
  mechanism but not why the permission vocabulary or combination rule was
  selected.
- Limitations: Policy chronology and documented influences remain pending.
- Sensitivity: private
- Redistribution status: unknown
- Licence: GPL-3.0-only
- Hash: not-applicable
- Supersedes: None
- Superseded by: PRV-20260828-001-E0040
- Administrative: no

## PRV-20260828-001-E0007

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: target code or tracked target document
- Evidentiary role: direct implementation evidence
- Title/description: G-stage boundary excludes policy-only exposure authority
  and independently validates R/W/X.
- Canonical locator: frozen target source
- Logical locator: `target://helium-te-poc/src/memory.c`
- Commit/version/date: `1ab289c066b69acdd8b55c9f77055b0145be1316`; 2026-08-11 UTC
- Checked date: 2026-08-28
- Precise location: `he_gstage_map()` lines 201-227;
  `he_gstage_allows()` lines 244-272; interface contracts at
  `target://helium-te-poc/include/he/memory.h` lines 54-90
- Relationship: Prevents `OPEN` from becoming a hardware permission bit,
  rejects invalid permission sets, and exposes a separate inspection path used
  for policy-to-hardware reconciliation.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: High
- Evidence basis: Exact frozen interface and implementation locators.
- Alternatives/counter-evidence: Hardware encodings inherently lack this
  target-defined policy bit, so part of the separation may follow directly
  from representation rather than a distinct external design source.
- Limitations: Does not establish why the target chose this policy/hardware
  seam.
- Sensitivity: private
- Redistribution status: unknown
- Licence: GPL-3.0-only
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0008

- Status: superseded
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: target code or tracked target document
- Evidentiary role: explicit source lineage
- Title/description: Target-maintained semantic description and explicit
  FLASK/SELinux comparison.
- Canonical locator: frozen target documentation
- Logical locator: `target://helium-te-poc/docs/concepts.md`
- Commit/version/date: `1ab289c066b69acdd8b55c9f77055b0145be1316`; 2026-08-11 UTC
- Checked date: 2026-08-28
- Precise location: lines 103-125; corroborating behavior descriptions at
  `target://helium-te-poc/docs/architecture.md` lines 45-53 and
  `target://helium-te-poc/docs/security-and-limits.md` lines 154-163
- Relationship: States the target's meaning of `OPEN`, non-composition of
  partial rules, and resemblance to the FLASK/SELinux permission shape while
  explicitly disclaiming identity with SELinux or XSM.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: High
- Evidence basis: Exact frozen maintained documentation.
- Alternatives/counter-evidence: `Resembles` may describe analogy rather than
  influence or derivation; external and historical corroboration is required.
- Limitations: Project-controlled characterization cannot independently prove
  source lineage or conceptual origin.
- Sensitivity: private
- Redistribution status: unknown
- Licence: GPL-3.0-only
- Hash: not-applicable
- Supersedes: None
- Superseded by: PRV-20260828-001-E0039
- Administrative: no

## PRV-20260828-001-E0009

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: target code or tracked target document
- Evidentiary role: direct implementation evidence
- Title/description: Unit coverage for sealed authorization, complete
  permission sets, denials, G-stage rejection, and asymmetric mappings.
- Canonical locator: frozen target tests
- Logical locator: `target://helium-te-poc/tests/unit/test_main.c`
- Commit/version/date: `1ab289c066b69acdd8b55c9f77055b0145be1316`; 2026-08-11 UTC
- Checked date: 2026-08-28
- Precise location: lines 189-262, 303-339, and 392-464
- Relationship: Shows the target's intended positive and negative contracts
  for the selected mechanisms without executing the reviewed repository.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: High
- Evidence basis: Exact frozen test-source locators.
- Alternatives/counter-evidence: Test presence is evidence of intended
  behavior, not independent evidence that the target was executed correctly or
  that a concept originated here.
- Limitations: Tests were not run under the provenance trust boundary.
- Sensitivity: private
- Redistribution status: unknown
- Licence: GPL-3.0-only
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0010

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: target Git commit, blame, tag, branch, or diff
- Evidentiary role: repository chronology
- Title/description: Earliest supported occurrence of all selected mechanisms in the history-sanitized `for-review` ancestry.
- Canonical locator: target commit 30c08e6345f6f0f2e0a716937d3cde6c8ed778c5
- Logical locator: `target://helium-te-poc/commit/30c08e6345f6f0f2e0a716937d3cde6c8ed778c5`
- Commit/version/date: `30c08e6345f6f0f2e0a716937d3cde6c8ed778c5`; 2026-08-04T08:51:11Z
- Checked date: 2026-08-28
- Precise location: Commit subject `chore: add sanitized external review snapshot`; complete selected source surfaces are present in this snapshot and remain attributed to it by frozen-revision blame.
- Relationship: Establishes the earliest supported repository occurrence of `OPEN`, separated exposure authority, complete-request authorization, per-bit-plus-combined derivation, G-stage `OPEN` rejection, TE-to-G-stage reconciliation, and policy-denial-plus-absent-mapping.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: High
- Evidence basis: The isolated history contains 19 ancestor commits; final blame for all selected implementation surfaces resolves to this commit.
- Alternatives/counter-evidence: The commit explicitly imported a current tree without internal development history, so the mechanisms may have existed earlier and may have been renamed or influenced before this snapshot.
- Limitations: This is the earliest supported occurrence, not an original implementation date or conceptual-origin record.
- Sensitivity: private
- Redistribution status: unknown
- Licence: not-applicable
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0011

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: target Git commit, blame, tag, branch, or diff
- Evidentiary role: implementation-authorship evidence
- Title/description: Frozen-revision authorship metadata for the selected implementation and core documentation.
- Canonical locator: isolated blame bundle for target commit 1ab289c066b69acdd8b55c9f77055b0145be1316
- Logical locator: `target://helium-te-poc/commit/1ab289c066b69acdd8b55c9f77055b0145be1316`
- Commit/version/date: Blame at `1ab289c066b69acdd8b55c9f77055b0145be1316`; checked 2026-08-28
- Checked date: 2026-08-28
- Precise location: Blame for `include/he/te.h`, `src/te.c`, `src/policy/te.c`, `src/main.c`, `src/memory.c`, `docs/concepts.md`, `docs/architecture.md`, and `docs/security-and-limits.md`.
- Relationship: Attributes the selected source lines and initial sanitized snapshot to James Morris as Git author and committer; the snapshot commit also contains a Copilot co-authorship trailer.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: High
- Evidence basis: Maintained isolated blame and commit metadata consistently identify the same author and commit.
- Alternatives/counter-evidence: Git metadata does not establish who conceived the mechanisms, how assistance was divided, whether earlier authors existed outside the sanitized history, or responsible-human approval.
- Limitations: No pre-snapshot authoring history, PR review record, or original design discussion is present in the permitted ancestry.
- Sensitivity: private
- Redistribution status: unknown
- Licence: not-applicable
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0012

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: target code or tracked target document
- Evidentiary role: documented influence
- Title/description: Target statement that its TE tuple follows FLASK and SELinux vocabulary and that XSM/FLASK is relevant hypervisor prior art.
- Canonical locator: target policy-model documentation
- Logical locator: `target://helium-te-poc/docs/policy-models.md`
- Commit/version/date: Present at `1ab289c066b69acdd8b55c9f77055b0145be1316`; 2026-08-11 UTC
- Checked date: 2026-08-28
- Precise location: `Relationship to FLASK, SELinux, and XSM`; corroborating class, permission, and mapping-derivation sections.
- Relationship: Directly documents influence on the source-type, target-type, object-class, and permission vocabulary while disclaiming identity with those complete systems.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: High
- Evidence basis: Explicit maintained target statement at the frozen commit.
- Alternatives/counter-evidence: The statement may record analogy or background vocabulary rather than direct derivation; it does not identify FLASK, SELinux, or XSM as the source of `OPEN`, complete-set checking, or policy-to-hardware reconciliation.
- Limitations: Introduction commit for this document was not included in the supplied blame bundle; external primary-source comparison remains separate.
- Sensitivity: private
- Redistribution status: unknown
- Licence: GPL-3.0-only
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0013

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: target code or tracked target document
- Evidentiary role: documented influence
- Title/description: Target bibliography for Type Enforcement vocabulary and general security principles.
- Canonical locator: target authoritative references
- Logical locator: `target://helium-te-poc/docs/references.md`
- Commit/version/date: Present at `1ab289c066b69acdd8b55c9f77055b0145be1316`; links checked by target on 2026-08-06
- Checked date: 2026-08-28
- Precise location: `Type Enforcement` and `Security principles` sections.
- Relationship: Names the Flask Security Architecture, SELinux Type Enforcement and access-vector materials, XSM/FLASK documentation, Saltzer and Schroeder, and the Anderson report as target-declared sources for vocabulary or motivating principles.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: High
- Evidence basis: Explicit target-maintained bibliography and bounded statement of what the references establish.
- Alternatives/counter-evidence: Bibliographic inclusion does not prove adoption of any selected mechanism, transfer relationship, or conceptual origin.
- Limitations: Primary sources had not yet been independently verified at this internal-lineage phase.
- Sensitivity: private
- Redistribution status: unknown
- Licence: GPL-3.0-only
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0014

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: target Git commit, blame, tag, branch, or diff
- Evidentiary role: counter-evidence
- Title/description: All five retained agent security reviews postdate the earliest supported selected mechanisms.
- Canonical locator: target review-integration commits
- Logical locator: `target://helium-te-poc/agent-review`
- Commit/version/date: `f79a5852a824f5ca792a0e8b87e693a730fd98cb` through `b9e73929e2258b85d30b0679f5125c05b2e47e5d`; 2026-08-05T07:28:19Z through 2026-08-05T09:34:12Z
- Checked date: 2026-08-28
- Precise location: Integration commits for Grok 4.5, Claude Opus 5, Gemini 3.1 Pro Preview, MAI Code 1 Flash Picker, and Claude Fable 5 retained packages.
- Relationship: Counters a hypothesis that the retained reviews introduced ASPECT-001, ASPECT-002, or ASPECT-003 because commit 30c08e6345f6f0f2e0a716937d3cde6c8ed778c5 already contains them.
- Source ownership: project-controlled
- Independence: unknown
- Confidence: High
- Evidence basis: Review integration chronology follows the sanitized snapshot, and selected source lines remain blamed to the earlier commit.
- Alternatives/counter-evidence: An inaccessible review, prompt, or discussion before the sanitized snapshot could still have influenced the original implementation.
- Limitations: Several retained packages contain conflicting or incomplete model and reviewed-baseline metadata; self-reported independence was not externally verified.
- Sensitivity: private
- Redistribution status: unknown
- Licence: GPL-3.0-only
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0015

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: target issue, pull request, discussion, prompt, or handoff
- Evidentiary role: counter-evidence
- Title/description: Maintained remediation and handoff records distinguish review-driven adjacent hardening from the unchanged selected policy input.
- Canonical locator: target remediation handoff
- Logical locator: `target://helium-te-poc/HANDOFF.md`
- Commit/version/date: Remediation plan `4155d0b2f94ffd7c4d27a43a7a6604db96738dc6`; integration `ac1ea8fb47821d10939780671af287bbf793afff`; 2026-08-06T00:50:17Z and 2026-08-07T17:11:40Z
- Checked date: 2026-08-28
- Precise location: `Repository state`, `Review processing and remediation state`, and statements that the retained packages and sole policy `src/policy/te.c` remained unmodified.
- Relationship: Supports explicit reviewer influence on adjacent subject-state, G-stage-layout, evidence, evaluator, and process hardening, while countering attribution of the selected policy mechanisms to those reviews.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: High
- Evidence basis: Maintained target handoff and matching history entries explicitly link reviews to later remediations and identify protected unchanged inputs.
- Alternatives/counter-evidence: Non-policy source or documentation may have been clarified during remediation, and an earlier unrecorded influence remains possible.
- Limitations: The remediation record is automation-produced and does not establish responsible-human H6 review or H7 release approval.
- Sensitivity: private
- Redistribution status: unknown
- Licence: GPL-3.0-only
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0016

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-003
- Source type: paper, proceedings item, dataset, or replication artifact
- Evidentiary role: prior art
- Title/description: W. E. Boebert and R. Y. Kain, "A Practical Alternative to Hierarchical Integrity Policies."
- Canonical locator: https://csrc.nist.gov/files/pubs/conference/1985/09/30/proceedings-8th-national-computer-security-confere/final/docs/1985-8th-ncsc-proceedings.pdf
- Logical locator: `workspace://osr-claude/sources/ncsc-nissc/ncsc-1985-8th-proceedings.pdf`
- Commit/version/date: Proceedings of the 8th National Computer Security Conference, 1985, pages 18-27
- Checked date: 2026-08-28
- Precise location: Printed pages 22-24 within the paper
- Relationship: Foundational Type Enforcement evidence in which mandatory, discretionary, and domain/type checks successively narrow rights before final rights are loaded into MMU tables; illegal access aborts the subject.
- Source ownership: independent
- Independence: independent
- Confidence: High
- Evidence basis: Primary period paper verified in the NIST-hosted proceedings and against the retained local copy.
- Alternatives/counter-evidence: The paper contains no distinct map or exposure permission and no independent runtime readback of the encoded MMU state.
- Limitations: Supports generic TE and policy-to-hardware ancestry, not target influence or the exact selected mechanisms.
- Sensitivity: public
- Redistribution status: unknown
- Licence: Historical conference proceedings; per-paper redistribution grant not established
- Hash: sha256:c3b2a2032df09dc9d1676aea5f015c0f56dd845cb92b4f73d76c90f6149601d5
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0017

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: paper, proceedings item, dataset, or replication artifact
- Evidentiary role: prior art
- Title/description: Richard Y. Kain and Carl E. Landwehr, "On Access Checking in Capability-Based Systems."
- Canonical locator: https://www.landwehr.org/1987landwehr-kain-ieeetse.pdf
- Logical locator: `workspace://osr-claude/sources/kain-landwehr-tse.pdf`
- Commit/version/date: IEEE Transactions on Software Engineering SE-13(2), February 1987, pages 202-207
- Checked date: 2026-08-28
- Precise location: Sections 3-6
- Relationship: Separates capability creation, copying, preparation or reachability, and actual use, with delayed computation of rights before access.
- Source ownership: independent
- Independence: independent
- Confidence: High
- Evidence basis: Primary author copy and retained byte-identical local evidence were inspected.
- Alternatives/counter-evidence: The mechanism is capability-based and contains no distinct policy-only exposure bit or runtime policy-to-hardware reconciliation.
- Limitations: Supports a general preparation-versus-use distinction, not transfer to the target.
- Sensitivity: public
- Redistribution status: unknown
- Licence: Author-copy availability; publisher redistribution terms not established
- Hash: sha256:7d17ae73533ecbc95201409acc55f4b7deb13c75094a2da620ae05e1bb50663d
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0018

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002
- Source type: paper, proceedings item, dataset, or replication artifact
- Evidentiary role: prior art
- Title/description: Todd Fine and Spencer E. Minear, "Assuring Distributed Trusted Mach."
- Canonical locator: https://conferences.computer.org/sp/pdfs/sp/1993/00044168.pdf
- Logical locator: `workspace://osr-claude/sources/dtmach-sp1993.pdf`
- Commit/version/date: IEEE Symposium on Research in Security and Privacy, May 1993, pages 206-218
- Checked date: 2026-08-28
- Precise location: Sections 2.2.2 and 5.1, printed pages 208-212
- Relationship: A task may possess a Mach port right while policy separately permits only mapping-purpose use, message use, or transfer; possession and authorized operation are distinct.
- Source ownership: independent
- Independence: independent
- Confidence: High
- Evidence basis: Direct primary text verified in the proceedings copy and retained local file.
- Alternatives/counter-evidence: Mach port rights and service permissions differ materially from a TE-gated second-stage page-table mapping.
- Limitations: Strong conceptual prior art for separated relationship and use authority; no evidence of target influence.
- Sensitivity: public
- Redistribution status: unknown
- Licence: IEEE proceedings; per-file redistribution grant not established
- Hash: sha256:5596d003616f6c85be7d98a2b26b1e20d0c00b2e48306627852646bdb3f099a8
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0019

- Status: active
- Aspect IDs: ASPECT-002, ASPECT-003
- Source type: paper, proceedings item, dataset, or replication artifact
- Evidentiary role: adjacent precedent
- Title/description: Spencer E. Minear, "Providing Policy Control Over Object Operations in a Mach Based System."
- Canonical locator: https://www-old.cs.utah.edu/flux/fluke/html/dtos/DOCs/usenix95.pdf
- Logical locator: `workspace://osr-claude/sources/dtos-usenix95.pdf`
- Commit/version/date: Manuscript dated 1995-04-28; Fifth USENIX UNIX Security Symposium, June 1995, pages 141-156
- Checked date: 2026-08-28
- Precise location: Sections 4.1-4.4
- Relationship: SSID and TSID policy lookup returns access vectors for distinct IPC and object-service operations; absent current permission state causes a blocking security fault.
- Source ownership: independent
- Independence: independent
- Confidence: High
- Evidence basis: Primary project paper verified against the public and retained copies.
- Alternatives/counter-evidence: The mechanism maintains cached policy consistency and does not independently inspect page-table or other hardware permission encoding.
- Limitations: Adjacent policy/enforcement and fail-closed precedent only.
- Sensitivity: public
- Redistribution status: unknown
- Licence: Public project copy; per-file redistribution grant not established
- Hash: sha256:8525ccfe752b2f47bde377b775e347f519f1678a5cadceea6ca2b9b7317e75a9
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0020

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: paper, proceedings item, dataset, or replication artifact
- Evidentiary role: prior art
- Title/description: Ray Spencer, Stephen Smalley, Peter Loscocco, Mike Hibler, David Andersen, and Jay Lepreau, "The Flask Security Architecture: System Support for Diverse Security Policies."
- Canonical locator: https://www.usenix.org/conference/8th-usenix-security-symposium/flask-security-architecture-system-support-diverse-security
- Logical locator: `workspace://osr-claude/sources/flask-node14.html`
- Commit/version/date: 8th USENIX Security Symposium, August 1999, pages 123-140
- Checked date: 2026-08-28
- Precise location: Sections 5.3.3-5.4, especially the microkernel-specific relationship controls
- Relationship: Uses source and target security identifiers with requested permission sets, separately controls connection and object-reference relationships usable for mapping or exporting memory, and revalidates access modes on mapped memory.
- Source ownership: independent
- Independence: independent
- Confidence: High
- Evidence basis: Official USENIX publication and retained primary HTML section were inspected.
- Alternatives/counter-evidence: The paper does not define the target's policy-only `OPEN` permission or its exact one-rule and policy-to-PTE reconciliation behavior.
- Limitations: Detailed relationship-permission inventory is partly deferred to a separate restricted or unavailable policy-module document.
- Sensitivity: public
- Redistribution status: unknown
- Licence: USENIX publication; explicit redistribution grant for retained HTML not established
- Hash: sha256:ce3a80c2c06e46346e9b5cda25981b00bd93a94eca70ee6ef5d0cb822cac9819
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0021

- Status: active
- Aspect IDs: ASPECT-003
- Source type: paper, proceedings item, dataset, or replication artifact
- Evidentiary role: adjacent precedent
- Title/description: O. Sami Saydjari, "LOCK: An Historical Perspective."
- Canonical locator: https://www.acsac.org/2002/papers/classic-lock.pdf
- Logical locator: `workspace://osr-claude/sources/lock-historical-perspective-acsac2002.pdf`
- Commit/version/date: Annual Computer Security Applications Conference, 2002
- Checked date: 2026-08-28
- Precise location: Capability-based access-control section, PDF pages 4-6
- Relationship: Describes policy-derived current rights loaded by privileged software into MMU tables for hardware enforcement.
- Source ownership: independent
- Independence: independent
- Confidence: High
- Evidence basis: Primary retrospective by a participant in the LOCK program, verified against the retained copy.
- Alternatives/counter-evidence: The inspected source treats translation and loading as trusted and does not describe independent hardware-state readback or terminal divergence handling.
- Limitations: Supports a policy-to-MMU chain, not the target's exact runtime reconciliation.
- Sensitivity: public
- Redistribution status: unknown
- Licence: ACSAC publication; per-file redistribution grant not established
- Hash: sha256:8c9d702ebe68930b85711a262c940fff816e8da68afc4e8dc9442a3799a6e3f5
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0022

- Status: active
- Aspect IDs: ASPECT-003
- Source type: paper, proceedings item, dataset, or replication artifact
- Evidentiary role: counter-evidence
- Title/description: David F. Ferraiolo, Serban Gavrila, Vincent Hu, and D. Richard Kuhn, "Composing and Combining Policies under the Policy Machine."
- Canonical locator: https://csrc.nist.gov/files/pubs/conference/2005/06/01/composing-and-combining-policies-under-the-policy-/final/docs/sacmat05_pm-final.pdf
- Logical locator: `workspace://osr-claude/sources/nist-csrc/2005-composing-and-combining-policies-under-the-policy.pdf`
- Commit/version/date: ACM SACMAT 2005, 2005-06-01 through 2005-06-03
- Checked date: 2026-08-28
- Precise location: Section 7, PDF pages 8-9
- Relationship: Authorization intersects applicable policy classes while unioning contributing permissions within a policy class; the paper also uses `open` as a compound user request rather than exposure authority.
- Source ownership: independent
- Independence: independent
- Confidence: High
- Evidence basis: NIST-hosted primary paper and retained copy were inspected.
- Alternatives/counter-evidence: Policy Machine is not Flask or SELinux and does not determine target lineage.
- Limitations: Provides policy-composition and terminology counter-evidence, not hardware-state reconciliation.
- Sensitivity: public
- Redistribution status: unknown
- Licence: ACM publication with government-work notice; general redistribution basis not established
- Hash: sha256:165a1625acc64e9390d55db5c4f3c5496b7c20ff9fa1d993dd9adb612296fce5
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0023

- Status: active
- Aspect IDs: ASPECT-001
- Source type: external repository or maintainer record
- Evidentiary role: counter-evidence
- Title/description: Linux SELinux commit "selinux: place open in the common file perms."
- Canonical locator: https://github.com/torvalds/linux/commit/49b7b8de46d293113a0a0bb026ff7bd833c73367
- Logical locator: `search-log.md`
- Commit/version/date: `49b7b8de46d293113a0a0bb026ff7bd833c73367`; 2010-08-02
- Checked date: 2026-08-28
- Precise location: Commit message and common file permission definitions
- Relationship: Establishes that a mature SELinux permission named `open` denotes the ordinary file-open operation, not policy-only exposure or mapping authority.
- Source ownership: independent
- Independence: independent
- Confidence: High
- Evidence basis: Direct public repository commit reached through the approved public-query citation chain.
- Alternatives/counter-evidence: A shared name does not preclude an unrelated target-specific meaning.
- Limitations: Terminology collision only; it does not address the target's mechanism.
- Sensitivity: public
- Redistribution status: approved
- Licence: GPL-2.0-only for the relevant Linux source
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0024

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002
- Source type: external repository or maintainer record
- Evidentiary role: prior art
- Title/description: Linux SELinux commit "selinux: add a map permission check for mmap."
- Canonical locator: https://github.com/torvalds/linux/commit/3ba4bf5f1e2c58bddd84ba27c5aeaf8ca1d36bff
- Logical locator: `search-log.md`
- Commit/version/date: `3ba4bf5f1e2c58bddd84ba27c5aeaf8ca1d36bff`; 2017-05-23
- Checked date: 2026-08-28
- Precise location: Commit message and the added `FILE__MAP` authorization in `security/selinux/hooks.c`
- Relationship: Adds a distinct policy permission that gates memory mapping independently from ordinary data-operation permissions because later mapped accesses cannot be revalidated like system-call I/O.
- Source ownership: independent
- Independence: independent
- Confidence: High
- Evidence basis: Direct public repository commit and source change reached through the approved query and citation path.
- Alternatives/counter-evidence: Linux `mmap` and file-policy semantics differ from second-stage mapping and the permission is not a policy-only bit named `OPEN`.
- Limitations: Strong close prior art; no evidence that it influenced the target.
- Sensitivity: public
- Redistribution status: approved
- Licence: GPL-2.0-only
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0025

- Status: active
- Aspect IDs: ASPECT-003
- Source type: external repository or maintainer record
- Evidentiary role: counter-evidence
- Title/description: SELinuxProject `libsepol` access-vector rule expansion.
- Canonical locator: https://github.com/SELinuxProject/selinux/blob/e38dc14f39e5b69bbb905e01e91cd2c897bcec75/libsepol/src/expand.c#L2095-L2135
- Logical locator: `search-log.md`
- Commit/version/date: `e38dc14f39e5b69bbb905e01e91cd2c897bcec75`; checked 2026-08-28
- Checked date: 2026-08-28
- Precise location: `expand_avrule_helper()`, lines 2095-2135
- Relationship: Matching ordinary SELinux allow-rule permission masks are accumulated with bitwise OR for the same source type, target type, and class.
- Source ownership: independent
- Independence: independent
- Confidence: High
- Evidence basis: Direct project source at an exact commit reached through approved navigation.
- Alternatives/counter-evidence: Conditional-policy representation is more complex, but it does not reverse ordinary permission accumulation.
- Limitations: Compiler expansion evidence, not a complete proof of every kernel policy-evaluation path.
- Sensitivity: public
- Redistribution status: approved
- Licence: LGPL-2.1-or-later for libsepol
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0026

- Status: active
- Aspect IDs: ASPECT-003
- Source type: standard or specification
- Evidentiary role: prior art
- Title/description: RISC-V SmMTT Task Group, "RISC-V Supervisor Domains Access Protection," version 0.49.
- Canonical locator: https://github.com/riscv/riscv-smmtt/releases/tag/v0.49
- Logical locator: `workspace://osr-claude/sources/riscv-smmtt/spec/riscv-smmtt-spec-v0.49-2026-01.pdf`
- Commit/version/date: Version 0.49; title-page date 2026-01-15; release observed 2026-01-16; upstream source pin `ed5e461a875b1ab3a5fde325c02751e34152a2a2`
- Checked date: 2026-08-28
- Precise location: Sections 1.2, 4.1, and 4.1.1
- Relationship: Effective memory access requires page-table, PMP, and MPT permission; malformed or reserved protection entries and denied combinations fault closed.
- Source ownership: independent
- Independence: independent
- Confidence: High
- Evidence basis: Exact retained specification and pinned upstream source were checked; local source activity was observed through 2026-08-18.
- Alternatives/counter-evidence: The protection layers are distinct mechanisms rather than duplicate derivations of one policy, and no software readback comparison is specified.
- Limitations: The true latest public state on 2026-08-28 could not be established within the approved query boundary; freshness after 2026-08-18 is unknown.
- Sensitivity: public
- Redistribution status: approved
- Licence: CC-BY-4.0
- Hash: sha256:4f41821d2e2762b989591b5146b846de9e9a84a65236ba987e05c4afb01e9786
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0027

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: review metadata
- Evidentiary role: negative search result
- Title/description: Allowlisted public terminology and primary-source query pass.
- Canonical locator: review public-search record
- Logical locator: `search-log.md`
- Commit/version/date: Public queries executed 2026-08-28
- Checked date: 2026-08-28
- Precise location: SEARCH-005, SEARCH-006, and SEARCH-007
- Relationship: No search established the exact phrases `exposure authority`, `separated exposure authority`, `dual permission derivation`, or `dual-source authorization` as historical OS-security terms, and no source established the target's exact runtime policy-to-hardware readback reconciliation.
- Source ownership: independent
- Independence: partially-independent
- Confidence: Medium
- Evidence basis: Sixteen exact user-approved queries plus primary-source citation navigation and bounded negative comparison.
- Alternatives/counter-evidence: Search-engine coverage is incomplete; inaccessible archives, alternative terminology, lower-level implementation reports, or private design records may contain closer precedents.
- Limitations: Negative results are bounded observations, not proof of absence.
- Sensitivity: private
- Redistribution status: not-applicable
- Licence: not-applicable
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0028

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002
- Source type: user-supplied or inaccessible resource metadata
- Evidentiary role: unresolved lead
- Title/description: Flask Security Policy Module, section 3, cited by the 1999 Flask paper.
- Canonical locator: Precise citation in the Flask paper reference inventory; definitive public copy not located
- Logical locator: `inaccessible-resources.md`
- Commit/version/date: Cited by the 1999 Flask publication
- Checked date: 2026-08-28
- Precise location: INACCESSIBLE-002
- Relationship: May contain the exact Flask or Fluke map, export, connection, and relationship permission inventory needed to compare with policy-only exposure authority.
- Source ownership: independent
- Independence: independent
- Confidence: High
- Evidence basis: The primary Flask paper explicitly defers detailed relationship permissions to this module document.
- Alternatives/counter-evidence: The Flask paper itself confirms relationship controls but does not expose an exact target-style `OPEN` permission.
- Limitations: No approved retained or publicly reachable copy was found; licence and redistribution terms are unknown.
- Sensitivity: public
- Redistribution status: unknown
- Licence: unknown
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0029

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: user-supplied or inaccessible resource metadata
- Evidentiary role: unresolved lead
- Title/description: DTOS Generalized Security Policy Specification and General System Security and Assurability Assessment Report.
- Canonical locator: Utah DTOS archive metadata; June 1997 reports
- Logical locator: `inaccessible-resources.md`
- Commit/version/date: June 1997
- Checked date: 2026-08-28
- Precise location: INACCESSIBLE-003
- Relationship: Could define exact DTOS object classes, relationship permissions, access-vector composition, and policy-to-enforcement consistency mechanisms.
- Source ownership: independent
- Independence: independent
- Confidence: High
- Evidence basis: DTOS and Flask primary papers cite the reports, and publicly reachable cover pages identify them.
- Alternatives/counter-evidence: The accessible DTOS and Flask papers already establish the broad architecture but not target-style one-rule or hardware-readback behavior.
- Limitations: Cover-page distribution restrictions preclude using or redistributing the reports beyond public metadata under this review.
- Sensitivity: restricted
- Redistribution status: not-approved
- Licence: Government or internal distribution restrictions stated on report covers
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0030

- Status: active
- Aspect IDs: ASPECT-003
- Source type: user-supplied or inaccessible resource metadata
- Evidentiary role: unresolved lead
- Title/description: T. M. Chen, "SAT Design Overview," MITRE Bedford Working Paper 25867.
- Canonical locator: MITRE Bedford Working Paper 25867, 1984-12-18
- Logical locator: `inaccessible-resources.md`
- Commit/version/date: 1984-12-18
- Checked date: 2026-08-28
- Precise location: INACCESSIBLE-004
- Relationship: Could clarify the lower-level delayed-binding, rights calculation, MMU loading, and fail-closed behavior behind later SAT and LOCK descriptions.
- Source ownership: independent
- Independence: independent
- Confidence: Medium
- Evidence basis: Later primary papers and the LOCK retrospective cite the SAT design lineage.
- Alternatives/counter-evidence: Boebert-Kain and LOCK already establish policy-derived MMU rights but no runtime readback.
- Limitations: No public or approved local copy was identified; rights and redistribution status are unknown.
- Sensitivity: public
- Redistribution status: unknown
- Licence: likely MITRE-controlled; exact rights unknown
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0031

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002
- Source type: user-supplied or inaccessible resource metadata
- Evidentiary role: unresolved lead
- Title/description: Gligor and coauthors, "Traditional Capability-Based Systems: An Analysis of Their Ability to Meet TCSEC," IDA P-1935.
- Canonical locator: IDA P-1935, October 1986
- Logical locator: `inaccessible-resources.md`
- Commit/version/date: 1986-10
- Checked date: 2026-08-28
- Precise location: INACCESSIBLE-005
- Relationship: May provide a contemporary government assessment of capability reachability, preparation, transfer, and use distinctions relevant to exposure authority.
- Source ownership: independent
- Independence: independent
- Confidence: Medium
- Evidence basis: The report is cited in the inspected capability access-checking lineage.
- Alternatives/counter-evidence: Kain-Landwehr and DTMach provide accessible primary evidence for the main distinction.
- Limitations: No open copy was located; IDA rights and redistribution status are unknown.
- Sensitivity: public
- Redistribution status: unknown
- Licence: unknown
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0032

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: user-supplied or inaccessible resource metadata
- Evidentiary role: unresolved lead
- Title/description: 18th National Information Systems Security Conference proceedings, volume 2, pages 384-761.
- Canonical locator: CERIAS hard-copy proceedings holding; 1995 volume 2
- Logical locator: `inaccessible-resources.md`
- Commit/version/date: 1995
- Checked date: 2026-08-28
- Precise location: INACCESSIBLE-006
- Relationship: May contain missing DTOS or Type Enforcement transition material between the accessible 1995 DTOS paper and later Flask work.
- Source ownership: independent
- Independence: independent
- Confidence: Medium
- Evidence basis: Public bibliographic metadata confirms the volume and hard-copy holding.
- Alternatives/counter-evidence: Accessible DTOS and Flask publications cover the principal architecture.
- Limitations: No open digital copy was found; scanning and redistribution rights are unknown.
- Sensitivity: public
- Redistribution status: unknown
- Licence: unknown
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0033

- Status: active
- Aspect IDs: ASPECT-003
- Source type: user-supplied or inaccessible resource metadata
- Evidentiary role: unresolved lead
- Title/description: SmMTT public repository and release activity after the locally verified 2026-08-18 observation.
- Canonical locator: https://github.com/riscv/riscv-smmtt
- Logical locator: `inaccessible-resources.md`
- Commit/version/date: Freshness window 2026-08-19 through 2026-08-28
- Checked date: 2026-08-28
- Precise location: INACCESSIBLE-007
- Relationship: Could establish whether version 0.49 remained the latest public specification state at the review cutoff.
- Source ownership: independent
- Independence: independent
- Confidence: High
- Evidence basis: Version 0.49 and local activity through 2026-08-18 were verified, but direct fresh repository-state checking was outside the approved query navigation path.
- Alternatives/counter-evidence: The retained v0.49 text is sufficient for the cited mechanism regardless of later draft activity.
- Limitations: Freshness only; no effect on the 2026-01 mechanism evidence. Public source is CC-BY-4.0.
- Sensitivity: public
- Redistribution status: approved
- Licence: CC-BY-4.0
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0034

- Status: active
- Aspect IDs: ASPECT-002
- Source type: user-supplied or inaccessible resource metadata
- Evidentiary role: unresolved lead
- Title/description: Official publisher copy and canonical identifier for "Security in KeyKOS."
- Canonical locator: IEEE Symposium on Security and Privacy 1986, pages 78-85; official route returned HTTP 403
- Logical locator: `inaccessible-resources.md`
- Commit/version/date: 1986-04
- Checked date: 2026-08-28
- Precise location: INACCESSIBLE-008
- Relationship: Could confirm canonical publisher metadata for supplementary capability-system counter-evidence.
- Source ownership: independent
- Independence: independent
- Confidence: Medium
- Evidence basis: A retained primary copy and bibliography establish the paper, while the candidate official route denied access.
- Alternatives/counter-evidence: The retained copy already supports the mechanism and is not load-bearing for the final classification.
- Limitations: Publisher access and redistribution terms are not approved.
- Sensitivity: public
- Redistribution status: not-approved
- Licence: IEEE publication
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0035

- Status: active
- Aspect IDs: ASPECT-002, ASPECT-003
- Source type: user-supplied or inaccessible resource metadata
- Evidentiary role: unresolved lead
- Title/description: Historical canonical publication page for "seL4 Enforces Integrity."
- Canonical locator: https://ts.data61.csiro.au/publications/nictaabstracts/Sewell_WB_11.abstract.pml
- Logical locator: `inaccessible-resources.md`
- Commit/version/date: ITP 2011
- Checked date: 2026-08-28
- Precise location: INACCESSIBLE-009
- Relationship: Could confirm final public bibliographic metadata and copy licensing for supplementary formal policy-to-concrete-state precedent.
- Source ownership: independent
- Independence: independent
- Confidence: Medium
- Evidence basis: The historical domain failed DNS and successor guesses returned 404; a retained primary paper exists.
- Alternatives/counter-evidence: This source is supplementary and does not show runtime policy-to-hardware reconciliation.
- Limitations: Canonical hosting and redistribution terms remain unresolved.
- Sensitivity: public
- Redistribution status: unknown
- Licence: unknown
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0036

- Status: active
- Aspect IDs: ASPECT-002
- Source type: user-supplied or inaccessible resource metadata
- Evidentiary role: unresolved lead
- Title/description: Canonical publication record for "Security-Enhanced Darwin: Porting SELinux to Mac OS X."
- Canonical locator: Former TrustedBSD publication host; January 22, 2007 draft retained locally
- Logical locator: `inaccessible-resources.md`
- Commit/version/date: Draft dated 2007-01-22
- Checked date: 2026-08-28
- Precise location: INACCESSIBLE-010
- Relationship: Could confirm final publication status and canonical metadata for supplementary separation of port-right ownership from operation permissions.
- Source ownership: independent
- Independence: independent
- Confidence: Medium
- Evidence basis: The former host failed DNS or TLS access, while a retained primary draft establishes the mechanism.
- Alternatives/counter-evidence: DTMach and Flask already provide stronger load-bearing evidence.
- Limitations: Final publication status and redistribution terms are unknown.
- Sensitivity: public
- Redistribution status: unknown
- Licence: unknown
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0037

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002
- Source type: user-supplied or inaccessible resource metadata
- Evidentiary role: unresolved lead
- Title/description: Post-2016 `cap-talk` mailing-list archive.
- Canonical locator: Google Groups `cap-talk` archive
- Logical locator: `inaccessible-resources.md`
- Commit/version/date: Activity visible through at least 2026-04-23
- Checked date: 2026-08-28
- Precise location: INACCESSIBLE-011
- Relationship: Could contain later terminology collisions or explicit historical commentary on mapping, reachability, and use authority.
- Source ownership: independent
- Independence: independent
- Confidence: Low
- Evidence basis: The landing page was reachable, but archive-wide searching would have required public queries outside the approved term boundary.
- Alternatives/counter-evidence: Primary historical papers already establish the principal prior-art relationships.
- Limitations: Low retrieval priority; archive redistribution terms are unclear and later commentary would not establish target influence by itself.
- Sensitivity: public
- Redistribution status: unknown
- Licence: archive terms unknown
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0038

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: review metadata
- Evidentiary role: administrative record
- Title/description: User-confirmed effective provenance scope and evidence boundary.
- Canonical locator: confirmed review intake for PRV-20260828-001
- Logical locator: `scope.md`
- Commit/version/date: Scope confirmed 2026-08-28 before package allocation and specialist delegation
- Checked date: 2026-08-28
- Precise location: scope.md SCOPE-001 and ACTIVITY-002
- Relationship: Authorizes the exact clean target revision, three selected aspects and directly coupled mechanisms, Deep depth, all-history target chronology, approved local sources, ten-term public-query allowlist, exclusions, and intended public-candidate request while initial distribution remains private.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: High
- Evidence basis: The complete effective scope was presented after resolving the target state and explicitly confirmed by the user; the later permission to use target agent-review material was incorporated and the complete scope was reconfirmed.
- Alternatives/counter-evidence: Any material scope change would invalidate this confirmation and require a new complete scope confirmation.
- Limitations: Records authorization and boundaries only; it does not support implementation or provenance conclusions.
- Sensitivity: private
- Redistribution status: not-applicable
- Licence: not-applicable
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: yes

## PRV-20260828-001-E0039

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: target code or tracked target document
- Evidentiary role: documented influence
- Title/description: Corrected target-maintained statement of FLASK and SELinux vocabulary influence.
- Canonical locator: frozen target documentation
- Logical locator: `target://helium-te-poc/docs/concepts.md`
- Commit/version/date: `1ab289c066b69acdd8b55c9f77055b0145be1316`; 2026-08-11 UTC
- Checked date: 2026-08-28
- Precise location: `docs/concepts.md` lines 103-125 and `docs/policy-models.md` relationship-to-FLASK-SELinux-and-XSM section
- Relationship: The target states that its source-type, target-type, object-class, and permission tuple resembles or follows basic FLASK and SELinux vocabulary while explicitly disclaiming identity with SELinux, XSM, or FLASK.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: High
- Evidence basis: Explicit frozen target statements, corroborated by primary Flask architecture evidence.
- Alternatives/counter-evidence: The wording may record analogy or vocabulary adoption rather than direct implementation derivation; it does not identify those systems as the source of target-style `OPEN`, one-rule non-composition, or policy-to-G-stage reconciliation.
- Limitations: Supports documented influence only for the broad tuple and vocabulary, not verified source lineage or conceptual origin.
- Sensitivity: private
- Redistribution status: unknown
- Licence: GPL-3.0-only
- Hash: not-applicable
- Supersedes: PRV-20260828-001-E0008
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0040

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-003
- Source type: target code or tracked target document
- Evidentiary role: direct implementation evidence
- Title/description: Corrected fixed TE rule-table evidence with completed chronology and influence limitations.
- Canonical locator: frozen target source
- Logical locator: `target://helium-te-poc/src/policy/te.c`
- Commit/version/date: `1ab289c066b69acdd8b55c9f77055b0145be1316`; 2026-08-11 UTC
- Checked date: 2026-08-28
- Precise location: Label tables and six fixed rules lines 18-81; direct authorization wrapper lines 112-118
- Relationship: Supplies the only linked policy inputs consumed by the selected exposure and mapping-derivation path.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: High
- Evidence basis: Exact frozen policy implementation; earliest supported occurrence and authorship are recorded in PRV-20260828-001-E0010 and PRV-20260828-001-E0011, while vocabulary influence is bounded by PRV-20260828-001-E0039.
- Alternatives/counter-evidence: Fixed rules show target use but not why the permission vocabulary, one-rule check, or reconciliation sequence was selected.
- Limitations: The original pre-snapshot policy chronology and conceptual source remain unresolved; later retained agent reviews did not modify this policy.
- Sensitivity: private
- Redistribution status: unknown
- Licence: GPL-3.0-only
- Hash: not-applicable
- Supersedes: PRV-20260828-001-E0006
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0041

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: review metadata
- Evidentiary role: administrative record
- Title/description: Completed maintained validation record for PRV-20260828-001.
- Canonical locator: review validation status
- Logical locator: `HANDOFF.md`
- Commit/version/date: Validation completed 2026-08-28
- Checked date: 2026-08-28
- Precise location: HANDOFF.md Validation status
- Relationship: Records successful completed-package validation, provenance agent-contract validation, and whitespace inspection after synthesis-audit corrections.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: High
- Evidence basis: `scripts/validate-review.sh` completed in default mode, `tests/validate-agent.sh` completed, and the outer read-only Git whitespace inspection reported no errors.
- Alternatives/counter-evidence: Structural validation does not prove append-only history integrity without a supplied baseline and does not authorize publication.
- Limitations: Validation confirms package contracts and references, not the truth of inaccessible evidence or responsible-human acceptance.
- Sensitivity: private
- Redistribution status: not-applicable
- Licence: not-applicable
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: yes
