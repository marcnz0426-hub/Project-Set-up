# Universal Agent Entry Point

Every AI agent must read this file before working on the project.

## Required Startup Sequence

1. Read `AGENTS.md`.
2. Read `.ai/README.md`.
3. Read `PROJECT_STATUS.md`.
4. Read `.ai/context/INDEX.md` (lists all available context files).
5. Read `.ai/context/purpose.md` (project vision, goals, users — always read).
6. Read `.ai/rules/build-discipline.md` and `.ai/rules/security.md` (mandatory).
7. Read `.ai/workflow/workflow-order.md`.
8. Read the relevant `.ai/agents/*.md` persona for the role you are performing.
9. Read `.ai/memory/index.md` before opening detailed memory files.
10. Load on-demand based on task:
    - Planning/Coding → `.ai/context/architecture.md` + `design/` folder
    - Brainstorming → `.ai/context/domain.md`
    - Debugging → `.ai/context/domain.md`
    - Any task → `.ai/rules/coding-standards.md` + `.ai/rules/testing.md`
11. Open detailed memory files only when the index suggests relevant prior context.

## Context Loading Workflow

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

## Operating Rules

- Use the workflow in `.ai/workflow/workflow-order.md`.
- Use the skill map in `.ai/workflow/agent-skill-map.md` to choose skills.
- Treat `.ai/skills/` as the local canonical skill library for this project.
- Keep work understandable for the next AI model.
- Do not assume chat history will survive a model switch or rate limit.
- Keep self-healing memory bounded by `.ai/memory/memory-policy.md`.
- Update `PROJECT_STATUS.md` and `.ai/memory/handoff.md` before stopping.
- When fixing a bug or recurring problem, log it concisely in `.ai/memory/bug-log.md` and update `.ai/memory/index.md`.
- When a fix pattern is reusable, add or update `.ai/memory/fix-patterns.md`.
- When memory exceeds policy thresholds, run `.ai/commands/prune-memory.md`.

## Role Selection

- Use `.ai/agents/orchestrator.md` for general coordination.
- Use `.ai/agents/brainstormer.md` when the request is fuzzy.
- Use `.ai/agents/planner.md` when turning requirements into tasks.
- Use `.ai/agents/implementer.md` when writing code.
- Use `.ai/agents/parallel-development-lead.md` when splitting independent work.
- Use `.ai/agents/code-reviewer.md` for independent review.
- Use `.ai/agents/debugger.md` for bugs and failures.
- Use `.ai/agents/release-manager.md` for final verification, PR, merge, and branch cleanup.
- Use `.ai/agents/skill-builder.md` for editing or creating skills.