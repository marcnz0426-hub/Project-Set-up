# Agent Skill Map

Use this map to choose which local skills belong to each agent role.

## Required Context Reads (All Roles)

- `.ai/context/INDEX.md`
- `.ai/context/purpose.md`
- `.ai/rules/build-discipline.md`
- `.ai/rules/security.md`

## Main Orchestrator

- `.ai/skills/00-runtime/using-superpowers`
- `.ai/skills/01-brainstorming/brainstorming`
- `.ai/skills/02-planning/build-phases`
- `.ai/skills/02-planning/writing-plans`
- `.ai/skills/03-work-isolation/using-git-worktrees`
- `.ai/skills/04-parallelization/dispatching-parallel-agents`
- `.ai/skills/05-execution/executing-plans`
- `.ai/skills/06-subagent-development/subagent-driven-development`
- `.ai/skills/09-review-request/requesting-code-review`
- `.ai/skills/11-review-response/receiving-code-review`
- `.ai/skills/12-verification/verification-before-completion`
- `.ai/skills/13-branch-finish/finishing-a-development-branch`

### Additional Context Reads

- `.ai/context/architecture.md`
- `.ai/context/domain.md`
- `design/` folder (all design files)

## Brainstormer

- `.ai/skills/01-brainstorming/brainstorming`
- `.ai/skills/02-planning/writing-plans`

**Sub-roles (delegate for specialized work):**

| Sub-role | Skill |
|----------|-------|
| Product Manager | `.ai/skills/01-brainstorming/product-manager` |
| Product UX Design | `.ai/skills/01-brainstorming/product-ux-design` |

### Additional Context Reads

- `.ai/context/architecture.md`
- `.ai/context/domain.md`
- `design/brand/guidelines.md`

## Planner

- `.ai/skills/01-brainstorming/brainstorming`
- `.ai/skills/02-planning/build-phases`
- `.ai/skills/02-planning/writing-plans`
- `.ai/skills/03-work-isolation/using-git-worktrees`
- `.ai/skills/04-parallelization/dispatching-parallel-agents`

**Sub-roles (delegate for specialized work):**

| Sub-role | Skill |
|----------|-------|
| Principal Architect | `.ai/skills/02-planning/principal-architect` |
| Technical Program Manager | `.ai/skills/02-planning/technical-program-manager` |

### Additional Context Reads

- `.ai/context/architecture.md`
- `.ai/context/domain.md`
- `design/` folder (all design files)

## Implementer

- `.ai/skills/07-coding/test-driven-development`
- `.ai/skills/08-debugging/systematic-debugging`
- `.ai/skills/12-verification/verification-before-completion`
- `.ai/skills/11-review-response/receiving-code-review`

**Sub-roles (delegate for specialized work):**

| Sub-role | Skill |
|----------|-------|
| Backend Engineering | `.ai/skills/07-coding/backend-engineering` |
| Frontend Engineering | `.ai/skills/07-coding/frontend-engineering` |
| UI Designer | `.ai/skills/07-coding/ui-designer` |
| UX Writing | `.ai/skills/07-coding/ux-writing` |

### Additional Context Reads

- `.ai/context/architecture.md`
- `design/` folder (all design files)
- `.ai/rules/coding-standards.md`
- `.ai/rules/testing.md`

## Parallel Development Lead

- `.ai/skills/04-parallelization/dispatching-parallel-agents`
- `.ai/skills/05-execution/executing-plans`
- `.ai/skills/06-subagent-development/subagent-driven-development`
- `.ai/skills/09-review-request/requesting-code-review`
- `.ai/skills/11-review-response/receiving-code-review`
- `.ai/skills/12-verification/verification-before-completion`

### Additional Context Reads

- `.ai/context/architecture.md`
- `design/` folder (all design files)

## Code Reviewer

- `.ai/skills/10-code-review/code-reviewer`

### Additional Context Reads

- `.ai/context/architecture.md`
- `design/` folder (all design files)
- `.ai/rules/coding-standards.md`
- `.ai/rules/security.md`
- `.ai/rules/testing.md`

## Debugger

- `.ai/skills/08-debugging/systematic-debugging`
- `.ai/skills/07-coding/test-driven-development`
- `.ai/skills/12-verification/verification-before-completion`

### Additional Context Reads

- `.ai/context/domain.md`
- `.ai/context/architecture.md`
- `.ai/rules/security.md`

## Release Manager

- `.ai/skills/09-review-request/requesting-code-review`
- `.ai/skills/12-verification/verification-before-completion`
- `.ai/skills/13-branch-finish/finishing-a-development-branch`
- `.ai/skills/03-work-isolation/using-git-worktrees`

### Additional Context Reads

- `.ai/context/architecture.md`
- `.ai/rules/git-workflow.md`

## Skill Builder

- `.ai/skills/90-meta/writing-skills`
- `.ai/skills/01-brainstorming/brainstorming`
- `.ai/skills/02-planning/writing-plans`
- `.ai/skills/12-verification/verification-before-completion`

### Additional Context Reads

- `.ai/context/architecture.md`

<!-- Sub-roles collapsed into parent agents above. See Brainstormer, Planner, and Implementer sections for Product Manager, Product UX Design, Principal Architect, Technical Program Manager, Backend Engineering, Frontend Engineering, UI Designer, and UX Writing. -->