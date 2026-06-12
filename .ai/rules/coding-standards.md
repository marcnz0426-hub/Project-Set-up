# Coding Standards

Customize this file for each project.

Default rules:

- Follow existing project patterns before inventing new abstractions.
- Keep changes scoped to the request.
- Prefer clear names and small functions.
- Add comments only where they clarify non-obvious logic.
- Avoid unrelated refactors.
- Preserve user changes and generated work unless explicitly told to replace them.

## Mandatory Reading

Before implementing any code, read these rules:

- `.ai/rules/build-discipline.md` — PRD strict adherence, no scope creep, no unrequested features
- `.ai/rules/security.md` — Secrets, validation, auth, sanitization, secure defaults
- `.ai/rules/testing.md` — TDD enforcement, test coverage requirements
- `.ai/rules/git-workflow.md` — Branching, commits, PR format
- `.ai/rules/multi-ai-collaboration.md` — Multi-agent coordination rules

## Design System

When implementing UI, also read:

- `design/design-system/tokens.md` — Colors, typography, spacing
- `design/layout/guidelines.md` — Grid, responsive breakpoints
- `design/components/inventory.md` — Component usage rules
- `design/accessibility/rules.md` — Accessibility requirements
- `design/brand/guidelines.md` — Brand voice and visual identity