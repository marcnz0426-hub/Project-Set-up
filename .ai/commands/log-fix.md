# Command: Log Fix

Use after fixing a bug or recurring problem.

1. Append one concise entry to `.ai/memory/bug-log.md` using `.ai/templates/bug-log-entry.md`.
2. Keep the entry under 150 words.
3. Include status, severity, dates, seen count, tags, archive date, and whether to delete from active memory after archive.
4. Update `.ai/memory/index.md`.
5. If reusable, update `.ai/memory/fix-patterns.md`.
6. If unresolved risk remains, update `.ai/memory/known-issues.md`.
7. Run `.ai/commands/prune-memory.md` if active memory exceeds thresholds.