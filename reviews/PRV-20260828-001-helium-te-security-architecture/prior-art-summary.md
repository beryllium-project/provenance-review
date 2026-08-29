# Helium TE PoC security architecture provenance - Prior Art Summary

Review ID: `PRV-20260828-001`
Short name: `helium-te-security-architecture`
Distribution: `private`
Intended distribution: `public-candidate`
Created: `2026-08-28`
Status: `Complete`
Latest iteration: `PRIOR-ART-ITERATION-001`
Latest updated: `2026-08-29`

## Current at-a-glance projection

- Based on iteration: PRIOR-ART-ITERATION-001
- Bottom line: Helium's selected mechanisms sit in a well-established lineage of Type Enforcement, relationship or mapping authority, and policy-derived hardware enforcement, while the exact combination of policy-only `OPEN`, one-rule non-composition, absent-mapping denial, and post-install G-stage readback with fail-stop handling remains unresolved.
- Implementation lineage: Verified internal lineage is limited to exact fixed Sv39x4, validation, table-initialization, root-encoding, map-validation, and generic runtime or trap lines inherited from Beryllium `cc6029a` by `511187f`; minimal-pathfinder policy/mechanism, identifiers-versus-authority, absent-mapping, and fail-closed concepts are documented predecessor context rather than inherited-code claims.
- Documented influence: The target explicitly identifies Flask and SELinux vocabulary and model influence. Same-checkpoint Beryllium records cite Xen XSM/FLASK and RISC-V as Medium-confidence framing or architectural background, not as mechanism-specific influence.
- Distinct or unresolved: Exact `OPEN` terminology and no-PTE representation, one-rule TE non-composition, policy-denial-plus-absent-mapping, direct Beryllium-to-standalone transfer, and the exact post-install G-stage readback and terminal divergence sequence remain unresolved.
- Credit framing: Credit each predecessor only for its evidenced contribution. Credit James Morris for the Beryllium implementation and for authoring and committing the standalone snapshot; preserve the Copilot co-authorship disclosure without inferring contribution shares, and keep underlying standalone line authorship and conceptual origin unresolved.
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0011, PRV-20260828-001-E0012, PRV-20260828-001-E0013, PRV-20260828-001-E0016, PRV-20260828-001-E0017, PRV-20260828-001-E0018, PRV-20260828-001-E0019, PRV-20260828-001-E0020, PRV-20260828-001-E0021, PRV-20260828-001-E0023, PRV-20260828-001-E0024, PRV-20260828-001-E0025, PRV-20260828-001-E0026, PRV-20260828-001-E0039, PRV-20260828-001-E0051, PRV-20260828-001-E0052, PRV-20260828-001-E0061, PRV-20260828-001-E0062, PRV-20260828-001-E0072, PRV-20260828-001-E0076, PRV-20260828-001-E0105, PRV-20260828-001-E0106, PRV-20260828-001-E0107, PRV-20260828-001-E0109, PRV-20260828-001-E0110, PRV-20260828-001-E0112, PRV-20260828-001-E0114, PRV-20260828-001-E0115, PRV-20260828-001-E0118, PRV-20260828-001-E0124
- Chronology IDs: CHRON-004, CHRON-007, CHRON-008, CHRON-009, CHRON-010, CHRON-011, CHRON-012, CHRON-013, CHRON-014, CHRON-015, CHRON-016, CHRON-018, CHRON-019, CHRON-021, CHRON-023, CHRON-024, CHRON-025, CHRON-026, CHRON-031, CHRON-032, CHRON-036, CHRON-037, CHRON-043, CHRON-044, CHRON-046
- Confidence: High
- Evidence basis: Exact isolated Git ancestry and blame establish the bounded internal code lineage; target and Beryllium documents establish named influence; primary publications, specifications, commits, manuals, and archives establish the prior-art and counter-evidence chronology.
- Alternatives/counter-evidence: SELinux ordinary allow permissions accumulate and its `open` names an ordinary file operation; capability possession can itself confer authority; seL4 can silently downgrade requested rights; Xen can run permissively; and pKVM and Xen records show that policy, requested, or installed mapping state can diverge without the target's exact fail-stop reconciliation.
- Limitations: No admitted evidence proves conceptual origin, direct Beryllium-to-standalone transfer, exact source identity across repositories, or novelty; inaccessible and bounded negative searches leave closer predecessors possible. The isolated capture supports the exact lineage findings but lacks per-output invocation, exit-status, byte-count, and SHA-256 attestation and was documented after capture.
- Administrative: no

## Significant prior art

Public links are navigation aids, not evidence substitutes. The evidence ledger
and chronology remain authoritative for scope, source status, alternatives,
and limitations.

| Significant prior art | Canonical public link | Date/version | Relationship/classification | Why it matters | Aspect IDs | Evidence IDs | Chronology IDs | Confidence |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| David L. Golber, "The SDC Communications Kernel" | [NIST proceedings](https://csrc.nist.gov/files/pubs/conference/1981/08/10/proceedings-4th-seminar-dod-computer-security-init/final/docs/1981-4th-seminar-proceedings.pdf) | August 1981 | strong prior-art relationship | Separates capability acquisition, hardware mapping, later use, transfer, unmapping, and release across a mapping lifecycle. | ASPECT-001, ASPECT-002, ASPECT-003 | PRV-20260828-001-E0051 | CHRON-024 | High |
| W. E. Boebert and R. Y. Kain, "A Practical Alternative to Hierarchical Integrity Policies" | [NIST proceedings](https://csrc.nist.gov/files/pubs/conference/1985/09/30/proceedings-8th-national-computer-security-confere/final/docs/1985-8th-ncsc-proceedings.pdf) | 1985 | strong prior-art relationship | Establishes Type Enforcement and successive policy narrowing before MMU enforcement. | ASPECT-001, ASPECT-003 | PRV-20260828-001-E0016 | CHRON-007 | High |
| Richard Y. Kain and Carl E. Landwehr, "On Access Checking in Capability-Based Systems" | [Author copy](https://www.landwehr.org/1987landwehr-kain-ieeetse.pdf) | February 1987 | strong prior-art relationship | Separates capability preparation and reachability from later use authority. | ASPECT-001, ASPECT-002, ASPECT-003 | PRV-20260828-001-E0017 | CHRON-008 | High |
| Todd Fine and Spencer E. Minear, "Assuring Distributed Trusted Mach" | [IEEE paper](https://conferences.computer.org/sp/pdfs/sp/1993/00044168.pdf) | May 1993 | strong prior-art relationship | Separates possession of a port right from policy-authorized use, transfer, or mapping-purpose operation. | ASPECT-001, ASPECT-002 | PRV-20260828-001-E0018 | CHRON-009 | High |
| Spencer E. Minear, "Providing Policy Control Over Object Operations in a Mach Based System" | [USENIX paper](https://www-old.cs.utah.edu/flux/fluke/html/dtos/DOCs/usenix95.pdf) | June 1995 | strong prior-art relationship | Shows policy-derived access vectors and fail-closed handling when current permission information is unavailable. | ASPECT-002, ASPECT-003 | PRV-20260828-001-E0019 | CHRON-010 | High |
| Ray Spencer et al., "The Flask Security Architecture" | [USENIX publication](https://www.usenix.org/conference/8th-usenix-security-symposium/flask-security-architecture-system-support-diverse-security) | August 1999 | strong prior-art relationship | Establishes the TE tuple, requested permission sets, connection controls, and object-reference relationships used for mapping or export. | ASPECT-001, ASPECT-002, ASPECT-003 | PRV-20260828-001-E0020 | CHRON-011 | High |
| O. Sami Saydjari, "LOCK: An Historical Perspective" | [ACSAC paper](https://www.acsac.org/2002/papers/classic-lock.pdf) | 2002 | strong prior-art relationship | Documents policy-derived current rights loaded into MMU tables for hardware enforcement. | ASPECT-003 | PRV-20260828-001-E0021 | CHRON-012 | High |
| Linux SELinux `map` permission | [Linux commit](https://github.com/torvalds/linux/commit/3ba4bf5f1e2c58bddd84ba27c5aeaf8ca1d36bff) | 2017-05-23 | strong prior-art relationship | Independently gates creation of a memory mapping separately from later read or write operations. | ASPECT-001, ASPECT-002 | PRV-20260828-001-E0024 | CHRON-015 | High |
| RISC-V Supervisor Domains Access Protection, SmMTT v0.49 | [Canonical release](https://github.com/riscv/riscv-smmtt/releases/tag/v0.49) | v0.49, 2026-01-15 | strong prior-art relationship | Provides layered, conjunctive, fail-closed hardware authorization across page-table, PMP, and MPT checks. | ASPECT-003 | PRV-20260828-001-E0026 | CHRON-016 | High |
| TrustedBSD MAC Framework | [USENIX publication](https://www.usenix.org/conference/2003-usenix-annual-technical-conference/trustedbsd-mac-framework-extensible-kernel-access) | June 2003 | adjacent precedent | Demonstrates restrictive composition in which any active policy can deny, but not one-rule TE non-composition. | ASPECT-003 | PRV-20260828-001-E0052 | CHRON-025, CHRON-036 | High |
| Capsicum: Practical Capabilities for UNIX | [USENIX paper](https://www.usenix.org/events/sec10/tech/full_papers/Watson.pdf) | 2010-08-11 | adjacent precedent | Requires complete descriptor rights for operations, while capability possession itself is authority. | ASPECT-002, ASPECT-003 | PRV-20260828-001-E0072 | CHRON-036 | High |
| seL4 VSpace mapping authority | [seL4 13.0.0 manual source](https://github.com/seL4/seL4/blob/13.0.0/manual/parts/vspace.tex) | 13.0.0, 2024-07-01 | adjacent precedent | Uses mapping capabilities and selected rights but may silently downgrade excessive requests. | ASPECT-001, ASPECT-002, ASPECT-003 | PRV-20260828-001-E0061 | CHRON-031, CHRON-037 | High |
| CHERI Instruction-Set Architecture | [CHERI ISA v9](https://www.cl.cam.ac.uk/techreports/UCAM-CL-TR-987.pdf) | Version 9, September 2023 | adjacent precedent | Supplies tagged, bounded, permission-bearing capabilities and monotonic authority reduction alongside paging. | ASPECT-002, ASPECT-003 | PRV-20260828-001-E0062 | CHRON-032, CHRON-037 | High |
| Petroni et al., semantic-integrity monitoring | [USENIX publication](https://www.usenix.org/conference/15th-usenix-security-symposium/architecture-specification-based-detection-semantic) | July 2006 | adjacent precedent | Asynchronously compares protected policy-derived masks with live SELinux AVC state, but does not mediate mapping installation or fail stop immediately. | ASPECT-003 | PRV-20260828-001-E0124 | CHRON-026, CHRON-046 | High |

## PRIOR-ART-ITERATION-001

- Date: 2026-08-29
- Supersedes: None
- Change reason: Created the required human-readable prior-art projection from the completed review's existing admitted evidence and classifications.
- Bottom line: Helium's selected mechanisms sit in a well-established lineage of Type Enforcement, relationship or mapping authority, and policy-derived hardware enforcement, while the exact target combination remains unresolved.
- Implementation lineage: Verified internal lineage is limited to exact fixed Sv39x4, validation, table-initialization, root-encoding, map-validation, and generic runtime or trap lines inherited from Beryllium `cc6029a` by `511187f`; predecessor concepts are documented context, not inherited-code claims.
- Documented influence: The target explicitly identifies Flask and SELinux vocabulary and model influence; same-checkpoint Beryllium records cite Xen XSM/FLASK and RISC-V as Medium-confidence framing or architectural background.
- Distinct or unresolved: Exact `OPEN` terminology and no-PTE representation, one-rule TE non-composition, policy-denial-plus-absent-mapping, direct Beryllium-to-standalone transfer, and exact post-install G-stage readback with terminal divergence handling remain unresolved.
- Credit framing: Credit predecessors only for specific supported contributions. Credit James Morris for the Beryllium implementation and standalone snapshot authorship/commit integration; preserve the Copilot co-authorship disclosure without inferring contribution shares, and leave underlying standalone line authorship and conceptual origin unresolved.
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Evidence IDs: PRV-20260828-001-E0011, PRV-20260828-001-E0012, PRV-20260828-001-E0013, PRV-20260828-001-E0016, PRV-20260828-001-E0017, PRV-20260828-001-E0018, PRV-20260828-001-E0019, PRV-20260828-001-E0020, PRV-20260828-001-E0021, PRV-20260828-001-E0023, PRV-20260828-001-E0024, PRV-20260828-001-E0025, PRV-20260828-001-E0026, PRV-20260828-001-E0039, PRV-20260828-001-E0051, PRV-20260828-001-E0052, PRV-20260828-001-E0061, PRV-20260828-001-E0062, PRV-20260828-001-E0072, PRV-20260828-001-E0076, PRV-20260828-001-E0105, PRV-20260828-001-E0106, PRV-20260828-001-E0107, PRV-20260828-001-E0109, PRV-20260828-001-E0110, PRV-20260828-001-E0112, PRV-20260828-001-E0114, PRV-20260828-001-E0115, PRV-20260828-001-E0118, PRV-20260828-001-E0124
- Chronology IDs: CHRON-004, CHRON-007, CHRON-008, CHRON-009, CHRON-010, CHRON-011, CHRON-012, CHRON-013, CHRON-014, CHRON-015, CHRON-016, CHRON-018, CHRON-019, CHRON-021, CHRON-023, CHRON-024, CHRON-025, CHRON-026, CHRON-031, CHRON-032, CHRON-036, CHRON-037, CHRON-043, CHRON-044, CHRON-046
- Confidence: High
- Evidence basis: Exact isolated Git ancestry and blame establish bounded implementation lineage; explicit target records establish influence; primary publications, specifications, commits, manuals, and archives establish chronology and relationship classes.
- Alternatives/counter-evidence: SELinux permission accumulation and ordinary `open`, capability possession as authority, seL4 downgrade, Xen permissive mode, and pKVM or Xen state divergence weaken claims that the target's exact combination is inherited or generic.
- Limitations: No admitted evidence proves conceptual origin, direct cross-repository transfer, exact source identity across repositories, or novelty; inaccessible and bounded negative searches leave closer predecessors possible. The capture has exact helper isolation but no per-output invocation, status, byte-count, and SHA-256 attestation.
- Administrative: no
