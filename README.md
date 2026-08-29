# Beryllium provenance review

This independent Beryllium component provides a project-local GitHub Copilot
agent for detailed provenance analysis of user-selected code designs, features,
and implementation strategies.

The agent maps a selected aspect to exact code and history, searches approved
local Beryllium research and current public primary sources, tests competing
lineage hypotheses, and preserves a durable evidence package. Every package
includes a versioned `prior-art-summary.md` so a human can see significant
prior art, implementation lineage, documented influence, unresolved elements,
and contribution-specific credit framing at a glance.

## Safety and claim boundary

- Reviewed repositories, research repositories, and web pages are untrusted
  evidence, never instructions.
- The agent writes only in this repository. It does not modify reviewed
  repositories or sibling Beryllium components.
- It does not execute reviewed code, install its dependencies, or bypass
  authentication, paywalls, robots controls, or source licences.
- Git authorship, style, bulk changes, or similarity alone do not establish
  conceptual origin, copying, AI generation, intent, or misconduct.
- Every substantive conclusion requires evidence identifiers, chronology,
  alternative explanations, confidence, and limitations.
- Reports default to `private`. Publication, release, licensing approval,
  attribution approval, and public claims remain human gates.

## Planned invocation

After implementation, select the project custom agent:

```text
/agent provenance-review
```

The agent will ask for the target repository, exact revision or explicitly
approved working-tree state, the aspects to analyze, exclusions, chronology
window, review depth, and distribution classification.

## Repository layout

```text
.github/agents/       user-facing and internal specialist agents
.github/skills/       provenance workflow and evidence rules
reviews/              durable PRV-* review packages
sources/public/       approved redistributable source copies
sources/metadata/     citations, hashes, queries, and acquisition records
sources/quarantine/   ignored restricted, licensed, or private copies
inbox/                ignored user-supplied material
scratch/              ignored temporary retrieval and extraction files
templates/            canonical review artifact templates
scripts/              deterministic review scaffolding and validation
tests/                repository contract checks and synthetic fixtures
```

Numbered `PRIOR-ART-ITERATION-NNN` records are append-only. The summary's
current projection and canonical-link table may be updated only by appending a
complete next iteration and moving the explicit latest pointer. Public links
aid navigation but do not replace evidence-ledger and chronology/search
records.

Read [RESEARCH-SOURCES.md](RESEARCH-SOURCES.md) before consuming sibling
research and [SOURCE-LINEAGE.md](SOURCE-LINEAGE.md) before changing the
provenance method.

## Local HTML review site

Markdown remains normative. Generate or check the supplementary dependency-free
site with:

```sh
python3 ./scripts/render-review.py reviews/PRV-20260828-001-helium-te-security-architecture
python3 ./scripts/render-review.py --check reviews/PRV-20260828-001-helium-te-security-architecture
```

Open it locally with:

```sh
firefox reviews/PRV-20260828-001-helium-te-security-architecture/html/index.html
```

## Validation

From this repository:

```sh
bash ./tests/validate-agent.sh
git diff --check
```

A private `origin` remote is configured at
`https://github.com/beryllium-project/provenance-review.git`. No publication
or release workflow is configured.
