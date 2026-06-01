# AI Project Starter

Reusable starter folder for projects worked on by multiple AI models.

Copy this folder into a new project, then customize the project-specific files:

- `PROJECT_STATUS.md`
- `AGENTS.md`
- `.ai/settings.json`
- `.ai/rules/*.md`
- `.ai/memory/*.md`

The `.ai/` folder is the shared control center. It contains workflow instructions, agent personas, reusable command prompts, copied skills, and project-local memory.

## How To Use

1. Copy this entire folder into a new project.
2. Ask any AI model to read `AGENTS.md` first.
3. Keep `PROJECT_STATUS.md` current during work.
4. Log every meaningful bug fix or repeated issue in `.ai/memory/bug-log.md`.
5. Before switching models or stopping, update `.ai/memory/handoff.md`.

## Design Goal

The project should remain understandable even when work moves between Claude, Codex, Gemini, Cursor, or another model. Each agent should be able to recover context from files instead of relying on chat history.