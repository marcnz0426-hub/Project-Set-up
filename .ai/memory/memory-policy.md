# Memory Policy

Self-healing memory must be useful, small, and cheap to read.

## Read Policy

- Read `index.md` before opening any detailed memory file.
- Open detailed files only when tags, symptoms, components, or active issues match the current task.
- Do not paste large logs into memory. Summarize the symptom, root cause, fix, and verification.

## Active Memory Limits

- `bug-log.md`: maximum 30 active entries or 25 KB, whichever comes first.
- Bug entries: maximum 150 words each.
- `fix-patterns.md`: maximum 20 active reusable patterns.
- `lessons-learned.md`: maximum 30 active lessons.
- `known-issues.md`: unresolved issues only.
- `handoff.md`: latest handoff only, no history.

## Required Metadata

Bug entries must include:

- `status`: open, resolved, archived
- `severity`: critical, important, minor
- `first_seen`
- `last_seen`
- `seen_count`
- `tags`
- `archive_after`
- `delete_from_active`: yes/no

## Retention Rules

Keep active:

- Open bugs.
- Critical or Important bugs that can still recur.
- Bugs with `seen_count` of 2 or more.
- Reusable fix patterns.
- Lessons that still affect current development.

Archive:

- Resolved, non-recurring bugs after 60 days without being seen again.
- Old severe bugs that are still useful but no longer need active context.
- Superseded details that may be useful later but are not needed in normal work.

Delete from active memory:

- Resolved, low-value, non-recurring bugs after archive.
- Duplicate entries after merging useful details.
- Obsolete lessons replaced by better guidance.
- Handoff history older than the current handoff.

## Pruning Trigger

Run `.ai/commands/prune-memory.md` when:

- `bug-log.md` exceeds 30 active entries or 25 KB.
- Any bug entry grows past 150 words.
- `fix-patterns.md` exceeds 20 active patterns.
- `lessons-learned.md` exceeds 30 active lessons.
- An agent notices duplicate, stale, or obsolete memory.