# Getting Started with AI Project Starter

This template provides a workflow system for AI agents to coordinate work across models. Use this guide to set up a new project.

## Quick Start

### Step 1: Read The Entry Point

Every AI agent session starts with `AGENTS.md`. This file tells the agent what to read, in what order, and which persona to use.

### Step 2: Fill In Context Files

The `.ai/context/` folder contains files that describe your project. Fill these in for your specific project:

| File | What To Fill | Why It Matters |
|------|-------------|----------------|
| `.ai/context/purpose.md` | Project vision, goals, users, scope | Agents make decisions based on your purpose |
| `.ai/context/architecture.md` | Tech stack, folder structure, design decisions | Agents place files correctly, use right tools |
| `.ai/context/domain.md` | Business rules, terminology, personas | Agents understand domain constraints |

### Step 3: Set Up Design Tokens

The `design/` folder contains design system defaults. Replace with your brand:

| File | Action |
|------|--------|
| `design/design-system/tokens.md` | Replace hex colors, fonts with your brand values |
| `design/brand/guidelines.md` | Replace brand colors, font names |
| `design/layout/guidelines.md` | Adjust grid, breakpoints to your needs |
| `design/components/inventory.md` | Customize component inventory |
| `design/accessibility/rules.md` | Review and adjust accessibility targets |

### Step 4: (Optional) Create PRD/UX Context

For feature work, copy the template files from `.ai/context/templates/` to `.ai/context/` and fill them in:

```bash
cp .ai/context/templates/PRD.md .ai/context/PRD.md
cp .ai/context/templates/UX-design.md .ai/context/UX-design.md
cp .ai/context/templates/UX-copy.md .ai/context/UX-copy.md
cp .ai/context/templates/UI-design.md .ai/context/UI-design.md
```

Then update `.ai/context/INDEX.md` with the new file paths and sizes.

### Step 5: Run Health Check

Run the health check command to verify everything is connected:

```bash
# An AI agent will run: .ai/commands/health-check.md
```

Expected: "Scaffolding verified. Ready to proceed."

### Step 6: Start A Session

The first agent session will:

1. Read `AGENTS.md` (always start here)
2. Initialize session cache in `.ai/.session-state.json`
3. Load context files
4. Read the workflow in `.ai/workflow/workflow-order.md`
5. Pick the right phase and begin

## Project Structure Overview

```
.ai/                  # AI agent coordination hub (required)
  agents/             # Role personas (orchestrator, implementer, reviewer, etc.)
  commands/           # Reusable prompt commands (health-check, verify, debug, etc.)
  context/            # Project context files (purpose, architecture, domain)
    templates/        # Ready-to-fill templates (PRD, UX, UI)
  memory/             # Self-healing memory (bug log, fix patterns, lessons)
  rules/              # Collaboration, coding, testing, security, git rules
  skills/             # Local skill library organized by workflow phase
  workflow/           # Phase ordering, agent-skill mapping
  settings.json       # Project-level configuration
  .session-state.json # Session cache (gitignored)
design/               # Design system, brand, layout, components
tests/                # Test files
.github/workflows/    # CI/CD configurations
```

## Workflow At A Glance

```
Investigate → Preflight → Load Context → Plan → Isolate → 
Execute → TDD → Debug → Review → Verify → Finish
```

Each phase is defined in `.ai/workflow/workflow-order.md` with exit criteria and rollback paths.

## Agent Roles

| Agent | When To Use |
|-------|-------------|
| Orchestrator | General coordination, delegation |
| Brainstormer | Fuzzy ideas, product thinking |
| Planner | Turning requirements into tasks |
| Implementer | Writing code |
| Code Reviewer | Independent review |
| Debugger | Bugs and failures |
| Release Manager | Final verification, PR, merge |

## Need Help?

- Read `AGENTS.md` for the full agent startup sequence
- Read `.ai/workflow/workflow-order.md` for phase details
- Run health check for scaffolding validation
- Update `PROJECT_STATUS.md` to track progress
