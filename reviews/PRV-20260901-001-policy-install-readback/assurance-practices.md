# Decision/enforcement assurance practices - Cross-agent input

Review ID: `PRV-20260901-001`
Target: `target://helium-te-poc`
Target revision: `1ab289c066b69acdd8b55c9f77055b0145be1316`
Checked: `2026-09-01`
Distribution: `private`
Intended distribution: `public-candidate`
Status: `Complete`
Latest prior-art projection: `PRIOR-ART-ITERATION-001`

## Purpose

This is a derived, consumer-oriented projection of the completed provenance
review. It adds no evidence, attribution, threat finding, risk decision, or
assurance claim. Consumers should cite the PRV evidence IDs below rather than
copying private source or session content.

Suggested logical locator:

```text
component://provenance-review/reviews/PRV-20260901-001-policy-install-readback/assurance-practices.md
```

Suggested consumer classifications:

- Threat-modeler: `Security or assurance review`, `Design input`, and
  `Assumptions or limits`; use as a delta input, not an authoritative model.
- Analysis workbook: completed PRV first-tier local evidence; use for a
  focused follow-up inquiry without re-running provenance attribution.

## Core findings for consumers

| Label | Finding | Evidence IDs | Consumer significance |
| --- | --- | --- | --- |
| Established | The coding agent planned a pre-entry mapping/denial verification boundary and implemented the policy-to-PTE comparison before independent review. | PRV-20260901-001-E0007, PRV-20260901-001-E0008, PRV-20260901-001-E0009 | Treat the control as an intentional initialization assurance mechanism, not a reviewer-added patch. |
| Established | The control derives policy R/W/X, installs the leaf, rechecks policy and stored PTE permissions, and fails on either over-mapping or under-mapping. | PRV-20260901-001-E0005, PRV-20260901-001-E0012 | Model the control against accidental policy-to-enforcement divergence before subject execution. |
| Established | The mechanism originated in Beryllium commit `511187f9d1f44c322e3a4a11347584fd8a20dc72` and transferred directly into standalone Helium. | PRV-20260901-001-E0006, PRV-20260901-001-E0010 | Existing threat-model provenance assumptions can be updated without claiming conceptual priority. |
| Established | The comparison reads software page-table memory. It is not HGATP CSR readback, a hardware/TLB observation, continuous monitoring, or an independent trust domain. | PRV-20260901-001-E0005, PRV-20260901-001-E0012 | Keep software-state, selector-state, effective-translation, and retained-evidence claims separate. |
| Inferred | The precise per-bit algorithm was selected to realize exact policy-to-PTE correspondence and fail-fast mapping correctness. | PRV-20260901-001-E0007, PRV-20260901-001-E0009 | Use as rationale with Medium confidence; do not present it as hidden agent intent or the sole motive. |
| Unknown | No public source was established as the direct conceptual source of the exact synchronous sequence. | PRV-20260901-001-E0013, PRV-20260901-001-E0017 | Do not claim novelty, independent convergence, or external derivation. |

## Examples of established assurance practices

These examples show constituent practices. None is evidence that the target
copied or was directly influenced by the source.

| Practice and primary source | What the source establishes | Relationship to the target | Evidence IDs |
| --- | --- | --- | --- |
| [NIST SP 800-160 Vol. 1 Rev. 1](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-160v1r1.pdf), 2022 | Separates policy, mechanism, and enforcement concerns; emphasizes mediated access, verifiability, protective failure, and secure-activation checkpoints. | Principle-level rationale for checking an enforcement artifact before activation; not a prescribed PTE algorithm. | PRV-20260901-001-E0014 |
| [DTOS policy control](https://www.usenix.org/legacy/publications/library/proceedings/security95/full_papers/minear.pdf), 1995 | Requires enforcement points to receive current policy-derived permission state, blocks on security faults, and keeps permission checking active during secure startup. | Strong prior art for current-policy enforcement and fail-closed initialization; no post-install PTE decoding. | PRV-20260901-001-E0019 |
| [Flask Security Architecture](https://www.usenix.org/legacy/events/sec99/full_papers/spencer/spencer_html/node14.html), 1999 | Checks policy for each mapped-memory access mode and revalidates after policy change because interface interception alone is insufficient. | Strong mapped-memory enforcement-point and lifecycle precedent; validation occurs at access or policy-change time. | PRV-20260901-001-E0016 |
| [Petroni et al. semantic-integrity monitoring](https://www.usenix.org/conference/15th-usenix-security-symposium/architecture-specification-based-detection-semantic), 2006 | Recomputes policy-derived expectations and compares them with live SELinux AVC enforcement-decision state. | Adjacent policy-versus-live-state comparison; asynchronous and detection-oriented rather than admission-time fail-stop. | PRV-20260901-001-E0015 |
| [LOCK: An Historical Perspective](https://www.acsac.org/2002/papers/classic-lock.pdf), 2002 | Separates an access decider from an MMU enforcer and explicitly identifies privileged policy-to-MMU translation as a trusted seam. | Explains the seam the target checks, while also showing that readback is not universal. | PRV-20260901-001-E0020 |
| [seL4 Enforces Integrity](https://sel4.org/Research/pdfs/sel4-enforces-integrity.pdf), 2011 | Proves concrete protection-state authority remains within an abstract policy bound. | Proof-based alternative to runtime reconciliation. | PRV-20260901-001-E0021 |
| [Translation Validation for a Verified OS Kernel](https://sel4.net/Research/pdfs/translation-validation-verified-os-kernel.pdf), 2013 | Checks the produced binary against the expected source semantics rather than trusting compilation. | Strong analogy for validating a produced artifact after translation, but much broader than R/W/X readback. | PRV-20260901-001-E0022 |

## Threat-model delta candidates

No `THREAT-*`, `CONTROL-*`, `MITIGATION-*`, or risk identifiers are allocated
here. The threat-modeler owns those records.

### Candidate threats or failure modes

| Candidate | Fact status | Description | Evidence IDs |
| --- | --- | --- | --- |
| Incorrect permission translation | Established surface | Policy permits one R/W/X set but the installed leaf contains another because of an encoder, argument, index, or integration defect. | PRV-20260901-001-E0005 |
| Common-mode checker failure | Established limitation | Mapper and readback share the same policy API, PTE constants, compiler, image, memory, and trust domain, allowing correlated faults to agree incorrectly. | PRV-20260901-001-E0012 |
| Post-check mutation | Established limitation | A leaf modified after initialization can escape this one-time reconciliation. | PRV-20260901-001-E0005, PRV-20260901-001-E0012 |
| Check bypass or ordering defect | Inferred threat | Guest entry, root publication, or a later write occurring before successful reconciliation would invalidate the admission invariant. | PRV-20260901-001-E0007, PRV-20260901-001-E0009 |
| Hardware-effective state differs | Established limitation | The software PTE matches policy but hardware, firmware, TLB/cache state, DMA, debug, or physical memory does not enforce that state. | PRV-20260901-001-E0012, PRV-20260901-001-E0023 |
| Future dynamic-policy staleness | Proposed future threat | If labels, policy, roots, or mappings become mutable, cached or installed state may become stale and require lifecycle revalidation. | PRV-20260901-001-E0016, PRV-20260901-001-E0019 |

### Current control and mitigation candidates

| Candidate | Fact status | Description | Evidence IDs |
| --- | --- | --- | --- |
| Post-install R/W/X reconciliation | Established current control | Compare policy and stored leaf permissions after every fixed leaf installation and terminate on inequality. | PRV-20260901-001-E0005 |
| Private-leaf absence and shared asymmetry checks | Established current controls | Require cross-private policy denial plus no mapping and verify writer-RW versus reader-R shared leaves. | PRV-20260901-001-E0005, PRV-20260901-001-E0012 |
| Direct divergence negative test | Proposed mitigation | Add an authorized test seam that corrupts one installed permission and proves the exact terminal branch without changing production defaults. | PRV-20260901-001-E0012 |
| More diverse PTE validator | Proposed mitigation | Decode raw PTE state with separately maintained constants or generated specification data to reduce common-mode agreement. | PRV-20260901-001-E0012 |
| Immutability or later integrity checking | Proposed mitigation | Prevent post-seal table writes or add an independently justified lifecycle check when mappings become dynamic. | PRV-20260901-001-E0016, PRV-20260901-001-E0019 |
| Proof or translation validation | Established alternative practice; proposed target option | Prove policy/protection refinement or validate a produced artifact instead of relying only on runtime readback. | PRV-20260901-001-E0021, PRV-20260901-001-E0022 |
| Independent effective-state evidence | Proposed mitigation | Use separately acquired access/fault traces, hardware results, attestation, or another trust domain when claims extend beyond software table consistency. | PRV-20260901-001-E0012, PRV-20260901-001-E0023 |

## Existing consumer-package updates

### Threat-modeler

Relevant existing package:

```text
component://threat-modeler/models/TM-20260901-001-helium-te-poc/
```

- `OPEN-003` can be advanced: strong constituent prior art now exists for
  current-policy enforcement, mapped-memory validation, policy-to-MMU
  translation, live-state comparison, formal refinement, and translation
  validation. The exact target sequence and source-specific influence remain
  unresolved.
- `OPEN-010` can be advanced from unresolved transfer to verified direct
  implementation lineage, while retaining the missing full-history
  byte-reconstruction limitation.
- Existing policy/PTE controls and threats should retain their current target
  revision and assurance limits. This artifact supplies provenance and
  comparative-control context, not risk acceptance or a replacement model.

### Analysis workbook

Relevant existing session:

```text
component://analysis-workbook/sessions/AWB-20260829-001-post-g-install-readback-use-case/
```

Suggested follow-up questions include:

1. Which future Beryllium threat and lifecycle assumptions justify runtime
   PTE reconciliation rather than proof, translation validation, immutable
   construction, or later monitoring?
2. What independence level is required between policy evaluation, PTE
   construction, PTE decoding, and effective-state observation?
3. Which exact failure classes should a divergence-injection test cover, and
   which common-mode faults remain outside that test?
4. At what lifecycle transition would a fixed initialization check become
   insufficient and require revocation or revalidation?

The workbook should preserve the distinction between software PTE
reconciliation, HGATP selector readback, effective translation behavior, and
evidence-file correspondence.

## Boundaries and limitations

- This artifact is not a threat model, risk ranking, mitigation decision,
  requirement, implementation authorization, or assurance approval.
- `Established`, `Inferred`, `Proposed`, and `Unknown` labels apply only to
  the statements in this projection.
- Helium remains a fixed review-and-test PoC, not formally verified or
  hardware validated.
- No risk is accepted, and no publication, release, or responsible-human
  approval is implied.
- Private implementation and agent-session evidence remain unlinked and must
  be consumed through the cited PRV evidence IDs.
- The package remains private. Public-candidate promotion still requires
  clearance of private and unknown-redistribution dependencies plus a
  responsible-human promotion record.

## Normative provenance paths

- Scope: `scope.md`
- Human-readable lineage: `prior-art-summary.md`
- Findings and falsification: `report.md`
- Evidence records: `evidence-ledger.md`
- Chronology: `chronology.md`
- Public and local query record: `search-log.md`
- Retrieval gaps: `inaccessible-resources.md`
- Distribution gate: `publication-checklist.md`
