# AI Project Starter

A reusable starter template for projects worked on by multiple AI models. The `.ai/` folder is the shared control center containing workflow instructions, agent personas, reusable skills, project-local memory, context files, design system, and rules.

---

## Quick Install

### Option A — npx + degit (easiest)

```bash
npx -y degit marcnz0426-hub/Project-Set-up my-new-project
```

This downloads a clean copy into `my-new-project/` — no git history, no extra files.

> Replace `my-new-project` with your folder name. Use `./` to install into the current directory.

### Option B — GitHub Template

1. Go to [**github.com/marcnz0426-hub/Project-Set-up**](https://github.com/marcnz0426-hub/Project-Set-up)
2. Click **"Use this template"**
3. Name your repo and click **Create repository**

> Enable this in your repo's **Settings** → check **"Template repository"**.

### Option C — git clone

```bash
git clone --depth 1 https://github.com/marcnz0426-hub/Project-Set-up.git my-new-project
cd my-new-project
rm -rf .git
```

---

## What's Included

### Context Folder (`.ai/context/`)

Project context that agents read before planning or implementing:

| File | Purpose | Load Rule |
|------|---------|-----------|
| `INDEX.md` | Lists all context files | Always read |
| `purpose.md` | Project vision, goals, users | Always read |
| `architecture.md` | Tech stack, design decisions | On-demand |
| `domain.md` | Business rules, terminology | On-demand |
| `BUILD-PHASES.md` | Agent-generated phase breakdown | Generated after context loading |

**3-Tier Loading:** Read INDEX first → read Summary sections → load full sections only when needed.

### Design Folder (`design/`)

Global design guidelines that agents must follow:

| File | Purpose |
|------|---------|
| `design-system/tokens.md` | Colors, typography, spacing, design tokens |
| `layout/guidelines.md` | Grid, responsive breakpoints, spacing system |
| `components/inventory.md` | Component list, variants, states, usage rules |
| `accessibility/rules.md` | Contrast, focus, ARIA, keyboard navigation |
| `brand/guidelines.md` | Brand voice, tone, logo usage |

### Rules Folder (`.ai/rules/`)

Mandatory rules agents must follow:

| File | Purpose |
|------|---------|
| `build-discipline.md` | PRD strict adherence, no scope creep |
| `security.md` | Secrets, validation, auth, sanitization |
| `coding-standards.md` | Code style, patterns, conventions |
| `testing.md` | TDD, test coverage requirements |
| `git-workflow.md` | Branching, commits, PR format |

### Agent Skills (`.ai/skills/`)

22 skills organized by workflow phase:

| Phase | Skills |
|-------|--------|
| 00 - Runtime | using-superpowers |
| 01 - Brainstorming | brainstorming, product-manager, product-ux-design |
| 02 - Planning | writing-plans, principal-architect, technical-program-manager |
| 03 - Work Isolation | using-git-worktrees |
| 04 - Parallelization | dispatching-parallel-agents |
| 05 - Execution | executing-plans |
| 06 - Subagent Dev | subagent-driven-development |
| 07 - Coding | test-driven-development, backend-engineering, frontend-engineering, ui-designer, ux-writing |
| 08 - Debugging | systematic-debugging |
| 09 - Review Request | requesting-code-review |
| 10 - Code Review | code-reviewer |
| 11 - Review Response | receiving-code-review |
| 12 - Verification | verification-before-completion |
| 13 - Branch Finish | finishing-a-development-branch |
| 90 - Meta | writing-skills |

### Agent Personas (`.ai/agents/`)

9 agent roles for different tasks:

- **Orchestrator** — general coordination
- **Brainstormer** — fuzzy ideas, product thinking
- **Planner** — requirements to tasks
- **Implementer** — writing code
- **Parallel Development Lead** — splitting work
- **Code Reviewer** — independent review
- **Debugger** — bugs and failures
- **Release Manager** — PR, merge, cleanup
- **Skill Builder** — editing/creating skills

---

## After Setup

### 1. Upload Context Files

Add your project context to `.ai/context/`:

```bash
# Your PRD, UX design, UX copy, UI design files
cp PRD.md .ai/context/
cp UX-design.md .ai/context/
cp UX-copy.md .ai/context/
cp UI-design.md .ai/context/
```

### 2. Fill in Project Purpose

Edit `.ai/context/purpose.md` with your project vision, goals, and users.

### 3. Customize Design System

Edit files in `design/` with your actual:
- Design tokens (colors, typography, spacing)
- Layout guidelines
- Component inventory
- Accessibility rules
- Brand guidelines

### 4. Start Building

Ask any AI model:

```
Read the context files in .ai/context/ and plan the build.
```

The agent will:
1. Read `.ai/context/INDEX.md`
2. Read `.ai/context/purpose.md`
3. Read your uploaded context files (PRD, UX, UI, Copy)
4. Synthesize and ask clarifying questions
5. Create `.ai/context/BUILD-PHASES.md`
6. Proceed to planning

---

## Workflow

The standard workflow follows these phases:

```
Brainstorm → Plan → Isolate Work → Parallelize → Execute → Code → Debug → Review → Verify → Finish
```

Key rules:
- **Always read** `.ai/context/purpose.md` and `.ai/rules/build-discipline.md`
- **Before debugging** — read `.ai/memory/index.md` first
- **Before stopping** — update `PROJECT_STATUS.md` and `.ai/memory/handoff.md`

---

## Customization

### Adding New Skills

1. Create folder: `.ai/skills/<phase-number>/<skill-name>/`
2. Add `SKILL.md` with YAML frontmatter
3. Add `agents/openai.yaml` for OpenAI integration
4. Update `.ai/workflow/agent-skill-map.md`

### Adding New Rules

1. Create `.ai/rules/<rule-name>.md`
2. Add to `rules_mandatory` in `.ai/settings.json`
3. Cross-reference in `.ai/rules/coding-standards.md`

### Adding New Design Files

1. Create folder: `design/<category>/`
2. Add `<name>.md` with YAML frontmatter
3. Update `design/README.md`
4. Add to `design_files` in `.ai/settings.json`

---

## Design Goal

The project remains understandable when work moves between Claude, Codex, Gemini, Cursor, or any other model. Each agent recovers context from files instead of relying on chat history.

---

## File Structure

```
project-root/
├── AGENTS.md                          # Agent entry point
├── PROJECT_STATUS.md                  # Current work status
├── README.md                          # This file
├── .ai/
│   ├── README.md                      # Control center docs
│   ├── settings.json                  # Project configuration
│   ├── agents/                        # 9 agent personas
│   ├── commands/                      # Reusable prompt commands
│   ├── context/                       # Project context (NEW)
│   │   ├── INDEX.md
│   │   ├── purpose.md
│   │   ├── architecture.md
│   │   ├── domain.md
│   │   ├── BUILD-PHASES.md
│   │   └── README.md
│   ├── memory/                        # Self-healing memory
│   ├── rules/                         # Mandatory rules (NEW)
│   │   ├── build-discipline.md
│   │   ├── security.md
│   │   ├── coding-standards.md
│   │   ├── testing.md
│   │   └── git-workflow.md
│   ├── skills/                        # 22 skills by phase
│   │   ├── 00-runtime/
│   │   ├── 01-brainstorming/
│   │   ├── 02-planning/
│   │   ├── 03-work-isolation/
│   │   ├── 04-parallelization/
│   │   ├── 05-execution/
│   │   ├── 06-subagent-development/
│   │   ├── 07-coding/
│   │   ├── 08-debugging/
│   │   ├── 09-review-request/
│   │   ├── 10-code-review/
│   │   ├── 11-review-response/
│   │   ├── 12-verification/
│   │   ├── 13-branch-finish/
│   │   └── 90-meta/
│   ├── templates/                     # Fill-in templates
│   └── workflow/                      # Workflow config
└── design/                            # Global design system (NEW)
    ├── README.md
    ├── design-system/tokens.md
    ├── layout/guidelines.md
    ├── components/inventory.md
    ├── accessibility/rules.md
    └── brand/guidelines.md
```
