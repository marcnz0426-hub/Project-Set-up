# Health Check

Run this before starting any work session (Phase 00.2) to verify the project scaffolding is intact.

## Steps

0. **Initialize session cache:**
   - Read `.ai/.session-state.json`
   - If `session_id` is null or missing: generate one (use current timestamp ISO string), set `started_at`, reset `loaded_files` to all false, write file
   - Set `last_activity` to current timestamp after every read/write operation
   - If all mandatory files are cached (loaded_files all true), skip steps 1-9 of AGENTS.md startup
   - **Check `context_read_progress`** for entries from a prior session:
     - If `session_id` was null before generation (brand new session): reset `context_read_progress` to `{}` — prior partial reads are from a different work context
     - If `session_id` already existed (continuing session): entries are valid, report to agent: "Previous session partially read [N] file(s). Resume reading from the recorded boundary for each."
     - Do NOT clear the entries during health-check — they are consumed during Phase 00.3 context loading (the agent reads the boundaried range and removes entries once fully read)

1. **Verify entry point files exist:**
   ```
   AGENTS.md
   PROJECT_STATUS.md
   README.md
   ```

2. **Verify `.ai/` directory structure:**
   ```
   .ai/README.md
   .ai/settings.json
   .ai/workflow/workflow-order.md
   .ai/workflow/agent-skill-map.md
   .ai/context/INDEX.md
   .ai/context/purpose.md
   .ai/memory/index.md
   .ai/memory/memory-policy.md
   ```

3. **Verify `settings.json` is valid JSON and all referenced paths resolve:**
   - Check `context_root`, `memory_root`, `skills_root`, `rules_root` directories exist
   - Check `memory_index` file exists
   - Check at least the mandatory rules files exist

4. **Verify skill folders exist:**
   ```
   .ai/skills/00-runtime/
   .ai/skills/01-brainstorming/
   .ai/skills/07-coding/
   .ai/skills/12-verification/
   ```

5. **Report results:**
   - List any missing files or directories
   - If all checks pass, report: "Scaffolding verified. Ready to proceed."
   - If issues found, list them and ask user whether to continue or fix first.

6. **Cross-reference all agent→skill references:**
   - Read `.ai/workflow/agent-skill-map.md`
   - For each agent listed, verify every referenced skill folder has a `SKILL.md` file in it
   - Read `.ai/settings.json` and verify all file/directory paths resolve on disk
   - Read all `.ai/agents/*.md` files and verify their listed skills match the entries in `agent-skill-map.md`
   - Report: "All references resolve cleanly" or list each broken reference with its full path

   **Common failures to catch:**
   - Agent references a skill that doesn't exist in `.ai/skills/`
   - `settings.json` path doesn't resolve to an actual file
   - Agent `.md` lists a skill that `agent-skill-map.md` doesn't list (or vice versa)

7. **Check git state:**
   - Current branch: `git branch --show-current`
   - Uncommitted changes: `git status --short`
   - Untracked files count: `git ls-files --others --exclude-standard | wc -l`
   - Report: branch name, dirty/clean state, divergence from main

8. **Check environment tooling (if available):**
   - Node.js: `node --version`
   - Python: `python --version`
   - Git: `git --version`
   - Docker: `docker --version` (if applicable)
   - Report: which tools are available and their versions

9. **Check project dependencies exist:**
   - If `package.json` exists → verify `node_modules/` exists or run `npm install` if missing
   - If `requirements.txt` exists → verify installed or run `pip install -r requirements.txt` if missing
   - If `Cargo.toml` exists → verify `Cargo.lock` exists
   - If `go.mod` exists → verify `go.sum` exists
   - Report: "All project dependencies present" or list missing dependencies with install command

## Auto-Healing

When the health check finds missing files, attempt auto-creation before reporting failure:

### Auto-Creation Rules

| Missing File | Auto-Heal Action |
|-------------|-------------------|
| `.ai/.session-state.json` | Create with null session_id, current timestamp `started_at`, all `loaded_files` false, `context_read_progress: {}` |
| `.ai/context/purpose.md` | Create with template structure (section headers only, marked `TODO`) |
| `.ai/context/INDEX.md` | Create with default index referencing purpose.md, architecture.md, domain.md |
| `.ai/memory/index.md` | Create with empty sections |
| `.ai/memory/memory-policy.md` | Copy from `.ai/rules/` equivalent or create with defaults |
| `.ai/settings.json` | Warn only — too project-specific to auto-create |
| `AGENTS.md` | Warn only — critical entry point |

**Procedure:**
1. On finding a missing file, check if it's in the auto-heal table above
2. If yes → create the file with minimal valid content and log: `Auto-healed: [file]`
3. If no → add to the missing files report
4. After auto-healing, re-run the check for healed items to confirm they're valid

## Notes

- This is a lightweight check, not a full system audit.
- If files are missing and auto-heal fails, the agent should warn but can still proceed if the user approves.
- Run this at the start of any new session or after a model switch.
