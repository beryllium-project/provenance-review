# PRV-20260828-001 - Quick source scope

Status: `Complete and validated`
Distribution: `private`
Confirmed: `2026-08-28`
Normative scope: `scope.md`
Scope evidence: `PRV-20260828-001-E0042`
Local-source registry: `RESEARCH-SOURCES.md` at the provenance-review
repository root

## Time boundary

- Frozen target remains Helium `for-review` commit
  `1ab289c066b69acdd8b55c9f77055b0145be1316`.
- Standalone-repository creation anchor:
  `2026-08-04T08:31:12Z`,
  commit `b3994e52663dab03d8025db2750a0650aa40e80c`.
- Beryllium implementation, planning, prompt, transcript, review, discussion,
  and Git evidence must be authored or committed no later than that anchor.
- Current post-cutoff Beryllium files may identify exact earlier commits but
  cannot support provenance conclusions.
- External content must be dated no later than the anchor to support prior-art
  or influence conclusions. Later pages may supply access metadata or clearly
  labeled counter-evidence only.

## Included Beryllium anchors

| Date | Commit | Surface |
| --- | --- | --- |
| 2026-07-17 | `819251ed66a58e31002bc9e20b858a4cfaac69d0` | Original proof-oriented pathfinder |
| 2026-07-18 | `2c0bf53290760ab2866942ba8629e49e034d101d` | Dual-architecture pathfinder |
| 2026-07-18 | `cc6029acdd5df1fc14157c4faea4cc047e49a90e` | Minimal RISC-V policy pathfinder |
| 2026-07-20 | `b3f26316d4e0c3bbd76957677cc2a852bbd96dc2` | Exact-transition and isolation-proof checkpoint |
| 2026-07-20 | `511187f9d1f44c322e3a4a11347584fd8a20dc72` | Fixed Type Enforcement pathfinder |
| 2026-07-20 | `4b6892b9ca2ac7bdf694647c6f92156168324248` | Post-pathfinder policy research |
| 2026-07-20 | `b4b6fb7dfd28943cce0a6352e1870974e3be8bdf` | Architecture and session transcripts |
| 2026-07-20 | `9d8407f2eadb4fcbf8647ce7e26623e59d1d5ae3` | Post-pathfinder architecture decision |
| 2026-07-21 | `ecbcfefedb2815b26476dbe38e3f5b0ad74c0871` | Beryllium and Helium identity split |
| 2026-07-21 | `5d2276630d81b8a4e6b70babf7381c3b9e714403` | Model 0.1 implementation |
| 2026-07-21 | `cf658bdab8996234e4439575f532daeb931cdcfd` | Model 0.1 stage tag |
| 2026-07-24 | `e58adc3e22994521e064bf3bfb7e8c608529ef55` | Accepted Model 0.2 boundary |
| 2026-07-25 | `a81edbc34d344338f9818d24738037cab04279ff` | Accepted runtime plan |
| 2026-07-25 | `64a88b15a6c35d522fa997699c4fb514b15da314` | R0 freeze |

Other Beryllium commits are admissible only when they predate the cutoff and
an isolated exact-commit search directly connects them to ASPECT-001,
ASPECT-002, or ASPECT-003.

## Beryllium prehistory result

- `511187f9d1f44c322e3a4a11347584fd8a20dc72` at
  `2026-07-20T14:51:03Z` is the earliest supported implementation of all
  three selected mechanisms.
- It directly descends from minimal pathfinder
  `cc6029acdd5df1fc14157c4faea4cc047e49a90e`. Exact blame verifies
  inherited fixed Sv39x4, address/path validation, table initialization, root
  encoding, map-validation fragments, and generic runtime/trap lines.
- The minimal plan and evidence separately document policy/mechanism,
  identifiers-versus-authority, absent-mapping, and fail-closed predecessor
  concepts; those broader propositions are not classified as verified source
  lineage.
- `OPEN`, the fixed TE rule table, complete-request reauthorization, G-stage
  rejection of `OPEN`, and policy/PTE reconciliation first appear in the
  supplied evidence at `511187f`.
- Same-day policy research and session transcripts were committed several
  hours later and are retrospective context, not pre-implementation prompts.
- The evidence establishes a plausible close internal predecessor to
  standalone Helium at Medium confidence but does not prove a cross-repository
  import, rename, patch identity, source-hash bridge, or identical
  implementation ancestry.

Evidence: PRV-20260828-001-E0105 through PRV-20260828-001-E0114.

## Public primary-source coverage

- Proceedings: USENIX Security, OSDI, USENIX ATC, HotOS; ACM SOSP, CCS,
  ASPLOS, EuroSys, VEE, SACMAT; IEEE Security and Privacy, ACSAC; NDSS;
  historical NCSC and NISSC; directly relevant workshops and talks.
- Mailing lists and archives: LKML, KVM, Linux Security Modules, SELinux,
  Xen-devel; FreeBSD hackers, security, and architecture discussions; NetBSD
  `tech-kern` and `tech-security`; OpenBSD technical and security
  discussions; `cap-talk`; seL4 and CHERI public archives.
- Related projects: seL4; CHERI, CHERIoT, CheriBSD, Capsicum; Xen, XSM,
  FLASK; Linux KVM, pKVM, LSM, SELinux; Bao; Jailhouse; relevant capability
  and separation-kernel systems.
- Industry hypervisors: Oracle or Sun LDoms and Oracle VM Server for SPARC;
  IBM PR/SM and PowerVM; Microsoft Hyper-V and VBS; VMware ESXi and VMkernel;
  AWS Nitro and Firecracker.

Only primary technical sources may support substantive conclusions. Vendor
marketing, later summaries, and unauthenticated recollections are leads only.

## Coverage result

### Proceedings

- USENIX and the available NCSC/NISSC corpus received the strongest
  full-text treatment.
- ACM, IEEE, ACSAC, NDSS, and SACMAT were searched venue-wide with primary
  citation follow-up rather than paper-by-paper enumeration.
- Admissible additions:
  - 1981 SDC Communications Kernel: capability-to-hardware mapping and
    mapping lifecycle.
  - 2003 TrustedBSD MAC Framework: deny-dominant policy-module
    intersection.
  - 2006 Petroni et al.: adjacent asynchronous comparison of protected
    SELinux policy state with live AVC enforcement state; not mapping
    reconciliation or immediate fail-stop handling.
- InkTag was discovered through an out-of-bound title route and withdrawn
  after compliant ASPLOS queries failed to reach it.
- 18th NISSC volume 2 remains unavailable.

Evidence: PRV-20260828-001-E0051 through PRV-20260828-001-E0054 and
PRV-20260828-001-E0070.

### Mailing lists, related projects, and industry hypervisors

- Exact compliant searches covered Linux, LKML, KVM, pKVM, LSM, SELinux,
  Xen/XSM/FLASK and Xen-devel; FreeBSD, NetBSD, and OpenBSD archives;
  `cap-talk`; seL4; CHERI, CHERIoT, CheriBSD, and Capsicum; Bao and
  Jailhouse; LDoms, PR/SM, PowerVM, Hyper-V/VBS, ESXi/VMkernel, Nitro, and
  Firecracker.
- Admissible close or structural precedents include Capsicum descriptor
  authority, FreeBSD and NetBSD maximum permissions, OpenBSD immutable maps,
  Xen FLASK cross-domain mapping control, pKVM ownership transitions, seL4
  mapping capabilities, CHERI authority, LDoms and PR/SM assignment, VBS
  isolation, and ESXi VMkernel separation.
- Material counter-evidence includes Xen's historical permissive default,
  seL4's silent rights downgrade, capability possession as intentional
  authority, and platform configurations where desired, pending, and active
  enforcement state can differ.
- The exact FreeBSD split mapping-right source, Xen combined grant-mask
  implementation, NetBSD kauth result, PAPR TCE details, Hyper-V TLFS fields,
  Bao warning paths, Jailhouse flag layout, pre-cutoff DirectPath record,
  and detailed Nitro mapping architecture were not reached through compliant
  queries and do not support conclusions.
- A separate archive-specific rerun executed forty-six approved queries across
  LKML, LSM, SELinux, KVM/pKVM, Xen-devel, FreeBSD, NetBSD, OpenBSD,
  `cap-talk`, seL4, and CHERI. It recovered Xen grant-mapping and mapping-bug
  posts plus a NetBSD separate-address-space record, and preserved bounded
  negatives for the remaining archives.
- pKVM findings are pinned to immutable Android common-kernel commit
  `c747c018510514875d9d790dde177c52bba7b679`, dated 2026-05-24.

Evidence: PRV-20260828-001-E0056, PRV-20260828-001-E0061,
PRV-20260828-001-E0062, PRV-20260828-001-E0071 through
PRV-20260828-001-E0084, and PRV-20260828-001-E0115 through
PRV-20260828-001-E0122.

## Query-compliance result

- Initial expanded public searches used several technical identifiers and
  title fragments outside the confirmed allowlist.
- Those routes are preserved in `search-log.md` only as compliance history.
- Proceedings and ecosystem searches were rerun with approved public names
  plus exact approved generic phrases.
- Evidence reached only through the original out-of-bound routes was
  withdrawn or superseded.

Exact records: SEARCH-011, SEARCH-012, and SEARCH-013.

## Public-safe terms

The original ten generic query terms remain approved. Additional approved
terms are the public venue, archive, project, and hypervisor names above plus:

`mapping permission`; `relationship permission`; `memory mapping authority`;
`stage-2 mapping authorization`; `page table permission derivation`;
`policy hardware consistency`; `reference monitor MMU`;
`capability reachability`; `hypervisor compartment authority`;
`logical domain memory mapping`; `fail-closed hypervisor authorization`.

Do not send Helium, Beryllium, target symbols, private identifiers, private
source phrases, or implementation details to public services.

## Current amendment status

- Scope confirmation: complete.
- Pre-creation Beryllium lineage: complete.
- Expanded proceedings pass: complete.
- Expanded ecosystem and mailing-list pass: complete.
- Query-compliance reruns: complete.
- Helper isolation manifest: complete and specialist-verified.
- Exact inherited-line classification: complete.
- Archive-specific compliant mailing-list rerun: complete.
- Attribution and report amendment: complete.
- Package validation against committed baseline `684d9bf`: complete.
- Distribution remains private; public-candidate promotion remains blocked.
