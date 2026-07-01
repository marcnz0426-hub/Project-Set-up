# Architecture Decision Records (ADRs)

This folder stores decisions that explain **why** the project is built the way it is. When an agent or developer picks an approach, framework, pattern, or tool — the rationale is recorded here so future agents (and humans) don't re-litigate the same questions.

## Why ADRs?

The AI Project Starter is designed for multi-model workflows where chat history doesn't survive model switches. ADRs ensure the "why" behind decisions is preserved in files, not chat.

## When to Write an ADR

| Trigger | Example |
|---------|---------|
| User approves a direction in Phase 01 (Brainstorming) | "Use PostgreSQL over MongoDB for relational data" |
| Architecture decision in Phase 02 (Planning) | "Monorepo with Turborepo over separate repos" |
| Technology selection | "Use Clerk for auth instead of building custom" |
| Pattern choice | "Server components by default, client only when interactive" |
| Significant tradeoff accepted | "Accept eventual consistency for better performance" |
| Decision reversed or superseded | Mark old ADR as "Superseded" and link to new one |

## How to Number

Use sequential numbering: `001`, `002`, `003`, etc. Never reuse numbers, even if an ADR is superseded.

## Reading Order

Agents should:
1. Read this `README.md` first
2. Scan ADR filenames to understand what decisions exist
3. Read specific ADRs when a task touches the relevant area
4. Check for "Superseded" status before following an old ADR

## Files

| File | Status | Summary |
|------|--------|---------|
| `template.md` | Template | Blank ADR template for new decisions |

_No decisions recorded yet. ADRs will be added as the project progresses._
