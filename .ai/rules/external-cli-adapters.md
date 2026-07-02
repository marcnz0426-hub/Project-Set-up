# External CLI Adapters Policy

This rule governs how the orchestrator safely detects, registers, documents, and invokes external CLI tools or coding agents (such as Jules, OpenCode, Aider, Gemini CLI, Claude CLI, Codex CLI, Antigravity agents, etc.) requested by the user.

## 1. Discovery and Auto-Registration

When the user explicitly asks to use an external CLI or coding agent (e.g., "Use Jules as the reviewer", "Use OpenCode with DeepSeek for frontend"), the orchestrator MUST perform the following discovery steps:

1. **Check for Existing Adapter:** Check if an adapter already exists in `.ai/adapters/` (e.g., `.ai/adapters/jules.md`).
2. **Verify Installation:** Verify whether the CLI is installed locally. **CRITICAL: Use non-mutating checks only during discovery (e.g., `jules --version`, `which opencode`). Do NOT run mutating CLI commands.**
3. **Auto-Register (if missing):** If the CLI is verified to be installed but no adapter exists:
   - Create a new adapter file using `.ai/adapters/cli-tool-template.md`.
   - Register the tool in `.ai/settings.json` under `external_cli_tools.registered`.
4. **Define Tool Boundaries:** In the new adapter, clearly define:
   - What roles the tool may perform.
   - Whether the tool is allowed to edit files.
   - How the tool receives prompts/tasks.
   - How the tool reports output.
5. **Stop on Ambiguity:** If command syntax, model syntax, authentication state, or setup requirements are unclear, STOP and ask the user for clarification.

## 2. Strict Safety Constraints & Hard Stops

To ensure external CLIs operate securely, the orchestrator MUST enforce the following strict technical constraints:

- **Network Isolation:** Do NOT allow external tools to make unauthorized outbound network calls. If a tool requires network access, it must be explicitly approved by the user.
- **Mutating Command Pre-Approval:** Any CLI command that modifies system state, file structures, or git history (outside of the allowed edit boundaries) MUST be presented to the user for explicit approval before execution. Use dry-runs where possible.
- **Secrets Isolation:** The execution environment MUST be sanitized. Do NOT pass sensitive environment variables (e.g., `AWS_ACCESS_KEY`, `DB_PASSWORD`, API keys) into the CLI process unless strictly required and approved by the user.
- **Missing CLI:** The requested CLI is not installed on the system. **Do NOT install any missing CLIs without explicit user approval.**
- **Interactive Setup:** The CLI requires login, authentication, or interactive setup.
- **Unverified Syntax:** The command syntax or model name syntax cannot be reliably verified.
- **Destructive Actions:** The CLI attempts or requests to perform destructive actions (e.g., deleting untracked files without approval, dropping databases).
- **Role Conflict:** The CLI's designated role conflicts with the user's requested behavior (e.g., attempting to write files when configured as a read-only code reviewer).
- **Repeated Failures:** The same CLI task fails repeatedly.

## 3. Expected Orchestrator Behavior (Example)

If a user says: *"Use Jules as reviewer and OpenCode as frontend/debugger."*

The orchestrator MUST:
1. Verify `jules` is installed.
2. Create or load `.ai/adapters/jules.md`.
3. Mark Jules as `code-reviewer`, **read-only**.
4. Verify `opencode` is installed.
5. Create or load `.ai/adapters/opencode.md`.
6. Mark OpenCode as `frontend-implementer` and `debugger`, **edit-allowed** (if confirmed by user).
7. Verify model syntax before invoking any requested models for these CLIs.
8. Prepare task packets for each CLI (see Prompt Contracts).
9. Capture reports from each CLI (see Output Contracts).
10. Validate review findings before sending them to the debugger.
11. Loop: implementation → review → debug → test until exit criteria are met.

## 4. Prompt Contracts

Every orchestrator prompt/command dispatched to an external CLI MUST explicitly include or define:
- **Role**: The specific role the CLI is performing (e.g., frontend-implementer).
- **Scope**: The exact bounds of the task.
- **Project Requirements**: Core guidelines from `AGENTS.md` or `coding-standards.md`.
- **References**: Relevant paths to PRD, UI, UX, or architecture documents.
- **Read Access**: Which files it is allowed to read.
- **Write Access**: Which files it is allowed to edit.
- **Acceptance Criteria**: What defines a successful completion.
- **Output Format**: Enforce the output contract (see below).
- **Stop Conditions**: When the CLI should halt and report back.

## 5. Output Contracts

Every external CLI adapter MUST require the tool to report its results back to the orchestrator in a structured manner containing:
- **Role Used**: E.g., reviewer, implementer.
- **Task Performed**: Summary of actions taken.
- **Files Read**: List of files analyzed.
- **Files Changed**: List of files modified (if any).
- **Requirements Satisfied**: Confirmation of met criteria.
- **Tests/Checks Run**: Verification steps performed.
- **Findings by Severity**: (Critical, Important, Minor).
- **Blockers**: Any issues preventing completion.
- **Status**: Whether the overall task is complete or incomplete.
