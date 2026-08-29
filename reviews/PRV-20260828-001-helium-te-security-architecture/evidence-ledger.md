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

- Status: superseded
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
- Superseded by: PRV-20260828-001-E0090
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

## PRV-20260828-001-E0042

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: review metadata
- Evidentiary role: administrative record
- Title/description: Explicitly confirmed amended source scope for pre-creation Beryllium history and expanded public landscape research.
- Canonical locator: confirmed review amendment for PRV-20260828-001
- Logical locator: `scope.md`
- Commit/version/date: Amendment confirmed 2026-08-28
- Checked date: 2026-08-28
- Precise location: scope.md SOURCE-SCOPE-AMENDMENT-001 and ACTIVITY-010
- Relationship: Authorizes exact pre-2026-08-04T08:31:12Z Beryllium anchors, pre-cutoff-only substantive use, systematic conference and mailing-list coverage, related seL4 and CHERI ecosystems, selected industry hypervisors including LDoms, and a supplementary source-scope summary.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: High
- Evidence basis: The complete amended effective scope was presented after resolving the creation anchor and surviving Beryllium commit IDs, and the user explicitly confirmed it exactly as written.
- Alternatives/counter-evidence: A different creation event or public disclosure boundary would require another complete scope confirmation.
- Limitations: Records authorization and cutoff only; it does not support implementation, influence, or prior-art conclusions.
- Sensitivity: private
- Redistribution status: not-applicable
- Licence: not-applicable
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: yes

## PRV-20260828-001-E0043

- Status: superseded
- Aspect IDs: ASPECT-002, ASPECT-003
- Source type: approved local research
- Evidentiary role: dependency inheritance
- Title/description: Minimal RISC-V policy pathfinder as the direct Beryllium predecessor of the fixed TE pathfinder.
- Canonical locator: Beryllium private repository commit cc6029acdd5df1fc14157c4faea4cc047e49a90e
- Logical locator: `workspace://beryllium-repo/planning/minimal-pathfinder-evidence.md`
- Commit/version/date: `cc6029acdd5df1fc14157c4faea4cc047e49a90e`; 2026-07-18T06:15:59Z
- Checked date: 2026-08-28
- Precise location: Minimal pathfinder plan/evidence and inherited G-stage/runtime lines identified by blame at successor commit `511187f9d1f44c322e3a4a11347584fd8a20dc72`
- Relationship: Establishes direct repository ancestry for the policy/mechanism seam, fixed Sv39x4 builder, designation-versus-authority distinction, absent-leaf denial, and generic fail-closed trap framework later reused by the TE pathfinder.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: High
- Evidence basis: Isolated helper history places `511187f` directly after `cc6029a`; successor blame retains substantial mapping and runtime scaffolding from the minimal checkpoint.
- Alternatives/counter-evidence: The minimal checkpoint contains no target-style `OPEN`, exact TE rule table, complete-request reauthorization, or TE-to-PTE reconciliation.
- Limitations: Supports verified implementation inheritance for generic scaffolding, not conceptual origin of the selected TE mechanisms or cross-repository transfer.
- Sensitivity: private
- Redistribution status: unknown
- Licence: GPL-3.0-only
- Hash: not-applicable
- Supersedes: None
- Superseded by: PRV-20260828-001-E0105
- Administrative: no

## PRV-20260828-001-E0044

- Status: superseded
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: approved local research
- Evidentiary role: repository chronology
- Title/description: Earliest supported Beryllium checkpoint containing all selected TE mechanisms.
- Canonical locator: Beryllium private repository commit 511187f9d1f44c322e3a4a11347584fd8a20dc72
- Logical locator: `workspace://beryllium-repo/planning/type-enforcement-pathfinder-evidence.md`
- Commit/version/date: `511187f9d1f44c322e3a4a11347584fd8a20dc72`; 2026-07-20T14:51:03Z
- Checked date: 2026-08-28
- Precise location: Commit `pathfinder: add fixed type enforcement PoC`; TE plan/evidence and blamed implementation under `pathfinder/include/be/` and `pathfinder/src/`
- Relationship: Predates the standalone repository and is the earliest supported Beryllium occurrence of policy-only `OPEN`, separate R/W/X derivation, one-rule complete-request coverage, G-stage rejection of `OPEN`, policy/PTE comparison, mapping-state denial checks, and fail-closed divergence.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: High
- Evidence basis: Exact pre-cutoff helper log, tree, plan/evidence extracts, and blame for all selected implementation surfaces.
- Alternatives/counter-evidence: Plan, implementation, tests, and evidence entered in one commit, so intra-commit conceptual chronology and any earlier working-tree or prompt origin remain unknown.
- Limitations: Establishes earliest supported internal implementation chronology, not direct import into standalone Helium.
- Sensitivity: private
- Redistribution status: unknown
- Licence: GPL-3.0-only
- Hash: not-applicable
- Supersedes: None
- Superseded by: PRV-20260828-001-E0107
- Administrative: no

## PRV-20260828-001-E0045

- Status: superseded
- Aspect IDs: ASPECT-001, ASPECT-003
- Source type: approved local research
- Evidentiary role: direct implementation evidence
- Title/description: Beryllium fixed TE permission vocabulary, policy table, and complete-request authorization.
- Canonical locator: Beryllium private repository source at commit 511187f9d1f44c322e3a4a11347584fd8a20dc72
- Logical locator: `workspace://beryllium-repo/pathfinder/include/be/te.h`
- Commit/version/date: `511187f9d1f44c322e3a4a11347584fd8a20dc72`; 2026-07-20T14:51:03Z
- Checked date: 2026-08-28
- Precise location: `pathfinder/include/be/te.h` lines 33-159; `pathfinder/src/te.c` lines 27-184; `pathfinder/src/policy/te.c` lines 16-150
- Relationship: Defines `BE_TE_PERMISSION_OPEN`, sealed labels, six fixed allow rules, malformed-input denial, and one valid exact-key rule covering every requested permission.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: High
- Evidence basis: Isolated blame at the exact checkpoint attributes the complete TE API, mechanism, and policy surfaces to `511187f`.
- Alternatives/counter-evidence: Bitmask access-vector and subset matching techniques are established practice; implementation chronology does not establish conceptual novelty.
- Limitations: No source-to-binary proof, intra-commit design order, or cross-repository import record is present.
- Sensitivity: private
- Redistribution status: unknown
- Licence: GPL-3.0-only
- Hash: not-applicable
- Supersedes: None
- Superseded by: PRV-20260828-001-E0108
- Administrative: no

## PRV-20260828-001-E0046

- Status: superseded
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: approved local research
- Evidentiary role: direct implementation evidence
- Title/description: Beryllium TE-derived G-stage construction, denial reconciliation, and divergence failure.
- Canonical locator: Beryllium private repository source at commit 511187f9d1f44c322e3a4a11347584fd8a20dc72
- Logical locator: `workspace://beryllium-repo/pathfinder/src/main.c`
- Commit/version/date: `511187f9d1f44c322e3a4a11347584fd8a20dc72`; 2026-07-20T14:51:03Z
- Checked date: 2026-08-28
- Precise location: `pathfinder/src/main.c` lines 131-255 and 364-417; `pathfinder/src/memory.c` lines 128-197; `pathfinder/include/be/memory.h` lines 53-84
- Relationship: Requires `OPEN`, derives R/W/X per bit, rechecks the combined request, excludes `OPEN` from hardware encoding, compares policy and PTE access, requires policy denial plus absent cross-private leaves, and fails terminally on divergence.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: High
- Evidence basis: Exact pre-cutoff blame and historical source contracts at `511187f`.
- Alternatives/counter-evidence: The fixed synthetic scenario and common defensive checks do not prove broad complete mediation or conceptual origin.
- Limitations: Direct correspondence with standalone `he_` source remains unproved without a rename/import diff, patch identity, or source-hash bridge.
- Sensitivity: private
- Redistribution status: unknown
- Licence: GPL-3.0-only
- Hash: not-applicable
- Supersedes: None
- Superseded by: PRV-20260828-001-E0109
- Administrative: no

## PRV-20260828-001-E0047

- Status: superseded
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: approved local research
- Evidentiary role: documented influence
- Title/description: Same-checkpoint Beryllium TE plan and evidence with explicit Flask, SELinux, XSM, and RISC-V references.
- Canonical locator: Beryllium private repository planning records at commit 511187f9d1f44c322e3a4a11347584fd8a20dc72
- Logical locator: `workspace://beryllium-repo/planning/type-enforcement-pathfinder-plan.md`
- Commit/version/date: `511187f9d1f44c322e3a4a11347584fd8a20dc72`; 2026-07-20T14:51:03Z
- Checked date: 2026-08-28
- Precise location: Type Enforcement plan references and the plan/evidence descriptions of `OPEN`, complete rules, derived mappings, mapping absence, and policy/PTE checks
- Relationship: Explicitly documents Flask, SELinux Type Enforcement and access vectors, Xen XSM/FLASK, and the RISC-V Hypervisor Extension as framing or architectural sources available at the first supported implementation checkpoint.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: Medium
- Evidence basis: Exact contemporaneous plan/evidence files and citations.
- Alternatives/counter-evidence: Plan and implementation share one commit, so the records cannot prove which source inspired `OPEN`, one-rule coverage, or reconciliation before coding.
- Limitations: Supports documented influence on framing and vocabulary, not verified derivation of the exact selected algorithms.
- Sensitivity: private
- Redistribution status: unknown
- Licence: GPL-3.0-only
- Hash: not-applicable
- Supersedes: None
- Superseded by: PRV-20260828-001-E0110
- Administrative: no

## PRV-20260828-001-E0048

- Status: superseded
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: approved local research
- Evidentiary role: counter-evidence
- Title/description: Same-day post-implementation Beryllium architecture and session analysis.
- Canonical locator: Beryllium private repository commit b4b6fb7dfd28943cce0a6352e1870974e3be8bdf
- Logical locator: `workspace://beryllium-repo/planning/session-analysis-transcripts-2026-07-20.md`
- Commit/version/date: `4b6892b9ca2ac7bdf694647c6f92156168324248` at 2026-07-20T19:27:57Z and `b4b6fb7dfd28943cce0a6352e1870974e3be8bdf` at 2026-07-20T20:02:05Z
- Checked date: 2026-08-28
- Precise location: Isolation-engine policy research and the TE/VBS, isolation-engine, and CAP+TE/CHERI session records
- Relationship: Generalizes the completed TE pathfinder's proofability, policy/PTE soundness, hardware isolation, and CAP+TE options, but explicitly postdates the 14:51:03Z implementation checkpoint.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: High
- Evidence basis: Exact timestamps and records describe themselves as post-pathfinder or retrospective analysis.
- Alternatives/counter-evidence: An earlier unretained prompt or working-tree discussion may still have influenced implementation.
- Limitations: Session IDs and Copilot trailers do not establish conceptual contribution shares or generated-code provenance.
- Sensitivity: private
- Redistribution status: not-applicable
- Licence: GPL-3.0-only planning records; session content remains private
- Hash: not-applicable
- Supersedes: None
- Superseded by: PRV-20260828-001-E0111
- Administrative: no

## PRV-20260828-001-E0049

- Status: superseded
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: approved local research
- Evidentiary role: unresolved lead
- Title/description: Beryllium and Helium identity split followed by standalone repository creation.
- Canonical locator: Beryllium commit ecbcfefedb2815b26476dbe38e3f5b0ad74c0871 and standalone creation anchor b3994e52663dab03d8025db2750a0650aa40e80c
- Logical locator: `workspace://beryllium-repo/planning/HANDOFF.md`
- Commit/version/date: `ecbcfefedb2815b26476dbe38e3f5b0ad74c0871` at 2026-07-21T04:29:57Z; standalone anchor `b3994e52663dab03d8025db2750a0650aa40e80c` at 2026-08-04T08:31:12Z
- Checked date: 2026-08-28
- Precise location: Identity-refactor commit metadata, pre-cutoff historical logs, and standalone creation-anchor metadata
- Relationship: Supports intended transition from Beryllium pathfinder naming and `be_` identifiers to Helium and `he_` identifiers before the standalone repository appeared.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: Medium
- Evidence basis: Exact commit chronology and naming statement.
- Alternatives/counter-evidence: No supplied cross-repository parent, rename diff, patch identity, source-hash bridge, or import record proves that `511187f` was directly transferred into standalone Helium.
- Limitations: Classify `511187f` as a close internal predecessor; direct standalone implementation lineage remains unresolved. The former standalone `local-history` ref and `c8d1032` anchor are unavailable.
- Sensitivity: private
- Redistribution status: not-applicable
- Licence: not-applicable
- Hash: not-applicable
- Supersedes: None
- Superseded by: PRV-20260828-001-E0112
- Administrative: no

## PRV-20260828-001-E0050

- Status: superseded
- Aspect IDs: ASPECT-002, ASPECT-003
- Source type: approved local research
- Evidentiary role: counter-evidence
- Title/description: Pre-cutoff Beryllium policy-neutral models and runtime plan constrain transfer of TE-specific claims.
- Canonical locator: Beryllium Model 0.1, Model 0.2, runtime-plan, and R0 exact checkpoints
- Logical locator: `workspace://beryllium-repo/planning/architecture-model-0.2.md`
- Commit/version/date: `5d2276630d81b8a4e6b70babf7381c3b9e714403` through `64a88b15a6c35d522fa997699c4fb514b15da314`; 2026-07-21 through 2026-07-25
- Checked date: 2026-08-28
- Precise location: Model 0.1 and 0.2 records, accepted single-hart runtime plan, and R0 freeze
- Relationship: Preserves mapping soundness, sealed authority, derived enforcement, directional sharing, independent rechecks, and fail-closed behavior while deliberately remaining policy-neutral and excluding TE or Helium import from the accepted runtime profile.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: High
- Evidence basis: Exact pre-cutoff planning/model records at confirmed commits.
- Alternatives/counter-evidence: These later records may reflect lessons from the TE pathfinder but cannot establish its earlier conceptual origin.
- Limitations: Counters a claim of one uninterrupted TE implementation lineage across all later Beryllium work.
- Sensitivity: private
- Redistribution status: unknown
- Licence: GPL-3.0-only
- Hash: not-applicable
- Supersedes: None
- Superseded by: PRV-20260828-001-E0113
- Administrative: no

## PRV-20260828-001-E0051

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: paper, proceedings item, dataset, or replication artifact
- Evidentiary role: prior art
- Title/description: David L. Golber, "The SDC Communications Kernel."
- Canonical locator: https://csrc.nist.gov/files/pubs/conference/1981/08/10/proceedings-4th-seminar-dod-computer-security-init/final/docs/1981-4th-seminar-proceedings.pdf
- Logical locator: `workspace://osr-claude/sources/ncsc-nissc/dod-csi-seminar-1981-4th-proceedings.pdf`
- Commit/version/date: Fourth Seminar on the DoD Computer Security Initiative, August 1981
- Checked date: 2026-08-28
- Precise location: Paper pages P-3 and P-13 through P-16; companion extraction lines 10474-10491, 11217-11329, and 11388-11525
- Relationship: Capability acquisition, hardware mapping with corresponding read/write rights, later use, transfer, unmapping, and release are separate lifecycle operations; `K-MAP` derives hardware mapping rights from capability state.
- Source ownership: independent
- Independence: independent
- Confidence: High
- Evidence basis: Primary NIST-hosted proceedings, complete retained PDF, tracked text extraction, and manifest metadata.
- Alternatives/counter-evidence: The same capability authorizes mapping and later access, so the source does not define a separately granted policy-only mapping permission or independent hardware readback.
- Limitations: Strong prior art for capability-to-MMU derivation and lifecycle separation, adjacent rather than exact precedent for target-style `OPEN`.
- Sensitivity: public
- Redistribution status: unknown
- Licence: Proceedings and contributed-paper redistribution grant not established
- Hash: sha256:8b869f9c666659ba62434fbc9e7f26f1079e5f011ec0d3f60c003a0ca8d2fad7
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0052

- Status: active
- Aspect IDs: ASPECT-003
- Source type: paper, proceedings item, dataset, or replication artifact
- Evidentiary role: counter-evidence
- Title/description: Robert Watson, Wayne Morrison, Chris Vance, and Brian Feldman, "The TrustedBSD MAC Framework: Extensible Kernel Access Control for FreeBSD 5.0."
- Canonical locator: https://www.usenix.org/conference/2003-usenix-annual-technical-conference/trustedbsd-mac-framework-extensible-kernel-access
- Logical locator: `search-log.md`
- Commit/version/date: USENIX Annual Technical Conference 2003, June 2003, pages 285-296
- Checked date: 2026-08-28
- Precise location: Section 5, Composition, and preceding framework entry-point discussion
- Relationship: Independently loaded policy modules compose by rights intersection: any module denial denies the operation; relabeling uses separate check and commit phases.
- Source ownership: independent
- Independence: independent
- Confidence: High
- Evidence basis: Official USENIX primary paper and event record.
- Alternatives/counter-evidence: This is framework-level conjunction across modules, not a requirement that one syntactic rule contain every permission or a page-table derivation mechanism.
- Limitations: Provides restrictive composition prior art and counter-evidence to overbroad grant-union claims only.
- Sensitivity: public
- Redistribution status: not-applicable
- Licence: USENIX and paper-author terms; no copy retained
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0053

- Status: superseded
- Aspect IDs: ASPECT-003
- Source type: paper, proceedings item, dataset, or replication artifact
- Evidentiary role: prior art
- Title/description: Nick L. Petroni Jr., Timothy Fraser, Aaron Walters, and William A. Arbaugh, "An Architecture for Specification-Based Detection of Semantic Integrity Violations in Kernel Dynamic Data."
- Canonical locator: https://www.usenix.org/conference/15th-usenix-security-symposium/architecture-specification-based-detection-semantic
- Logical locator: `search-log.md`
- Commit/version/date: 15th USENIX Security Symposium, July 2006, pages 289-304
- Checked date: 2026-08-28
- Precise location: Sections 2.2, 3, 4.2, and 5
- Relationship: An independent monitor reads live SELinux AVC authorization state, recomputes expected masks from protected policy tables using ordinary and conditional entry union, compares the states, and invokes a configured response on mismatch.
- Source ownership: independent
- Independence: independent
- Confidence: High
- Evidence basis: Primary paper with an implemented prototype and attack experiment.
- Alternatives/counter-evidence: It monitors a cache asynchronously and notifies an administrator rather than admitting a PTE or terminating immediately.
- Limitations: Strong prior art for equivalent policy-versus-enforcement-state reconciliation, but not the target's exact post-install TE-to-G-stage readback and fail-stop sequence.
- Sensitivity: public
- Redistribution status: not-applicable
- Licence: USENIX and paper-author terms; no copy retained
- Hash: not-applicable
- Supersedes: None
- Superseded by: PRV-20260828-001-E0124
- Administrative: no

## PRV-20260828-001-E0054

- Status: withdrawn
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: paper, proceedings item, dataset, or replication artifact
- Evidentiary role: prior art
- Title/description: Owen S. Hofmann, Sangman Kim, Alan M. Dunn, Michael Z. Lee, and Emmett Witchel, "InkTag: Secure Applications on an Untrusted Operating System."
- Canonical locator: https://www.cs.utexas.edu/users/witchel/pubs/hofmann13asplos-inktag.pdf
- Logical locator: `search-log.md`
- Commit/version/date: ASPLOS 2013, 2013-03-16 through 2013-03-20, pages 253-264
- Checked date: 2026-08-28
- Precise location: Sections 2.4 and 4.1 through 4.4, especially pages 257-259
- Relationship: Trusted application intent is recorded separately from an untrusted OS's proposed PTE update; the hypervisor verifies address, object, offset, and frame correspondence before installing the mapping and refuses invalid evidence.
- Source ownership: independent
- Independence: independent
- Confidence: High
- Evidence basis: Primary author manuscript and complete implementation description.
- Alternatives/counter-evidence: Validation occurs before installation, not as independent post-install readback of a TE-derived hardware mapping.
- Limitations: Strong prior art for intent-authorized fail-closed mapping admission, not a policy-only `OPEN` bit or one-rule TE semantics.
- Sensitivity: public
- Redistribution status: not-applicable
- Licence: ACM copyright; author manuscript publicly accessible and no copy retained
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0055

- Status: superseded
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: external repository or maintainer record
- Evidentiary role: prior art
- Title/description: FreeBSD Capsicum mapping-right derivation in FreeBSD 14.3.
- Canonical locator: https://github.com/freebsd/freebsd-src/blob/release/14.3.0/sys/sys/capsicum.h ; https://github.com/freebsd/freebsd-src/blob/release/14.3.0/sys/vm/vm_mmap.c
- Logical locator: `search-log.md`
- Commit/version/date: FreeBSD 14.3-RELEASE; 2025-06-10
- Checked date: 2026-08-28
- Precise location: `CAP_MMAP` through `CAP_MMAP_RWX` definitions and `kern_mmap` complete-rights construction and VM maximum-protection intersection
- Relationship: Separates base mapping authority from R/W/X-specific mapping rights, checks a complete selected rights set on one descriptor, and derives the VM protection ceiling from capability rights.
- Source ownership: project-controlled
- Independence: independent
- Confidence: High
- Evidence basis: Release-pinned FreeBSD source and imported Capsicum tests.
- Alternatives/counter-evidence: Descriptor rights may be copied or retained, and the model is capability-based rather than a policy-only no-PTE bit.
- Limitations: First-introduction commit and design discussion were not recovered.
- Sensitivity: public
- Redistribution status: approved
- Licence: FreeBSD BSD-family source licences, subject to notices
- Hash: not-applicable
- Supersedes: None
- Superseded by: PRV-20260828-001-E0072
- Administrative: no

## PRV-20260828-001-E0056

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-003
- Source type: external repository or maintainer record
- Evidentiary role: prior art
- Title/description: NetBSD `PROT_MPROTECT` maximum future mapping authority.
- Canonical locator: https://man.netbsd.org/mmap.2
- Logical locator: `search-log.md`
- Commit/version/date: NetBSD manual source dated 2019-09-08
- Checked date: 2026-08-28
- Precise location: `mmap(2)` lines 46-66 and 176-185 in the rendered manual
- Relationship: Reserves a future R/W/X authorization ceiling without immediately granting those permissions in the active mapping; later protection changes remain constrained.
- Source ownership: project-controlled
- Independence: independent
- Confidence: High
- Evidence basis: Official NetBSD manual.
- Alternatives/counter-evidence: This is a maximum-protection ceiling, not a separate object-exposure permission or TE decision.
- Limitations: Original introduction commit and discussion remain unresolved.
- Sensitivity: public
- Redistribution status: not-applicable
- Licence: NetBSD documentation terms; no copy retained
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0057

- Status: withdrawn
- Aspect IDs: ASPECT-003
- Source type: mailing-list or archive record
- Evidentiary role: counter-evidence
- Title/description: NetBSD kauth authorization composition and no-security-model exception.
- Canonical locator: https://man.netbsd.org/kauth.9 ; https://mail-index.netbsd.org/tech-security/2006/08/25/0000.html
- Logical locator: `search-log.md`
- Commit/version/date: Kauth design discussions in 2006; official manual checked 2026-08-28
- Checked date: 2026-08-28
- Precise location: Manual authorization result rules and 2006 `tech-security` design discussion
- Relationship: Requires at least one `ALLOW` and no `DENY` when security models participate, but permits a no-decision request when no security model is loaded.
- Source ownership: project-controlled
- Independence: independent
- Confidence: High
- Evidence basis: Official manual and primary project mailing-list record.
- Alternatives/counter-evidence: Configurations with an active security model retain deny-dominant behavior.
- Limitations: Counters only universal fail-closed claims; no dedicated mapping action was identified.
- Sensitivity: public
- Redistribution status: not-applicable
- Licence: NetBSD documentation and mailing-list terms; no copy retained
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0058

- Status: superseded
- Aspect IDs: ASPECT-001, ASPECT-003
- Source type: external repository or maintainer record
- Evidentiary role: adjacent precedent
- Title/description: OpenBSD `pledge` execution-mapping control and `mimmutable` mapping immutability.
- Canonical locator: https://man.openbsd.org/pledge.2 ; https://man.openbsd.org/mimmutable.2 ; https://marc.info/?l=openbsd-tech&m=166874067828564&w=2
- Logical locator: `search-log.md`
- Commit/version/date: `prot_exec` present by 2017; `mimmutable` discussion in 2022; OpenBSD 7.3-era behavior
- Checked date: 2026-08-28
- Precise location: `pledge(2)` mmap or mprotect execution rule and `mimmutable(2)` rejection behavior
- Relationship: Adds process-policy and immutable-map constraints beyond ordinary R/W/X and fails later mapping or protection changes with `EPERM`.
- Source ownership: project-controlled
- Independence: independent
- Confidence: High
- Evidence basis: Official manuals and maintainer discussion.
- Alternatives/counter-evidence: Ordinary OpenBSD mapping remains largely file-mode plus R/W/X, so mapping authority is not always separately represented.
- Limitations: No general policy-only exposure bit or policy-to-PTE reconciliation.
- Sensitivity: public
- Redistribution status: not-applicable
- Licence: OpenBSD documentation and mailing-list terms; no copy retained
- Hash: not-applicable
- Supersedes: None
- Superseded by: PRV-20260828-001-E0074
- Administrative: no

## PRV-20260828-001-E0059

- Status: superseded
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: external repository or maintainer record
- Evidentiary role: prior art
- Title/description: Xen 4.19 FLASK grant-map relationship authorization.
- Canonical locator: https://github.com/xen-project/xen/blob/RELEASE-4.19.0/xen/xsm/flask/hooks.c ; https://github.com/xen-project/xen/blob/RELEASE-4.19.0/xen/xsm/flask/policy/access_vectors
- Logical locator: `search-log.md`
- Commit/version/date: Xen 4.19.0; 2024-07-29 through 2024-07-30
- Checked date: 2026-08-28
- Precise location: `grant_mapref` hook and `GRANT__MAP_READ`, `GRANT__MAP_WRITE`, unmap, MMU, IOMMU, and resource access-vector definitions
- Relationship: Authorizes domain-pair grant mapping with a combined read and optional write mask, while distinct permissions govern unmap, transfer, MMU mapping, IOMMU use, and resource assignment.
- Source ownership: project-controlled
- Independence: independent
- Confidence: High
- Evidence basis: Release-pinned Xen FLASK source and access-vector definitions.
- Alternatives/counter-evidence: Policy compiler accumulation across multiple rules was not separately traced, and grant-table semantics differ from a static G-stage root.
- Limitations: Strong prior art for relationship-specific mapping and complete combined authorization, not target one-rule syntax or hardware readback.
- Sensitivity: public
- Redistribution status: approved
- Licence: GPL-2.0-only or compatible Xen source licensing
- Hash: not-applicable
- Supersedes: None
- Superseded by: PRV-20260828-001-E0075
- Administrative: no

## PRV-20260828-001-E0060

- Status: superseded
- Aspect IDs: ASPECT-002, ASPECT-003
- Source type: external repository or maintainer record
- Evidentiary role: prior art
- Title/description: Linux arm64 pKVM ownership, donation, share, and unshare model.
- Canonical locator: https://docs.kernel.org/next/virt/kvm/arm/pkvm.html ; https://docs.kernel.org/6.14/virt/kvm/arm/hypercalls.html
- Logical locator: `search-log.md`
- Commit/version/date: Linux documentation available before 2026-08-04; versioned 6.14 ABI reference
- Checked date: 2026-08-28
- Precise location: Memory ownership, donation, share, unshare, host-access revocation, and hypercall invalid-parameter sections
- Relationship: Ownership and sharing transitions determine reachability separately from R/W/X, and invalid transitions are rejected.
- Source ownership: project-controlled
- Independence: independent
- Confidence: High
- Evidence basis: Official Linux kernel documentation and ABI.
- Alternatives/counter-evidence: The documented design lacks complete IOMMU isolation and warns that VMM address-space changes may not remain coherent with guest mappings.
- Limitations: Strong transition and reachability precedent but contrary evidence to universal continuous reconciliation.
- Sensitivity: public
- Redistribution status: approved
- Licence: Linux kernel documentation licence
- Hash: not-applicable
- Supersedes: None
- Superseded by: PRV-20260828-001-E0115
- Administrative: no

## PRV-20260828-001-E0061

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: standard or specification
- Evidentiary role: counter-evidence
- Title/description: seL4 version 13.0.0 VSpace mapping authority and rights downgrade.
- Canonical locator: https://github.com/seL4/seL4/blob/13.0.0/manual/parts/vspace.tex
- Logical locator: `search-log.md`
- Commit/version/date: seL4 13.0.0; 2024-07-01
- Checked date: 2026-08-28
- Precise location: VSpace mapping authority, frame or page capability rights, paging-structure authority, and mapping error behavior
- Relationship: Mapping requires possession of appropriate page or frame and VSpace authority, but requested rights beyond the page capability are silently downgraded rather than rejected.
- Source ownership: project-controlled
- Independence: independent
- Confidence: High
- Evidence basis: Release-pinned seL4 manual and API documentation.
- Alternatives/counter-evidence: Exact invalid capability, address, or paging-structure conditions still fail.
- Limitations: Strong structural mapping-authority precedent and direct counter-evidence to universal exact-or-fail permission derivation.
- Sensitivity: public
- Redistribution status: approved
- Licence: seL4 project licensing for source and manual
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0062

- Status: active
- Aspect IDs: ASPECT-002, ASPECT-003
- Source type: standard or specification
- Evidentiary role: counter-evidence
- Title/description: CHERI ISA version 9 capability possession, monotonicity, and paged-memory interaction.
- Canonical locator: https://www.cl.cam.ac.uk/techreports/UCAM-CL-TR-987.pdf
- Logical locator: `search-log.md`
- Commit/version/date: CHERI ISA version 9; 2023-09
- Checked date: 2026-08-28
- Precise location: Abstract and chapters 2-3
- Relationship: Tagged, bounded, permission-bearing capabilities are checked alongside paged virtual memory; valid capability possession intentionally constitutes represented authority, and non-monotonic modification clears the tag.
- Source ownership: affiliated
- Independence: independent
- Confidence: High
- Evidence basis: Primary architecture specification.
- Alternatives/counter-evidence: Possession-as-authority contradicts an overbroad separation between possession and use; capability monotonicity is not general revocation.
- Limitations: No policy-only mapping bit or one-rule TE semantics.
- Sensitivity: public
- Redistribution status: approved
- Licence: CC-BY-4.0
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0063

- Status: superseded
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: vendor or project-controlled statement
- Evidentiary role: prior art
- Title/description: Oracle or Sun Logical Domains resource assignment and pending-versus-active configuration.
- Canonical locator: https://docs.oracle.com/en/virtualization/oracle-vm-server-sparc/ldoms-admin/
- Logical locator: `search-log.md`
- Commit/version/date: Oracle VM Server for SPARC 3.4 and 3.6 administration documentation, pre-2026-08-04 editions
- Checked date: 2026-08-28
- Precise location: Control-domain, memory and I/O assignment, direct-I/O, static allocation, and delayed-reconfiguration sections
- Relationship: Control-domain management authority assigns CPU, memory, and I/O resources while the hypervisor enforces the active allocation; pending and active configurations may intentionally differ.
- Source ownership: project-controlled
- Independence: independent
- Confidence: Medium
- Evidence basis: Primary vendor technical administration manuals.
- Alternatives/counter-evidence: Exact sun4v hypervisor IOMMU map or unmap authorization and failure semantics were not retrieved.
- Limitations: Strong platform-level assignment precedent, but pending-versus-active divergence weakens continuous reconciliation claims.
- Sensitivity: public
- Redistribution status: not-applicable
- Licence: Oracle documentation terms; no copy retained
- Hash: not-applicable
- Supersedes: None
- Superseded by: PRV-20260828-001-E0100
- Administrative: no

## PRV-20260828-001-E0064

- Status: superseded
- Aspect IDs: ASPECT-002, ASPECT-003
- Source type: vendor or project-controlled statement
- Evidentiary role: prior art
- Title/description: IBM PR/SM channel-path and device access and candidate lists.
- Canonical locator: https://www.ibm.com/docs/en/module_1687296212988/pdf/SB10-7178-01.pdf
- Logical locator: `search-log.md`
- Commit/version/date: IBM Z and LinuxONE PR/SM Planning Guide SB10-7178-01; 2023
- Checked date: 2026-08-28
- Precise location: Page 122, channel-path and device candidate-list semantics
- Relationship: Configuration-list membership determines which logical partitions initially or subsequently obtain channel-path or device reachability; null lists deny initial access.
- Source ownership: project-controlled
- Independence: independent
- Confidence: High
- Evidence basis: Primary IBM technical planning guide.
- Alternatives/counter-evidence: Channel assignment is not a page-table or TE permission analogue.
- Limitations: Strong platform reachability precedent only.
- Sensitivity: public
- Redistribution status: not-applicable
- Licence: IBM documentation terms; no copy retained
- Hash: not-applicable
- Supersedes: None
- Superseded by: PRV-20260828-001-E0080
- Administrative: no

## PRV-20260828-001-E0065

- Status: superseded
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: standard or specification
- Evidentiary role: prior art
- Title/description: PowerVM on POWER Architecture Reference version 10.60 TCE and LIOBN authority model.
- Canonical locator: https://openpowerfoundation.org/specifications/papr/
- Logical locator: `search-log.md`
- Commit/version/date: PAPR version 10.60; 2024-11-04
- Checked date: 2026-08-28
- Precise location: TCE, LIOBN, `H_PUT_TCE`, assignment, invalidation, and authority sections; exact page extraction remains pending
- Relationship: Assignment of a logical I/O resource and LIOBN grants authority to perform mapping operations, while individual TCEs separately encode DMA translations and access.
- Source ownership: project-controlled
- Independence: independent
- Confidence: Medium
- Evidence basis: Exact pre-cutoff public specification landing and architecture description.
- Alternatives/counter-evidence: Delegated resource ownership may intentionally convey mapping authority; exact error and invalidation semantics remain to be extracted.
- Limitations: Strong industry architecture lead, but not load-bearing for the exact selected mechanism.
- Sensitivity: public
- Redistribution status: not-applicable
- Licence: OpenPOWER specification terms; no copy retained
- Hash: not-applicable
- Supersedes: None
- Superseded by: PRV-20260828-001-E0081
- Administrative: no

## PRV-20260828-001-E0066

- Status: superseded
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: standard or specification
- Evidentiary role: prior art
- Title/description: Microsoft Hyper-V TLFS VTL memory-protection hierarchy.
- Canonical locator: https://raw.githubusercontent.com/Microsoft/Virtualization-Documentation/master/tlfs/Hypervisor%20Top%20Level%20Functional%20Specification%20v5.0.pdf
- Logical locator: `search-log.md`
- Commit/version/date: Hypervisor Top-Level Functional Specification version 5.0 and later pre-cutoff editions
- Checked date: 2026-08-28
- Precise location: Virtual Secure Mode chapter, default protection mask, VTL hierarchy, and write-once enablement
- Relationship: Higher VTL authority configures restrictions over lower-VTL memory access separately from lower-level guest mappings, with restrictive hierarchy and reset-bound defaults.
- Source ownership: project-controlled
- Independence: independent
- Confidence: High
- Evidence basis: Primary vendor ABI specification.
- Alternatives/counter-evidence: No one-rule TE analogue or continuous policy-to-PTE readback is described.
- Limitations: Supports layered restriction and assignment precedent only.
- Sensitivity: public
- Redistribution status: not-applicable
- Licence: Microsoft Open Specification Promise and document terms; no copy retained
- Hash: not-applicable
- Supersedes: None
- Superseded by: PRV-20260828-001-E0082
- Administrative: no

## PRV-20260828-001-E0067

- Status: superseded
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: paper, proceedings item, dataset, or replication artifact
- Evidentiary role: counter-evidence
- Title/description: Bao static-partitioning configuration and non-uniform invalid-configuration handling.
- Canonical locator: https://drops.dagstuhl.de/entities/document/10.4230/OASIcs.NG-RES.2020.3
- Logical locator: `search-log.md`
- Commit/version/date: 2020-01-20
- Checked date: 2026-08-28
- Precise location: Static configuration to stage-2 mapping architecture and inspected warning or truncation paths
- Relationship: Authoritative configuration directly determines stage-2 mappings, tightly coupling assignment and enforcement; some invalid shared-memory configurations warn, truncate, or continue.
- Source ownership: affiliated
- Independence: independent
- Confidence: High
- Evidence basis: Peer-reviewed project paper and public source inspection.
- Alternatives/counter-evidence: Other invalid states may still fail, and dynamic revocation is outside the main design.
- Limitations: Counters universal separation and fail-closed claims without weakening the target-specific invariant.
- Sensitivity: public
- Redistribution status: approved
- Licence: CC-BY-3.0
- Hash: not-applicable
- Supersedes: None
- Superseded by: PRV-20260828-001-E0079
- Administrative: no

## PRV-20260828-001-E0068

- Status: withdrawn
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: external repository or maintainer record
- Evidentiary role: counter-evidence
- Title/description: Jailhouse version 0.12 complete cell configuration.
- Canonical locator: https://github.com/siemens/jailhouse/blob/v0.12/include/jailhouse/cell-config.h
- Logical locator: `search-log.md`
- Commit/version/date: Jailhouse version 0.12; 2020-02-04
- Checked date: 2026-08-28
- Precise location: Cell memory-region, PCI, IOMMU, DMA, sharing, and R/W/X configuration structures
- Relationship: One authoritative cell descriptor combines resource relationship, mapping ranges, R/W/X, DMA, sharing, device, and IOMMU metadata.
- Source ownership: project-controlled
- Independence: independent
- Confidence: High
- Evidence basis: Version-pinned public source.
- Alternatives/counter-evidence: Lifecycle and management authority remain separate even when the configuration record couples mapping and access rights.
- Limitations: Strong limiting example against universal separate mapping authority; transaction and rollback behavior require more source history.
- Sensitivity: public
- Redistribution status: approved
- Licence: GPL-2.0-only or BSD alternative
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0069

- Status: superseded
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: review metadata
- Evidentiary role: negative search result
- Title/description: Expanded BSD, Linux, capability, hypervisor, and industry ecosystem search record.
- Canonical locator: review ecosystem-search record
- Logical locator: `search-log.md`
- Commit/version/date: Searches completed 2026-08-28 with substantive source cutoff 2026-08-04T08:31:12Z
- Checked date: 2026-08-28
- Precise location: SEARCH-011 and inaccessible-resource amendment records
- Relationship: Records systematic archive and project coverage, close precedents, limiting counterexamples, and unresolved original patch or design discussions.
- Source ownership: independent
- Independence: partially-independent
- Confidence: Medium
- Evidence basis: Primary source, manual, specification, source-repository, mailing-list, and vendor-document searches across all confirmed ecosystems.
- Alternatives/counter-evidence: Archive indexing is incomplete, some current pages lack cutoff-pinned revisions, and no-result queries do not prove absence.
- Limitations: No source established the target's exact policy-only `OPEN`, one-rule syntax, or continuous TE-to-G-stage readback with terminal divergence.
- Sensitivity: private
- Redistribution status: not-applicable
- Licence: not-applicable
- Hash: not-applicable
- Supersedes: None
- Superseded by: PRV-20260828-001-E0071
- Administrative: no

## PRV-20260828-001-E0070

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: review metadata
- Evidentiary role: negative search result
- Title/description: Expanded proceedings public-query compliance correction.
- Canonical locator: review proceedings-query compliance record
- Logical locator: `search-log.md`
- Commit/version/date: Compliance rerun completed 2026-08-28
- Checked date: 2026-08-28
- Precise location: SEARCH-011
- Relationship: Re-established the SDC, TrustedBSD, and Petroni findings through approved local evidence or compliant public queries and withdrew InkTag because no approved query or citation-navigation chain reached it.
- Source ownership: independent
- Independence: partially-independent
- Confidence: High
- Evidence basis: SDC was verified in the approved local corpus; `site:usenix.org/legacy/event/usenix03/tech/freenix03 \"USENIX ATC\" \"type enforcement\"` reached TrustedBSD; `site:usenix.org/legacy/event/sec06 \"USENIX Security\" \"type enforcement\"` reached Petroni; eighteen compliant ASPLOS queries failed to reach InkTag.
- Alternatives/counter-evidence: InkTag remains a potentially relevant public source, but its earlier exact-title discovery route was outside the confirmed query boundary.
- Limitations: The withdrawn InkTag record must not support amendment conclusions unless a future confirmed scope permits and independently reaches it.
- Sensitivity: private
- Redistribution status: not-applicable
- Licence: not-applicable
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0071

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: review metadata
- Evidentiary role: negative search result
- Title/description: Expanded ecosystem public-query compliance correction.
- Canonical locator: review ecosystem-query compliance record
- Logical locator: `search-log.md`
- Commit/version/date: Compliance rerun completed 2026-08-28
- Checked date: 2026-08-28
- Precise location: SEARCH-012 and SEARCH-013
- Relationship: Excludes all results reached only through unapproved technical identifiers or title fragments, re-establishes a narrower set through approved project-name and generic-term queries, and records which earlier candidate claims are inadmissible.
- Source ownership: independent
- Independence: partially-independent
- Confidence: High
- Evidence basis: Fifty-two exact compliant queries were executed; each retained candidate was mapped to a compliant route and every unreached source-level claim was explicitly excluded.
- Alternatives/counter-evidence: Some inadmissible sources may be valid public prior art, but they cannot support this amendment under the confirmed discovery boundary.
- Limitations: Search-engine indexing and citation navigation remain incomplete; no-result routes are not proof of absence.
- Sensitivity: private
- Redistribution status: not-applicable
- Licence: not-applicable
- Hash: not-applicable
- Supersedes: PRV-20260828-001-E0069
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0072

- Status: active
- Aspect IDs: ASPECT-002, ASPECT-003
- Source type: paper, proceedings item, dataset, or replication artifact
- Evidentiary role: adjacent precedent
- Title/description: Robert N. M. Watson, Jonathan Anderson, Ben Laurie, and Kris Kennaway, "Capsicum: Practical Capabilities for UNIX."
- Canonical locator: https://www.usenix.org/events/sec10/tech/full_papers/Watson.pdf
- Logical locator: `search-log.md`
- Commit/version/date: USENIX Security 2010; 2010-08-11
- Checked date: 2026-08-28
- Precise location: Section 2.2, PDF pages 2-3
- Relationship: File descriptors are rights-bearing authority tokens; rights masks support monotonic subset derivation, and operations may require a complete set of rights on the descriptor used.
- Source ownership: independent
- Independence: independent
- Confidence: High
- Evidence basis: Primary USENIX paper reached through the compliant query `Capsicum capability reachability`.
- Alternatives/counter-evidence: The compliant route did not establish the later FreeBSD source-level split between base mapping and R/W/X mapping rights.
- Limitations: Adjacent complete-capability and possession-as-authority precedent, not target-style policy-only `OPEN` or one-rule TE semantics.
- Sensitivity: public
- Redistribution status: not-applicable
- Licence: USENIX and author terms; no copy retained
- Hash: not-applicable
- Supersedes: PRV-20260828-001-E0055
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0073

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-003
- Source type: paper, proceedings item, dataset, or replication artifact
- Evidentiary role: prior art
- Title/description: Brooks Davis, "Improving Memory Permissions in FreeBSD."
- Canonical locator: https://freebsdfoundation.org/wp-content/uploads/2019/11/Improving-Memory-Permissions-in-FreeBSD.pdf
- Logical locator: `search-log.md`
- Commit/version/date: September-October 2019 report describing June 2019 integration
- Checked date: 2026-08-28
- Precise location: PDF pages 12-13, current versus maximum mapping permissions
- Relationship: Separates current hardware-visible R/W/X from a stored maximum permission ceiling that constrains future mapping-protection changes.
- Source ownership: affiliated
- Independence: independent
- Confidence: High
- Evidence basis: FreeBSD Foundation primary technical report reached through `FreeBSD mapping permission`.
- Alternatives/counter-evidence: A future-permission ceiling is not a separate permission to expose an object in a page table.
- Limitations: Original architecture discussion and first-introduction attribution remain unavailable.
- Sensitivity: public
- Redistribution status: not-applicable
- Licence: FreeBSD Foundation publication terms; no copy retained
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0074

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-003
- Source type: external repository or maintainer record
- Evidentiary role: adjacent precedent
- Title/description: OpenBSD immutable address-space mapping controls.
- Canonical locator: https://www.openbsd.org/innovations.html
- Logical locator: `search-log.md`
- Commit/version/date: OpenBSD innovation entry dated 2022-12-04
- Checked date: 2026-08-28
- Precise location: Innovation entry stating that R/W/X and mapping-related address-space permissions can be made immutable and later changes fail with `EPERM`
- Relationship: Adds policy and immutability constraints beyond ordinary R/W/X and fails closed on subsequent prohibited mapping or protection changes.
- Source ownership: project-controlled
- Independence: independent
- Confidence: High
- Evidence basis: Official OpenBSD project record reached through `OpenBSD mapping permission`.
- Alternatives/counter-evidence: Ordinary mappings remain substantially file-mode and R/W/X driven.
- Limitations: No general policy-only exposure permission or runtime policy-to-PTE comparison.
- Sensitivity: public
- Redistribution status: not-applicable
- Licence: OpenBSD project page terms; no copy retained
- Hash: not-applicable
- Supersedes: PRV-20260828-001-E0058
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0075

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002
- Source type: external repository or maintainer record
- Evidentiary role: prior art
- Title/description: Xen 4.4 `xl(1)` FLASK mapping and cross-domain relationship controls.
- Canonical locator: https://xenbits.xen.org/docs/4.4-testing/man/xl.1.html
- Logical locator: `search-log.md`
- Commit/version/date: Xen 4.4 documentation; 2014-03-10 release line
- Checked date: 2026-08-28
- Precise location: FLASK section, rendered lines 921-935
- Relationship: Policy controls domain communication, grants, device passthrough, arbitrary cross-domain page mapping, enforcement state, and policy loading.
- Source ownership: project-controlled
- Independence: independent
- Confidence: High
- Evidence basis: Primary Xen documentation reached through compliant `Xen XSM type enforcement`, `Xen FLASK type enforcement`, and `Xen FLASK mapping permission` queries.
- Alternatives/counter-evidence: The compliant route did not reach the exact combined read/write grant mask or source-level access-vector implementation.
- Limitations: Strong broad relationship and mapping precedent, not target one-rule syntax or hardware-state reconciliation.
- Sensitivity: public
- Redistribution status: not-applicable
- Licence: Xen documentation terms; no copy retained
- Hash: not-applicable
- Supersedes: PRV-20260828-001-E0059
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0076

- Status: active
- Aspect IDs: ASPECT-003
- Source type: mailing-list or archive record
- Evidentiary role: counter-evidence
- Title/description: Daniel De Graaf, Xen FLASK unified boot-parameter patch.
- Canonical locator: https://lists.xenproject.org/archives/html/xen-devel/2015-03/msg00435.html
- Logical locator: `search-log.md`
- Commit/version/date: Xen-devel patch dated 2015-03-03
- Checked date: 2026-08-28
- Precise location: Boot-mode description for permissive, enforcing, and force behavior when policy is missing or invalid
- Relationship: Shows that Xen FLASK historically defaulted to permissive behavior, while explicit enforcing or force configuration could stop boot on missing or broken policy.
- Source ownership: project-controlled
- Independence: independent
- Confidence: High
- Evidence basis: Original Xen-devel patch reached through `Xen FLASK type enforcement`.
- Alternatives/counter-evidence: Configured enforcing mode remains fail closed.
- Limitations: Counters universal fail-closed claims only and does not address mapping reconciliation.
- Sensitivity: public
- Redistribution status: not-applicable
- Licence: Mailing-list and Xen contribution terms; no copy retained
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0077

- Status: active
- Aspect IDs: ASPECT-002, ASPECT-003
- Source type: paper, proceedings item, dataset, or replication artifact
- Evidentiary role: adjacent precedent
- Title/description: "CHERIoT: Complete Memory Safety for Embedded Devices."
- Canonical locator: https://cheriot.org/papers/2023-micro-cheriot-uarch.pdf
- Logical locator: `search-log.md`
- Commit/version/date: MICRO-56 proceedings, 2023
- Checked date: 2026-08-28
- Precise location: Architecture and compartmentalized-memory-safety sections
- Relationship: Compartment imports and capability-mediated interfaces materialize concrete reachability and authority in a CHERI-derived embedded architecture.
- Source ownership: affiliated
- Independence: independent
- Confidence: Medium
- Evidence basis: Primary architecture paper reached through `CHERIoT capability reachability`.
- Alternatives/counter-evidence: No target-style policy-only mapping bit or TE rule was established.
- Limitations: Architecture-level only; current project book and source were not cutoff-version pinned.
- Sensitivity: public
- Redistribution status: not-applicable
- Licence: Publication terms; no copy retained
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0078

- Status: active
- Aspect IDs: ASPECT-002, ASPECT-003
- Source type: vendor or project-controlled statement
- Evidentiary role: adjacent precedent
- Title/description: CheriBSD 23.11 background and hybrid capability/MMU architecture.
- Canonical locator: https://www.cheribsd.org/getting-started/23.11/background/index.html
- Logical locator: `search-log.md`
- Commit/version/date: CheriBSD 23.11; 2023-11
- Checked date: 2026-08-28
- Precise location: CHERI, CHERI C/C++, CheriBSD background, and pure-capability execution sections
- Relationship: Documents hybrid paged-memory and capability enforcement and a pure-capability authority model.
- Source ownership: project-controlled
- Independence: independent
- Confidence: Medium
- Evidence basis: Versioned project guide reached through `CheriBSD capability reachability` and `CheriBSD page table permission derivation`.
- Alternatives/counter-evidence: No cutoff-pinned source-level `mmap` permission-derivation path was reached.
- Limitations: Broad architecture context only.
- Sensitivity: public
- Redistribution status: not-applicable
- Licence: CheriBSD project documentation terms; no copy retained
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0079

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: paper, proceedings item, dataset, or replication artifact
- Evidentiary role: counter-evidence
- Title/description: José Martins, Adriano Tavares, Marco Solieri, Marko Bertogna, and Sandro Pinto, "Bao: A Lightweight Static Partitioning Hypervisor."
- Canonical locator: https://drops.dagstuhl.de/entities/document/10.4230/OASIcs.NG-RES.2020.3
- Logical locator: `search-log.md`
- Commit/version/date: 2020-01-20
- Checked date: 2026-08-28
- Precise location: Architecture description of static VM resource assignment and two-stage memory translation
- Relationship: Authoritative static configuration directly determines stage-2 mappings and assigned resources, coupling relationship and realized enforcement.
- Source ownership: affiliated
- Independence: independent
- Confidence: High
- Evidence basis: Primary paper reached by navigating from the official Bao repository returned by `Bao hypervisor compartment authority`.
- Alternatives/counter-evidence: Management and lifecycle authority remain distinct from guest use.
- Limitations: Prior source-level warning or truncation claims are withdrawn because the compliant route did not reach those implementation paths.
- Sensitivity: public
- Redistribution status: approved
- Licence: CC-BY-3.0
- Hash: not-applicable
- Supersedes: PRV-20260828-001-E0067
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0080

- Status: active
- Aspect IDs: ASPECT-002, ASPECT-003
- Source type: vendor or project-controlled statement
- Evidentiary role: prior art
- Title/description: IBM Z PR/SM Planning Guide logical-partition resource authority.
- Canonical locator: https://www.ibm.com/support/pages/sites/default/files/inline-files/SB10-7175-01a.pdf
- Logical locator: `search-log.md`
- Commit/version/date: Guide level SB10-7175-01a; 2020
- Checked date: 2026-08-28
- Precise location: Chapter 1, PR/SM and logical-partitioning resource allocation and reconfiguration
- Relationship: Operator-defined configuration allocates resources to isolated logical partitions and governs later activation or reconfiguration.
- Source ownership: project-controlled
- Independence: independent
- Confidence: High
- Evidence basis: Primary IBM guide reached through `IBM PR/SM logical domain memory mapping`.
- Alternatives/counter-evidence: Partition resource allocation is not a page-table or TE permission analogue.
- Limitations: Strong platform assignment precedent only.
- Sensitivity: public
- Redistribution status: not-applicable
- Licence: IBM documentation terms; no copy retained
- Hash: not-applicable
- Supersedes: PRV-20260828-001-E0064
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0081

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002
- Source type: vendor or project-controlled statement
- Evidentiary role: adjacent precedent
- Title/description: IBM POWER Hypervisor dynamic logical-partition resource assignment.
- Canonical locator: https://www.ibm.com/docs/en/power6?topic=technologies-power-hypervisor
- Logical locator: `search-log.md`
- Commit/version/date: POWER6-era documentation, published by 2012
- Checked date: 2026-08-28
- Precise location: Isolated logical partitions and dynamic processor, memory, and I/O assignment
- Relationship: Hypervisor management authority assigns resources to isolated partitions separately from partition-local access.
- Source ownership: project-controlled
- Independence: independent
- Confidence: High
- Evidence basis: Primary IBM documentation reached through `IBM hypervisor compartment authority` and `PowerVM hypervisor compartment authority`.
- Alternatives/counter-evidence: The compliant route did not reach PAPR TCE or LIOBN-specific mapping semantics.
- Limitations: Broad platform precedent only.
- Sensitivity: public
- Redistribution status: not-applicable
- Licence: IBM documentation terms; no copy retained
- Hash: not-applicable
- Supersedes: PRV-20260828-001-E0065
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0082

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002
- Source type: vendor or project-controlled statement
- Evidentiary role: adjacent precedent
- Title/description: Microsoft "Plan for Hyper-V security in Windows Server."
- Canonical locator: https://learn.microsoft.com/en-us/windows-server/virtualization/hyper-v/plan/plan-hyper-v-security-in-windows-server
- Logical locator: `search-log.md`
- Commit/version/date: Page last updated 2024-11-01
- Checked date: 2026-08-28
- Precise location: Secure the Hyper-V host and secure virtual machines sections
- Relationship: Separates root management and physical-device exposure authority from virtual-machine operation.
- Source ownership: project-controlled
- Independence: independent
- Confidence: Medium
- Evidence basis: Primary Microsoft technical guidance reached through `Hyper-V policy hardware consistency` and `Hyper-V mapping permission`.
- Alternatives/counter-evidence: The compliant route did not reach exact TLFS VTL protection-mask fields.
- Limitations: Broad management and exposure guidance, not an exact mapping or reconciliation specification.
- Sensitivity: public
- Redistribution status: not-applicable
- Licence: Microsoft Learn terms; no copy retained
- Hash: not-applicable
- Supersedes: PRV-20260828-001-E0066
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0083

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: vendor or project-controlled statement
- Evidentiary role: prior art
- Title/description: Microsoft Security, "Virtualization-based security memory enclaves: Data protection through isolation."
- Canonical locator: https://www.microsoft.com/en-us/security/blog/2018/06/05/virtualization-based-security-vbs-memory-enclaves-data-protection-through-isolation/
- Logical locator: `search-log.md`
- Commit/version/date: 2018-06-05
- Checked date: 2026-08-28
- Precise location: Data protection section describing hypervisor-controlled secure memory and invalid-access exceptions
- Relationship: Hypervisor control separates enclave resource management from lower-trust access, and invalid accesses raise exceptions.
- Source ownership: project-controlled
- Independence: independent
- Confidence: High
- Evidence basis: Primary Microsoft engineering record reached through `Microsoft VBS hypervisor compartment authority`.
- Alternatives/counter-evidence: No one-rule TE semantics or continuous policy-to-PTE readback.
- Limitations: Vendor-controlled description supports broad architecture precedent only.
- Sensitivity: public
- Redistribution status: not-applicable
- Licence: Microsoft publication terms; no copy retained
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0084

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002
- Source type: standard or specification
- Evidentiary role: prior art
- Title/description: VMware vSphere 5.5 Update 2 Security Target.
- Canonical locator: https://www.commoncriteriaportal.org/files/epfiles/383-4-300%20VMware%20vSphere%205.5%20Update%202%20ST%20v0.6.pdf
- Logical locator: `search-log.md`
- Commit/version/date: Version 0.6; 2015-06-28
- Checked date: 2026-08-28
- Precise location: Sections 1.5.2.9 and 7.1.9, pages 24 and 69-71
- Relationship: VMkernel-controlled allocation, exclusive writable memory, and VM-domain separation distinguish platform assignment from guest-local use.
- Source ownership: project-controlled
- Independence: independent
- Confidence: High
- Evidence basis: Primary Common Criteria security target reached through `ESXi hypervisor compartment authority` and `VMware ESXi hypervisor compartment authority`.
- Alternatives/counter-evidence: No pre-cutoff DirectPath or IOMMU-specific technical record was reached.
- Limitations: Platform isolation precedent only; no target-style mapping permission or reconciliation.
- Sensitivity: public
- Redistribution status: not-applicable
- Licence: Common Criteria portal and VMware document terms; no copy retained
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0085

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-003
- Source type: user-supplied or inaccessible resource metadata
- Evidentiary role: unresolved lead
- Title/description: Original SELinux `file:map` LKML or SELinux mailing-list posting and review series.
- Canonical locator: Linux commit `3ba4bf5f1e2c58bddd84ba27c5aeaf8ca1d36bff`; original public message ID unresolved
- Logical locator: `inaccessible-resources.md`
- Commit/version/date: Implementation committed 2017-05-23; original posting chronology unresolved
- Checked date: 2026-08-28
- Precise location: INACCESSIBLE-012
- Relationship: Could establish the first proposal date, rationale, alternatives, reviewers, and whether permission accumulation or revocation semantics were discussed.
- Source ownership: independent
- Independence: independent
- Confidence: High
- Evidence basis: Exact compliant LKML, LSM, and SELinux archive queries returned no original thread while the implementation commit remains verified in baseline evidence.
- Alternatives/counter-evidence: The existing commit is sufficient for mechanism chronology but not discussion provenance.
- Limitations: Mailing-list copyright and redistribution terms are unknown.
- Sensitivity: public
- Redistribution status: unknown
- Licence: mailing-list terms unknown
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0086

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-003
- Source type: user-supplied or inaccessible resource metadata
- Evidentiary role: unresolved lead
- Title/description: First FreeBSD Capsicum mapping-right commit and design discussion.
- Canonical locator: FreeBSD source and review archives; exact revision and message unresolved
- Logical locator: `inaccessible-resources.md`
- Commit/version/date: Predates or accompanies FreeBSD Capsicum mapping-right support; exact date unresolved
- Checked date: 2026-08-28
- Precise location: INACCESSIBLE-013
- Relationship: Could determine whether split mapping rights were present in original Capsicum or added later and identify the design rationale.
- Source ownership: independent
- Independence: independent
- Confidence: High
- Evidence basis: Compliant queries reached the 2010 Capsicum paper but not the exact source-level split-right introduction.
- Alternatives/counter-evidence: The general descriptor-right architecture remains established by the paper.
- Limitations: Original commit, author, review sequence, and redistribution status are unknown.
- Sensitivity: public
- Redistribution status: unknown
- Licence: FreeBSD source likely BSD-family; archive-message terms unknown
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0087

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-003
- Source type: user-supplied or inaccessible resource metadata
- Evidentiary role: unresolved lead
- Title/description: FreeBSD maximum-permission architecture and review discussion for the June 2019 integration.
- Canonical locator: FreeBSD revision `r349240`; review or architecture-list discussion not retrieved
- Logical locator: `inaccessible-resources.md`
- Commit/version/date: 2019-06 integration
- Checked date: 2026-08-28
- Precise location: INACCESSIBLE-014
- Relationship: Could establish author and reviewer attribution, motivation, policy-to-VM invariants, rollback behavior, and error semantics.
- Source ownership: independent
- Independence: independent
- Confidence: High
- Evidence basis: The compliant FreeBSD Foundation report verifies the mechanism but not the original review record.
- Alternatives/counter-evidence: NetBSD `PROT_MPROTECT` supplies independent similar precedent.
- Limitations: Review-page and mailing-list redistribution terms are unknown.
- Sensitivity: public
- Redistribution status: unknown
- Licence: unknown
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0088

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: user-supplied or inaccessible resource metadata
- Evidentiary role: unresolved lead
- Title/description: Original Xen grant-table mapping and XSM or FLASK patch series.
- Canonical locator: Xen-devel archive and Xen source history; exact original series unresolved
- Logical locator: `inaccessible-resources.md`
- Commit/version/date: Expected before Xen 4.4 and later 4.19 source; exact dates unresolved
- Checked date: 2026-08-28
- Precise location: INACCESSIBLE-015
- Relationship: Could establish first implementation chronology, intended domain-relationship semantics, combined read/write authorization, policy-rule aggregation, and rejected alternatives.
- Source ownership: independent
- Independence: independent
- Confidence: High
- Evidence basis: Compliant Xen FLASK queries reached broad mapping documentation and a 2015 boot-mode patch but not the original mapping source or discussion.
- Alternatives/counter-evidence: Broad Xen relationship and mapping control remains established.
- Limitations: Mailing-list and source-copy redistribution terms require review.
- Sensitivity: public
- Redistribution status: unknown
- Licence: Xen source likely GPL-compatible; mailing-list terms unknown
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0089

- Status: active
- Aspect IDs: ASPECT-002, ASPECT-003
- Source type: user-supplied or inaccessible resource metadata
- Evidentiary role: unresolved lead
- Title/description: Original pKVM ownership, donation, share, and unshare patch series.
- Canonical locator: Linux KVM or kvmarm mailing-list archive; exact series unresolved
- Logical locator: `inaccessible-resources.md`
- Commit/version/date: Public design predates 2026-08-04; exact first proposal date unresolved
- Checked date: 2026-08-28
- Precise location: INACCESSIBLE-016
- Relationship: Could establish first proposal, authorship, rejected alternatives, transition ordering, and stale-map or DMA-isolation discussion.
- Source ownership: independent
- Independence: independent
- Confidence: High
- Evidence basis: Compliant queries reached official pKVM documentation but not the original public patch series.
- Alternatives/counter-evidence: Current official documentation supplies the broad ownership and mapping-state mechanism.
- Limitations: Archive-message redistribution terms are unknown.
- Sensitivity: public
- Redistribution status: unknown
- Licence: Linux contribution and mailing-list terms
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0090

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002
- Source type: user-supplied or inaccessible resource metadata
- Evidentiary role: unresolved lead
- Title/description: Capability-system `cap-talk` archive and post corpus.
- Canonical locator: Google Groups and historical EROS `cap-talk` archives
- Logical locator: `inaccessible-resources.md`
- Commit/version/date: Archive lifetime through the 2026-08-04 substantive cutoff
- Checked date: 2026-08-28
- Precise location: INACCESSIBLE-017
- Relationship: Could supply original terminology and discussions concerning possession, designation, authority, attenuation, amplification, mapping, and revocation.
- Source ownership: independent
- Independence: independent
- Confidence: Medium
- Evidence basis: Exact approved queries returned no relevant indexed post and suffered unrelated geographic terminology collisions.
- Alternatives/counter-evidence: Primary capability papers and project specifications already establish major conceptual alternatives.
- Limitations: Archive state, canonical message URLs, copyright, and redistribution terms remain unresolved.
- Sensitivity: public
- Redistribution status: unknown
- Licence: archive terms unknown
- Hash: not-applicable
- Supersedes: PRV-20260828-001-E0037
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0091

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: user-supplied or inaccessible resource metadata
- Evidentiary role: unresolved lead
- Title/description: Oracle or Sun sun4v and UltraSPARC virtual-machine hypervisor API specification.
- Canonical locator: Legacy Sun or Oracle hypervisor API documentation; exact surviving normative URL unresolved
- Logical locator: `inaccessible-resources.md`
- Commit/version/date: Expected pre-Oracle VM Server for SPARC administration guides
- Checked date: 2026-08-28
- Precise location: INACCESSIBLE-018
- Relationship: Could define ownership checks for IOMMU map and unmap, access attributes, invalidation, and precise error returns beneath LDoms management.
- Source ownership: independent
- Independence: independent
- Confidence: High
- Evidence basis: Compliant LDoms queries reached administration guides but not the normative hypervisor API.
- Alternatives/counter-evidence: Existing LDoms evidence supports platform assignment and pending-versus-active configuration only.
- Limitations: Legacy documentation rights and redistribution status are unknown.
- Sensitivity: public
- Redistribution status: unknown
- Licence: Oracle or Sun documentation terms unknown
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0092

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: user-supplied or inaccessible resource metadata
- Evidentiary role: unresolved lead
- Title/description: Immutable pre-cutoff VMware DirectPath and IOMMU assignment documentation.
- Canonical locator: VMware or Broadcom technical documentation; exact pre-2026-08-04 edition unresolved
- Logical locator: `inaccessible-resources.md`
- Commit/version/date: Required edition no later than 2026-08-04T08:31:12Z
- Checked date: 2026-08-28
- Precise location: INACCESSIBLE-019
- Relationship: Could establish assignment prerequisites, device-group requirements, teardown ordering, IOTLB invalidation, and reassignment safety.
- Source ownership: independent
- Independence: independent
- Confidence: High
- Evidence basis: Compliant VMware queries reached broad ESXi isolation evidence but no version-pinned DirectPath technical record.
- Alternatives/counter-evidence: The 2015 vSphere security target supports broad VMkernel-controlled allocation.
- Limitations: Current vendor articles may be post-cutoff and cannot support substantive conclusions.
- Sensitivity: public
- Redistribution status: unknown
- Licence: VMware or Broadcom documentation terms
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0093

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: user-supplied or inaccessible resource metadata
- Evidentiary role: unresolved lead
- Title/description: Cutoff-pinned CheriBSD `mmap` implementation and history.
- Canonical locator: CheriBSD public repository; exact pre-cutoff commit and path chain unresolved
- Logical locator: `inaccessible-resources.md`
- Commit/version/date: Required source state no later than 2026-08-04T08:31:12Z
- Checked date: 2026-08-28
- Precise location: INACCESSIBLE-020
- Relationship: Could define returned capability bounds and permissions, maximum VM protections, page-table interaction, and revocation behavior.
- Source ownership: independent
- Independence: independent
- Confidence: Medium
- Evidence basis: Compliant queries reached versioned CheriBSD architecture material but not source-level mapping derivation.
- Alternatives/counter-evidence: CHERI and seL4 specifications already establish capability authority and mapping structure.
- Limitations: Mixed FreeBSD and CHERI licensing must be preserved.
- Sensitivity: public
- Redistribution status: unknown
- Licence: mixed FreeBSD and CHERI source licensing
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0094

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: user-supplied or inaccessible resource metadata
- Evidentiary role: unresolved lead
- Title/description: Cutoff-pinned CHERIoT book and source snapshot.
- Canonical locator: CHERIoT public book and source repositories; immutable pre-cutoff snapshot unresolved
- Logical locator: `inaccessible-resources.md`
- Commit/version/date: Required state no later than 2026-08-04T08:31:12Z
- Checked date: 2026-08-28
- Precise location: INACCESSIBLE-021
- Relationship: Could establish exact import permission encoding, linker materialization, compartment reachability, and revocation semantics.
- Source ownership: independent
- Independence: independent
- Confidence: Medium
- Evidence basis: Compliant query reached the 2023 architecture paper and current project records, but current book and source were not cutoff-version pinned.
- Alternatives/counter-evidence: The architecture paper supports only broad capability and compartment precedent.
- Limitations: Source and documentation redistribution terms require review.
- Sensitivity: public
- Redistribution status: unknown
- Licence: CHERIoT project terms
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0095

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: user-supplied or inaccessible resource metadata
- Evidentiary role: unresolved lead
- Title/description: Exact pre-cutoff PAPR TCE and logical I/O mapping specification sections.
- Canonical locator: OpenPOWER PAPR specification archive; exact admissible PDF route not reached
- Logical locator: `inaccessible-resources.md`
- Commit/version/date: Relevant versions no later than 2026-08-04T08:31:12Z
- Checked date: 2026-08-28
- Precise location: INACCESSIBLE-022
- Relationship: Could confirm the separation between logical I/O resource assignment, mapping authority, individual translation entries, invalidation, and error handling.
- Source ownership: independent
- Independence: independent
- Confidence: Medium
- Evidence basis: Compliant PowerVM queries established broad partition authority but did not reach normative TCE or LIOBN sections.
- Alternatives/counter-evidence: LDoms, PR/SM, pKVM, and Hyper-V provide other platform-assignment precedents.
- Limitations: Specification licence and exact version must be verified.
- Sensitivity: public
- Redistribution status: unknown
- Licence: OpenPOWER specification terms unknown
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0096

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: user-supplied or inaccessible resource metadata
- Evidentiary role: unresolved lead
- Title/description: Exact pre-cutoff Hyper-V TLFS VTL protection-mask hierarchy.
- Canonical locator: Microsoft Virtualization Documentation TLFS archive; compliant route did not reach the exact specification
- Logical locator: `inaccessible-resources.md`
- Commit/version/date: Required pre-cutoff TLFS edition
- Checked date: 2026-08-28
- Precise location: INACCESSIBLE-023
- Relationship: Could establish exact higher-VTL protection authority, default masks, write-once enablement, and error or transition semantics.
- Source ownership: independent
- Independence: independent
- Confidence: Medium
- Evidence basis: Compliant Hyper-V queries reached broad security guidance and a VBS engineering record but not the TLFS source used by the excluded earlier query.
- Alternatives/counter-evidence: VBS and broad Hyper-V evidence already support layered management and isolation precedent.
- Limitations: Microsoft specification terms and exact cutoff version must be verified.
- Sensitivity: public
- Redistribution status: unknown
- Licence: Microsoft specification terms
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0097

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: review metadata
- Evidentiary role: administrative record
- Title/description: Completed synthesis of the confirmed pre-creation Beryllium and expanded public-source amendment.
- Canonical locator: review amendment synthesis
- Logical locator: `HANDOFF.md`
- Commit/version/date: Amendment synthesis completed 2026-08-28
- Checked date: 2026-08-28
- Precise location: report.md OBS-015 through OBS-029; attribution.md ATTRIBUTION-009 through ATTRIBUTION-011; source-scope-summary.md
- Relationship: Integrates pre-standalone Beryllium lineage, expanded proceedings and ecosystem findings, public-query compliance corrections, contribution-specific attribution, and revised retrieval priorities.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: High
- Evidence basis: All amendment research todos completed, out-of-bound public discovery routes were preserved and excluded, and the current draft passes maintained draft validation.
- Alternatives/counter-evidence: Independent synthesis audit and completed-package validation may require further corrections.
- Limitations: Administrative synthesis evidence does not independently establish any provenance claim or publication approval.
- Sensitivity: private
- Redistribution status: not-applicable
- Licence: not-applicable
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: yes

## PRV-20260828-001-E0098

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: review metadata
- Evidentiary role: counter-evidence
- Title/description: Amendment correction to baseline earliest-occurrence and no-lineage wording.
- Canonical locator: amendment correction for PRV-20260828-001
- Logical locator: `report.md`
- Commit/version/date: Correction recorded 2026-08-28
- Checked date: 2026-08-28
- Precise location: report.md OBS-030 and chronology.md CHRON-041
- Relationship: Clarifies that `30c08e6345f6f0f2e0a716937d3cde6c8ed778c5` is the earliest supported standalone-repository occurrence, while Beryllium `511187f9d1f44c322e3a4a11347584fd8a20dc72` is an earlier internal implementation checkpoint and only exact minimal-to-TE inherited lines support verified source lineage.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: High
- Evidence basis: Confirmed pre-creation Beryllium history, exact blame metadata, and the committed baseline records being corrected.
- Alternatives/counter-evidence: Direct Beryllium-to-standalone implementation transfer remains unresolved.
- Limitations: Preserves baseline observations as historical states of the review rather than deleting or rewriting them.
- Sensitivity: private
- Redistribution status: not-applicable
- Licence: not-applicable
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0099

- Status: superseded
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: review metadata
- Evidentiary role: administrative record
- Title/description: Maintained-helper identity, isolation guarantees, invocation inventory, and amendment-state manifest.
- Canonical locator: private ignored helper-isolation manifest for PRV-20260828-001
- Logical locator: `scope.md`
- Commit/version/date: Helper repository baseline `684d9bf1fcb4030f5d3ace69b2364d431805db14`; manifest created 2026-08-28
- Checked date: 2026-08-28
- Precise location: scope.md SOURCE-SCOPE-AMENDMENT-001 and HANDOFF.md validation boundary; private ignored isolation manifest and identity files
- Relationship: Establishes that all Beryllium evidence was captured through the maintained wrapper under an empty environment, isolated metadata and attributes, disabled hooks, credentials, protocols, pagers, external diff and text conversion, validated relative paths, read-only copied index, and exact invocation inventory.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: High
- Evidence basis: Exact helper source at the baseline, SHA-256 identity `6ff15f1fa9e49232fe2053bcc0b4c62cc9660464770d3bfc160bf528b8d91bd2`, helper state output, and retained per-mode invocation inventory.
- Alternatives/counter-evidence: Final amendment per-file hashes and baseline-aware validation remain pending.
- Limitations: Administrative reproducibility evidence does not prove the substantive truth of target or external-source claims.
- Sensitivity: private
- Redistribution status: not-applicable
- Licence: GPL-3.0-only helper
- Hash: sha256:6ff15f1fa9e49232fe2053bcc0b4c62cc9660464770d3bfc160bf528b8d91bd2
- Supersedes: None
- Superseded by: PRV-20260828-001-E0114
- Administrative: yes

## PRV-20260828-001-E0100

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002
- Source type: vendor or project-controlled statement
- Evidentiary role: prior art
- Title/description: Oracle VM Server for SPARC 3.2 logical-domain resource and CPU or memory mapping.
- Canonical locator: https://docs.oracle.com/cd/E48724_01/html/E48732/examplesofcpuandmemorymapping.html ; https://docs.oracle.com/en/virtualization/oracle-vm-server-sparc/ldoms-admin/hypervisor-and-logical-domains.html
- Logical locator: `search-log.md`
- Commit/version/date: Oracle VM Server for SPARC 3.2 Administration Guide; updated 2015-05
- Checked date: 2026-08-28
- Precise location: Hypervisor and Logical Domains section and Example 16-4 CPU and memory mapping entries
- Relationship: Control-domain management allocates physical resources to logical domains and the hypervisor enforces each domain's assigned subset.
- Source ownership: project-controlled
- Independence: independent
- Confidence: High
- Evidence basis: Exact pre-cutoff Oracle administration-guide edition reached through compliant LDoms queries.
- Alternatives/counter-evidence: The guide does not expose the lower-level sun4v hypervisor mapping API or continuous reconciliation.
- Limitations: Strong platform-assignment precedent only.
- Sensitivity: public
- Redistribution status: not-applicable
- Licence: Oracle documentation terms; no copy retained
- Hash: not-applicable
- Supersedes: PRV-20260828-001-E0063
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0101

- Status: active
- Aspect IDs: ASPECT-003
- Source type: user-supplied or inaccessible resource metadata
- Evidentiary role: unresolved lead
- Title/description: NetBSD kauth decision-composition source reached only by the excluded initial route.
- Canonical locator: NetBSD kauth manual and `tech-security` archives; compliant route did not re-establish the record
- Logical locator: `inaccessible-resources.md`
- Commit/version/date: Original design discussions in 2006
- Checked date: 2026-08-28
- Precise location: INACCESSIBLE-024
- Relationship: Could confirm allow, deny, defer, and no-security-model behavior as counter-evidence to universal fail-closed authorization.
- Source ownership: independent
- Independence: independent
- Confidence: Medium
- Evidence basis: Initial discovery identified the record, but `NetBSD deny by default` did not reach it in the compliance rerun.
- Alternatives/counter-evidence: seL4 rights downgrade and Xen permissive default already provide admissible non-universal behavior.
- Limitations: Inadmissible until reached under a confirmed query boundary or supplied directly.
- Sensitivity: public
- Redistribution status: unknown
- Licence: NetBSD documentation and mailing-list terms
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0102

- Status: active
- Aspect IDs: ASPECT-003
- Source type: user-supplied or inaccessible resource metadata
- Evidentiary role: unresolved lead
- Title/description: Bao malformed shared-memory configuration warning or truncation paths.
- Canonical locator: Bao public source repository; exact path reached only through the excluded initial route
- Logical locator: `inaccessible-resources.md`
- Commit/version/date: Source state associated with the pre-cutoff Bao architecture
- Checked date: 2026-08-28
- Precise location: INACCESSIBLE-025
- Relationship: Could test whether invalid static configuration always fails closed or may warn, truncate, or continue.
- Source ownership: independent
- Independence: independent
- Confidence: Medium
- Evidence basis: Initial source inspection reported such paths, but the compliant `Bao hypervisor compartment authority` route reached only broad architecture.
- Alternatives/counter-evidence: The admissible Bao paper establishes static assignment and stage-2 derivation.
- Limitations: Inadmissible until a confirmed public route or user-supplied source establishes the exact implementation.
- Sensitivity: public
- Redistribution status: unknown
- Licence: Bao source and publication terms
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0103

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: user-supplied or inaccessible resource metadata
- Evidentiary role: unresolved lead
- Title/description: Jailhouse version 0.12 exact cell memory-region, DMA, PCI, IOMMU, sharing, and R/W/X layout.
- Canonical locator: Jailhouse public source repository; exact configuration header reached only through the excluded initial route
- Logical locator: `inaccessible-resources.md`
- Commit/version/date: Jailhouse v0.12; 2020-02-04
- Checked date: 2026-08-28
- Precise location: INACCESSIBLE-026
- Relationship: Could confirm how one cell record couples assignment, mapping, R/W/X, device, DMA, and IOMMU authority.
- Source ownership: independent
- Independence: independent
- Confidence: Medium
- Evidence basis: Compliant `Jailhouse hypervisor compartment authority` reached the broad repository architecture but not the exact header.
- Alternatives/counter-evidence: Bao and broad Jailhouse documentation already show static assignment.
- Limitations: Inadmissible source-level detail until reached under a confirmed route or supplied directly.
- Sensitivity: public
- Redistribution status: unknown
- Licence: GPL-2.0-only or BSD alternative
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0104

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: user-supplied or inaccessible resource metadata
- Evidentiary role: unresolved lead
- Title/description: Detailed AWS Nitro Cards, Controller, hypervisor mapping, and I/O-assignment architecture.
- Canonical locator: AWS Nitro security-design whitepaper; compliant route reached only Nitro Enclaves overview
- Logical locator: `inaccessible-resources.md`
- Commit/version/date: Relevant whitepaper dated 2024-02-15
- Checked date: 2026-08-28
- Precise location: INACCESSIBLE-027
- Relationship: Could establish mapping-level control separation, device assignment, and reconciliation details beyond broad enclave partitioning.
- Source ownership: independent
- Independence: independent
- Confidence: Medium
- Evidence basis: Initial exact-title discovery reached the detailed paper, but the compliant `AWS Nitro hypervisor compartment authority` route did not.
- Alternatives/counter-evidence: Admissible Nitro Enclaves material supports broad CPU and memory partitioning only.
- Limitations: Inadmissible until reached under a confirmed query route or provided directly.
- Sensitivity: public
- Redistribution status: unknown
- Licence: AWS whitepaper terms
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0105

- Status: active
- Aspect IDs: ASPECT-002, ASPECT-003
- Source type: approved local research
- Evidentiary role: explicit source lineage
- Title/description: Exact generic source lines inherited from minimal pathfinder `cc6029a` into Beryllium TE checkpoint `511187f`.
- Canonical locator: Beryllium private repository successor source at commit 511187f9d1f44c322e3a4a11347584fd8a20dc72
- Logical locator: `workspace://beryllium-repo/pathfinder/src/memory.c@511187f9d1f44c322e3a4a11347584fd8a20dc72`
- Commit/version/date: Predecessor `cc6029acdd5df1fc14157c4faea4cc047e49a90e`; successor `511187f9d1f44c322e3a4a11347584fd8a20dc72`; 2026-07-18 through 2026-07-20
- Checked date: 2026-08-28
- Precise location: `memory.c` successor lines 14-32, 37-52, 55-58, 60, 62, 64-75, 77-126, 129, 131-138, 147-153, 158-160, 163-164, and 200-209; `main.c` successor lines 15-31, 43-45, 58, 70-71, 79, 81-111, 113-129, 180, 221, 267-270, 292-296, 306, 309-310, 329-350, 354-358, 430-465, 474-483, and 494-497; `include/be/memory.h` lines 11-52, 64-72, and 86-87
- Relationship: Verifies inherited fixed Sv39x4 and PTE infrastructure, address and path validation, table initialization, root encoding, map-validation fragments, pointer and guest-PC helpers, terminal failure, trap and event scaffolding, hart-zero entry checks, and installed-root verification.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: High
- Evidence basis: Direct commit ancestry and exact successor blame assigning these substantive lines to `cc6029a`.
- Alternatives/counter-evidence: Brace-only, comment-only, and isolated separator lines were excluded from mechanism-level classification.
- Limitations: Does not establish implementation lineage for policy/mechanism separation, absent-mapping denial, TE permission derivation, `OPEN`, one-rule authorization, or policy/PTE reconciliation.
- Sensitivity: private
- Redistribution status: unknown
- Licence: GPL-3.0-only
- Hash: not-applicable
- Supersedes: PRV-20260828-001-E0043
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0106

- Status: active
- Aspect IDs: ASPECT-002, ASPECT-003
- Source type: approved local research
- Evidentiary role: repository chronology
- Title/description: Minimal pathfinder documented predecessor concepts distinct from verified inherited source lines.
- Canonical locator: Beryllium minimal-pathfinder planning and evidence at commit cc6029acdd5df1fc14157c4faea4cc047e49a90e
- Logical locator: `workspace://beryllium-repo/planning/minimal-pathfinder-evidence.md@cc6029acdd5df1fc14157c4faea4cc047e49a90e`
- Commit/version/date: `cc6029acdd5df1fc14157c4faea4cc047e49a90e`; 2026-07-18T06:15:59Z
- Checked date: 2026-08-28
- Precise location: Minimal pathfinder plan and evidence descriptions of build-time policy/mechanism separation, ownership and capability alternatives, identifiers distinct from authority, unassigned-page absence plus current-policy denial, exact-event fail-closed handling, and offline authority reporting
- Relationship: Establishes architectural predecessor context that predates the TE checkpoint.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: High
- Evidence basis: Exact pre-cutoff planning and evidence records.
- Alternatives/counter-evidence: The concepts may reflect broader capability or security design practice and are not demonstrated as unchanged source implementation in the TE checkpoint.
- Limitations: Predecessor concepts must not be reported as verified implementation lineage without exact inherited lines.
- Sensitivity: private
- Redistribution status: unknown
- Licence: GPL-3.0-only
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0107

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: approved local research
- Evidentiary role: repository chronology
- Title/description: Corrected earliest supported Beryllium checkpoint containing all selected mechanisms.
- Canonical locator: Beryllium commit 511187f9d1f44c322e3a4a11347584fd8a20dc72
- Logical locator: `workspace://beryllium-repo/planning/type-enforcement-pathfinder-evidence.md@511187f9d1f44c322e3a4a11347584fd8a20dc72`
- Commit/version/date: `511187f9d1f44c322e3a4a11347584fd8a20dc72`; 2026-07-20T14:51:03Z
- Checked date: 2026-08-28
- Precise location: Commit metadata, TE plan/evidence, exact tree, and blamed TE implementation paths
- Relationship: Earliest supported Beryllium implementation checkpoint for policy-only `OPEN`, TE labels and rules, per-bit plus complete-request authorization, G-stage exclusion of `OPEN`, policy/PTE comparison, mapping-state denial checks, and fail-closed divergence.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: High
- Evidence basis: Maintained-helper history, tree, exact historical records, and blame.
- Alternatives/counter-evidence: Same-commit planning and implementation cannot establish intra-commit idea chronology.
- Limitations: Does not establish conceptual origin or direct transfer into the standalone repository.
- Sensitivity: private
- Redistribution status: unknown
- Licence: GPL-3.0-only
- Hash: not-applicable
- Supersedes: PRV-20260828-001-E0044
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0108

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-003
- Source type: approved local research
- Evidentiary role: direct implementation evidence
- Title/description: Immutable Beryllium TE API, decision mechanism, and fixed policy at `511187f`.
- Canonical locator: Beryllium private repository source at commit 511187f9d1f44c322e3a4a11347584fd8a20dc72
- Logical locator: `workspace://beryllium-repo/pathfinder/include/be/te.h@511187f9d1f44c322e3a4a11347584fd8a20dc72`
- Commit/version/date: `511187f9d1f44c322e3a4a11347584fd8a20dc72`; 2026-07-20T14:51:03Z
- Checked date: 2026-08-28
- Precise location: `pathfinder/include/be/te.h` lines 33-159; `pathfinder/src/te.c` lines 27-184; `pathfinder/src/policy/te.c` lines 16-150, all at `511187f`
- Relationship: Defines `OPEN`, sealed labels, six fixed rules, malformed-input denial, and one exact valid rule covering every requested permission.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: High
- Evidence basis: All relevant lines are blamed to `511187f`.
- Alternatives/counter-evidence: Bitmask access-vector and subset tests are established patterns.
- Limitations: Implementation authorship and chronology do not establish conceptual origin or standalone transfer.
- Sensitivity: private
- Redistribution status: unknown
- Licence: GPL-3.0-only
- Hash: not-applicable
- Supersedes: PRV-20260828-001-E0045
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0109

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: approved local research
- Evidentiary role: direct implementation evidence
- Title/description: Immutable Beryllium TE-derived G-stage construction and reconciliation at `511187f`.
- Canonical locator: Beryllium private repository source at commit 511187f9d1f44c322e3a4a11347584fd8a20dc72
- Logical locator: `workspace://beryllium-repo/pathfinder/src/main.c@511187f9d1f44c322e3a4a11347584fd8a20dc72`
- Commit/version/date: `511187f9d1f44c322e3a4a11347584fd8a20dc72`; 2026-07-20T14:51:03Z
- Checked date: 2026-08-28
- Precise location: `main.c` lines 131-255 and 352-420; `memory.c` lines 128-197; `include/be/memory.h` lines 53-84, all at `511187f`
- Relationship: Implements `OPEN` gating, separate R/W/X derivation, complete-request recheck, hardware exclusion of `OPEN`, policy/PTE comparison, cross-private policy denial plus absent mapping, shared-write denial plus present read-only mapping, and fail-closed divergence.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: High
- Evidence basis: Exact historical source and blame.
- Alternatives/counter-evidence: Fixed-scenario defensive checks and common security patterns remain plausible conceptual explanations.
- Limitations: No source-to-binary proof or cross-repository import record.
- Sensitivity: private
- Redistribution status: unknown
- Licence: GPL-3.0-only
- Hash: not-applicable
- Supersedes: PRV-20260828-001-E0046
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0110

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: approved local research
- Evidentiary role: documented influence
- Title/description: Immutable same-checkpoint TE plan and evidence with explicit Flask, SELinux, XSM, and RISC-V references.
- Canonical locator: Beryllium planning records at commit 511187f9d1f44c322e3a4a11347584fd8a20dc72
- Logical locator: `workspace://beryllium-repo/planning/type-enforcement-pathfinder-plan.md@511187f9d1f44c322e3a4a11347584fd8a20dc72`
- Commit/version/date: `511187f9d1f44c322e3a4a11347584fd8a20dc72`; 2026-07-20T14:51:03Z
- Checked date: 2026-08-28
- Precise location: TE plan references and plan/evidence descriptions; companion `planning/type-enforcement-pathfinder-evidence.md` at the same commit
- Relationship: Documents Flask, SELinux TE and access vectors, Xen XSM/FLASK, and RISC-V H as framing or vocabulary sources available at the earliest supported implementation checkpoint.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: Medium
- Evidence basis: Exact contemporaneous records and citations.
- Alternatives/counter-evidence: Plan and implementation entered together and do not identify the source of each exact algorithm.
- Limitations: Supports framing and vocabulary influence only.
- Sensitivity: private
- Redistribution status: unknown
- Licence: GPL-3.0-only
- Hash: not-applicable
- Supersedes: PRV-20260828-001-E0047
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0111

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: approved local research
- Evidentiary role: counter-evidence
- Title/description: Immutable post-implementation policy research and session records.
- Canonical locator: Beryllium commits 4b6892b9ca2ac7bdf694647c6f92156168324248 and b4b6fb7dfd28943cce0a6352e1870974e3be8bdf
- Logical locator: `workspace://beryllium-repo/planning/session-analysis-transcripts-2026-07-20.md@b4b6fb7dfd28943cce0a6352e1870974e3be8bdf`
- Commit/version/date: `4b6892b9ca2ac7bdf694647c6f92156168324248` at 2026-07-20T19:27:57Z; `b4b6fb7dfd28943cce0a6352e1870974e3be8bdf` at 2026-07-20T20:02:05Z
- Checked date: 2026-08-28
- Precise location: `planning/isolation-engine-policy-research.md@4b6892b`; transcript index and TE/VBS, isolation-engine, and CAP+TE/CHERI records at `b4b6fb7`
- Relationship: Retrospectively analyzes the completed 14:51:03Z TE checkpoint and cannot establish pre-implementation origin.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: High
- Evidence basis: Exact timestamps and self-described post-pathfinder status.
- Alternatives/counter-evidence: Earlier unretained prompts or working-tree discussions may exist.
- Limitations: Session and co-authorship metadata do not allocate conceptual contributions.
- Sensitivity: private
- Redistribution status: not-applicable
- Licence: GPL-3.0-only planning records; session content remains private
- Hash: not-applicable
- Supersedes: PRV-20260828-001-E0048
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0112

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: approved local research
- Evidentiary role: unresolved lead
- Title/description: Immutable Beryllium and Helium identity-split commit plus standalone creation anchor.
- Canonical locator: Beryllium commit ecbcfefedb2815b26476dbe38e3f5b0ad74c0871 and standalone commit b3994e52663dab03d8025db2750a0650aa40e80c
- Logical locator: `workspace://beryllium-repo/commit/ecbcfefedb2815b26476dbe38e3f5b0ad74c0871`
- Commit/version/date: `ecbcfefedb2815b26476dbe38e3f5b0ad74c0871` at 2026-07-21T04:29:57Z; `b3994e52663dab03d8025db2750a0650aa40e80c` at 2026-08-04T08:31:12Z
- Checked date: 2026-08-28
- Precise location: Maintained-helper commit metadata and standalone creation-anchor log; no historical HANDOFF file content is asserted
- Relationship: Documents intended `be_` to `he_` identity continuity before standalone creation.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: Medium
- Evidence basis: Exact commit chronology and identity-refactor message.
- Alternatives/counter-evidence: Snapshot migration, selective port, or independent rewrite remain plausible.
- Limitations: No parent, import, file-level rename, patch identity, source-hash bridge, or surviving local-history anchor.
- Sensitivity: private
- Redistribution status: not-applicable
- Licence: not-applicable
- Hash: not-applicable
- Supersedes: PRV-20260828-001-E0049
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0113

- Status: active
- Aspect IDs: ASPECT-002, ASPECT-003
- Source type: approved local research
- Evidentiary role: counter-evidence
- Title/description: Immutable pre-cutoff policy-neutral models and runtime-plan context.
- Canonical locator: Beryllium exact commits 5d2276630d81b8a4e6b70babf7381c3b9e714403 through 64a88b15a6c35d522fa997699c4fb514b15da314
- Logical locator: `workspace://beryllium-repo/planning/architecture-model-0.2.md@e58adc3e22994521e064bf3bfb7e8c608529ef55`
- Commit/version/date: Model 0.1 `5d2276630d81b8a4e6b70babf7381c3b9e714403`; Model 0.2 `e58adc3e22994521e064bf3bfb7e8c608529ef55`; runtime plan `a81edbc34d344338f9818d24738037cab04279ff`; R0 `64a88b15a6c35d522fa997699c4fb514b15da314`; 2026-07-21 through 2026-07-25
- Checked date: 2026-08-28
- Precise location: Exact extracted `architecture-model-0.1.md`, `architecture-model-0.2.md`, `single-hart-runtime-plan.md`, and `single-hart-runtime-r0-freeze.md` at the listed commits
- Relationship: Preserves policy-neutral mapping soundness, sealed authority, derived enforcement, directional sharing, and rechecks while excluding TE or Helium import from the accepted runtime profile.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: High
- Evidence basis: Exact pre-cutoff records.
- Alternatives/counter-evidence: The records may reflect lessons from the TE experiment.
- Limitations: Counters one uninterrupted TE implementation lineage and does not establish earlier origin.
- Sensitivity: private
- Redistribution status: unknown
- Licence: GPL-3.0-only
- Hash: not-applicable
- Supersedes: PRV-20260828-001-E0050
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0114

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: review metadata
- Evidentiary role: administrative record
- Title/description: Corrected helper-isolation and capture-reproducibility record.
- Canonical locator: private ignored helper-isolation manifest for PRV-20260828-001
- Logical locator: `scope.md`
- Commit/version/date: Helper repository baseline `684d9bf1fcb4030f5d3ace69b2364d431805db14`; corrected record 2026-08-28
- Checked date: 2026-08-28
- Precise location: scope.md ACTIVITY-015; private helper manifest, helper identity files, invocation inventory, and bundle outputs
- Relationship: Establishes the maintained wrapper's execution-isolation guarantees and exact invocation inventory for all Beryllium history, tree, show, and blame capture.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: High
- Evidence basis: Exact baseline helper source, SHA-256 `6ff15f1fa9e49232fe2053bcc0b4c62cc9660464770d3bfc160bf528b8d91bd2`, empty-environment and isolated-Git controls, read-only index handling, empty-tree attributes, and captured invocation list.
- Alternatives/counter-evidence: The manifest was created after the evidence pass and is not a cryptographic execution attestation.
- Limitations: Helper `show` output is a commit patch rather than a universal file-at-commit snapshot; bundle outputs lack a per-file invocation, exit-status, byte-count, and SHA-256 manifest; Git and SHA tool versions are not pinned; final amendment per-file hashes and baseline validation remain pending.
- Sensitivity: private
- Redistribution status: not-applicable
- Licence: GPL-3.0-only helper
- Hash: sha256:6ff15f1fa9e49232fe2053bcc0b4c62cc9660464770d3bfc160bf528b8d91bd2
- Supersedes: PRV-20260828-001-E0099
- Superseded by: None
- Administrative: yes

## PRV-20260828-001-E0115

- Status: active
- Aspect IDs: ASPECT-002, ASPECT-003
- Source type: external repository or maintainer record
- Evidentiary role: prior art
- Title/description: Immutable pKVM ownership and protected stage-2 mapping documentation.
- Canonical locator: https://android.googlesource.com/kernel/common/+/c747c018510514875d9d790dde177c52bba7b679/Documentation/virt/kvm/arm/pkvm.rst
- Logical locator: `search-log.md`
- Commit/version/date: Android common-kernel commit `c747c018510514875d9d790dde177c52bba7b679`; 2026-05-24
- Checked date: 2026-08-28
- Precise location: Overview and CPU memory-isolation sections covering host stage-2 mappings, pinned guest memory, fixed post-start memory-slot configuration, DMA isolation status, and VMM or guest mapping-coherency limitation
- Relationship: Ownership and lifecycle state determine protected stage-2 reachability, post-start movement or deletion is rejected, and the source explicitly documents incomplete DMA isolation and possible address-space incoherency.
- Source ownership: project-controlled
- Independence: independent
- Confidence: High
- Evidence basis: Immutable pre-cutoff source reached through compliant `pKVM` and `Linux pKVM` queries.
- Alternatives/counter-evidence: Broad ownership and transition-time checks do not establish continuous policy-to-hardware reconciliation.
- Limitations: Original pKVM patch-series chronology remains unavailable.
- Sensitivity: public
- Redistribution status: approved
- Licence: Linux kernel documentation licence
- Hash: not-applicable
- Supersedes: PRV-20260828-001-E0060
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0116

- Status: active
- Aspect IDs: ASPECT-002, ASPECT-003
- Source type: mailing-list or archive record
- Evidentiary role: adjacent precedent
- Title/description: Xen arm grant and DMA mapping relationship patch.
- Canonical locator: https://old-list-archives.xen.org/archives/html/xen-devel/2014-04/msg02792.html
- Logical locator: `search-log.md`
- Commit/version/date: Xen-devel patch dated 2014-04-22
- Checked date: 2026-08-28
- Precise location: Patch description for adding a grant entry to map an MFN one-to-one in dom0 stage-2 state
- Relationship: Provides primary archive evidence that a grant relationship precedes and authorizes a concrete mapping operation.
- Source ownership: project-controlled
- Independence: independent
- Confidence: High
- Evidence basis: Original Xen-devel post reached through compliant `Xen-devel mapping permission` and relationship queries.
- Alternatives/counter-evidence: This is grant and DMA mapping, not XSM rule composition or target-style TE `OPEN`.
- Limitations: Exact FLASK authorization semantics are not established by this patch.
- Sensitivity: public
- Redistribution status: not-applicable
- Licence: Xen contribution and mailing-list terms; no copy retained
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0117

- Status: active
- Aspect IDs: ASPECT-003
- Source type: mailing-list or archive record
- Evidentiary role: prior art
- Title/description: Xen long-standing grant-mapping bug and safe-unmap patch series.
- Canonical locator: https://lists.xenproject.org/archives/html/xen-devel/2015-01/msg00326.html
- Logical locator: `search-log.md`
- Commit/version/date: Xen-devel RFC series dated 2015-01-06
- Checked date: 2026-08-28
- Precise location: Series cover describing long-standing grant-map bugs and safe unmapping goals
- Relationship: Establishes stale or malformed mapping-state consistency and safe-unmap concerns in a production hypervisor.
- Source ownership: project-controlled
- Independence: independent
- Confidence: High
- Evidence basis: Original Xen-devel series reached through compliant archive queries.
- Alternatives/counter-evidence: Detailed per-patch failure semantics were not retained.
- Limitations: Adjacent mapping-consistency precedent, not policy/PTE readback.
- Sensitivity: public
- Redistribution status: not-applicable
- Licence: Xen contribution and mailing-list terms; no copy retained
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0118

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002
- Source type: mailing-list or archive record
- Evidentiary role: counter-evidence
- Title/description: Xen device permission and mapping defect report.
- Canonical locator: https://lists.xen.org/archives/html/xen-devel/2022-03/msg00864.html
- Logical locator: `search-log.md`
- Commit/version/date: Xen-devel report dated 2022-03-11
- Checked date: 2026-08-28
- Precise location: Report that a permission grant and an Intel graphics operation-region mapping could diverge
- Relationship: Confirms that management permission state and realized device mapping can be separate and inconsistent.
- Source ownership: project-controlled
- Independence: independent
- Confidence: Medium
- Evidence basis: Original Xen-devel report reached through compliant mapping and relationship queries.
- Alternatives/counter-evidence: Device-passthrough behavior differs from memory-root construction.
- Limitations: Counter-evidence to continuous reconciliation, not an origin source.
- Sensitivity: public
- Redistribution status: not-applicable
- Licence: Mailing-list terms; no copy retained
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0119

- Status: active
- Aspect IDs: ASPECT-002, ASPECT-003
- Source type: mailing-list or archive record
- Evidentiary role: adjacent precedent
- Title/description: NetBSD separate-address-space mitigation discussion.
- Canonical locator: https://mail-index.netbsd.org/tech-kern/2018/01/21/msg023000.html
- Logical locator: `search-log.md`
- Commit/version/date: NetBSD `tech-kern` post dated 2018-01-21
- Checked date: 2026-08-28
- Precise location: Discussion of separate address-space state as a mitigation boundary
- Relationship: Provides archive evidence for policy-driven absence of selected mappings and separate address spaces.
- Source ownership: project-controlled
- Independence: independent
- Confidence: Medium
- Evidence basis: Primary NetBSD archive record reached through compliant `NetBSD tech-kern mapping permission`.
- Alternatives/counter-evidence: It is not an original maximum-permission or relationship-authorization design record.
- Limitations: Adjacent precedent only.
- Sensitivity: public
- Redistribution status: not-applicable
- Licence: NetBSD mailing-list terms; no copy retained
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0120

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: review metadata
- Evidentiary role: negative search result
- Title/description: Compliant archive-specific mailing-list and immutable pKVM rerun.
- Canonical locator: review mailing-list compliance record
- Logical locator: `search-log.md`
- Commit/version/date: Rerun completed 2026-08-28
- Checked date: 2026-08-28
- Precise location: SEARCH-014
- Relationship: Records mandatory archive-specific queries for LKML, LSM, SELinux, KVM, pKVM, Xen-devel, FreeBSD, NetBSD, OpenBSD, cap-talk, seL4, and CHERI and pins substantive pKVM claims to immutable commit `c747c018510514875d9d790dde177c52bba7b679`.
- Source ownership: independent
- Independence: partially-independent
- Confidence: High
- Evidence basis: Exact approved archive-name-plus-phrase queries, primary URLs, source dates, and bounded negative results.
- Alternatives/counter-evidence: Several archives returned only project documentation or terminology collisions rather than original design threads.
- Limitations: Negative archive results do not prove absence; original SELinux, FreeBSD, pKVM, seL4, CHERI, and `cap-talk` discussions remain retrieval gaps.
- Sensitivity: private
- Redistribution status: not-applicable
- Licence: not-applicable
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0121

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: user-supplied or inaccessible resource metadata
- Evidentiary role: unresolved lead
- Title/description: Public seL4 mailing-list or discussion record for mapping-capability semantics and rights downgrade.
- Canonical locator: seL4 public archives; no compliant mailing-list message returned
- Logical locator: `inaccessible-resources.md`
- Commit/version/date: Relevant public discussion expected before 2026-08-04
- Checked date: 2026-08-28
- Precise location: INACCESSIBLE-028
- Relationship: Could establish historical rationale, alternatives, and chronology for mapping-capability authority and silent rights downgrade.
- Source ownership: independent
- Independence: independent
- Confidence: Medium
- Evidence basis: Compliant seL4 queries reached manuals, proof assumptions, FAQ, and the integrity paper but no mailing-list record.
- Alternatives/counter-evidence: Versioned seL4 manuals already establish the mechanism.
- Limitations: Archive location and redistribution terms remain unresolved.
- Sensitivity: public
- Redistribution status: unknown
- Licence: archive terms unknown
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0122

- Status: active
- Aspect IDs: ASPECT-002, ASPECT-003
- Source type: user-supplied or inaccessible resource metadata
- Evidentiary role: unresolved lead
- Title/description: Public CHERI mailing-list or discussion record for capability and paged-memory composition.
- Canonical locator: CHERI public project archives; no compliant mailing-list message returned
- Logical locator: `inaccessible-resources.md`
- Commit/version/date: Relevant public discussion expected before 2026-08-04
- Checked date: 2026-08-28
- Precise location: INACCESSIBLE-029
- Relationship: Could establish chronology and rejected alternatives for capability/MMU composition, mapping authority, and consistency assumptions.
- Source ownership: independent
- Independence: independent
- Confidence: Medium
- Evidence basis: Compliant CHERI queries reached specifications, programming guides, and DMA-composition material but no discussion archive.
- Alternatives/counter-evidence: CHERI ISAv9 and project guides already establish the architecture.
- Limitations: Archive location, completeness, and redistribution terms remain unresolved.
- Sensitivity: public
- Redistribution status: unknown
- Licence: archive terms unknown
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0123

- Status: superseded
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: review metadata
- Evidentiary role: administrative record
- Title/description: Append-only amendment correction to the publication blocker inventory.
- Canonical locator: amendment publication gate
- Logical locator: `publication-checklist.md`
- Commit/version/date: Correction recorded 2026-08-28
- Checked date: 2026-08-28
- Precise location: publication-checklist.md Amendment publication correction
- Relationship: Preserves baseline `PUBLICATION-001` verbatim while defining the complete current evidence inventory that blocks promotion after E0041.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: High
- Evidence basis: Current evidence-ledger sensitivity, redistribution, and supersession fields through E0123.
- Alternatives/counter-evidence: A future human-cleared derivative may use a smaller dependency set if traceability remains intact.
- Limitations: This record does not clear evidence, authorize promotion, or substitute for a responsible-human promotion record.
- Sensitivity: private
- Redistribution status: not-applicable
- Licence: not-applicable
- Hash: not-applicable
- Supersedes: None
- Superseded by: PRV-20260828-001-E0125
- Administrative: yes

## PRV-20260828-001-E0124

- Status: active
- Aspect IDs: ASPECT-003
- Source type: paper, proceedings item, dataset, or replication artifact
- Evidentiary role: adjacent precedent
- Title/description: Nick L. Petroni Jr., Timothy Fraser, Aaron Walters, and William A. Arbaugh, "An Architecture for Specification-Based Detection of Semantic Integrity Violations in Kernel Dynamic Data."
- Canonical locator: https://www.usenix.org/conference/15th-usenix-security-symposium/architecture-specification-based-detection-semantic
- Logical locator: `search-log.md`
- Commit/version/date: 15th USENIX Security Symposium, July 2006, pages 289-304
- Checked date: 2026-08-28
- Precise location: Sections 2.2, 3, 4.2, and 5
- Relationship: An independent asynchronous monitor recomputes expected SELinux permission masks from protected policy tables using ordinary and conditional entry union, compares them with live AVC cache entries, and reports inconsistencies.
- Source ownership: independent
- Independence: independent
- Confidence: High
- Evidence basis: Primary paper with implemented prototype and attack experiment, independently reached through the compliant query `site:usenix.org/legacy/event/sec06 \"USENIX Security\" \"type enforcement\"`.
- Alternatives/counter-evidence: The work demonstrates broad policy-versus-live-enforcement-decision consistency monitoring.
- Limitations: It is not mapping reconciliation, PTE readback, admission control, immediate denial, or terminal fail-stop handling; asynchronous observation can require repeated failures.
- Sensitivity: public
- Redistribution status: not-applicable
- Licence: USENIX and paper-author terms; no copy retained
- Hash: not-applicable
- Supersedes: PRV-20260828-001-E0053
- Superseded by: None
- Administrative: no

## PRV-20260828-001-E0125

- Status: superseded
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: review metadata
- Evidentiary role: administrative record
- Title/description: Completed amendment audit remediation and current publication blocker inventory through E0125.
- Canonical locator: amendment audit and publication gate
- Logical locator: `publication-checklist.md`
- Commit/version/date: Remediation completed 2026-08-28
- Checked date: 2026-08-28
- Precise location: publication-checklist.md Amendment publication correction; scope.md ACTIVITY-016
- Relationship: Records restoration of the append-only baseline, exact inherited-line classification, helper isolation review, compliant archive coverage, immutable pKVM evidence, bounded Petroni classification, authorship separation, inaccessible-resource completion, and the current private promotion blocker inventory.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: High
- Evidence basis: Baseline-aware draft validation passes, all remediation todos are complete, and current conclusions cite active compliant evidence.
- Alternatives/counter-evidence: Completion-mode validation and agent-contract validation remain pending.
- Limitations: Does not authorize publication or substitute for responsible-human review.
- Sensitivity: private
- Redistribution status: not-applicable
- Licence: not-applicable
- Hash: not-applicable
- Supersedes: PRV-20260828-001-E0123
- Superseded by: PRV-20260828-001-E0126
- Administrative: yes

## PRV-20260828-001-E0126

- Status: superseded
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: review metadata
- Evidentiary role: administrative record
- Title/description: Completed amendment validation and current private publication blocker inventory through E0126.
- Canonical locator: final amendment validation and publication gate
- Logical locator: `HANDOFF.md`
- Commit/version/date: Validation completed 2026-08-28
- Checked date: 2026-08-28
- Precise location: HANDOFF.md Validation status; publication-checklist.md Amendment publication correction
- Relationship: Records passing baseline-aware completion validation, agent-contract validation, and whitespace inspection after all audit corrections, while preserving the complete current private promotion blocker inventory.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: High
- Evidence basis: `scripts/validate-review.sh --baseline 684d9bf1fcb4030f5d3ace69b2364d431805db14` passed in completion mode, `tests/validate-agent.sh` passed, and `git diff --check` passed.
- Alternatives/counter-evidence: Validation proves structural, reference, phase, and append-only baseline contracts, not inaccessible-source truth or human publication approval.
- Limitations: The ignored Beryllium capture bundle remains non-tamper-evident at the per-output level, as recorded in E0114.
- Sensitivity: private
- Redistribution status: not-applicable
- Licence: not-applicable
- Hash: not-applicable
- Supersedes: PRV-20260828-001-E0125
- Superseded by: PRV-20260828-001-E0127
- Administrative: yes

## PRV-20260828-001-E0127

- Status: active
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Source type: review metadata
- Evidentiary role: administrative record
- Title/description: Created the versioned human-readable prior-art summary contract, validated supplementary rendering, and updated the current private publication blocker inventory through E0127.
- Canonical locator: prior-art summary iteration and rendered review navigation
- Logical locator: `prior-art-summary.md`
- Commit/version/date: PRIOR-ART-ITERATION-001; 2026-08-29
- Checked date: 2026-08-29
- Precise location: prior-art-summary.md current projection, significant-prior-art table, and PRIOR-ART-ITERATION-001; html/prior-art-summary.html
- Relationship: Records creation of the required current prior-art projection, append-only iteration history, canonical-link table, and supplementary HTML page using existing admitted evidence and classifications, and supersedes the previous validation/publication-inventory record.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: High
- Evidence basis: The summary references only existing active evidence-ledger and chronology records, maintained validator and renderer checks cover its structure and generated page, and the publication checklist identifies blockers through E0127.
- Alternatives/counter-evidence: This administrative record does not strengthen or reclassify any substantive provenance relationship.
- Limitations: Validation does not establish source truth, novelty, publication approval, or conceptual origin.
- Sensitivity: private
- Redistribution status: not-applicable
- Licence: not-applicable
- Hash: not-applicable
- Supersedes: PRV-20260828-001-E0126
- Superseded by: None
- Administrative: yes
