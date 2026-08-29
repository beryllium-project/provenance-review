# @@TITLE@@ - Review Handoff

Review ID: `@@REVIEW_ID@@`
Short name: `@@SHORT_NAME@@`
Distribution: `private`
Intended distribution: `private`
Created: `@@CREATED_DATE@@`
Status: `Draft`

## Overall position

The private draft package exists, but target intake and provenance analysis
have not started. No substantive provenance or attribution claim is recorded.

## Blockers

- Target identity, state, aspects, chronology, depth, and research permissions
  are not yet supplied.

## Exact next action

Complete `scope.md`, freeze the effective scope, and validate the in-progress
package with:

```sh
bash scripts/validate-review.sh --draft reviews/@@REVIEW_ID@@-@@SHORT_NAME@@
```

## Continuation paths

- Scope: `scope.md`
- Prior-art summary: `prior-art-summary.md` (`Latest iteration: None`)
- Report: `report.md`
- Evidence ledger: `evidence-ledger.md`
- Search record: `search-log.md`
- Inaccessible resources: `inaccessible-resources.md`

## History integrity

Activity and evidence are intended to be append-only. Structural validation
does not prove this without `--baseline` comparison or Git-history review.
