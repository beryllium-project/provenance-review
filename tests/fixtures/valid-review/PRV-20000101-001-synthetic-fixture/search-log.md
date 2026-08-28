# Synthetic Fixture - Search Log

Review ID: `PRV-20000101-001`
Short name: `synthetic-fixture`
Distribution: `private`
Intended distribution: `private`
Created: `2000-01-01`
Status: `Complete`

Search activity is intended to be append-only and should be compared with a
baseline or Git history when historical integrity matters.

## SEARCH-001

- Date: 2000-01-01
- Pass: Synthetic target inspection
- Aspect IDs: ASPECT-001
- Query or action: Locate fixture_boundary in the synthetic target record.
- Sources searched: target://synthetic-fixture/marker.txt
- Result: The intentionally authored marker was located.
- Evidence IDs: PRV-20000101-001-E0002
- Negative result: No independent source was found or expected.
- Terminology collisions: Boundary marker is generic test terminology.
- Limitations: No real repository was searched.

## SEARCH-002

- Date: 2000-01-01
- Pass: Synthetic inaccessible-resource handling
- Aspect IDs: ASPECT-001
- Query or action: Record the reserved invalid-domain locator without network access.
- Sources searched: inaccessible-resources.md
- Result: The resource remains an intentionally inaccessible fixture.
- Evidence IDs: PRV-20000101-001-E0003
- Negative result: No alternate copy exists because the source is fictional.
- Terminology collisions: No collision was identified.
- Limitations: No network request was made.
