# Universal Agent Entry Point

Every AI agent must read this file before working on the project.

## Required Startup Sequence

0. **Check session cache and manifest.** Read `.ai/.session-state.json`. If `session_id` is set and all mandatory files are cached (steps 1-9 below), skip directly to step 10 (on-demand loading). Otherwise, proceed through the full sequence and update the cache when done.

   > **Manifest-based smart loading:** Read `.ai/manifest.json` first. Compare file hashes to see if anything changed since last session. Only re-read files whose hash changed or that haven't been loaded yet. For `tier: "on-demand"` files, skip entirely unless the task requires them.
   > **Fresh session:** If `.ai/.session-state.json` is missing or `session_id` is null, generate a new session_id (use current timestamp as ISO string or a short random hash), set `started_at` to the current time, reset `loaded_files` to all false, and write the updated JSON before proceeding to step 1.
   > **First-run detection:** If `purpose.md` still contains TODO placeholders, suggest running the setup wizard (`.ai/commands/setup-wizard.md`) before proceeding.
   > **Batching:** After step 0, read steps 1-5 in parallel where your platform supports batch reads.
   > **Activity tracking:** Update `last_activity` with the current timestamp after reading or writing any file. This allows future agents to detect stale sessions.

1. Read `AGENTS.md`.
2. Read `.ai/README.md`.
3. Read `PROJECT_STATUS.md`.
4. Read `.ai/context/INDEX.md` (lists all available context files).
5. Read `.ai/context/purpose.md` (project vision, goals, users — always read).
6. Read `.ai/rules/build-discipline.md`, `.ai/rules/security.md`, and `.ai/rules/external-cli-adapters.md` (mandatory).
7. Read `.ai/workflow/workflow-order.md`.
8. Read the relevant `.ai/agents/*.md` persona for the role you are performing.
9. Read `.ai/memory/index.md` before opening detailed memory files.
10. **Run environment preflight** — check `.ai/commands/health-check.md` or run: git status, verify required CLIs.
11. Load on-demand based on task:
    - Planning/Coding → `.ai/context/architecture.md` + `design/` folder
    - Brainstorming → `.ai/context/domain.md`
    - Debugging → `.ai/context/domain.md`
    - Architecture decisions → `.ai/context/decisions/` (read existing ADRs)
    - Any task → `.ai/rules/coding-standards.md` + `.ai/rules/testing.md`
12. Open detailed memory files only when the index suggests relevant prior context.
13. **Update manifest** — after reading files, update `.ai/manifest.json` hashes for any files that changed.

## Context Loading Workflow

When user uploads context files (PRD.md, UX-design.md, UX-copy.md, UI-design.md), see **Phase 00.3 (Context Loading)** in `.ai/workflow/workflow-order.md` for the full flow. This is the canonical reference — the startup sequence above handles session initialization only.

## Operating Rules

- **Plan Mode:** Before any action (code, commit, PR), pass through Phase -1 (Investigation). Read, search, and propose. No file writes, no code changes without explicit user approval.
- Use the workflow in `.ai/workflow/workflow-order.md`.
- **New project?** Run the setup wizard (`.ai/commands/setup-wizard.md`) or follow `GETTING_STARTED.md`.
- Use the skill map in `.ai/workflow/agent-skill-map.md` to choose skills.
- Treat `.ai/skills/` as the local canonical skill library for this project.
- Keep work understandable for the next AI model.
- Do not assume chat history will survive a model switch or rate limit.
- Keep self-healing memory bounded by `.ai/memory/memory-policy.md`.
- **Dashboard updates:** Update `PROJECT_STATUS.md` dashboard metrics at every phase transition, not just when stopping.
- Update `PROJECT_STATUS.md` and `.ai/memory/handoff.md` before stopping.
- **Architecture decisions:** When making significant technology or pattern choices, write an ADR in `.ai/context/decisions/`. Read existing ADRs before proposing alternatives.
- When fixing a bug or recurring problem, log it concisely in `.ai/memory/bug-log.md` and update `.ai/memory/index.md`.
- When a fix pattern is reusable, add or update `.ai/memory/fix-patterns.md`.
- When memory exceeds policy thresholds, run `.ai/commands/prune-memory.md`.
- **Platform adapters:** If using Claude Code, Cursor, Windsurf, or other tools, check `.ai/adapters/` for platform-specific entry points.
- **External CLIs:** If the user requests an installed CLI (e.g. Jules, OpenCode) with no adapter, auto-register it before use. Do not install missing CLIs, do not guess command syntax, do not pass secrets into external tools, and do not let review-only tools edit files.

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