# Antigravity Adapter for AI Project Starter

# Setup: Copy this file to `.agents/AGENTS.md` in your workspace

## Entry Point

Read the project-root `AGENTS.md` for the full startup sequence. This adapter provides Antigravity-specific guidance.

## Antigravity-Specific Behavior

### Skill Loading
- Skills are in `.ai/skills/` as `SKILL.md` files
- Read SKILL.md directly using `view_file` — no registration needed
- Use the skill map at `.ai/workflow/agent-skill-map.md` to find relevant skills

### Context Loading
- Read `.ai/manifest.json` first — use summaries to decide what to load
- Only re-read files whose hash has changed since last session
- Use `view_file` for targeted reads of specific line ranges

### Tool Usage
- Use `run_command` for git operations, builds, and test runs
- Use `write_to_file` and `replace_file_content` for code changes
- Use `grep_search` for codebase investigation in Phase -1

## Essential Files

| Priority | File | Purpose |
|----------|------|---------|
| Always | `AGENTS.md` | Startup sequence |
| Always | `.ai/context/purpose.md` | Project vision |
| Always | `.ai/manifest.json` | File metadata for smart loading |
| Always | `.ai/workflow/workflow-order.md` | Phase ordering |
| Mandatory | `.ai/rules/build-discipline.md` | PRD adherence |
| Mandatory | `.ai/rules/security.md` | Security rules |
| On-demand | `.ai/context/architecture.md` | Tech stack |
| On-demand | `.ai/context/decisions/` | Architecture decisions |
| On-demand | `design/` | Design system |

## Before Stopping

Update `PROJECT_STATUS.md` dashboard metrics and `.ai/memory/handoff.md`.
