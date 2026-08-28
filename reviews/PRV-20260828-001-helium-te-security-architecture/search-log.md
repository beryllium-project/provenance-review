# Helium TE PoC security architecture provenance - Search Log

Review ID: `PRV-20260828-001`
Short name: `helium-te-security-architecture`
Distribution: `private`
Intended distribution: `public-candidate`
Created: `2026-08-28`
Status: `Complete`

Search activity is intended to be append-only. Preserve exact negative
queries, terminology collisions, source dates, and access limitations.

## SEARCH-001

- Date: 2026-08-28
- Pass: Review initialization
- Aspect IDs: ASPECT-001
- Query or action: Recorded the initialization search state before source queries began.
- Sources searched: Repository-generated review metadata.
- Result: At package creation, analysis had not started; SEARCH-002 through SEARCH-008 record the completed work.
- Evidence IDs: PRV-20260828-001-E0001
- Negative result: No search result is asserted.
- Terminology collisions: Assessment was deferred to SEARCH-002 through SEARCH-008.
- Limitations: Search coverage is zero.

## SEARCH-002

- Date: 2026-08-28
- Pass: Target aspect discovery
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Query or action: Local target search for
  `policy[- ]only|open permission|OPEN|exposure authority|exposure_authority|dual permission|permission deriv|fail[- ]closed|deny[- ]by[- ]default`,
  followed by bounded symbol searches for `HE_TE_PERMISSION_OPEN`,
  `he_mapping_permissions`, `he_te_authorize`, `he_gstage_map`,
  `he_gstage_allows`, `he_require_private_denial`, `combined decision`, and
  `partial rules`.
- Sources searched: Frozen target source, maintained documentation, tests,
  handoff, and retained agent-review material.
- Result: Located the three selected aspects in the TE interface and
  mechanism, fixed policy, runtime mapping seam, G-stage implementation,
  maintained documentation, unit tests, and target-controlled review records.
- Evidence IDs: PRV-20260828-001-E0003, PRV-20260828-001-E0004,
  PRV-20260828-001-E0005, PRV-20260828-001-E0007,
  PRV-20260828-001-E0009, PRV-20260828-001-E0039,
  PRV-20260828-001-E0040
- Negative result: No exact target identifier named `dual permission
  derivation` was found in the bounded source search; the review label covers
  both per-bit-plus-combined authorization and policy-versus-hardware
  reconciliation.
- Terminology collisions: `open` produced extensive unrelated matches for
  files, network listeners, workflow status, OpenSBI, and open tooling. Those
  meanings are excluded from ASPECT-001.
- Limitations: This pass maps current surfaces only. It does not establish
  first introduction, authorship, influence, prior art, or independent
  convergence.

## SEARCH-003

- Date: 2026-08-28
- Pass: Internal code and history lineage
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Query or action: Inspected the complete 19-commit sanitized ancestor log, isolated blame for eight selected source/documentation files, target references and policy-model documentation, handoff/remediation records, and retained agent-review integration chronology. Searched history and files for `HE_TE_PERMISSION_OPEN`, `open`, exposure, complete request, combined decision, divergence, absent mapping, FLASK, SELinux, XSM, review influence, and policy modification.
- Sources searched: Private sanitized Git bundle under ignored `scratch/PRV-20260828-001/` and frozen target files at commit `1ab289c066b69acdd8b55c9f77055b0145be1316`.
- Result: All selected mechanism lines trace to sanitized snapshot commit `30c08e6345f6f0f2e0a716937d3cde6c8ed778c5`; target documentation explicitly identifies FLASK/SELinux tuple vocabulary and general security-principle influences; retained reviews postdate the mechanisms and are linked only to adjacent remediations.
- Evidence IDs: PRV-20260828-001-E0010, PRV-20260828-001-E0011, PRV-20260828-001-E0012, PRV-20260828-001-E0013, PRV-20260828-001-E0014, PRV-20260828-001-E0015
- Negative result: No permitted commit, issue, prompt, handoff, review, or design record attributes the name or semantics of `OPEN`, per-bit-plus-combined authorization, TE-to-G-stage reconciliation, or policy-denial-plus-absent-mapping to a specific source. No retained review precedes the mechanisms or is explicitly linked to their introduction.
- Terminology collisions: `Dual permission derivation` is review taxonomy, not a target term. Exact one-rule complete-set matching means one rule covers the full requested subset; it does not require equality between requested and granted permission sets.
- Limitations: The branch is intentionally history-sanitized; pre-snapshot development history, excluded `local-history`, PRs, issues, and unavailable design discussions were not inspected. Negative results do not prove absence.

## SEARCH-004

- Date: 2026-08-28
- Pass: Approved local-source landscape
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Query or action: Read the registered source boundary and relevant component instructions, then searched approved read-only local research for foundational Type Enforcement, map or reachability authority, policy composition, policy-to-hardware derivation, fail-closed enforcement, and cited primary sources.
- Sources searched: `workspace://osr-claude` at `f2edd17c6ed70f09a9b3db98eec27e54e185612a`; `workspace://formal-verification-research` at `8b91ebda1d4a5c733596a67ef7c5cc83486212e9`; `workspace://beryllium-repo` at `65f6d895a2007e8e093582cc48726375fd23b563`; `workspace://cheri-riscv-notes-repo` at `655309289ee715cbe40690d41b222e3cba05e6b5`; `workspace://xrv-research-repo` at `ca414903b93cab82697a30ec2a57ed62c357d380`.
- Result: The strongest retained primary corpus was in `osr-claude`: Boebert-Kain Type Enforcement, Kain-Landwehr, DTMach, DTOS, Flask, LOCK, Policy Machine, and SmMTT. Exact retained-copy hashes were computed separately.
- Evidence IDs: PRV-20260828-001-E0016, PRV-20260828-001-E0017, PRV-20260828-001-E0018, PRV-20260828-001-E0019, PRV-20260828-001-E0020, PRV-20260828-001-E0021, PRV-20260828-001-E0022, PRV-20260828-001-E0026, PRV-20260828-001-E0038
- Negative result: No approved local source established target influence, exact target-style `OPEN`, single-rule non-composition as a Flask or SELinux property, or runtime policy-to-hardware readback with terminal mismatch handling.
- Terminology collisions: NIST Policy Machine uses `open` as a compound user request; other local security literature uses exposure in unrelated senses.
- Limitations: Local-source availability is not exhaustive, public accessibility does not establish redistribution permission, and restricted Microsoft copies were neither opened nor copied.

## SEARCH-005

- Date: 2026-08-28
- Pass: Public terminology queries
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Query or action: Exact queries with no date, language, domain, repository, author, or project-name filters: `type enforcement`; `policy-only permission`; `open permission`; `exposure authority`; `separated exposure authority`; `dual permission derivation`; `dual-source authorization`; `fail-closed authorization`; `deny by default`; `reference monitor permission derivation`.
- Sources searched: Public search results reached only through the user-approved query terms.
- Result: `type enforcement` reached the historical lineage amid programming-language collisions; `deny by default` and `fail-closed authorization` produced generic principle or modern vendor material; the remaining distinctive phrases produced unrelated or sparse results.
- Evidence IDs: PRV-20260828-001-E0027, PRV-20260828-001-E0038
- Negative result: No query established policy-only `OPEN`, exposure authority, dual permission derivation, or dual-source authorization as an established historical OS-security term.
- Terminology collisions: Browser and Android permissions, environmental and medical exposure, statutory authority, procurement, two-person approval, programming-language permission splitting, firewalls, and modern authorization products.
- Limitations: Search-engine indexing, archives, and alternate terminology are incomplete.

## SEARCH-006

- Date: 2026-08-28
- Pass: Public combined-concept queries
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Query or action: Exact approved combinations with no filters: `type enforcement open permission`; `type enforcement policy-only permission`; `open permission exposure authority`; `dual permission derivation dual-source authorization`; `separated exposure authority open permission`; `policy-only permission fail-closed authorization`.
- Sources searched: Public search results and citation links reached from those results.
- Result: No close primary source was found under the distinctive combined phrases; foundational and implementation sources were reached through `type enforcement` and subsequent citation navigation.
- Evidence IDs: PRV-20260828-001-E0027, PRV-20260828-001-E0038
- Negative result: No exact phrase combination identified the target's policy-only/no-PTE exposure bit, per-bit-plus-complete-set algorithm, or policy-to-hardware readback reconciliation.
- Terminology collisions: Occupational exposure, medical disclosure, generic IAM policy, dual approval, and programming-language derivations dominated unrelated results.
- Limitations: The approved public-term boundary prohibited target identifiers and source-specific search queries.

## SEARCH-007

- Date: 2026-08-28
- Pass: Primary-source citation and repository navigation
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Query or action: From allowlisted results, followed primary bibliographies and official project links to verify Type Enforcement, DTMach, DTOS, Flask, LOCK, Policy Machine, Linux SELinux `open` and `map` commits, SELinuxProject rule expansion, and SmMTT version 0.49.
- Sources searched: NIST proceedings, author and project copies, IEEE and USENIX publications, ACSAC, Linux and SELinuxProject repositories, and the RISC-V SmMTT release/source.
- Result: Confirmed strong prior art for separated mapping or relationship authority; confirmed policy-derived rights loaded into MMU enforcement; confirmed SELinux ordinary allow permissions accumulate by bitwise OR; found no exact runtime policy-to-hardware readback precedent.
- Evidence IDs: PRV-20260828-001-E0016, PRV-20260828-001-E0017, PRV-20260828-001-E0018, PRV-20260828-001-E0019, PRV-20260828-001-E0020, PRV-20260828-001-E0021, PRV-20260828-001-E0022, PRV-20260828-001-E0023, PRV-20260828-001-E0024, PRV-20260828-001-E0025, PRV-20260828-001-E0026, PRV-20260828-001-E0038
- Negative result: Flask and foundational TE sources do not show target-style `OPEN`; LOCK, DTOS, Flask, and SmMTT do not show independent hardware-state readback followed by terminal policy mismatch handling.
- Terminology collisions: Linux SELinux `open` is a file-operation permission, while SELinux `map` is the closer mapping-authority precedent.
- Limitations: Canonical URLs for several supplementary historical sources remain unresolved; detailed restricted DTOS policy reports were not used.

## SEARCH-008

- Date: 2026-08-28
- Pass: Inaccessible-resource and source-clearance check
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Query or action: Checked cited but unavailable Flask, DTOS, SAT, capability-analysis, conference-volume, publisher, historical-host, mailing-list, and SmMTT freshness leads; recorded exact access outcomes and alternatives.
- Sources searched: Public citation chains, approved local source metadata, publisher and historical project routes, library holdings, and the confirmed public-query navigation path.
- Result: Preserved eleven stable inaccessible-resource records. High-priority gaps are the Flask policy-module permission inventory, restricted DTOS design reports, the SAT design overview, and SmMTT activity after 2026-08-18.
- Evidence IDs: PRV-20260828-001-E0028, PRV-20260828-001-E0029, PRV-20260828-001-E0030, PRV-20260828-001-E0031, PRV-20260828-001-E0032, PRV-20260828-001-E0033, PRV-20260828-001-E0034, PRV-20260828-001-E0035, PRV-20260828-001-E0036, PRV-20260828-001-E0037
- Negative result: No accessible source closed the exact `OPEN`, one-rule non-composition, or runtime policy-to-hardware reconciliation origin gaps.
- Terminology collisions: No additional exact technical usage was established in the limited archive checks.
- Limitations: Restrictions were not bypassed; user-provided copies would remain private or restricted until licensing and redistribution review.
