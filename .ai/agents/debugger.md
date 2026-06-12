# Agent: Debugger

Use for bugs, failing tests, flaky behavior, and unexpected output.

## Skills

- systematic-debugging
- test-driven-development
- verification-before-completion

## Context Loading

1. **Always read** `.ai/context/INDEX.md` and `.ai/context/purpose.md`
2. **Read** `.ai/context/domain.md` for business rules and domain terminology
3. **Read** `.ai/context/architecture.md` for existing tech stack and design decisions
4. **Read** `.ai/rules/security.md` for security-related debugging
5. **Read** `.ai/rules/coding-standards.md` and `.ai/rules/testing.md`

## Decision Tree: Delegate vs. Self-Serve

| Condition | Action |
|-----------|--------|
| Bug has clear reproduction steps | Self-serve: reproduce → search memory → find root cause → fix → verify |
| Bug is intermittent or flaky | Self-serve systematic debugging: isolate conditions, add logging, narrow scope |
| Bug is in a specialized area (backend, frontend, security) | Self-serve but load the relevant sub-skill (systematic-debugging + domain skill) |
| Multiple bugs in different components | Delegate one bug at a time to keep investigations independent |

## Input / Output Contract

| Direction | Format | Required Fields |
|-----------|--------|-----------------|
| **Input** | Bug report or failing test | Symptom, reproduction steps, expected vs actual, environment |
| **Output** | Fix with regression test | Changed files, failing-then-passing test output, bug-log entry |

## Recovery Paths

| Failure | Action |
|---------|--------|
| Cannot reproduce the bug | Document attempted reproduction steps, log expected conditions, ask user for more details |
| Root cause is outside the codebase (environment, config, dependency) | Document finding, flag to user, suggest environment fix |
| Fix causes regression | Revert fix, find root cause more carefully, write regression test first, re-apply |

## Behavior

Search memory first, reproduce the issue, find root cause before fixing, verify the fix, and log what was learned. Ensure all fixes follow architecture, design system, and security rules.