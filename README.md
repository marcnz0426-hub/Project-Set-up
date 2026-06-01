# AI Project Starter

Reusable starter folder for projects worked on by multiple AI models.

The `.ai/` folder is the shared control center. It contains workflow instructions, agent personas, reusable command prompts, copied skills, and project-local memory.

---

## Quick Install (Recommended)

No need to clone this repo. Just run **one command** to scaffold a new project:

### Option A — npx + degit (easiest)

```powershell
npx -y degit marcnz0426-hub/Project-Set-up my-new-project
```

This downloads a clean copy of the boilerplate into `my-new-project/` — no git history, no extra files.

> **Tip:** Replace `my-new-project` with whatever folder name you want. Use `./` to install into the current directory.

### Option B — GitHub Template (browser)

1. Go to [**github.com/marcnz0426-hub/Project-Set-up**](https://github.com/marcnz0426-hub/Project-Set-up)
2. Click the green **"Use this template"** button
3. Name your new repo and click **Create repository**

> **Note:** To enable this, go to your repo's **Settings** and check **"Template repository"**.

### Option C — git clone (manual)

```powershell
git clone --depth 1 https://github.com/marcnz0426-hub/Project-Set-up.git my-new-project
Remove-Item -Recurse -Force my-new-project\.git
```

This shallow-clones the repo and removes the `.git` folder so you start fresh.

---

## After Setup

1. `cd` into your new project folder.
2. Run `git init` to initialize version control (skip if you used the GitHub template).
3. Ask any AI model to read `AGENTS.md` first.
4. Customize the project-specific files:
   - `PROJECT_STATUS.md`
   - `AGENTS.md`
   - `.ai/settings.json`
   - `.ai/rules/*.md`
   - `.ai/memory/*.md`
5. Keep `PROJECT_STATUS.md` current during work.
6. Log every meaningful bug fix or repeated issue in `.ai/memory/bug-log.md`.
7. Before switching models or stopping, update `.ai/memory/handoff.md`.

## Design Goal

The project should remain understandable even when work moves between Claude, Codex, Gemini, Cursor, or another model. Each agent should be able to recover context from files instead of relying on chat history.