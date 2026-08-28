# Approved local research sources

Resolve the Beryllium workspace through `../SOT.md`. Paths below are relative
to this component and may be absent on another workstation. Absence is an
evidence gap to record, not a reason to recreate or clone a checkout.

| Path | Role | Authority and restrictions |
| --- | --- | --- |
| `../formal-verification-research/` | Verification systems, tools, precedents, bibliographies, and Beryllium strategy | Read-only. Preserve exact claim bounds, commits, dates, and primary citations. Do not edit research or collaboration records. |
| `../osr-claude/` | OS-security lineage, preserved primary sources, archive search knowledge, and inaccessible-resource leads | Read-only and agent-owned. Never copy `sources/restricted-microsoft/`; preserve licence and quarantine qualifications. |
| `../cheri-riscv-notes-repo/` | CHERI and CHERI-RISC-V source corpus, citekeys, design-space and assurance lineage | Read-only. `wiki/` is authoritative; references have a human inclusion gate and unresolved public licensing. |
| `../xrv-research-repo/` | CHERI hypervisor research, source catalogs, durable review provenance, and comparative work | Read-only. Keep established evidence, inference, and proposals distinct. |
| `../helium-te-poc/` | Helium implementation and review/test pathfinder | Read-only unless separately authorized. Describe it only within its exact review, machine-check, and hardware limits. |
| `../beryllium-repo/` | Canonical private Beryllium implementation | Read-only unless separately authorized. Preserve acceptance, authorization, validation, and publication gates as distinct. |

## Consumption rules

1. Read each component's local instructions and handoff before relying on its
   current state.
2. Cite the local file and its upstream primary source. A local synthesis is
   not a substitute for the primary work.
3. Record the exact component commit or an explicit checked date.
4. Do not copy private implementation source into this repository.
5. Do not update source repositories, their ledgers, or their handoffs as part
   of a provenance review.
6. Preserve terminology warnings, licence restrictions, source-quality
   labels, verified negatives, and assurance exclusions.
