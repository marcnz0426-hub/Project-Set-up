# Platform Adapters

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

## What Adapters Do

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
