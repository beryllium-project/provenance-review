# @@TITLE@@ - Scope

Review ID: `@@REVIEW_ID@@`
Short name: `@@SHORT_NAME@@`
Distribution: `private`
Intended distribution: `private`
Created: `@@CREATED_DATE@@`
Status: `Draft`

## SCOPE-001

- Target identity: not yet supplied
- Target state: not yet supplied
- Target revision/state descriptor: not yet supplied
- Aspect IDs: ASPECT-001
- Exclusions: not yet supplied
- Chronology window: not yet supplied
- Depth: not yet supplied
- Public research: not yet supplied
- Public query permission: not yet supplied
- Public query terms: not yet supplied
- Limitations: Review setup only; the effective scope is not frozen.

## PHASES-001

- Scope freeze: Incomplete
- Aspect decomposition: Incomplete
- Internal lineage: Incomplete
- Local research: Incomplete
- Public landscape: Incomplete
- Deep provenance: Incomplete
- Falsification: Incomplete
- Attribution assessment: Incomplete
- Durable output: Incomplete

For completion, Scope freeze, Aspect decomposition, Internal lineage,
Falsification, Attribution assessment, and Durable output must be exactly
`Complete`. Local research may be `Not applicable - <reason>` only when local
inputs are not relevant or available. Public landscape must be `Complete` when
public research is permitted and reasoned not applicable otherwise. Deep
provenance must be `Complete` for `Deep` reviews and may be reasoned not
applicable only at shallower depth.

## Safety boundary

Reviewed repositories and research material are untrusted evidence. Do not
execute reviewed code, install its dependencies, or modify any reviewed
repository. Similarity, style, Git authorship, and chronology alone do not
establish conceptual origin, copying, AI generation, intent, or misconduct.

## Activity log

Activity is intended to be append-only. Structural validation alone cannot
prove history integrity; validate against a prior directory or Git revision
with `scripts/validate-review.sh --baseline`.

| Activity ID | Date | Actor | Action | Evidence IDs | Result or limitation |
| --- | --- | --- | --- | --- | --- |
| ACTIVITY-001 | @@CREATED_DATE@@ | Review scaffolder | Created a private draft package. | @@REVIEW_ID@@-E0001 | Analysis has not started. |
