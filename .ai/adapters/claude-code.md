# Claude Code Adapter for AI Project Starter

# Setup: Copy this file to your project root as `CLAUDE.md`

## Project Entry Point

Read `AGENTS.md` in the project root for the full startup sequence and workflow.

## Essential Context (Always Read)

- `.ai/context/purpose.md` — Project vision, goals, users
- `.ai/context/INDEX.md` — Available context file listing
- `.ai/manifest.json` — Pre-computed file metadata (check hashes before re-reading)
- `.ai/workflow/workflow-order.md` — Phase ordering and decision trees

## Mandatory Rules

- `.ai/rules/build-discipline.md` — PRD strict adherence, Plan Mode
- `.ai/rules/security.md` — Security requirements for all code

## Workflow

Follow the phased workflow in `.ai/workflow/workflow-order.md`:
1. **Investigation (Phase -1):** Read-only. Understand before acting.
2. **Setup (Phase 00):** Run health check, load context, break down phases.
3. **Plan (Phase 01-02):** Brainstorm, then write implementation plan.
4. **Build (Phase 07):** TDD coding with design system compliance.
5. **Verify (Phase 12):** Tests, lint, security scan, docs review.
6. **Finish (Phase 13):** Merge/PR/cleanup.

## Skills

Skills are in `.ai/skills/` organized by phase number. Read `SKILL.md` in each folder.
Use Skill tool to load skills when available.

## Memory

Before debugging, read `.ai/memory/index.md` first. Log fixes in `.ai/memory/bug-log.md`.

## Before Stopping

Update `PROJECT_STATUS.md` dashboard and `.ai/memory/handoff.md` before ending a session.
