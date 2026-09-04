# Coding agent policy installation readback rationale - Aspect Map

Review ID: `PRV-20260901-001`
Short name: `policy-install-readback`
Distribution: `private`
Intended distribution: `public-candidate`
Created: `2026-09-01`
Status: `Complete`

## ASPECT-001

- Title: Post-install policy-to-G-stage permission readback
- Description: Determine why the coding agent derived a policy-authorized
  R/W/X set, installed a G-stage leaf, independently queried the resulting
  PTE permission bits, and terminated if policy and installed enforcement
  state differed.
- Code paths/symbols: `target://helium-te-poc/src/main.c` lines 142-204
  `he_mapping_permissions()` and `he_map_or_fail()`;
  `target://helium-te-poc/src/memory.c` lines 201-272
  `he_gstage_map()` and `he_gstage_allows()`; predecessor surfaces at
  `workspace://beryllium-repo/pathfinder/src/main.c@511187f9d1f44c322e3a4a11347584fd8a20dc72`
  and
  `workspace://beryllium-repo/pathfinder/src/memory.c@511187f9d1f44c322e3a4a11347584fd8a20dc72`.
- Behavior/claims: The mechanism treats policy decision state and encoded
  page-table state as separate representations. Initialization fails before
  first VS entry when any individual policy result disagrees with the
  installed leaf's R/W/X bits.
- Dependencies: Sealed fixed TE labels and rules, policy-only `OPEN`,
  complete-request authorization, G-stage leaf encoding, readable page-table
  storage, terminal `he_fail()` behavior, and the fixed boot-time root
  construction sequence.
- Tests/documentation: `target://helium-te-poc/docs/code-tour.md` lines
  225-232; `target://helium-te-poc/docs/security-and-limits.md` lines
  220-230; originating coding session
  `dbbcf000-98cc-4056-a389-e02370d0561b`; standalone extraction sessions
  `dbced89e-8cf1-4d7b-be4c-36fc945704dd` and
  `4a87f405-c6ae-4524-8eea-3ebc2ab3431e`; prior local review
  `workspace://provenance-review/reviews/PRV-20260828-001-helium-te-security-architecture/`.
- Evidence IDs: PRV-20260901-001-E0002, PRV-20260901-001-E0003,
  PRV-20260901-001-E0004, PRV-20260901-001-E0005,
  PRV-20260901-001-E0006, PRV-20260901-001-E0007,
  PRV-20260901-001-E0008, PRV-20260901-001-E0009,
  PRV-20260901-001-E0010, PRV-20260901-001-E0011,
  PRV-20260901-001-E0012, PRV-20260901-001-E0013,
  PRV-20260901-001-E0014, PRV-20260901-001-E0015,
  PRV-20260901-001-E0016, PRV-20260901-001-E0017,
  PRV-20260901-001-E0018, PRV-20260901-001-E0019,
  PRV-20260901-001-E0020, PRV-20260901-001-E0021,
  PRV-20260901-001-E0022, PRV-20260901-001-E0023
- Confidence: High
- Evidence basis: Exact source, isolated Git chronology, timestamped origin
  and extraction sessions, complete available-history audit, prior validated
  review, and public primary sources support the reason and lineage.
- Alternatives/counter-evidence: Ordinary defensive programming or an
  unrecorded source may still explain the exact algorithm. The initial user
  requirement did not prescribe it, and the retained independent review
  followed rather than triggered it.
- Limitations: The check reads stored software PTE state during fixed
  initialization, shares common-mode dependencies with the mapper, is not
  continuous, has no direct maintained divergence negative test, and does not
  establish hardware or formal verification.
