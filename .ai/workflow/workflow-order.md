# Workflow Order

Use this order unless the user explicitly asks for a narrower task.

| Order | Phase | Skill Folder | Purpose |
|---:|---|---|---|
| 00 | Runtime / skill loading | `.ai/skills/00-runtime/using-superpowers` | Start by finding and applying relevant skills. |
| 00b | Context loading | `.ai/context/` | Read INDEX.md, purpose.md, and load on-demand context files. |
| 00c | Phase breakdown | `.ai/context/BUILD-PHASES.md` | Break down work into ordered phases with dependencies. |
| 01 | Brainstorming | `.ai/skills/01-brainstorming/brainstorming` | Clarify intent, requirements, options, and tradeoffs. |
| 02 | Planning | `.ai/skills/02-planning/writing-plans` | Convert requirements into small implementation tasks. |
| 03 | Work isolation | `.ai/skills/03-work-isolation/using-git-worktrees` | Isolate feature work when appropriate. |
| 04 | Parallelization | `.ai/skills/04-parallelization/dispatching-parallel-agents` | Split independent work across agents. |
| 05 | Plan execution | `.ai/skills/05-execution/executing-plans` | Execute a written plan in batches. |
| 06 | Subagent development | `.ai/skills/06-subagent-development/subagent-driven-development` | Coordinate implementer and reviewer subagents. |
| 07 | Coding | `.ai/skills/07-coding/test-driven-development` | Write tests first for features and fixes. |
| 08 | Debugging | `.ai/skills/08-debugging/systematic-debugging` | Investigate root cause after reading the memory index. |
| 09 | Request review | `.ai/skills/09-review-request/requesting-code-review` | Ask for independent review after milestones. |
| 10 | Code review | `.ai/skills/10-code-review/code-reviewer` | Review implementation against plan and quality bar. |
| 11 | Receive review | `.ai/skills/11-review-response/receiving-code-review` | Triage and implement valid review feedback. |
| 12 | Verification | `.ai/skills/12-verification/verification-before-completion` | Verify before claiming done. |
| 13 | Branch finish | `.ai/skills/13-branch-finish/finishing-a-development-branch` | Decide merge, PR, cleanup, or keep-as-is. |
| 90 | Skill maintenance | `.ai/skills/90-meta/writing-skills` | Create, edit, or validate skills. |

## Standard Flow

Brainstorm -> Plan -> Isolate work -> Decide parallelization -> Execute -> Test-driven coding -> Debug if needed -> Request review -> Receive review -> Verify -> Finish branch.

## Context Loading Flow

When user uploads context files (PRD.md, UX-design.md, UX-copy.md, UI-design.md):

1. Read `.ai/context/INDEX.md` (what files exist).
2. Read `.ai/context/purpose.md` (always).
3. For each uploaded file:
   - Check file size
   - If < 500 lines → read in full
   - If > 500 lines → read frontmatter + Summary section
   - Store: file name, type, key points, section map
4. Synthesize:
   - Confirm what was read (summary per file)
   - Cross-reference files for conflicts/gaps
   - Ask 1-3 clarifying questions if needed
5. Create `.ai/context/BUILD-PHASES.md` (phase breakdown).
6. Update `PROJECT_STATUS.md` with current state.
7. Proceed to Planning phase (workflow step 02).

## Memory Rule

Before debugging or fixing, read `.ai/memory/index.md` first. Open detailed memory files only when relevant. If memory exceeds thresholds, use `.ai/commands/prune-memory.md`.

## Rate Limit / Model Switch Rule

Before switching models or stopping due to a rate limit, update:

- `PROJECT_STATUS.md`
- `.ai/memory/handoff.md`

Include the current goal, completed work, commands run, changed files, verification, open questions, and next safe step.