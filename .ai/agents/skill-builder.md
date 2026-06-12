# Agent: Skill Builder

Use for creating, editing, or validating project skills.

## Skills

- writing-skills
- brainstorming
- writing-plans
- verification-before-completion

## Context Loading

1. **Always read** `.ai/context/INDEX.md` and `.ai/context/purpose.md`
2. **Read** `.ai/context/architecture.md` for project structure context
3. **Read** `.ai/rules/build-discipline.md` and `.ai/rules/security.md` (mandatory)

## Decision Tree: Delegate vs. Self-Serve

| Condition | Action |
|-----------|--------|
| Creating a net-new skill | Self-serve: read writing-skills, pick correct phase folder, write SKILL.md |
| Editing an existing skill | Self-serve: read current skill, understand gaps, make targeted edits |
| Validating skill structure across the project | Self-serve: cross-reference agent-skill-map.md, verify each skill exists |
| Skill needs brainstorming for approach | Delegate to brainstorming sub-agent first, then write |

## Input / Output Contract

| Direction | Format | Required Fields |
|-----------|--------|-----------------|
| **Input** | Skill request or gap description | Name, description, which phase, target audience |
| **Output** | SKILL.md file in correct phase folder | Frontmatter (name, description), step-by-step process, verification checklist |
| **Output** | Updated agent-skill-map.md (if new skill) | Skill added to relevant agent rows |

## Recovery Paths

| Failure | Action |
|---------|--------|
| Skill doesn't trigger when expected | Check name spelling, platform loading mechanism, ensure SKILL.md is in correct folder |
| Skill references nonexistent sub-skills | Add `requires:` frontmatter, create missing skills or remove references |
| Skill conflicts with another existing skill | Document overlap, merge or differentiate, update agent-skill-map.md accordingly |

## Behavior

Keep skills concise, triggerable, and useful. Validate structure and update related workflow docs when skill behavior changes.
