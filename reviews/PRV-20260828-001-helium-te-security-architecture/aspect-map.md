# Helium TE PoC security architecture provenance - Aspect Map

Review ID: `PRV-20260828-001`
Short name: `helium-te-security-architecture`
Distribution: `private`
Intended distribution: `public-candidate`
Created: `2026-08-28`
Status: `Complete`

## ASPECT-001

- Title: Policy-only `OPEN` permission
- Description: Determine the provenance of the permission that authorizes
  initial G-stage exposure while remaining deliberately absent from hardware
  PTE permission bits.
- Code paths/symbols: `target://helium-te-poc/include/he/te.h` lines 33-48 `HE_TE_PERMISSION_OPEN`; `target://helium-te-poc/src/policy/te.c` lines 33-81 fixed rules; `target://helium-te-poc/src/main.c` lines 142-176 `he_mapping_permissions()`; `target://helium-te-poc/include/he/memory.h` lines 54-90 and `target://helium-te-poc/src/memory.c` lines 201-272 G-stage boundary; pre-standalone counterparts at `workspace://beryllium-repo/pathfinder/include/be/te.h@511187f9d1f44c322e3a4a11347584fd8a20dc72`, `pathfinder/src/policy/te.c@511187f9d1f44c322e3a4a11347584fd8a20dc72`, `pathfinder/src/main.c@511187f9d1f44c322e3a4a11347584fd8a20dc72`, and `pathfinder/src/memory.c@511187f9d1f44c322e3a4a11347584fd8a20dc72`.
- Behavior/claims: `OPEN` is required before a resource can be installed in a
  subject's G-stage root. It is queried independently, never encoded as a PTE
  bit, and is followed by derivation of the R/W/X subset.
- Dependencies: Sealed TE labels, the fixed allow-rule table, exact-rule
  authorization, runtime mapping derivation, and bounded G-stage leaf
  construction.
- Tests/documentation: `target://helium-te-poc/docs/concepts.md` lines 103-125; `target://helium-te-poc/docs/architecture.md` lines 45-53; `target://helium-te-poc/tests/unit/test_main.c` lines 189-262, 303-339, and 449-464; `workspace://beryllium-repo/planning/type-enforcement-pathfinder-plan.md@511187f9d1f44c322e3a4a11347584fd8a20dc72` and `workspace://beryllium-repo/planning/type-enforcement-pathfinder-evidence.md@511187f9d1f44c322e3a4a11347584fd8a20dc72`.
- Evidence IDs: PRV-20260828-001-E0003, PRV-20260828-001-E0004, PRV-20260828-001-E0007, PRV-20260828-001-E0009, PRV-20260828-001-E0016, PRV-20260828-001-E0017, PRV-20260828-001-E0018, PRV-20260828-001-E0020, PRV-20260828-001-E0023, PRV-20260828-001-E0024, PRV-20260828-001-E0027, PRV-20260828-001-E0039, PRV-20260828-001-E0040, PRV-20260828-001-E0051, PRV-20260828-001-E0061, PRV-20260828-001-E0071, PRV-20260828-001-E0073, PRV-20260828-001-E0075, PRV-20260828-001-E0083, PRV-20260828-001-E0084, PRV-20260828-001-E0100, PRV-20260828-001-E0107, PRV-20260828-001-E0108, PRV-20260828-001-E0109, PRV-20260828-001-E0110, PRV-20260828-001-E0112, PRV-20260828-001-E0115
- Confidence: High
- Evidence basis: Exact code, interface, documentation, and unit-test
  locators establish the frozen behavior; pre-cutoff Beryllium history places
  the same selected mechanism at `511187f`, directly after the minimal
  pathfinder.
- Alternatives/counter-evidence: Similar names or two-stage permission models
  may arise independently. Target documentation's FLASK/SELinux comparison is
  project-controlled and does not by itself establish derivation.
- Limitations: Final assessment is documented influence for the broad
  FLASK/SELinux TE tuple and a strong prior-art relationship for separate
  mapping authority, while the exact `OPEN` name, no-PTE representation, and
  Beryllium-to-standalone transfer remain unresolved. Capsicum, FreeBSD
  maximum permissions, Xen FLASK, pKVM, seL4, LDoms, VBS, and ESXi strengthen
  the broad prior art; no compliant source establishes the exact formulation.
  `Open` also collides with ordinary file, network, and availability
  terminology.

## ASPECT-002

- Title: Separated exposure authority
- Description: Determine the provenance of treating authority to expose or
  map an object as separate from authority to read, write, or execute it, and
  of requiring both policy denial and mapping absence for selected private
  resources.
- Code paths/symbols: `target://helium-te-poc/include/he/te.h` lines 33-48 separate exposure and access permissions; `target://helium-te-poc/src/main.c` lines 142-221 `he_mapping_permissions()` and `he_require_private_denial()`; `target://helium-te-poc/src/memory.c` lines 201-272 R/W/X-only hardware mapping; pre-standalone predecessor at `workspace://beryllium-repo/pathfinder/src/main.c@511187f9d1f44c322e3a4a11347584fd8a20dc72` lines 196-255 and 364-417 and `workspace://beryllium-repo/pathfinder/src/memory.c@511187f9d1f44c322e3a4a11347584fd8a20dc72` lines 128-197.
- Behavior/claims: Exposure authority is a policy decision that gates whether
  a leaf may exist. Access authority controls the leaf's R/W/X bits. For
  cross-private resources the initialized state must show both a denied
  `OPEN|READ` request and no installed leaf.
- Dependencies: ASPECT-001, exact complete-request rule matching, G-stage
  presence checks, fixed resource identities, and the initialization-time
  root construction path.
- Tests/documentation: `target://helium-te-poc/docs/concepts.md` lines 113-125; `target://helium-te-poc/docs/architecture.md` boot step 8, policy-to-hardware seam, and cross-private denial; `target://helium-te-poc/docs/security-and-limits.md` lines 154-163; Beryllium minimal and TE pathfinder plan/evidence at `cc6029a` and `511187f`; retained target agent reviews as untrusted leads.
- Evidence IDs: PRV-20260828-001-E0003, PRV-20260828-001-E0004, PRV-20260828-001-E0007, PRV-20260828-001-E0009, PRV-20260828-001-E0017, PRV-20260828-001-E0018, PRV-20260828-001-E0019, PRV-20260828-001-E0020, PRV-20260828-001-E0024, PRV-20260828-001-E0027, PRV-20260828-001-E0039, PRV-20260828-001-E0051, PRV-20260828-001-E0061, PRV-20260828-001-E0062, PRV-20260828-001-E0071, PRV-20260828-001-E0072, PRV-20260828-001-E0075, PRV-20260828-001-E0077, PRV-20260828-001-E0078, PRV-20260828-001-E0079, PRV-20260828-001-E0080, PRV-20260828-001-E0081, PRV-20260828-001-E0082, PRV-20260828-001-E0083, PRV-20260828-001-E0084, PRV-20260828-001-E0100, PRV-20260828-001-E0105, PRV-20260828-001-E0106, PRV-20260828-001-E0107, PRV-20260828-001-E0109, PRV-20260828-001-E0112, PRV-20260828-001-E0115, PRV-20260828-001-E0116, PRV-20260828-001-E0119
- Confidence: High
- Evidence basis: The frozen implementation and maintained documentation
  explicitly separate the policy-only exposure gate from hardware access
  bits and pair private-resource policy denial with mapping absence.
- Alternatives/counter-evidence: The phrase `exposure authority` may be target
  terminology for a common map-versus-use distinction. Similarity alone will
  not establish influence.
- Limitations: Final assessment is a strong prior-art relationship for
  separating relationship or mapping authority from later use, with only
  adjacent precedent for the target's policy-denial-plus-absent-mapping
  invariant. Beryllium `511187f` is a close internal predecessor, but direct
  transfer into standalone Helium is unresolved. Capability systems also show
  that possession of a valid rights-bearing capability may intentionally be
  authority. No specific external influence or affirmative independent
  convergence is verified.

## ASPECT-003

- Title: Dual permission derivation with fail-closed reconciliation
- Description: Determine the provenance of deriving access one bit at a time,
  requiring one rule to grant the complete `OPEN|R/W/X` result, encoding only
  R/W/X in hardware, and terminating when policy and the resulting G-stage
  permissions diverge.
- Code paths/symbols: `target://helium-te-poc/src/te.c` lines 7-12 and 139-181 exact complete-request authorization; `target://helium-te-poc/src/policy/te.c` lines 33-81 and 112-118 complete rule sets; `target://helium-te-poc/src/main.c` lines 142-204 per-bit derivation, full-set authorization, installation, and reconciliation; `target://helium-te-poc/src/memory.c` lines 201-272 hardware-side validation and inspection; pre-standalone counterparts at `workspace://beryllium-repo/pathfinder/src/te.c@511187f9d1f44c322e3a4a11347584fd8a20dc72`, `workspace://beryllium-repo/pathfinder/src/policy/te.c@511187f9d1f44c322e3a4a11347584fd8a20dc72`, `workspace://beryllium-repo/pathfinder/src/main.c@511187f9d1f44c322e3a4a11347584fd8a20dc72`, and `workspace://beryllium-repo/pathfinder/src/memory.c@511187f9d1f44c322e3a4a11347584fd8a20dc72`.
- Behavior/claims: No mapping is produced when `OPEN` is absent, when no R/W/X
  bit is granted, when write lacks read, when the complete set is not granted
  by one rule, when G-stage rejects the leaf, or when any policy decision and
  hardware permission disagree. Multiple partial policy rules cannot be
  composed into broader authority.
- Dependencies: ASPECT-001, ASPECT-002, sealed labels, per-decision rule
  validation, fixed policy rules, valid G-stage topology, and terminal
  `he_fail()` behavior.
- Tests/documentation: `target://helium-te-poc/docs/concepts.md` lines 103-125; `target://helium-te-poc/docs/architecture.md` lines 45-53 and policy seam; `target://helium-te-poc/docs/security-and-limits.md` lines 154-163; `target://helium-te-poc/tests/unit/test_main.c` lines 189-262, 303-339, and 392-464; retained target agent reviews as untrusted leads.
- Evidence IDs: PRV-20260828-001-E0004, PRV-20260828-001-E0005, PRV-20260828-001-E0007, PRV-20260828-001-E0009, PRV-20260828-001-E0016, PRV-20260828-001-E0017, PRV-20260828-001-E0019, PRV-20260828-001-E0020, PRV-20260828-001-E0021, PRV-20260828-001-E0022, PRV-20260828-001-E0025, PRV-20260828-001-E0026, PRV-20260828-001-E0027, PRV-20260828-001-E0039, PRV-20260828-001-E0040, PRV-20260828-001-E0051, PRV-20260828-001-E0052, PRV-20260828-001-E0056, PRV-20260828-001-E0061, PRV-20260828-001-E0062, PRV-20260828-001-E0070, PRV-20260828-001-E0071, PRV-20260828-001-E0072, PRV-20260828-001-E0073, PRV-20260828-001-E0075, PRV-20260828-001-E0076, PRV-20260828-001-E0079, PRV-20260828-001-E0083, PRV-20260828-001-E0105, PRV-20260828-001-E0106, PRV-20260828-001-E0107, PRV-20260828-001-E0108, PRV-20260828-001-E0109, PRV-20260828-001-E0110, PRV-20260828-001-E0111, PRV-20260828-001-E0113, PRV-20260828-001-E0115, PRV-20260828-001-E0117, PRV-20260828-001-E0118, PRV-20260828-001-E0120, PRV-20260828-001-E0124
- Confidence: High
- Evidence basis: The exact frozen code and tests establish the sequence of
  authorization, validation, encoding, inspection, and terminal failure.
- Alternatives/counter-evidence: The full-set check and post-encoding
  comparison may be ordinary defensive programming or independently
  convergent high-assurance practice rather than source-specific lineage.
- Limitations: `Dual permission derivation` is a review label, not an exact
  target identifier. Beryllium `511187f` is the earliest supported internal
  implementation. Final assessment is verified lineage for inherited minimal
  scaffolding, strong prior art for broad policy-derived enforcement,
  adjacent asynchronous live-AVC consistency monitoring and complete-grant
  precedent, and
  unresolved origin for one-rule TE non-composition, direct standalone
  transfer, and exact post-install policy-to-G-stage readback. SELinux
  accumulation, seL4 rights downgrade, and Xen permissive default are material
  counter-evidence to universal claims.
