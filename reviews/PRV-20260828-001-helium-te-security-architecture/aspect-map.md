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
- Code paths/symbols: `target://helium-te-poc/include/he/te.h` lines 33-48 `HE_TE_PERMISSION_OPEN`; `target://helium-te-poc/src/policy/te.c` lines 33-81 fixed rules; `target://helium-te-poc/src/main.c` lines 142-176 `he_mapping_permissions()`; `target://helium-te-poc/include/he/memory.h` lines 54-90 and `target://helium-te-poc/src/memory.c` lines 201-272 G-stage boundary.
- Behavior/claims: `OPEN` is required before a resource can be installed in a
  subject's G-stage root. It is queried independently, never encoded as a PTE
  bit, and is followed by derivation of the R/W/X subset.
- Dependencies: Sealed TE labels, the fixed allow-rule table, exact-rule
  authorization, runtime mapping derivation, and bounded G-stage leaf
  construction.
- Tests/documentation: `target://helium-te-poc/docs/concepts.md` lines 103-125; `target://helium-te-poc/docs/architecture.md` lines 45-53; `target://helium-te-poc/tests/unit/test_main.c` lines 189-262, 303-339, and 449-464.
- Evidence IDs: PRV-20260828-001-E0003, PRV-20260828-001-E0004, PRV-20260828-001-E0007, PRV-20260828-001-E0009, PRV-20260828-001-E0016, PRV-20260828-001-E0017, PRV-20260828-001-E0018, PRV-20260828-001-E0020, PRV-20260828-001-E0023, PRV-20260828-001-E0024, PRV-20260828-001-E0027, PRV-20260828-001-E0039, PRV-20260828-001-E0040
- Confidence: High
- Evidence basis: Exact code, interface, documentation, and unit-test
  locators at the frozen target commit establish the implemented behavior.
- Alternatives/counter-evidence: Similar names or two-stage permission models
  may arise independently. Target documentation's FLASK/SELinux comparison is
  project-controlled and does not by itself establish derivation.
- Limitations: Final assessment is documented influence for the broad
  FLASK/SELinux TE tuple and a strong prior-art relationship for separate
  mapping authority, while the exact `OPEN` name, no-PTE representation, and
  target transfer relationship remain unresolved. `Open` also collides with
  ordinary file, network, and availability terminology.

## ASPECT-002

- Title: Separated exposure authority
- Description: Determine the provenance of treating authority to expose or
  map an object as separate from authority to read, write, or execute it, and
  of requiring both policy denial and mapping absence for selected private
  resources.
- Code paths/symbols: `target://helium-te-poc/include/he/te.h` lines 33-48 separate exposure and access permissions; `target://helium-te-poc/src/main.c` lines 142-221 `he_mapping_permissions()` and `he_require_private_denial()`; `target://helium-te-poc/src/memory.c` lines 201-272 R/W/X-only hardware mapping.
- Behavior/claims: Exposure authority is a policy decision that gates whether
  a leaf may exist. Access authority controls the leaf's R/W/X bits. For
  cross-private resources the initialized state must show both a denied
  `OPEN|READ` request and no installed leaf.
- Dependencies: ASPECT-001, exact complete-request rule matching, G-stage
  presence checks, fixed resource identities, and the initialization-time
  root construction path.
- Tests/documentation: `target://helium-te-poc/docs/concepts.md` lines 113-125; `target://helium-te-poc/docs/architecture.md` boot step 8, policy-to-hardware seam, and cross-private denial; `target://helium-te-poc/docs/security-and-limits.md` lines 154-163; retained `target://helium-te-poc/agent-review/` files as untrusted leads.
- Evidence IDs: PRV-20260828-001-E0003, PRV-20260828-001-E0004, PRV-20260828-001-E0007, PRV-20260828-001-E0009, PRV-20260828-001-E0017, PRV-20260828-001-E0018, PRV-20260828-001-E0019, PRV-20260828-001-E0020, PRV-20260828-001-E0024, PRV-20260828-001-E0027, PRV-20260828-001-E0039
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
  invariant. No specific target influence, source transfer, or affirmative
  independent convergence is verified.

## ASPECT-003

- Title: Dual permission derivation with fail-closed reconciliation
- Description: Determine the provenance of deriving access one bit at a time,
  requiring one rule to grant the complete `OPEN|R/W/X` result, encoding only
  R/W/X in hardware, and terminating when policy and the resulting G-stage
  permissions diverge.
- Code paths/symbols: `target://helium-te-poc/src/te.c` lines 7-12 and 139-181 exact complete-request authorization; `target://helium-te-poc/src/policy/te.c` lines 33-81 and 112-118 complete rule sets; `target://helium-te-poc/src/main.c` lines 142-204 per-bit derivation, full-set authorization, installation, and reconciliation; `target://helium-te-poc/src/memory.c` lines 201-272 hardware-side validation and inspection.
- Behavior/claims: No mapping is produced when `OPEN` is absent, when no R/W/X
  bit is granted, when write lacks read, when the complete set is not granted
  by one rule, when G-stage rejects the leaf, or when any policy decision and
  hardware permission disagree. Multiple partial policy rules cannot be
  composed into broader authority.
- Dependencies: ASPECT-001, ASPECT-002, sealed labels, per-decision rule
  validation, fixed policy rules, valid G-stage topology, and terminal
  `he_fail()` behavior.
- Tests/documentation: `target://helium-te-poc/docs/concepts.md` lines 103-125; `target://helium-te-poc/docs/architecture.md` lines 45-53 and policy seam; `target://helium-te-poc/docs/security-and-limits.md` lines 154-163; `target://helium-te-poc/tests/unit/test_main.c` lines 189-262, 303-339, and 392-464; retained target agent reviews as untrusted leads.
- Evidence IDs: PRV-20260828-001-E0004, PRV-20260828-001-E0005, PRV-20260828-001-E0007, PRV-20260828-001-E0009, PRV-20260828-001-E0016, PRV-20260828-001-E0017, PRV-20260828-001-E0019, PRV-20260828-001-E0020, PRV-20260828-001-E0021, PRV-20260828-001-E0022, PRV-20260828-001-E0025, PRV-20260828-001-E0026, PRV-20260828-001-E0027, PRV-20260828-001-E0039, PRV-20260828-001-E0040
- Confidence: High
- Evidence basis: The exact frozen code and tests establish the sequence of
  authorization, validation, encoding, inspection, and terminal failure.
- Alternatives/counter-evidence: The full-set check and post-encoding
  comparison may be ordinary defensive programming or independently
  convergent high-assurance practice rather than source-specific lineage.
- Limitations: `Dual permission derivation` is a review label, not an exact
  target identifier. Final assessment is a strong prior-art relationship for
  broad policy-derived fail-closed hardware permissions, while the one-rule
  complete-request invariant and runtime policy-to-G-stage readback remain
  unresolved. Primary SELinux source contradicts inheritance of one-rule
  non-composition from SELinux.
