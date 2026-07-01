# Workflow Order

Use this order unless the user explicitly asks for a narrower task.

> **Phase Numbering:** Phase -1 is a read-only investigation mode that must precede all other phases. Phase 90 is meta/maintenance, intentionally separated from the development flow.
> **Fast-path:** For trivial tasks (≤5 lines changed, non-behavioral, docs-only, dep updates), jump directly from Phase -1 to Phase 07. Skip all intermediate phases. Log the skip in `PROJECT_STATUS.md`.
> **Compressed flow:** For routine tasks (single feature, <10 files, low risk), use the compressed flow below. It collapses 00.1-06 into a single planning phase.

## Phase Table

| Order | Phase | Skill Folder | Purpose | Exit Criteria |
|---:|---|---|---|---|
| -1 | Investigation (Plan Mode) | `.ai/rules/build-discipline.md` | Read-only investigation before any action. Read, search, propose — NO file writes or code changes. | Requirements understood; direction proposed; user approved next phase. |
| 00 | **Runtime & Setup** | | | |
| &emsp;00.1 | Skill loading | `.ai/skills/00-runtime/using-superpowers` | Find and apply relevant skills. | All relevant skills loaded; `PROJECT_STATUS.md` up to date. |
| &emsp;00.2 | Environment preflight | `.ai/commands/health-check.md` | Check git state, environment, tool availability, and dependency existence (package.json, requirements.txt, etc.) before work begins. | Git branch/status clean; required CLIs verified; project deps present; environment summary reported. |
| &emsp;00.3 | Context loading | `.ai/context/` | Read INDEX.md, purpose.md, and load on-demand context files. | Core context files read; uploaded files parsed; TRACEABILITY-MATRIX.md created. |
| &emsp;00.4 | Phase breakdown | `.ai/skills/02-planning/build-phases` | Break down work into ordered phases with dependencies. | BUILD-PHASES.md created with numbered phases, tasks, and acceptance criteria. |
| 01 | Brainstorming | `.ai/skills/01-brainstorming/brainstorming` | Clarify intent, requirements, options, and tradeoffs. | Requirements documented; user approved direction; 2-3 approaches explored; **ADR written for approved direction** (`.ai/context/decisions/`). |
| 02 | Planning | `.ai/skills/02-planning/writing-plans` | Convert requirements into small implementation tasks with MoSCoW priority. | Implementation plan with testable tasks; BUILD-PHASES.md updated; **ADRs written for architecture decisions**. |
| 02.5 | Architectural Spike | — | **[OPTIONAL]** Write quick, throwaway prototype code to validate technical unknowns. | Spike validated; throwaway code deleted; BUILD-PHASES.md updated; user approved to proceed to TDD. |
| 03 | Work isolation | `.ai/skills/03-work-isolation/using-git-worktrees` | **[OPT-IN]** Only when using git worktrees. Isolate feature work from main branch. **Skip otherwise.** | Isolated workspace ready; clean test baseline passing. |
| 04 | Parallelization | `.ai/skills/04-parallelization/dispatching-parallel-agents` | Split independent work across agents. | Independent tasks identified; agents dispatched with clear boundaries. |
| 05 | Plan execution | `.ai/skills/05-execution/executing-plans` | Execute a written plan in batches. | First batch complete; progress reported to user. |
| 06 | Subagent development | `.ai/skills/06-subagent-development/subagent-driven-development` | Coordinate implementer and reviewer subagents. | Implementer and reviewer subagents dispatched; outputs reviewed. |
| 07 | Coding | `.ai/skills/07-coding/test-driven-development` | Write tests first for features and fixes (Full TDD or Pragmatic Mode). | All tasks implemented; tests passing; linter clean; build succeeds; security scan clean. |
| 08 | Debugging | `.ai/skills/08-debugging/systematic-debugging` | Investigate root cause after reading the memory index. | Root cause identified; automated regression test written explicitly triggering the bug; fix applied; tests updated; memory logged in fix-patterns.md. |
| 09 | Request review | `.ai/skills/09-review-request/requesting-code-review` | Ask for independent review after milestones. | Review packet prepared (including Visual Dry Run screenshots); reviewer dispatched or review completed. |
| 10 | Code review | `.ai/skills/10-code-review/code-reviewer` | Review implementation against plan and quality bar. | Review findings triaged (Critical/Important/Minor); all items addressed. |
| 11 | Receive review | `.ai/skills/11-review-response/receiving-code-review` | Triage and implement valid review feedback. | Valid feedback implemented; re-verification complete. |
| 12 | Verification | `.ai/skills/12-verification/verification-before-completion` | Verify before claiming done — tests, lint, build, **security scan**, and **docs review**. | All checks pass; no regressions; security scan clean; Visual Dry Run against ui-design.md complete; user notified. |
| 13 | Branch finish | `.ai/skills/13-branch-finish/finishing-a-development-branch` | Decide merge, PR, cleanup, or keep-as-is. Archive BUILD-PHASES.md. | Branch merged/PR created or explicitly kept; Active Context Compression complete; worktree cleaned up; BUILD-PHASES.md archived. |
| 14 | Release | — | Deploy to staging, smoke test, deploy to production, monitor. | Staging verified; production deploy green; rollback plan documented. |
| 15 | Retrospective | — | Review what went well, what to improve, update memory patterns and bug log. | Lessons documented; fix patterns updated; memory index refreshed. |
| 90 | Skill maintenance | `.ai/skills/90-meta/writing-skills` | Create, edit, or validate skills. | Skill created/edited; workflow docs updated if behavior changed. |

## Standard Flow

```
              ┌────────────────────────────────────────────────────────────┐
              │ Phase -1: Investigation (Plan Mode) — always required      │
              └──────────┬─────────────────────────────────────────────────┘
                         │
            ┌────────────┼────────────────────────────┐
            ▼            ▼                            ▼
     [Compressed]   [Fast-Path]                 [Full Flow]
     (routine)      (trivial)                   (complex)
            │            │                            │
     ┌──────┴──────┐    └── Phase 07 (Coding) ──┐    └── Phase 00 (Setup)
     │ Phase 01    │         ┌──────────┐        │         Phase 01 (Brainstorm)
     │ (Brainstorm)│         │ Verify   │        │         Phase 02 (Plan)
     │ Phase 02    │         │ Finish   │        │         Phase 02.5 (Spike) [opt-in]
     │ (Plan)      │         └──────────┘        │    ┌────┤
     └──────┬──────┘                             │    │  Phase 03 (Isolate) [opt-in]
            ▼                                    │    │  Phase 05 (Execute)
     Phase 07 (Coding)                            │    │  Phase 06 (Subagent Dev)
            │                                    │    ▼
     ┌──────┴──────┐                              │  Phase 07 (Coding / TDD)
     │ Verify      │                              │  Phase 08 (Debug if needed)
     │ Finish      │                              │  Phase 09-11 (Review cycle)
     └─────────────┘                              │  Phase 12 (Verify)
                                                  │  Phase 13 (Branch Finish)
                                                  │  Phase 14 (Release)*
                                                  │  Phase 15 (Retro)*
                                                  └──────────────────────────
                                              * Optional — skip for internal/experimental branches
```

### Dependency Graph

```
Phase -1 (no deps, always first)
     │
     ▼
Phase 00 (no deps, always after -1)
     │
     ├──▶ 00.1 Skill loading ──▶ 00.2 Preflight ──▶ 00.3 Context ──▶ 00.4 Phase breakdown
     │
     ▼
Phase 01 (deps: 00)
     │
     ▼
Phase 02 (deps: 01)
     │
     ├──▶ Phase 02.5 [opt-in] (deps: 02)
     │         │
     │         ▼
     ├──▶ Phase 03 [opt-in] (deps: 02 or 02.5)
     │         │
     │         ▼
     ├──▶ Phase 04 (deps: 02 or 02.5, can run in parallel with 03)
     │         │
     │         ▼
     ├──▶ Phase 05 (deps: 04)
     │         │
     │         ▼
     └──▶ Phase 06 (deps: 05, can overlap with 05)
               │
               ▼
Phase 07 (deps: 02, 05, 06)
     │
     ▼
Phase 08 (deps: 07 — only entered when bugs found)
     │
     ▼
Phase 09 (deps: 07 or 08)
     │
     ▼
Phase 10 (deps: 09)
     │
     ▼
Phase 11 (deps: 10)
     │
     ▼
Phase 12 (deps: 11)
     │
     ▼
Phase 13 (deps: 12)
     │
     ├──▶ Phase 14 [optional] (deps: 13)
     │
     └──▶ Phase 15 [optional] (deps: 13 or 14)
```

### Compressed Flow (Routine Tasks)

Use when: single feature, <10 files, low risk, no parallelization needed.

```
Investigate → Brainstorm/Plan → TDD/Coding → Verify → Finish
```

**Phases collapsed:** 00.1-06 are folded into a single "Plan" phase. Phase 01 and 02 run back-to-back. Phases 03-06 are skipped. Phase 14 and 15 are skipped unless explicitly requested.

**Log the compressed decision** in `PROJECT_STATUS.md`: "Using compressed flow — phases 03-06, 14-15 skipped."

### Fast-Path (Trivial Tasks Only)

```
Investigate → Coding → Verify → Finish
```

**Fast-path criteria** (ALL must be true):
- Change is ≤ 5 lines modified
- Non-behavioral (typo fix, rename, comment, config)
- Docs-only or dependency update
- No test changes needed
- Log the skip decision in `PROJECT_STATUS.md`

## User Checkpoints

**Stop and get user approval before proceeding to the next phase at these gates:**

| After Phase | What to Present | User Must Approve |
|-------------|----------------|-------------------|
| -1 | Investigation summary + proposed direction | Go/no-go to proceed |
| 00.3 | Summary of loaded context | Context is correct and complete |
| 01 | 2-3 approaches with tradeoffs | Which direction to pursue |
| 02 | Implementation plan with task list | Plan is acceptable |
| 02.5 | Spike results | Discard code and proceed to TDD |
| 07 | "Ready for review" notification | Proceed to review (or request changes) |
| 12 | Verification results | Everything looks good to ship |
| 13 | Merge/PR/keep decision | How to finish the branch |
| 14 | Release plan + rollback strategy | Proceed with deploy |
| 15 | Retro notes | Lessons logged |

For all other phase transitions, proceed automatically but log the transition in `PROJECT_STATUS.md`.

**Dashboard rule:** At every phase transition (including automated ones), update the `PROJECT_STATUS.md` dashboard metrics: increment tasks complete, update phase status, log any new blockers. Do not just append to the log — update the summary tables at the top.

**ADR rule:** When a user approves a significant technical direction (Phase 01) or architecture decision (Phase 02), write an ADR in `.ai/context/decisions/` using the template. Number sequentially.

## Error Taxonomy (Symptom → Rollback Target)

When something goes wrong, diagnose the symptom below and roll back to the indicated phase. Re-run that phase's exit criteria before retrying the failed phase.

### Diagnosis Table

| Symptom | Likely Root Cause | Rollback To | Rollback Procedure |
|---------|------------------|-------------|--------------------|
| **Tests fail** during verification (Phase 12) | Bug or regression in implementation | Phase 08 (Debugging) | `git stash` recent changes → recreate clean repro → debug |
| **Tests pass but feature doesn't work** | Implementation gap that tests don't cover | Phase 07 (Coding) | Write failing test first → re-implement |
| **Design doesn't match PRD/UX specs** | Implementation deviated from requirements | Phase 07 (Coding) | Re-read PRD/UX specs → fix implementation, don't revert |
| **Architecture doesn't support the feature** | Planning missed architectural constraint | Phase 02 (Planning) | Revisit architecture.md → revise plan with architect sub-role |
| **Component doesn't exist in design system** | Gap in design context | Phase 01 (Brainstorming) | Brainstorm new component → get user approval |
| **Missing requirement discovered mid-build** | Incomplete context loading | Phase 00.3 (Context Loading) | Request missing context files from user → cross-reference |
| **Code quality issues** (lint, style, patterns) | Implementation skipped coding standards | Phase 07 (Coding) | Run linter → fix all errors → re-verify |
| **Security vulnerability found** | Security rules not followed | Phase 07 (Coding) | Read security.md → fix vulnerability → add regression test |
| **PRD ambiguous, multiple interpretations** | Insufficient brainstorming | Phase 01 (Brainstorming) | List interpretations → ask user which is correct |
| **Plan tasks are too large or unclear** | Planning didn't decompose enough | Phase 02 (Planning) | Split each task to ≤15 min → use MoSCoW priority |
| **Plan misses dependencies between tasks** | Dependency mapping incomplete | Phase 02 (Planning) | Re-map dependency graph → reorder tasks |
| **Execution stalls on wrong approach** | Plan was wrong | Phase 02 (Planning) | Stash partial work → write new plan → re-start |
| **Execution scope too large for one agent** | Parallelization opportunity missed | Phase 04 (Parallelization) | Identify independent chunks → dispatch parallel agents |
| **Parallel agents produce conflicting changes** | Shared dependency not identified | Phase 04 (Parallelization) | Serialize conflicted tasks → merge conflict resolution |
| **Code review finds missing tests** | TDD not followed | Phase 07 (Coding) | Write failing test → re-implement → re-verify red-green |
| **Review reveals requirements not met** | Requirements gap | Phase 01 (Brainstorming) | Re-read requirements with reviewer → clarify gaps |
| **External dependency unavailable** | Blocker outside team control | Stop, ask user | Document blocker → user decides (redesign or wait) |
| **Environment/tooling issue** | Preflight skipped or incomplete | Phase 00.2 (Preflight) | Fix tooling/versions → re-check |

### Phase-Level Recovery Map

```
Phase -1 (Investigation) fails:
  → Insufficient data → Gather more context, re-read files
  → Wrong direction   → Ask more targeted questions

Phase 00.2 (Preflight) fails:
  → Environment issue → Fix tooling/versions, re-check
  → Git state dirty   → Commit/stash changes, re-check
  → Missing deps      → Run npm install / pip install / equivalent

Phase 00.3 (Context loading) fails:
  → Missing files   → Request missing context from user
  → Gaps/conflicts  → Clarify with user, cross-reference again

Phase 01 (Brainstorming) fails:
  → Wrong direction → Deeper questions, re-propose
  → Rejected idea   → Return to Phase -1, gather constraints

Phase 02 (Planning) fails:
  → Plan too large   → Phase 04 (Parallelization)
  → Plan wrong       → Phase 01 (re-clarify requirements)

Phase 05 (Execution) stalls:
  → Plan is wrong    → Phase 02 (Planning)
  → Scope too large  → Phase 04 (Parallelization)

Phase 07 (Coding) blocked:
  → Unexpected complexity → Phase 02 (Planning)
  → Ambiguous requirement → Phase 01 (Brainstorming)
  → External dependency   → Stop and ask user

Phase 10 (Code Review) finds issues:
  → Code quality problems → Phase 07 (Coding)
  → Architecture issues   → Phase 02 (Planning)
  → Missing requirements  → Phase 01 (Brainstorming)

Phase 12 (Verification) fails:
  → Test failures         → Phase 08 (Debugging)
  → Security scan fails   → Phase 07 (Coding) — fix with security.md
  → Docs incomplete       → Phase 07 (Coding) — add docs
  → Implementation gaps   → Phase 07 (Coding)
  → Design/architecture issues → Phase 02 (Planning)

Phase 14 (Release) fails:
  → Staging tests fail    → Phase 08 (Debugging)
  → Production deploy error → Roll back to last known good version → Phase 08 (Debugging)

Phase 15 (Retro) fails:
  → Team disagrees on lessons → Document dissenting views → Move on
```

**Rule:** After any rollback, re-run the target phase and its exit criteria before retrying the failed phase.

## Context Loading Flow (Phase 00.3)

This is the canonical reference. See also AGENTS.md startup sequence (steps 1-9) for session initialization — the flows are complementary, not duplicates.

When user uploads context files (PRD.md, UX-design.md, UX-copy.md, UI-design.md):

1. Read `.ai/context/INDEX.md` (what files exist).
2. Read `.ai/context/purpose.md` (always).
3. For each uploaded file:
   - Check file size.
   - If < ~500 lines → read in full.
   - If > ~500 lines → use **Structural Skim**: Extract and read only the Markdown Headers (`#`, `##`, `###`) to understand the document's structure without getting bogged down in line-by-line details. Do not attempt to read the full file end-to-end to build the initial roadmap.
   - Store: file name, type, key points, and structural section map.
4. Synthesize:
   - Confirm what was read (summary per file)
   - Generate `TRACEABILITY-MATRIX.md` (mapping PRD features -> UX flows -> UI screens -> Architecture components) and explicitly highlight any gaps.
   - Ask 1-3 clarifying questions if needed
5. **JIT Reading Enforcement:** Inform the user: "Massive context files detected. I performed a structural skim to generate the roadmap. I will use Just-In-Time (JIT) reading to load the specific details of each phase only when that phase officially begins."
6. Create `.ai/context/BUILD-PHASES.md` (phase breakdown) based on the structural skim. See lifecycle rules below.
7. Update `PROJECT_STATUS.md` dashboard metrics with current state.
8. **Regenerate `.ai/manifest.json`** with updated file hashes and line counts for any files that were created or modified.
9. Proceed to Planning phase (workflow step 02).

## BUILD-PHASES.md Lifecycle Summary

| Stage | When | Action |
|-------|------|--------|
| **Create** | Phase 00.4 | Write `.ai/context/BUILD-PHASES.md` with full phase breakdown |
| **Update** | After Phase 02, Phase 04 | Revise tasks or add agent assignments |
| **Read** | Before Phase 07 | Reference current task and acceptance criteria |
| **Verify against** | Phase 12 | Check each task's acceptance criteria is met |
| **Archive** | After Phase 13 | Move to `.ai/memory/archive/` or delete |

Full details in `.ai/skills/02-planning/build-phases/SKILL.md`.

## Memory & Rules Updates (Bug Fix Institutionalization)

Before debugging or fixing, read `.ai/memory/index.md` first. Open detailed memory files only when relevant. If memory exceeds thresholds, use `.ai/commands/prune-memory.md`.

- **Global Rules Enhancement**: If an architectural anti-pattern caused a bug, inject a strict preventative rule into `.ai/rules/coding-standards.md` (e.g., "NEVER use useEffect for data fetching").
- **Fix Patterns Enhancement**: Use `.ai/memory/fix-patterns.md` as the passive dictionary for localized bug fixes (used only during Phase 08). Do NOT create active "Skills" for localized bugs to prevent skill bloat and overfitting. Instead, rely on automated regression tests to serve as permanent memory.

## Rate Limit / Model Switch Rule

Before switching models or stopping due to a rate limit, update:

- `PROJECT_STATUS.md`
- `.ai/memory/handoff.md`

Include the current goal, completed work, commands run, changed files, verification, open questions, and next safe step.
