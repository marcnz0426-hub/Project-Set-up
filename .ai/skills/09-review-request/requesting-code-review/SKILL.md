---
name: requesting-code-review
description: Use when Codex has completed a task, feature, bugfix, implementation-plan step, batch of plan steps, or branch and should request an independent code review before continuing, merging, or claiming readiness. Trigger before merge, after major implementation milestones, during subagent-driven development checkpoints, when stuck and needing a fresh review, or after complex debugging fixes.
---

# Requesting Code Review

Request an independent review early enough that defects can be fixed before they compound.

## When To Request Review

Request review:

- After each completed task in subagent-driven development.
- After a major feature, bugfix, refactor, or plan batch.
- Before merge, PR creation, or final readiness claims.
- When stuck and a fresh technical pass could reveal a missed assumption.
- After fixing a complex bug, especially when the root cause or regression risk is subtle.

Do not skip review because the change seems simple if it touches production behavior, data, security, tests, or shared architecture.

## Prepare The Review Packet

Collect:

- What was implemented.
- The plan, requirements, ticket, or user request.
- The git base and head, if available.
- The files or modules changed.
- Tests, builds, linters, screenshots, logs, or other verification already run.
- Known risks, unresolved questions, or intentional deviations from the plan.

Use git SHAs when possible:

```bash
git rev-parse HEAD
git merge-base HEAD origin/main
```

If there is no git repository or no clean git range, provide the changed files and relevant context instead.

## Dispatch Or Perform Review

Prefer an independent reviewer when the environment supports subagents or task delegation.

Ask the reviewer to use the `code-reviewer` skill and provide the review packet. If a subagent tool is not available, perform the review in the current session using `code-reviewer`.

Suggested review request:

```text
Use the code-reviewer skill to review this change.

What was implemented:
{WHAT_WAS_IMPLEMENTED}

Requirements or plan:
{PLAN_OR_REQUIREMENTS}

Git range:
Base: {BASE_SHA}
Head: {HEAD_SHA}

Verification already run:
{VERIFICATION}

Known risks or questions:
{RISKS}
```

If the folder includes `code-reviewer.md`, it may be used as a prompt template, but the canonical behavior should come from the `code-reviewer` skill.

## Act On Feedback

Triage every finding:

- Fix Critical issues before proceeding.
- Fix Important issues before merge or before starting dependent work.
- Track Minor issues only when they do not block the current goal.
- Push back on incorrect feedback with code, test output, logs, or reasoning.
- Ask for clarification when the reviewer identifies a risk but the fix is ambiguous.

After fixes, request re-review for Critical and Important findings.

## Integration Notes

- With `subagent-driven-development`: request review after each task before marking it complete.
- With `executing-plans`: request review after each batch or checkpoint.
- With ad-hoc development: request review before merge or final completion.
- With `receiving-code-review`: use that skill to process and implement returned feedback.
- With `verification-before-completion`: verify fixes before claiming the review is resolved.
