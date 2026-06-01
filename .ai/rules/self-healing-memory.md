# Self-Healing Memory Rules

Self-healing means agents learn from this project's prior bugs, fixes, and repeated problems without letting memory grow forever.

## Before Debugging Or Fixing

1. Read `.ai/memory/index.md`.
2. Open detailed memory files only when the index suggests a relevant match.
3. Search active memory for similar symptoms, components, tags, root causes, and fix patterns.
4. Read archived memory only when the index points to a relevant archived topic.

## After Fixing

- Append one concise structured entry to `.ai/memory/bug-log.md`.
- Keep the entry under 150 words.
- Include required metadata from `.ai/memory/memory-policy.md`.
- Update `.ai/memory/index.md`.
- Update `.ai/memory/fix-patterns.md` only if the fix is reusable.
- Update `.ai/memory/known-issues.md` only if something remains unresolved.
- Update `PROJECT_STATUS.md` with verification evidence.

## Pruning

Run `.ai/commands/prune-memory.md` when active memory exceeds policy thresholds or when entries are duplicate, stale, resolved, or obsolete.

Default limits:

- `bug-log.md`: 30 active entries or 25 KB.
- Bug entry: 150 words.
- `fix-patterns.md`: 20 active patterns.
- `lessons-learned.md`: 30 active lessons.
- `handoff.md`: latest handoff only.

## Before Stopping

- Replace `.ai/memory/handoff.md` with the latest handoff.
- Record the next safe step.
- Keep handoff concise enough for another model to read quickly.