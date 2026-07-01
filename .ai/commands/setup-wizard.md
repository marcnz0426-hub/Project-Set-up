# Command: Setup Wizard

Run this on first project setup. This command guides the user through filling in all context files interactively, turning a 30-minute manual process into a 5-minute conversation.

## When to Run

- After installing the template into a new project (via degit, GitHub template, or git clone)
- When `purpose.md` still contains TODO placeholders
- When the health check reports "context files are empty"

## Pre-Requisites

- Template is installed (`.ai/` folder exists)
- Health check has passed (scaffolding verified)

## Steps

### Step 1: Project Identity

Ask the user:
> "What is your project? Describe it in 2-3 sentences — what does it do, who is it for, and what problem does it solve?"

Write the response to:
- `.ai/context/purpose.md` → **Vision** section
- `.ai/context/purpose.md` → **Summary** section (condensed version)

### Step 2: Goals

Ask the user:
> "What are your 3-5 primary goals for this project? Each should be measurable."

Write the response to:
- `.ai/context/purpose.md` → **Goals** section

### Step 3: Target Users

Ask the user:
> "Who are your target users? For each user type, describe their needs and pain points."

Write the response to:
- `.ai/context/purpose.md` → **Target Users** table
- `.ai/context/domain.md` → **User Personas** section

### Step 4: Tech Stack

Ask the user:
> "What technologies are you using? List your frontend, backend, database, and hosting choices."

Write the response to:
- `.ai/context/architecture.md` → **Tech Stack** table
- `.ai/context/architecture.md` → **Summary** section

### Step 5: Scope

Ask the user:
> "What is in scope for this project? And equally important — what is explicitly NOT being built?"

Write the response to:
- `.ai/context/purpose.md` → **In Scope** and **Out of Scope** sections
- `.ai/context/purpose.md` → **Non-Goals** section

### Step 6: Business Rules

Ask the user:
> "What are the core business rules that govern your product? List concrete, testable constraints."

Write the response to:
- `.ai/context/domain.md` → **Business Rules** section
- `.ai/context/domain.md` → **Domain Terminology** table (extract key terms)

### Step 7: Design Direction

Ask the user:
> "Do you have a design system? If yes, describe your colors, fonts, and brand guidelines. If no, I'll skip this for now."

If yes → Write to:
- `design/design-system/tokens.md` → Replace placeholder tokens with actual values
- `design/brand/guidelines.md` → Replace placeholder brand values

If no → Log in `PROJECT_STATUS.md`: "Design system not configured — using template defaults."

### Step 8: Context File Upload

Ask the user:
> "Do you have any of these documents ready to upload?
> - PRD (Product Requirements Document)
> - UX Design (user flows, wireframes)
> - UX Copy (labels, error messages, onboarding text)
> - UI Design (visual specs, component specs)"

For each available document:
1. Copy the matching template from `.ai/context/templates/` to `.ai/context/`
2. Ask the user to paste or describe the content
3. Fill in the template with the provided content
4. Update `.ai/context/INDEX.md` with the new file path and size

### Step 9: Architecture Decisions

Ask the user:
> "Have you made any key architecture decisions? For example: why this database over others, why this framework, why this auth approach?"

For each decision:
- Create an ADR in `.ai/context/decisions/` using the ADR template
- Update `.ai/context/INDEX.md` to reference the decisions folder

### Step 10: Validation & Summary

1. Run health check (`.ai/commands/health-check.md`)
2. Regenerate `.ai/manifest.json` with updated file hashes and line counts
3. Update `PROJECT_STATUS.md` dashboard with setup completion status
4. Present summary:

```
✅ Setup Complete!

Files filled:
- purpose.md: ✅ (Vision, Goals, Users, Scope filled)
- architecture.md: ✅ (Tech stack, folder structure filled)
- domain.md: ✅ (Business rules, personas filled)
- design tokens: ✅ / ⬜ (skipped)
- PRD: ✅ / ⬜ (not uploaded)
- UX Design: ✅ / ⬜ (not uploaded)

Next step: Ask your AI agent to "Read the context files and plan the build."
```

## Completion Criteria

- At minimum, `purpose.md` Vision and Goals sections are filled (not TODO)
- `architecture.md` Tech Stack table has at least one row filled
- Health check passes
- `PROJECT_STATUS.md` dashboard is updated
- `.ai/manifest.json` is regenerated

## Notes

- If the user doesn't have answers for some sections, mark them as "TBD — user will provide later" instead of leaving TODO placeholders
- Don't pressure the user to fill everything — some sections can wait
- Log what was and wasn't filled in `PROJECT_STATUS.md`
