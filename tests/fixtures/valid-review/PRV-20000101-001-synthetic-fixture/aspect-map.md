# Synthetic Fixture - Aspect Map

Review ID: `PRV-20000101-001`
Short name: `synthetic-fixture`
Distribution: `private`
Intended distribution: `private`
Created: `2000-01-01`
Status: `Complete`

## ASPECT-001

- Title: Fictional boundary marker
- Description: A synthetic marker used to exercise deterministic evidence linkage.
- Code paths/symbols: target://synthetic-fixture/marker.txt symbol fixture_boundary
- Behavior/claims: The marker exists only as test data.
- Dependencies: No external dependencies.
- Tests/documentation: tests/validate-agent.sh and this fixture package.
- Evidence IDs: PRV-20000101-001-E0002, PRV-20000101-001-E0003
- Confidence: High
- Evidence basis: The fixture defines both records directly.
- Alternatives/counter-evidence: A different marker could exercise the same validator.
- Limitations: The aspect has no implementation or provenance significance.
