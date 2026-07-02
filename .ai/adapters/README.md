# Platform & External CLI Adapters

This folder contains platform-specific entry points that translate the generic AI Project Starter template into native configuration for different AI coding tools.

## How to Use

1. Identify which AI coding tool you're using
2. Copy the matching adapter file to your project root
3. Rename it to the platform's expected filename

| Platform | Adapter File | Copy To | Rename To |
|----------|-------------|---------|-----------|
| Claude Code | `claude-code.md` | Project root | `CLAUDE.md` |
| Cursor | `cursor.md` | Project root | `.cursorrules` |
| Antigravity | `antigravity.md` | `.agents/` | `AGENTS.md` |
| OpenCode | `opencode.md` | Project root | `opencode.md` |
| Windsurf | `windsurf.md` | Project root | `.windsurfrules` |

## External CLI Adapters

In addition to platform adapters, this folder stores **External CLI Adapters** (e.g., `jules.md`, `opencode.md`). These allow the orchestrator to dynamically invoke installed CLI tools or coding agents (like Jules, OpenCode, Aider, Gemini CLI, Claude CLI, Codex CLI, Antigravity, or future CLIs).

### How Auto-Registration Works
If you ask the orchestrator to use a specific installed CLI (e.g., "Use OpenCode for the frontend"), and an adapter doesn't exist, the orchestrator will:
1. Verify the CLI is installed locally using non-mutating checks.
2. Auto-register the tool by generating a new adapter file based on `.ai/adapters/cli-tool-template.md`.
3. Save it here to define the tool's roles, file-edit permissions, prompt format, and output contract.

**Important:** These adapters describe *how* to use the command safely, but they **do not prove the CLI is installed** permanently. The orchestrator will always verify the CLI's presence before dispatching tasks.

## What Platform Adapters Do

Each adapter:
- **Points to** the canonical `AGENTS.md` startup sequence (not duplicating it)
- **Translates** skill loading to the platform's native mechanism
- **Pre-loads** essential context references in the platform's expected format
- **Sets** platform-specific behaviors (tool use, file editing, etc.)

## What Adapters Do NOT Do

- Adapters don't replace `AGENTS.md` — they complement it
- Adapters don't duplicate rules or skills — they reference them
- Adapters don't change the workflow — they make it easier to start

## Maintaining Adapters

When updating `AGENTS.md` or `workflow-order.md`, check if adapters need corresponding updates. The adapters should stay thin wrappers — if an adapter grows beyond ~50 lines, content should move to the canonical files.
