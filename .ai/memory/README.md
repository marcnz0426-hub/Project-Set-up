# Project Memory

This folder is the project-local self-healing memory. It must stay small enough for agents to use without wasting context.

## Reading Order

1. Read `index.md` first.
2. Read `memory-policy.md` if deciding whether to keep, archive, or delete memory.
3. Open detailed memory files only when the index points to a relevant topic.

## Files

- `index.md`: compact map of active memory and tags.
- `memory-policy.md`: size limits, retention rules, pruning workflow.
- `bug-log.md`: active bug and fix records only.
- `fix-patterns.md`: reusable fixes and prevention patterns.
- `lessons-learned.md`: durable project lessons.
- `known-issues.md`: unresolved or risky issues only.
- `handoff.md`: latest continuation notes for the next agent.
- `archive/`: old resolved entries that should not stay in active memory.

## Core Rule

Do not append forever. Keep active memory concise, index-driven, and pruned.