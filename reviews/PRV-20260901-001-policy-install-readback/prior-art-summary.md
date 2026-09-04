# Coding agent policy installation readback rationale - Prior Art Summary

Review ID: `PRV-20260901-001`
Short name: `policy-install-readback`
Distribution: `private`
Intended distribution: `public-candidate`
Created: `2026-09-01`
Status: `Complete`
Latest iteration: `PRIOR-ART-ITERATION-001`
Latest updated: `2026-09-01`

## Current at-a-glance projection

- Based on iteration: PRIOR-ART-ITERATION-001
- Bottom line: The coding agent used the readback as a fail-closed policy-to-PTE soundness checkpoint before subject execution. This is directly documented in the origin plan/session and fits established high-assurance decision-versus-enforcement practice.
- Implementation lineage: The mechanism first appears in Beryllium commit `511187f9d1f44c322e3a4a11347584fd8a20dc72`, was created in its linked coding session, and was directly transferred through the documented standalone Helium extraction before the sanitized snapshot.
- Documented influence: Target records document Flask/SELinux influence on the broad TE model, but no mechanism-specific external influence for the exact readback. NIST, Petroni, and SELinux/Flask sources provide adjacent rationale and precedent only.
- Distinct or unresolved: The exact external conceptual origin remains unresolved. The check is initialization-time software PTE reconciliation, not continuous hardware-state verification, and the direct divergence branch lacks a maintained negative test.
- Credit framing: Credit Beryllium `511187f` as the direct implementation source and preserve its James Morris author/committer plus Copilot co-author/session record without assigning shares. Credit public predecessors only for their evidenced general patterns.
- Aspect IDs: ASPECT-001
- Evidence IDs: PRV-20260901-001-E0005, PRV-20260901-001-E0006, PRV-20260901-001-E0007, PRV-20260901-001-E0008, PRV-20260901-001-E0009, PRV-20260901-001-E0010, PRV-20260901-001-E0011, PRV-20260901-001-E0012, PRV-20260901-001-E0013, PRV-20260901-001-E0014, PRV-20260901-001-E0015, PRV-20260901-001-E0016, PRV-20260901-001-E0017, PRV-20260901-001-E0019, PRV-20260901-001-E0020, PRV-20260901-001-E0021, PRV-20260901-001-E0022, PRV-20260901-001-E0023
- Chronology IDs: CHRON-002, CHRON-003, CHRON-004, CHRON-005, CHRON-006, CHRON-007, CHRON-008, CHRON-009, CHRON-010, CHRON-011, CHRON-012, CHRON-013, CHRON-014, CHRON-015, CHRON-016, CHRON-017, CHRON-018, CHRON-019, CHRON-020, CHRON-021
- Confidence: High
- Evidence basis: Exact frozen code and Git chronology, timestamped origin and extraction sessions, complete available-history audit, prior validated review, and public primary sources.
- Alternatives/counter-evidence: The exact implementation may reflect ordinary defensive programming or unrecorded influence rather than a source-specific lineage.
- Limitations: Former full-history objects are unavailable; no claim of novelty, independent creation, formal verification, hardware validation, or production sufficiency is made.
- Administrative: no

## Significant prior art

Public links are navigation aids, not evidence substitutes. A source may appear
here only after its evidence-ledger and chronology or search records exist.
Internal, private, or restricted sources remain unlinked and are identified by
evidence IDs.

| Significant prior art | Canonical public link | Date/version | Relationship/classification | Why it matters | Aspect IDs | Evidence IDs | Chronology IDs | Confidence |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Beryllium fixed Type Enforcement pathfinder | None | 2026-07-20, commit `511187f9d1f44c322e3a4a11347584fd8a20dc72` | verified source lineage | Private direct implementation source and origin coding session for the standalone mechanism. | ASPECT-001 | PRV-20260901-001-E0006, PRV-20260901-001-E0007, PRV-20260901-001-E0010 | CHRON-006, CHRON-007, CHRON-009, CHRON-012, CHRON-013 | High |
| DTOS current-policy enforcement | [Primary paper](https://www-old.cs.utah.edu/flux/fluke/html/dtos/DOCS/usenix95.pdf) | 1995 | strong prior-art relationship | Requires current policy at enforcement points and fail-closed secure startup rather than disabling checks. | ASPECT-001 | PRV-20260901-001-E0019 | CHRON-017 | High |
| Flask Security Architecture | [USENIX paper](https://www.usenix.org/conference/8th-usenix-security-symposium/flask-security-architecture-system-support-diverse-security) | August 1999 | strong prior-art relationship | Applies policy at mapped-memory enforcement points and revalidates retained decisions after policy change. | ASPECT-001 | PRV-20260901-001-E0016 | CHRON-002 | High |
| LOCK: An Historical Perspective | [ACSAC paper](https://www.acsac.org/2002/papers/classic-lock.pdf) | 2002 | strong prior-art relationship | Loads policy-derived rights into MMU tables while explicitly trusting the translation seam, providing both ancestry and counter-evidence to readback being universal. | ASPECT-001 | PRV-20260901-001-E0020 | CHRON-018 | High |
| NIST SP 800-160 Vol. 1 Rev. 1, Engineering Trustworthy Secure Systems | [Official NIST PDF](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-160v1r1.pdf) | November 2022 | adjacent precedent | Separates policy decision from enforcement and emphasizes verifiability, protective failure, and secure activation checkpoints. | ASPECT-001 | PRV-20260901-001-E0014 | CHRON-004 | High |
| Petroni et al., semantic-integrity monitoring | [USENIX paper](https://www.usenix.org/legacy/event/sec06/tech/full_papers/petroni/petroni_html/main.html) | July 2006 | adjacent precedent | Recomputes policy-derived expectations and compares them with live enforcement-decision state, but asynchronously and outside PTE installation. | ASPECT-001 | PRV-20260901-001-E0015 | CHRON-003 | High |
| seL4 Enforces Integrity | [DOI record](https://doi.org/10.1007/978-3-642-22863-6_24) | 2011 | strong prior-art relationship | Establishes policy/protection-state correspondence through proof, providing a counterexample to runtime readback being the only assurance route. | ASPECT-001 | PRV-20260901-001-E0021 | CHRON-019 | High |
| Translation Validation for a Verified OS Kernel | [Author copy](https://www.cl.cam.ac.uk/~mom22/pldi13.pdf) | 2013 | strong prior-art relationship | Validates a produced artifact after translation rather than trusting the translator, while differing materially from runtime PTE checking. | ASPECT-001 | PRV-20260901-001-E0022 | CHRON-020 | High |

## Iteration contract

Numbered `PRIOR-ART-ITERATION-NNN` records are append-only and byte-stable once
committed. When material source or background changes alter the summary, append
a complete next iteration, update `Latest iteration`, `Latest updated`, the
current projection, and the significant-prior-art table, and preserve every
earlier numbered record.

## PRIOR-ART-ITERATION-001

- Date: 2026-09-01
- Supersedes: None
- Change reason: Initial reason-focused synthesis using newly examined origin and extraction session history plus the existing public primary-source landscape.
- Bottom line: The agent used the readback to establish a fail-closed policy-to-PTE correspondence checkpoint before execution, making policy translation errors visible at the fixed initialization boundary.
- Implementation lineage: The selected logic was introduced in the first retained origin-session runtime patch, committed in Beryllium `511187f`, carried through the Beryllium-to-Helium identity split, explicitly flattened into standalone Helium, and committed onto sanitized `for-review` history.
- Documented influence: Broad Flask/SELinux influence applies to the TE model. No direct record identifies NIST, Petroni, or SELinux policy-change handling as the source of the exact readback; they are adjacent prior art.
- Distinct or unresolved: Exact external conceptual origin is unresolved. The implementation checks stored software PTE bits once during initialization and shares common-mode dependencies with the mapper.
- Credit framing: Credit the direct Beryllium implementation and its recorded author/co-author metadata for the mechanism; credit public sources only for decision/enforcement assurance and consistency-monitoring precedent.
- Aspect IDs: ASPECT-001
- Evidence IDs: PRV-20260901-001-E0005, PRV-20260901-001-E0006, PRV-20260901-001-E0007, PRV-20260901-001-E0008, PRV-20260901-001-E0009, PRV-20260901-001-E0010, PRV-20260901-001-E0011, PRV-20260901-001-E0012, PRV-20260901-001-E0013, PRV-20260901-001-E0014, PRV-20260901-001-E0015, PRV-20260901-001-E0016, PRV-20260901-001-E0017, PRV-20260901-001-E0019, PRV-20260901-001-E0020, PRV-20260901-001-E0021, PRV-20260901-001-E0022, PRV-20260901-001-E0023
- Chronology IDs: CHRON-002, CHRON-003, CHRON-004, CHRON-005, CHRON-006, CHRON-007, CHRON-008, CHRON-009, CHRON-010, CHRON-011, CHRON-012, CHRON-013, CHRON-014, CHRON-015, CHRON-016, CHRON-017, CHRON-018, CHRON-019, CHRON-020, CHRON-021
- Confidence: High
- Evidence basis: Exact source and isolated history; timestamped origin, review, extraction, and sanitization records; exhaustive available-session audit; prior validated review; and public primary sources.
- Alternatives/counter-evidence: Ordinary defensive programming or an unrecorded influence could explain the same choice; LOCK trusts translation, seL4 proves correspondence, Petroni monitors asynchronously, and pKVM acknowledges possible incoherency, so this runtime readback is not universal.
- Limitations: Unavailable intermediate Git objects prevent complete byte-level reconstruction; the divergence branch lacks a direct maintained negative test; the check is not continuous or hardware-independent.
- Administrative: no
