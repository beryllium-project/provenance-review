# Synthetic Fixture - Evidence Ledger

Review ID: `PRV-20000101-001`
Short name: `synthetic-fixture`
Distribution: `private`
Intended distribution: `private`
Created: `2000-01-01`
Status: `Complete`

Evidence IDs are stable. Append-only integrity requires baseline or Git-history
comparison in addition to structural validation.

## PRV-20000101-001-E0001

- Status: active
- Aspect IDs: ASPECT-001
- Source type: review metadata
- Evidentiary role: administrative record
- Title/description: Synthetic package creation metadata.
- Canonical locator: review:synthetic-scope
- Logical locator: `scope.md`
- Commit/version/date: 2000-01-01
- Checked date: 2000-01-01
- Precise location: scope.md ACTIVITY-001
- Relationship: Establishes fixture package creation only.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: High
- Evidence basis: Deterministically authored fixture metadata.
- Alternatives/counter-evidence: Package creation does not establish target provenance.
- Limitations: Administrative evidence has no provenance value.
- Sensitivity: private
- Redistribution status: not-applicable
- Licence: not-applicable
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: yes

## PRV-20000101-001-E0002

- Status: active
- Aspect IDs: ASPECT-001
- Source type: target code or tracked target document
- Evidentiary role: direct implementation evidence
- Title/description: Fictional boundary marker target record.
- Canonical locator: fixture:synthetic-boundary-marker
- Logical locator: `target://synthetic-fixture/marker.txt`
- Commit/version/date: synthetic-revision-0001
- Checked date: 2000-01-01
- Precise location: marker.txt line 1 fixture_boundary
- Relationship: Direct synthetic input for OBS-001.
- Source ownership: project-controlled
- Independence: not-independent
- Confidence: High
- Evidence basis: The fixture intentionally defines the marker.
- Alternatives/counter-evidence: The marker may represent arbitrary test text.
- Limitations: It has no evidentiary value outside validator testing.
- Sensitivity: private
- Redistribution status: not-approved
- Licence: fixture-only; no redistribution approval
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no

## PRV-20000101-001-E0003

- Status: active
- Aspect IDs: ASPECT-001
- Source type: user-supplied or inaccessible resource metadata
- Evidentiary role: unresolved lead
- Title/description: Fictional inaccessible resource metadata.
- Canonical locator: https://example.invalid/provenance-fixture
- Logical locator: `inaccessible-resources.md`
- Commit/version/date: fictional-version-1
- Checked date: 2000-01-01
- Precise location: inaccessible-resources.md INACCESSIBLE-001
- Relationship: Exercises inaccessible-resource handling for OBS-002.
- Source ownership: unknown
- Independence: unknown
- Confidence: High
- Evidence basis: The reserved invalid domain intentionally identifies no source.
- Alternatives/counter-evidence: No alternate source exists because the record is fictional.
- Limitations: The record cannot support a real source claim.
- Sensitivity: private
- Redistribution status: not-approved
- Licence: unknown
- Hash: not-applicable
- Supersedes: None
- Superseded by: None
- Administrative: no
