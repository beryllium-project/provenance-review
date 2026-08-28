# @@TITLE@@ - Publication Checklist

Review ID: `@@REVIEW_ID@@`
Short name: `@@SHORT_NAME@@`
Distribution: `private`
Intended distribution: `private`
Created: `@@CREATED_DATE@@`
Status: `Draft`

`public-candidate` is a classification, not publication approval. The agent
must never record publication, licensing, sign-off, or responsible-human
approval.

- [ ] Scope and exact target revision are confirmed.
- [ ] Evidence sensitivity and redistribution status are reviewed.
- [ ] Citations, alternatives, chronology, confidence, and limitations are verified.
- [ ] Restricted, private, licensed, and user-supplied material is excluded or cleared.
- [ ] A responsible human has separately reviewed the proposed promotion.

## PUBLICATION-001

- Publication decision: not-requested
- Licensing decision: not-requested
- Sign-off decision: not-requested
- Human promotion record: None
- Aspect IDs: ASPECT-001
- Evidence IDs: @@REVIEW_ID@@-E0001
- Confidence: High
- Evidence basis: New reviews always begin private.
- Alternatives/counter-evidence: A human may later record a separate promotion decision.
- Limitations: This checklist grants no publication, licensing, release, or sign-off approval.

## Structured human promotion contract

A completed package with `Distribution: internal` or
`Distribution: public-candidate` must reference an actual
`HUMAN-PROMOTION-NNN` record in `Human promotion record`. A bare identifier is
invalid. The responsible human adds:

```text
## HUMAN-PROMOTION-NNN

- Actor/role: <responsible human and role>
- UTC timestamp: YYYY-MM-DDTHH:MM:SSZ
- From classification: private|internal
- To classification: internal|public-candidate
- Decision: promote
- Checklist basis: <why every promotion prerequisite is checked>
- Evidence IDs: <review-scoped evidence IDs>
- Limitations: <remaining limits; promotion is not publication approval>
```

The agent must not create this record or mark publication, licensing, or
sign-off approved.
