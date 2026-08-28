# Durable provenance review packages

Real reviews live in this directory as:

```text
PRV-YYYYMMDD-NNN-short-name/
```

The date is the UTC creation date, `NNN` is a repository-wide sequence for
that date regardless of slug, and `short-name` is a lowercase hyphenated slug.
Use `scripts/new-review.sh <short-name> <title>` rather than creating package
directories manually. Allocation is serialized by a short-lived
repository-local lock and refuses collisions with every existing
`reviews/PRV-YYYYMMDD-NNN-*` directory. The lock records a token, PID, and UTC
acquisition time. Ownership is checked before cleanup, and an atomically
claimed lock older than two minutes may be reclaimed even if its PID was
reused.

Every generated package starts with:

```text
Distribution: private
Intended distribution: private
Status: Draft
```

An untouched scaffold is valid only with:

```sh
bash scripts/validate-review.sh --draft reviews/PRV-YYYYMMDD-NNN-short-name
```

Default validation is completion validation. Promotion to `internal` or
`public-candidate` is a separate human-recorded action; neither classification
is publication, licensing, release, attribution, or sign-off approval.
Promoted completed packages must check every promotion prerequisite and
reference a structured `HUMAN-PROMOTION-NNN` record containing the responsible
human actor and role, UTC timestamp, from/to classifications, `promote`
decision, checklist basis, evidence IDs, and limitations. A bare promotion ID
does not satisfy validation, and publication/licensing/sign-off decisions
remain pending, blocked, or not requested.

Completion phase rules are conditional: the six core phases must be exactly
`Complete`; local research may be reasoned not applicable only when local
inputs are unavailable or irrelevant; public landscape follows the explicit
public-research permission; and Deep provenance is mandatory at `Deep` depth.

Evidence uses review-scoped stable IDs and records sensitivity separately from
package distribution. Evidence, chronology, search, inaccessible-resource,
report, attribution, and activity records are intended to be append-only.
Structural validation cannot prove historical integrity by itself. Use
`--baseline <prior-directory-or-git-ref>` or inspect Git history when validating
an updated package.
