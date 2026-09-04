# Documentation notes

This file is an append-friendly collection of miscellaneous Q&A drafts and
snippets for future user-facing documentation and FAQs. These drafts are
non-normative: authoritative target and review sources remain authoritative.
Avoid copying private implementation detail into downstream documentation.

## Entry contract

Each entry uses a stable, append-friendly ID in the form
`DOC-NOTE-YYYYMMDD-NNN`. Append new entries without renumbering or rewriting
existing IDs. Each entry records `Added`, `Type`, `Status`, `Audience`,
`Sensitivity`, and `Candidate destination`, followed by a question and draft
answer and a basis-and-limitations section.

## DOC-NOTE-20260904-001 — Label sealing

- **Added:** 2026-09-04
- **Type:** FAQ draft
- **Status:** Draft
- **Audience:** users and documentation authors
- **Sensitivity:** private
- **Candidate destination:** Helium FAQ / concepts / security documentation

### Question and draft answer

**What does “label sealing” mean in Helium?**

Before authorization or root construction, Helium assigns fixed TE labels to
every subject and object. It checks that labeling is complete, non-duplicate,
and valid, and then seals the label state. After sealing, labels cannot be
added or changed through the supported TE API. Incomplete, duplicate, invalid,
and post-seal labeling is rejected.

Authorization uses these frozen labels together with fixed rules. Label
sealing is a software/API invariant implemented by the trusted monitor. It
does not provide hardware-enforced immutability, protection against arbitrary
privileged corruption, formal verification, or hardware validation.

### Basis and limitations

Portable implementation locators include
`target://helium-te-poc/include/he/te.h`,
`target://helium-te-poc/src/te.c`,
`target://helium-te-poc/src/policy/te.c`, and
`target://helium-te-poc/src/main.c`. The completed review at
`reviews/PRV-20260901-001-policy-install-readback/` provides the review basis.
This draft is scoped to the fixed Helium proof of concept and should not be
generalized beyond the supported TE API or the documented trusted-monitor
assumptions.

## DOC-NOTE-20260904-002 — TE policy consultation and PTE enforcement

- **Added:** 2026-09-04
- **Type:** FAQ draft
- **Status:** Draft
- **Audience:** users and documentation authors
- **Sensitivity:** private
- **Candidate destination:** Helium FAQ / concepts / security documentation

### Question and draft answer

**Is the TE policy consulted on every TE-mediated access, or does Helium
depend on TE-derived PTE permissions?**

In the fixed Helium proof of concept, TE is not consulted on every successful
memory access. During initialization, the monitor consults the sealed fixed
policy for `open` and R/W/X permissions, builds G-stage PTEs, and checks
policy/PTE agreement. Normal guest memory accesses are then enforced by
hardware G-stage PTE permissions.

The monitor re-consults policy on the specific expected fault paths:
cross-private loads and the reader shared-page write. These checks confirm
that the hardware fault, policy denial, and mapping state agree. This is not
general per-access TE mediation.

A future dynamic policy would require explicit mapping updates, revalidation
or revocation, and appropriate TLB maintenance. The current claims remain
limited to the fixed proof of concept, without formal verification or hardware
validation.

### Basis and limitations

Portable implementation locators include
`target://helium-te-poc/include/he/te.h`,
`target://helium-te-poc/src/te.c`,
`target://helium-te-poc/src/policy/te.c`,
`target://helium-te-poc/src/main.c`, and
`target://helium-te-poc/src/memory.c`. The completed review at
`reviews/PRV-20260901-001-policy-install-readback/` provides the review basis.
This draft describes the fixed initialization and expected-fault design only;
it does not claim general per-access TE mediation, dynamic-policy safety,
formal verification, or hardware validation.

## DOC-NOTE-20260904-003 — TE policy and hardware enforcement precedents

- **Added:** 2026-09-04
- **Type:** FAQ draft
- **Status:** Draft
- **Audience:** users and documentation authors
- **Sensitivity:** private
- **Candidate destination:** Helium FAQ / concepts / architecture documentation

### Question and draft answer

**Are there precedents in TE systems where policy is mapped to hardware
enforcers and centralized TE policy is not consulted on every access?**

Yes. It is important, however, to distinguish every CPU memory access from
every logical security decision. Centralized policy can remain authoritative
while its decisions are cached or materialized in page-table/MMU permissions.
Hardware then enforces ordinary loads and stores without synchronously calling
the central security server on each instruction.

LOCK combines mandatory access control with Type Enforcement. SIDEARM acts as
the access decider, the MMU acts as the access enforcer, and privileged
CPU software translates the decision into MMU entries. LOCK explicitly
identifies that policy-to-MMU translation as trusted.

In the Flask microkernel, policy is checked on the initial access to mapped
memory during a page fault. Authorized memory access modes are then enforced
through memory protections, with revalidation when policy changes.

More generally in Flask/SELinux, the security server computes policy
decisions and remains the policy authority. Access-vector caches can satisfy
logical security-decision checks without a central-server call, while object
managers retain state for enforcement, including page-table access rights.
Individual CPU loads and stores covered by those installed protections do not
each make a new logical security decision or central-server call. Policy
changes therefore require invalidation, update, or revalidation of cached and
materialized decisions; policy still governs the resulting accesses.

Xen XSM/FLASK provides a modern hypervisor analogue: policy mediates grant and
cross-domain mapping operations, while ordinary accesses after installation
are enforced by hypervisor-managed page tables. The relationship between those
mediated mapping decisions and subsequent page-table enforcement is an
architectural inference, not a directly quoted guarantee that covers every Xen
configuration or access path.

The lifecycle distinction is critical. A static system can validate derived
permissions before activation. A dynamic system also needs cache invalidation,
mapping or PTE updates, revocation or revalidation, and appropriate TLB
maintenance when policy changes. Helium follows the static
derive/install/check-to-PTE pattern in a fixed proof of concept, with policy
rechecks on expected fault paths, not central policy consultation on every
successful access. This comparison does not add formal verification or
hardware validation.

### Basis and limitations

The completed cross-agent projection at
`reviews/PRV-20260901-001-policy-install-readback/assurance-practices.md`
provides the review basis, particularly PRV-20260901-001-E0016 and
PRV-20260901-001-E0020, with related lifecycle and retained-enforcement
context in PRV-20260901-001-E0015 and PRV-20260901-001-E0019. Public
navigation sources include
[LOCK: An Historical Perspective](https://www.acsac.org/2002/papers/classic-lock.pdf)
and
[The Flask Security Architecture](https://www.usenix.org/conference/8th-usenix-security-symposium/flask-security-architecture-system-support-diverse-security).

These systems establish precedents or architectural analogues, not direct
influence on Helium or the source of Helium's exact algorithm. The Helium
statement remains limited to the fixed proof of concept and its documented
expected-fault paths; it does not establish dynamic-policy safety, formal
verification, or hardware validation.
