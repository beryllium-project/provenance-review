# Coding agent policy installation readback rationale - Chronology

Review ID: `PRV-20260901-001`
Short name: `policy-install-readback`
Distribution: `private`
Intended distribution: `public-candidate`
Created: `2026-09-01`
Status: `Complete`

Chronology is intended to be append-only. Use baseline validation or Git
history review to detect modification or removal of prior entries.

## CHRON-001

- Date: 2026-09-01
- Event: Private draft review package created.
- Aspect IDs: ASPECT-001
- Evidence IDs: PRV-20260901-001-E0001
- Relationship: Administrative chronology only.
- Confidence: High
- Evidence basis: Repository-generated package metadata.
- Alternatives/counter-evidence: Creation does not show that analysis occurred.
- Limitations: This event provides no evidence about target history.

## CHRON-002

- Date: 1999-08
- Event: The Flask Security Architecture documented policy checks for mapped-memory access modes and revalidation of retained enforcement decisions after policy change.
- Aspect IDs: ASPECT-001
- Evidence IDs: PRV-20260901-001-E0016
- Relationship: Early adjacent precedent for validating mapped-memory enforcement points and maintaining policy/enforcement consistency.
- Confidence: High
- Evidence basis: Contemporaneous project-controlled primary text.
- Alternatives/counter-evidence: The target has no runtime policy change, policy server, cache, or relabeling.
- Limitations: This is not an independent installation-time PTE decoder or evidence of influence.

## CHRON-003

- Date: 2006-07
- Event: Petroni et al. published an implemented monitor that recomputed policy-derived expectations and compared them with live SELinux AVC enforcement-decision state.
- Aspect IDs: ASPECT-001
- Evidence IDs: PRV-20260901-001-E0015
- Relationship: Adjacent policy-versus-enforcement consistency-monitoring precedent.
- Confidence: High
- Evidence basis: Primary USENIX Security paper.
- Alternatives/counter-evidence: The monitor was asynchronous and its response differed from immediate boot-time failure.
- Limitations: It did not mediate page-table installation or inspect target-style PTEs.

## CHRON-004

- Date: 2022-11
- Event: NIST SP 800-160 Vol. 1 Rev. 1 described access mediation as a policy decision plus enforcement and required verifiability, protective failure, and secure-integration checkpoints.
- Aspect IDs: ASPECT-001
- Evidence IDs: PRV-20260901-001-E0014
- Relationship: Broad prior art for the assurance rationale behind checking the policy/enforcement seam before activation.
- Confidence: High
- Evidence basis: Official NIST publication.
- Alternatives/counter-evidence: The publication is implementation-neutral.
- Limitations: It does not prescribe post-install PTE comparison.

## CHRON-005

- Date: 2026-07-18T06:15:59Z
- Event: Minimal RISC-V policy pathfinder commit `cc6029acdd5df1fc14157c4faea4cc047e49a90e` supplied generic mapping validation and terminal map-failure scaffolding.
- Aspect IDs: ASPECT-001
- Evidence IDs: PRV-20260901-001-E0006
- Relationship: Direct internal predecessor for generic function structure, not the TE-specific per-bit reconciliation.
- Confidence: High
- Evidence basis: Isolated Git log and successor blame.
- Alternatives/counter-evidence: The minimal predecessor did not contain the selected TE comparison.
- Limitations: Generic fail-closed scaffolding does not establish conceptual origin of the later readback.

## CHRON-006

- Date: 2026-07-20T07:15:40Z
- Event: Before runtime implementation, the origin coding session created a plan requiring derivation of PTE permissions, root construction, and verification of required mappings and denials before first VS entry.
- Aspect IDs: ASPECT-001
- Evidence IDs: PRV-20260901-001-E0007, PRV-20260901-001-E0009
- Relationship: Earliest retained direct rationale for a pre-entry policy/enforcement consistency check.
- Confidence: High
- Evidence basis: Timestamped session tool request containing the plan text.
- Alternatives/counter-evidence: The plan did not yet prescribe the exact per-bit re-read algorithm.
- Limitations: Hidden pre-plan reasoning is unavailable.

## CHRON-007

- Date: 2026-07-20T07:22:45Z
- Event: The coding agent's first runtime patch added `be_map_or_fail()` with post-install per-bit policy and G-stage comparison plus terminal divergence handling.
- Aspect IDs: ASPECT-001
- Evidence IDs: PRV-20260901-001-E0007
- Relationship: First retained implementation event for the selected mechanism.
- Confidence: High
- Evidence basis: Timestamped apply-patch tool record in the commit-linked origin session.
- Alternatives/counter-evidence: The patch does not expose hidden reasoning or external source use.
- Limitations: This event establishes implementation timing, not independent effectiveness.

## CHRON-008

- Date: 2026-07-20T07:26:43Z to 2026-07-20T07:41:53Z
- Event: An independent design-review task examined the already-present policy-to-PTE derivation and found no blocking core defect.
- Aspect IDs: ASPECT-001
- Evidence IDs: PRV-20260901-001-E0008
- Relationship: Falsifies the hypothesis that this retained review caused the readback to be added.
- Confidence: High
- Evidence basis: Patch and review-task timestamps plus the task result.
- Alternatives/counter-evidence: Another unrecorded influence could predate both events.
- Limitations: Historical reviewer execution is not reproduced or treated as normative evidence.

## CHRON-009

- Date: 2026-07-20T14:51:03Z
- Event: Beryllium commit `511187f9d1f44c322e3a4a11347584fd8a20dc72` recorded the complete fixed Type Enforcement PoC and named the origin Copilot session.
- Aspect IDs: ASPECT-001
- Evidence IDs: PRV-20260901-001-E0006, PRV-20260901-001-E0007
- Relationship: Earliest supported committed implementation of the selected reconciliation.
- Confidence: High
- Evidence basis: Isolated Git log, blame, and commit-linked session reference.
- Alternatives/counter-evidence: Same-commit plan/code/test integration prevents finer Git-only chronology.
- Limitations: Commit co-authorship does not assign contribution percentages.

## CHRON-010

- Date: 2026-07-20T19:03:50Z
- Event: The same origin session explicitly formulated `policy-to-PTE soundness` as the property that every installed PTE is no more permissive than TE.
- Aspect IDs: ASPECT-001
- Evidence IDs: PRV-20260901-001-E0009
- Relationship: Direct same-session statement of the strongest supported engineering rationale.
- Confidence: High
- Evidence basis: Preserved user/assistant turn.
- Alternatives/counter-evidence: The statement followed the commit and is retrospective.
- Limitations: It corroborates but cannot reconstruct the agent's private pre-code reasoning.

## CHRON-011

- Date: 2026-07-21T04:29:57Z
- Event: Commit `ecbcfefedb2815b26476dbe38e3f5b0ad74c0871` established Beryllium and Helium identities while preserving the fixed-TE pathfinder.
- Aspect IDs: ASPECT-001
- Evidence IDs: PRV-20260901-001-E0010
- Relationship: Renamed the selected implementation before standalone extraction.
- Confidence: High
- Evidence basis: Isolated commit metadata and current blame.
- Alternatives/counter-evidence: Many renamed lines are attributed to the identity commit even where the underlying algorithm came from `511187f`.
- Limitations: Rename blame must not be mistaken for conceptual authorship.

## CHRON-012

- Date: 2026-08-04T00:19:08Z onward
- Event: A Beryllium-associated session was instructed to make the fixed-TE branch a simple standalone Helium project and moved the pathfinder implementation to repository root.
- Aspect IDs: ASPECT-001
- Evidence IDs: PRV-20260901-001-E0010
- Relationship: Direct documented transfer from the Beryllium worktree into standalone Helium.
- Confidence: High
- Evidence basis: Explicit user instruction, agent action record, session repository identity, and file activity.
- Alternatives/counter-evidence: Flattening and cleanup changed repository structure and some bytes.
- Limitations: Former intermediate commits are unavailable for complete byte-by-byte reconstruction.

## CHRON-013

- Date: 2026-08-04T08:51:11Z
- Event: Standalone session `4a87f405-c6ae-4524-8eea-3ebc2ab3431e` committed the sanitized source snapshot as `30c08e6345f6f0f2e0a716937d3cde6c8ed778c5` after preserving full history locally.
- Aspect IDs: ASPECT-001
- Evidence IDs: PRV-20260901-001-E0010, PRV-20260901-001-E0018
- Relationship: Introduced the selected mechanism into the history-sanitized `for-review` ancestry.
- Confidence: High
- Evidence basis: Session refs, commit metadata, target blame, and source-snapshot record.
- Alternatives/counter-evidence: Sanitized blame attributes imported lines to the snapshot commit.
- Limitations: The preserved full-history objects no longer resolve through the isolated helper.

## CHRON-014

- Date: 2026-08-11T06:38:20Z
- Event: Frozen target commit `1ab289c066b69acdd8b55c9f77055b0145be1316` retained the selected mechanism unchanged within later review-remediation and documentation work.
- Aspect IDs: ASPECT-001
- Evidence IDs: PRV-20260901-001-E0003, PRV-20260901-001-E0005, PRV-20260901-001-E0012
- Relationship: Exact reviewed target state.
- Confidence: High
- Evidence basis: Isolated target state, commit metadata, current source, and target blame.
- Alternatives/counter-evidence: Later changes strengthened surrounding tests and documentation but do not establish original rationale.
- Limitations: Target remains a review-and-test PoC, not formal or hardware validation.

## CHRON-015

- Date: 2026-08-28 to 2026-08-29
- Event: Prior review `PRV-20260828-001` identified `511187f` as the earliest supported internal implementation and adjacent consistency-monitoring precedent, while direct standalone transfer remained unresolved on then-used evidence.
- Aspect IDs: ASPECT-001
- Evidence IDs: PRV-20260901-001-E0013
- Relationship: Provides the previous evidence baseline and a falsifiable unresolved conclusion.
- Confidence: High
- Evidence basis: Completed local review package and session summary.
- Alternatives/counter-evidence: Newly examined extraction sessions now resolve the transfer relationship.
- Limitations: Exact external conceptual origin remains unresolved.

## CHRON-016

- Date: 2026-09-01
- Event: This review indexed all available associated agent history, recovered timestamped origin and extraction records, and separated the selected software PTE reconciliation from later CSR readbacks.
- Aspect IDs: ASPECT-001
- Evidence IDs: PRV-20260901-001-E0002, PRV-20260901-001-E0010, PRV-20260901-001-E0011, PRV-20260901-001-E0017, PRV-20260901-001-E0018
- Relationship: Resolves the strongest supported reason and direct transfer while preserving external-origin and missing-history limitations.
- Confidence: High
- Evidence basis: Exact session inventories, tool metadata, read-only Git captures, local prior review, and bounded public research.
- Alternatives/counter-evidence: Unavailable sessions or alternate terminology could add context.
- Limitations: The conclusion concerns retained evidence, not hidden model reasoning or intent.

## CHRON-017

- Date: 1995-04 to 1995-06
- Event: DTOS described current-policy enforcement, blocking security faults, and a limited secure startup policy rather than disabling checks.
- Aspect IDs: ASPECT-001
- Evidence IDs: PRV-20260901-001-E0019
- Relationship: Strong prior art for fail-closed initialization and current policy/enforcement correspondence.
- Confidence: High
- Evidence basis: Primary retained USENIX paper.
- Alternatives/counter-evidence: DTOS trusts its kernel binding and access-vector machinery.
- Limitations: No post-install PTE readback.

## CHRON-018

- Date: 2002
- Event: LOCK documented policy-derived access vectors loaded into MMU tables while explicitly treating privileged policy-to-MMU translation as trusted.
- Aspect IDs: ASPECT-001
- Evidence IDs: PRV-20260901-001-E0020
- Relationship: Strong policy-to-MMU prior art and counter-evidence to readback being universal.
- Confidence: High
- Evidence basis: Primary participant retrospective.
- Alternatives/counter-evidence: Tighter coupling can reduce, but not eliminate, translation assumptions.
- Limitations: No post-install comparison or fail-stop sequence.

## CHRON-019

- Date: 2011
- Event: "seL4 Enforces Integrity" proved that concrete protection state, including page-table links, refines abstract policy.
- Aspect IDs: ASPECT-001
- Evidence IDs: PRV-20260901-001-E0021
- Relationship: Strong conceptual prior art for policy-to-live-state correspondence and a proof-based alternative to runtime readback.
- Confidence: High
- Evidence basis: Primary peer-reviewed formal-verification paper.
- Alternatives/counter-evidence: Proof assumptions and certified setup replace the target's runtime check.
- Limitations: No runtime post-install PTE inspection.

## CHRON-020

- Date: 2013
- Event: seL4 translation validation checked a produced kernel binary against proved C semantics instead of trusting the translator.
- Aspect IDs: ASPECT-001
- Evidence IDs: PRV-20260901-001-E0022
- Relationship: Strong precedent for validating a produced artifact after translation.
- Confidence: High
- Evidence basis: Primary PLDI paper metadata and approved local research.
- Alternatives/counter-evidence: Whole-binary offline validation is broader than target permission readback.
- Limitations: No policy evaluator or page-table permission comparison.

## CHRON-021

- Date: 2026-05-24
- Event: Immutable pKVM documentation acknowledged possible mapping incoherency in a contemporary ownership-based isolation design.
- Aspect IDs: ASPECT-001
- Evidence IDs: PRV-20260901-001-E0023
- Relationship: Counter-evidence to continuous policy-to-mapping reconciliation being universal.
- Confidence: High
- Evidence basis: Exact public project commit and documentation.
- Alternatives/counter-evidence: pKVM uses a different ownership and lifecycle model.
- Limitations: No target-style TE policy or installation readback.
