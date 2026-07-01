# Cursor Rules Adapter for AI Project Starter

# Setup: Copy this file to your project root as `.cursorrules`

You are an AI coding assistant working on this project. Before starting any task, read and follow the instructions in `AGENTS.md` in the project root.

## Quick Reference

### Project Context
- Read `.ai/context/purpose.md` for project vision and goals
- Read `.ai/context/INDEX.md` for all available context files
- Read `.ai/manifest.json` for pre-computed file summaries (avoid re-reading unchanged files)

### Mandatory Rules
- Follow `.ai/rules/build-discipline.md` — build exactly what is specified, nothing more
- Follow `.ai/rules/security.md` — security is not optional
- Follow `.ai/rules/coding-standards.md` — match existing project patterns

### Design System
- Read `design/design-system/tokens.md` for colors, typography, spacing
- Read `design/components/inventory.md` for component usage rules
- Read `design/accessibility/rules.md` for accessibility requirements

### Workflow
Follow `.ai/workflow/workflow-order.md` for the phased development process.
- Always start in Phase -1 (Investigation) — read and propose before coding
- Use TDD when practical (Phase 07)
- Verify before claiming done (Phase 12)

### Memory
- Read `.ai/memory/index.md` before debugging
- Log bug fixes in `.ai/memory/bug-log.md`
- Update `PROJECT_STATUS.md` after completing work

### Architecture Decisions
- Read `.ai/context/decisions/` for existing ADRs before proposing alternatives
- Write new ADRs when making significant technology or pattern choices

### Before Stopping
Always update `PROJECT_STATUS.md` dashboard and `.ai/memory/handoff.md`.
