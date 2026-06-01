# AI Project Starter

Reusable starter folder for projects worked on by multiple AI models.

Copy this folder into a new project, then customize the project-specific files:

- `PROJECT_STATUS.md`
- `AGENTS.md`
- `.ai/settings.json`
- `.ai/rules/*.md`
- `.ai/memory/*.md`

The `.ai/` folder is the shared control center. It contains workflow instructions, agent personas, reusable command prompts, copied skills, and project-local memory.

## Quick Setup

Clone or download this repo, then run one of the following from **any directory**:

### Option A — Batch file (easiest)

```bat
"C:\path\to\AI-Project-Starter\setup.bat" "C:\Path\To\Your\NewProject"
```

### Option B — PowerShell

```powershell
powershell -ExecutionPolicy Bypass -File "C:\path\to\AI-Project-Starter\setup.ps1" "C:\Path\To\Your\NewProject"
```

### Option C — From inside the repo folder

```powershell
cd "C:\path\to\AI-Project-Starter"
powershell -ExecutionPolicy Bypass -File .\setup.ps1 "C:\Path\To\Your\NewProject"
```

> **Note:** The `-ExecutionPolicy Bypass` flag is required because Windows blocks `.ps1` scripts by default. It only applies to this single command and does not change your system settings.

## After Setup

1. `cd` into your new project folder.
2. Run `git init` to initialize version control.
3. Ask any AI model to read `AGENTS.md` first.
4. Customize `PROJECT_STATUS.md`, `AGENTS.md`, and `.ai/settings.json`.
5. Keep `PROJECT_STATUS.md` current during work.
6. Log every meaningful bug fix or repeated issue in `.ai/memory/bug-log.md`.
7. Before switching models or stopping, update `.ai/memory/handoff.md`.

## Design Goal

The project should remain understandable even when work moves between Claude, Codex, Gemini, Cursor, or another model. Each agent should be able to recover context from files instead of relying on chat history.