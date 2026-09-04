# Coding agent policy installation readback rationale - Attribution

Review ID: `PRV-20260901-001`
Short name: `policy-install-readback`
Distribution: `private`
Intended distribution: `public-candidate`
Created: `2026-09-01`
Status: `Complete`

## ATTRIBUTION-001

- Classification: verified source lineage
- Specific contribution: The fixed-TE post-install policy-to-G-stage R/W/X comparison and terminal divergence handling transferred from the Beryllium pathfinder into standalone Helium.
- Candidate source or contributor: Beryllium commit `511187f9d1f44c322e3a4a11347584fd8a20dc72`, its recorded James Morris authorship/commit integration, and linked Copilot session/co-authorship record.
- Aspect IDs: ASPECT-001
- Evidence IDs: PRV-20260901-001-E0006, PRV-20260901-001-E0007, PRV-20260901-001-E0010
- Confidence: High
- Evidence basis: Exact first implementation, commit-linked coding session, explicit standalone-extraction instruction and action, sanitization chronology, and blob corroboration.
- Credit recommendation: Credit the Beryllium fixed-TE implementation as the direct source of the standalone mechanism; preserve the recorded James Morris author/committer and Copilot co-author/session metadata without inferring contribution percentages.
- Alternatives/counter-evidence: Flattening, identity refactoring, and later remediation changed repository structure and some file bytes.
- Limitations: Verified transfer does not establish the external conceptual origin of the algorithm.

## ATTRIBUTION-002

- Classification: adjacent precedent
- Specific contribution: General separation of policy decision from enforcement plus verification or reconciliation of security-relevant enforcement state.
- Candidate source or contributor: Minear/DTOS; Spencer et al./Flask; Saydjari/LOCK; Petroni, Fraser, Walters, and Arbaugh; Sewell and coauthors; NIST SP 800-160 Vol. 1 Rev. 1.
- Aspect IDs: ASPECT-001
- Evidence IDs: PRV-20260901-001-E0014, PRV-20260901-001-E0015, PRV-20260901-001-E0016, PRV-20260901-001-E0019, PRV-20260901-001-E0020, PRV-20260901-001-E0021, PRV-20260901-001-E0022
- Confidence: High
- Evidence basis: Primary sources predate the target and support current-policy enforcement, mapped-memory validation, policy-to-MMU derivation, policy/protection refinement, post-translation validation, verifiable mediation, or policy-versus-live-state checking.
- Credit recommendation: Credit these sources only for the broad assurance and consistency patterns they document.
- Alternatives/counter-evidence: None performs the target's exact immediate post-install PTE-bit comparison and terminal boot failure.
- Limitations: No target record names these sources as mechanism-specific influences.

## ATTRIBUTION-003

- Classification: unresolved
- Specific contribution: Exact derive-policy, install-leaf, re-query both sides per bit, and immediately fail-stop sequence.
- Candidate source or contributor: No external source established.
- Aspect IDs: ASPECT-001
- Evidence IDs: PRV-20260901-001-E0009, PRV-20260901-001-E0013, PRV-20260901-001-E0017, PRV-20260901-001-E0020, PRV-20260901-001-E0021, PRV-20260901-001-E0022, PRV-20260901-001-E0023
- Confidence: Medium
- Evidence basis: The project directly documents its rationale, while the earlier deep review and current bounded public queries find only adjacent mechanisms.
- Credit recommendation: Do not claim novelty, independent convergence, or external derivation; describe the exact external conceptual origin as unresolved.
- Alternatives/counter-evidence: The pattern may be ordinary defensive programming, an unrecorded influence, or convergence on a common high-assurance design response; other systems trust translation, prove refinement, monitor later, or tolerate bounded incoherency.
- Limitations: Search coverage and retained session history cannot prove absence.

## Attribution boundary

Credit only the specific contribution supported by primary evidence. Git
authorship, style, bulk changes, chronology, or similarity alone do not prove
conceptual origin, copying, intent, or misconduct.
