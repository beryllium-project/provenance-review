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

## SEARCH-009

- Date: 2026-08-28
- Pass: Pre-creation Beryllium implementation and session lineage
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Query or action: Captured isolated logs and trees for five pathfinder checkpoints and pre-cutoff mainline through R0; extracted exact historical plans, evidence, policy research, pathfinder comparison, session records, models, runtime plan, and R0 freeze; inspected blame at `511187f9d1f44c322e3a4a11347584fd8a20dc72` for TE API, mechanism, policy, runtime, and G-stage files. Searched for `OPEN`, complete-request coverage, per-bit derivation, policy/PTE divergence, absent mapping, pre-implementation prompts, and cross-repository rename or import evidence.
- Sources searched: `workspace://beryllium-repo` exact commits no later than `2026-08-04T08:31:12Z`, through private maintained-helper output under ignored scratch.
- Result: Minimal pathfinder `cc6029a` is the direct generic implementation predecessor; fixed TE checkpoint `511187f` is the earliest supported Beryllium implementation of all selected mechanisms; later same-day sessions are retrospective; direct transfer into standalone Helium remains unresolved.
- Evidence IDs: PRV-20260828-001-E0042, PRV-20260828-001-E0043, PRV-20260828-001-E0044, PRV-20260828-001-E0045, PRV-20260828-001-E0046, PRV-20260828-001-E0047, PRV-20260828-001-E0048, PRV-20260828-001-E0049, PRV-20260828-001-E0050
- Negative result: No selected `OPEN`, one-rule, or TE/PTE reconciliation mechanism appears in supplied pre-`511187f` records; no pre-implementation prompt was retained; no cross-repository parent, rename diff, patch identity, source-hash bridge, or import record links `511187f` to standalone Helium.
- Terminology collisions: Pre-identity records use Beryllium and `be_` for the pathfinder that was later named Helium and `he_`; naming continuity is not implementation-transfer evidence.
- Limitations: The former standalone `local-history` ref and `c8d1032` anchor do not resolve. Current post-cutoff Beryllium files were not used as substantive evidence.

## SEARCH-010

- Date: 2026-08-28
- Pass: Expanded conference and proceedings landscape
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Query or action: Venue-bounded primary searches across USENIX Security, OSDI, USENIX ATC, HotOS, ACM SOSP, CCS, ASPLOS, EuroSys, VEE, SACMAT, IEEE Security and Privacy, ACSAC, NDSS, and the available NCSC/NISSC corpus. Query families combined each venue with approved terms for mapping permission, relationship permission, memory-mapping authority, capability reachability, page-table permission derivation, policy/hardware consistency, reference-monitor MMU, fail-closed authorization, Type Enforcement, and deny by default.
- Sources searched: Official proceedings and event pages, author manuscripts, NIST-hosted historical proceedings, and citation-chain primary sources with substantive dates no later than `2026-08-04T08:31:12Z`.
- Result: Initial discovery retained the 1981 SDC Communications Kernel, 2003 TrustedBSD MAC Framework, 2006 Petroni semantic-integrity monitor, and 2013 InkTag. The later compliance pass in SEARCH-011 retained the first three and excluded InkTag.
- Evidence IDs: PRV-20260828-001-E0042, PRV-20260828-001-E0051, PRV-20260828-001-E0052, PRV-20260828-001-E0053, PRV-20260828-001-E0054, PRV-20260828-001-E0070
- Negative result: No proceedings source resolved the exact target-style `OPEN`, one-rule complete-request origin, or post-install TE-to-G-stage readback with immediate terminal divergence handling.
- Terminology collisions: Relevant mechanisms appear under capability mapping, rights intersection, semantic integrity, mapping intent, and paraverification rather than the target's review terminology.
- Limitations: USENIX and the available NCSC/NISSC corpus received the strongest full-text treatment. ACM, IEEE, ACSAC, NDSS, and SACMAT coverage was venue-wide and citation-chain based rather than paper-by-paper enumeration; 18th NISSC volume 2 remains unavailable.

## SEARCH-011

- Date: 2026-08-28
- Pass: Expanded proceedings public-query compliance rerun
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Query or action: Re-ran source discovery only with approved venue names and exact generic phrases. Successful queries were `site:usenix.org/legacy/event/sec06 \"USENIX Security\" \"type enforcement\"` for Petroni and `site:usenix.org/legacy/event/usenix03/tech/freenix03 \"USENIX ATC\" \"type enforcement\"` plus `\"USENIX ATC\" \"type enforcement\"` for TrustedBSD. InkTag attempts used each of `page table permission derivation`, `policy hardware consistency`, `memory mapping authority`, `reference monitor MMU`, `fail-closed authorization`, `capability reachability`, `mapping permission`, `relationship permission`, `deny by default`, `policy-only permission`, and `type enforcement` with `ASPLOS`, plus compliant `site:cs.utexas.edu/users/witchel` and `site:dl.acm.org` forms.
- Sources searched: Approved local NCSC/NISSC corpus, official USENIX event archives, ASPLOS or institutional result pages reached through compliant queries.
- Result: SDC remained admissible through approved local evidence; TrustedBSD and Petroni were independently re-established through compliant public queries; InkTag was not reached and is withdrawn.
- Evidence IDs: PRV-20260828-001-E0051, PRV-20260828-001-E0052, PRV-20260828-001-E0053, PRV-20260828-001-E0054, PRV-20260828-001-E0070
- Negative result: No compliant ASPLOS query or result-citation chain reached InkTag.
- Terminology collisions: Prior out-of-bound searches used standalone technical terms and exact titles; results depending solely on those routes are excluded.
- Limitations: InkTag may be reconsidered only under a future explicitly confirmed public-query scope.

## SEARCH-012

- Date: 2026-08-28
- Pass: Expanded ecosystem initial discovery and scope-violation record
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Query or action: Initial public discovery used approved project names but also unapproved source identifiers, title fragments, and technical terms. Exact out-of-bound queries are preserved below solely as compliance history and are not relied upon.
- Sources searched: Public search and code-search services across BSD, Linux, Xen, seL4, CHERI, static partitioners, and industry hypervisors.
- Result: Candidate findings were treated as inadmissible until independently re-established through SEARCH-013. Exact FreeBSD split mapping rights, NetBSD kauth, Xen combined grant masks, PAPR TCE details, Hyper-V TLFS fields, Bao warning paths, Jailhouse flag layouts, DirectPath, detailed Nitro architecture, and source-level CheriBSD mappings were not re-admitted.
- Evidence IDs: PRV-20260828-001-E0055, PRV-20260828-001-E0057, PRV-20260828-001-E0059, PRV-20260828-001-E0064, PRV-20260828-001-E0065, PRV-20260828-001-E0066, PRV-20260828-001-E0067, PRV-20260828-001-E0068, PRV-20260828-001-E0069, PRV-20260828-001-E0071
- Negative result: No conclusion is retained solely from an out-of-bound discovery route.
- Terminology collisions: Public project identifiers and implementation symbols were improperly treated as query terms before the compliance audit.
- Limitations: The queries below document the violation; they are not authorized evidence-discovery paths.

### SEARCH-012 out-of-bound query log

```text
CAP_MMAP_R repo:freebsd/freebsd-src
site:reviews.freebsd.org "CAP_MMAP_R"
grant_mapref repo:xen-project/xen path:xen/xsm
site:xenbits.xen.org grant map_read map_write FLASK RELEASE-4.19.0
Page_Map repo:seL4/seL4
site:sel4.systems seL4 reference manual VSpace page map capability rights
site:cl.cam.ac.uk/techreports UCAM-CL-TR-987 CHERI ISA version 9
site:github.com/CTSRD-CHERI "mapping permission" capability
site:github.com/CTSRD-CHERI/cheribsd mmap PROT_MAX cheri_revoke
site:cheriot.org/book compartments sentry import export revocation
site:cl.cam.ac.uk/techreports/UCAM-CL-TR-987.pdf CSetBoundsExact tag cleared representable
site:cl.cam.ac.uk/techreports/UCAM-CL-TR-987.pdf virtual memory page table permissions capability check
site:cl.cam.ac.uk/techreports/UCAM-CL-TR-987.pdf monotonicity permissions tag
site:cheriot.org/book shared object permissions compartment import capability
PTE_HYP repo:bao-project/bao-hypervisor
"Bao: A Lightweight Static Partitioning Hypervisor" OASIcs
JAILHOUSE_MEM_READ repo:siemens/jailhouse
"Jailhouse: partitioning hypervisor based on Linux" Jan Kiszka 2014
site:openpowerfoundation.org "H_PUT_TCE" LIOBN PAPR PDF
"H_PUT_TCE" "logical I/O bus number" PDF
site:openpowerfoundation.org/specifications "Power Architecture Platform Requirements"
site:github.com/MicrosoftDocs/Virtualization-Documentation tlfs MapGpaPages VTL protection mask
Microsoft Hypervisor Top-Level Functional Specification PDF 2021 VTL protection mask
site:learn.microsoft.com Windows Server 2022 Discrete Device Assignment dismount assign device
site:microsoft.com/research Hyper-V architecture paper second level address translation IOMMU
site:learn.microsoft.com virtualization based security VTL memory protection 2024
site:techdocs.broadcom.com DirectPath I/O IOMMU assign device virtual machine
site:knowledge.broadcom.com "DirectPath I/O" IOMMU assign device
site:vmware.com "Architecture of VMware ESXi" PDF
site:docs.aws.amazon.com "Security Design of the AWS Nitro System" resource allocation isolation
site:usenix.org Firecracker Lightweight Virtualization Serverless Applications NSDI 2020
```

## SEARCH-013

- Date: 2026-08-28
- Pass: Expanded ecosystem compliant public-query rerun
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Query or action: Re-executed source discovery using only an approved public project or system name plus an exact approved generic phrase. The complete exact query list is preserved below.
- Sources searched: FreeBSD, NetBSD, OpenBSD, Linux, SELinux, Xen, pKVM, seL4, CHERI, CHERIoT, CheriBSD, Bao, Jailhouse, LDoms, PR/SM, PowerVM, Hyper-V, VBS, VMware ESXi, Nitro, and Firecracker primary pages and citation chains.
- Result: Re-established general Capsicum rights, FreeBSD and NetBSD maximum permissions, OpenBSD immutable mappings, broad Xen FLASK mapping control and permissive-mode counter-evidence, pKVM ownership state, seL4 and CHERI authority, CHERIoT and CheriBSD architecture, Bao static assignment, LDoms, PR/SM, broad PowerVM and Hyper-V, VBS memory isolation, and ESXi separation. Source-level findings not reached through compliant routes remain excluded or inaccessible.
- Evidence IDs: PRV-20260828-001-E0056, PRV-20260828-001-E0060, PRV-20260828-001-E0061, PRV-20260828-001-E0062, PRV-20260828-001-E0063, PRV-20260828-001-E0071, PRV-20260828-001-E0072, PRV-20260828-001-E0073, PRV-20260828-001-E0074, PRV-20260828-001-E0075, PRV-20260828-001-E0076, PRV-20260828-001-E0077, PRV-20260828-001-E0078, PRV-20260828-001-E0079, PRV-20260828-001-E0080, PRV-20260828-001-E0081, PRV-20260828-001-E0082, PRV-20260828-001-E0083, PRV-20260828-001-E0084
- Negative result: Compliant routes did not reach exact FreeBSD split mmap rights, NetBSD kauth composition, SELinux `file:map` implementation or mask accumulation, Xen combined grant masks, cutoff-pinned CheriBSD mapping source, Bao malformed-configuration paths, Jailhouse flag layouts, PAPR TCE details, Hyper-V TLFS fields, pre-cutoff VMware DirectPath, or detailed Nitro mapping architecture.
- Terminology collisions: Project-name searches returned broad architecture pages, product material, unrelated memory products, and current pages without immutable pre-cutoff versions.
- Limitations: Only re-established candidates may support amendment conclusions. Current unpinned pages were excluded from substantive use when an exact pre-cutoff version could not be established.

### SEARCH-013 exact compliant queries

```text
FreeBSD mapping permission
Capsicum mapping permission
NetBSD mapping permission
OpenBSD mapping permission
SELinux mapping permission
Xen FLASK relationship permission
pKVM stage-2 mapping authorization
seL4 capability reachability
CHERI capability reachability
CHERIoT capability reachability
CheriBSD mapping permission
Bao stage-2 mapping authorization
Jailhouse mapping permission
LDoms logical domain memory mapping
PR/SM hypervisor compartment authority
PowerVM page table permission derivation
Hyper-V policy hardware consistency
VBS policy hardware consistency
VMware ESXi mapping permission
AWS Nitro hypervisor compartment authority
Firecracker mapping permission
Bao hypervisor compartment authority
PAPR page table permission derivation
IBM hypervisor compartment authority
SELinux type enforcement
Xen XSM type enforcement
Xen FLASK type enforcement
VMware hypervisor compartment authority
ESXi hypervisor compartment authority
VMkernel policy hardware consistency
Firecracker hypervisor compartment authority
PAPR hypervisor compartment authority
IBM PR/SM logical domain memory mapping
PowerVM hypervisor compartment authority
Oracle VM Server for SPARC logical domain memory mapping
ESXi mapping permission
Capsicum capability reachability
Jailhouse hypervisor compartment authority
Microsoft VBS hypervisor compartment authority
Hyper-V mapping permission
pKVM policy hardware consistency
pKVM mapping permission
Linux pKVM stage-2 mapping authorization
KVM policy hardware consistency
CheriBSD capability reachability
CheriBSD page table permission derivation
PAPR memory mapping authority
VMware ESXi hypervisor compartment authority
NetBSD deny by default
SELinux open permission
SELinux policy-only permission
Xen FLASK mapping permission
```

## SEARCH-014

- Date: 2026-08-28
- Pass: Compliant archive-specific mailing-list and immutable pKVM rerun
- Aspect IDs: ASPECT-001, ASPECT-002, ASPECT-003
- Query or action: Executed every required archive-name or project-name query with exact approved generic phrases, then followed primary result links without issuing unapproved follow-up searches. Applied the substantive cutoff `2026-08-04T08:31:12Z` during source assessment.
- Sources searched: LKML, Linux Security Modules, SELinux, KVM, pKVM, Xen-devel, `freebsd-hackers`, `freebsd-security`, FreeBSD, NetBSD `tech-kern`, NetBSD `tech-security`, OpenBSD, `cap-talk`, seL4, and CHERI.
- Result: Recovered primary Xen grant-mapping, mapping-bug, and permission-versus-mapping records plus a NetBSD separate-address-space record; pinned pKVM to immutable commit `c747c018510514875d9d790dde177c52bba7b679`; other archives principally returned project documentation, unrelated results, or bounded negatives.
- Evidence IDs: PRV-20260828-001-E0085, PRV-20260828-001-E0086, PRV-20260828-001-E0088, PRV-20260828-001-E0089, PRV-20260828-001-E0090, PRV-20260828-001-E0115, PRV-20260828-001-E0116, PRV-20260828-001-E0117, PRV-20260828-001-E0118, PRV-20260828-001-E0119, PRV-20260828-001-E0120, PRV-20260828-001-E0121, PRV-20260828-001-E0122
- Negative result: No original SELinux distinct-map, pKVM ownership/share, FreeBSD Capsicum or maximum-permission, NetBSD kauth or maximum-permission, `cap-talk`, seL4 mailing-list, or CHERI mailing-list design thread was recovered.
- Terminology collisions: `cap-talk` searches returned Calendar Access Protocol, geographic mapping-authority, coverage-planning, and Cambridge CAP-machine results; `deny by default` frequently returned networking or firewall material.
- Limitations: Archive indexing is incomplete and bounded null results do not prove absence. Project manuals and specifications remain the primary evidence where original discussions were not located.

### SEARCH-014 exact queries

```text
LKML mapping permission
LKML policy hardware consistency
LKML type enforcement
Linux Security Modules mapping permission
Linux Security Modules policy hardware consistency
Linux Security Modules type enforcement
SELinux mapping permission
SELinux policy hardware consistency
SELinux type enforcement
KVM stage-2 mapping authorization
KVM policy hardware consistency
KVM mapping permission
pKVM stage-2 mapping authorization
pKVM policy hardware consistency
pKVM mapping permission
Xen-devel type enforcement
Xen-devel relationship permission
Xen-devel mapping permission
Xen-devel fail-closed authorization
freebsd-hackers mapping permission
freebsd-hackers relationship permission
freebsd-hackers deny by default
freebsd-security mapping permission
freebsd-security relationship permission
freebsd-security deny by default
FreeBSD mapping permission
FreeBSD relationship permission
FreeBSD deny by default
NetBSD tech-kern mapping permission
NetBSD tech-kern relationship permission
NetBSD tech-kern deny by default
NetBSD tech-security mapping permission
NetBSD tech-security relationship permission
NetBSD tech-security deny by default
OpenBSD mapping permission
OpenBSD relationship permission
OpenBSD deny by default
cap-talk capability reachability
cap-talk relationship permission
cap-talk mapping permission
seL4 capability reachability
seL4 mapping permission
seL4 policy hardware consistency
CHERI capability reachability
CHERI mapping permission
CHERI policy hardware consistency
```
