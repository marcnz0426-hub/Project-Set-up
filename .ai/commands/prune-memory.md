# Command: Prune Memory

Use when self-healing memory exceeds thresholds or contains stale, duplicate, resolved, or obsolete entries.

## Thresholds

- `bug-log.md`: more than 30 active entries or more than 25 KB.
- Bug entry: more than 150 words.
- `fix-patterns.md`: more than 20 active patterns.
- `lessons-learned.md`: more than 30 active lessons.
- `handoff.md`: more than the latest handoff.

## Process

1. Read `.ai/memory/memory-policy.md`.
2. Read `.ai/memory/index.md`.
3. Identify open, recurring, severe, and reusable items to keep active.
4. Merge duplicate bug entries or fix patterns.
5. Move resolved, non-recurring entries older than 60 days to `.ai/memory/archive/`.
6. Remove low-value archived entries from active memory.
7. Delete obsolete lessons that no longer guide future work.
8. Replace `handoff.md` with only the latest handoff.
9. Update `.ai/memory/index.md` with active entries and archive pointers.
10. Record pruning in `PROJECT_STATUS.md`.

## Safety

- Do not delete open bugs.
- Do not delete unresolved known issues.
- Do not delete recurring bugs with `seen_count` of 2 or more.
- Do not delete severe issues unless they are archived and clearly obsolete.
- When unsure, archive instead of permanently deleting.