# Context Folder

This folder contains project context that AI agents read before planning or implementing features.

## Structure

```
.ai/context/
├── INDEX.md              ← File listing with summaries (always read first)
├── purpose.md            ← Project vision, goals, users, scope (always read)
├── architecture.md       ← Tech stack, structure, design decisions (on-demand)
├── domain.md             ← Business rules, terminology, personas (on-demand)
├── BUILD-PHASES.md       ← Agent-generated phase breakdown (generated after context loading)
├── PRD.md                ← Product requirements document (user-uploaded)
├── UX-design.md          ← User flows, wireframes, interaction states (user-uploaded)
├── UX-copy.md            ← Labels, error messages, onboarding copy (user-uploaded)
└── UI-design.md          ← Visual system, component specs, design tokens (user-uploaded)
```

## 3-Tier Loading Workflow

### Tier 1: INDEX (Always Read)

Every agent session starts by reading `.ai/context/INDEX.md`. This is a lightweight file that lists all available context files with one-line summaries (~100 words total).

### Tier 2: SUMMARY (Read Relevant Files)

After reading INDEX, the agent identifies which files are relevant to the current task and reads their Summary sections (~200 words each).

### Tier 3: FULL SECTIONS (On-Demand)

If the task requires deeper detail, the agent reads specific sections by line range from the YAML frontmatter map.

## File Headers (Required)

Every context file must start with YAML frontmatter:

```markdown
---
type: prd|ux|ui|core|design
title: Human-readable title
version: 1.0
last_updated: YYYY-MM-DD
sections:
  - name: Section Name (lines 10-30)
  - name: Another Section (lines 31-80)
---

## Summary

[200-word max summary of the file contents]

## Full Content

[actual content starts here...]
```

## Agent Workflow

When an agent receives context files:

1. Read `.ai/context/INDEX.md` (always)
2. Read `.ai/context/purpose.md` (always)
3. For each user-uploaded file:
   - Check file size
   - If < 500 lines → read in full
   - If > 500 lines → read frontmatter + Summary section
   - Store: file name, type, key points, section map
4. Synthesize:
   - Confirm what was read (summary per file)
   - Cross-reference files for conflicts/gaps
   - Ask 1-3 clarifying questions if needed
5. Create `.ai/context/BUILD-PHASES.md` (phase breakdown)
6. Update `PROJECT_STATUS.md` with current state
7. Proceed to Planning phase (workflow step 02)

## Context File Guidelines

- Keep summaries under 200 words
- Use clear section headers for easy navigation
- Include line numbers in frontmatter sections map
- Version your files when making significant updates
- Cross-reference related files in the Summary section