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
| `decisions/` | Architecture Decision Records (ADRs) | Read existing before proposing new |

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

### 1. Run the Setup Wizard

The fastest way to configure your project is to run the interactive setup wizard. Ask your AI to run:

```bash
.ai/commands/setup-wizard.md
```

This wizard will guide you through filling out your project purpose, architecture, domain rules, and design tokens.

### 2. Platform Adapters

If you're using a specific AI coding tool, copy the matching adapter to your project root to give your agent a native entry point:
- **Claude Code**: Copy `.ai/adapters/claude-code.md` to `CLAUDE.md`
- **Cursor**: Copy `.ai/adapters/cursor.md` to `.cursorrules`
- **Windsurf**: Copy `.ai/adapters/windsurf.md` to `.windsurfrules`
- **Antigravity**: Copy `.ai/adapters/antigravity.md` to `.agents/AGENTS.md`

### 4. Start Building

Ask any AI model:

```
Read the context files in .ai/context/ and plan the build.
```

The agent will:
1. Initialize session cache and read `.ai/manifest.json` for smart file loading
2. Read `.ai/context/INDEX.md`
3. Read `.ai/context/purpose.md`
4. Read your uploaded context files (PRD, UX, UI, Copy)
5. **If any file exceeds 500 lines**, the agent performs a **Structural Skim** (reading only the Markdown headers) to understand the scope without losing detail memory
6. Synthesize and ask clarifying questions
7. Create `.ai/context/BUILD-PHASES.md` based on the structural skim
8. Proceed to planning, using **Just-In-Time (JIT) Reading** to read the deep details of each phase only when it begins

> **Session continuity:** With manifest-based loading and JIT reading, a new session immediately knows which phase it is in and loads only the exact details needed for that phase.

---

## Workflow

The standard workflow follows these phases:

```
Investigate → Load Context → Brainstorm → Plan → (Isolate → Parallelize → Execute → Code → Debug → Review → Verify → Finish)
```

Key rules:
- **Always read** `.ai/context/purpose.md` and `.ai/rules/build-discipline.md`
- **Before debugging** — read `.ai/memory/index.md` first
- **Before stopping** — update `PROJECT_STATUS.md` and `.ai/memory/handoff.md`
- **Large file handling** — Massive files use the **Structural Skim & JIT Reading** protocol to prevent attention degradation

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
│   ├── adapters/                      # Platform entry points (NEW)
│   ├── agents/                        # 9 agent personas
│   ├── commands/                      # Reusable prompt commands
│   ├── context/                       # Project context (NEW)
│   │   ├── INDEX.md
│   │   ├── purpose.md
│   │   ├── architecture.md
│   │   ├── domain.md
│   │   ├── BUILD-PHASES.md
│   │   ├── decisions/                 # ADR system
│   │   └── templates/                 # Fill-in templates (PRD, UX, UI, Copy)
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
│   ├── .session-state.json            # Cross-session progress cache
│   ├── manifest.json                  # Smart loader file hashes
│   └── workflow/                      # Workflow config
└── design/                            # Global design system (NEW)
    ├── README.md
    ├── design-system/tokens.md
    ├── layout/guidelines.md
    ├── components/inventory.md
    ├── accessibility/rules.md
    └── brand/guidelines.md
```
