# CLI Adapter: [Tool Name]

*This is a generic template for registering external CLI coding agents.*

## Tool Identity
- **Name:** [Tool Name, e.g., Jules]
- **Command Name:** `[command]`

## Installation Assumption
This adapter assumes `[command]` is installed and available in the system PATH. 
**Do NOT install this CLI without explicit user approval.**

## Verification Commands
- **Check Installation:** `[command] --version` (or equivalent non-mutating check)
- **Check Auth (if applicable):** `[command] auth status`

## Supported Roles & Permissions
This tool is authorized to perform the following roles. 
*Default Safety Rule: Reviewer, tester, planner, architect, and security-reviewer roles are **read-only** unless the user explicitly allows edits.*

| Role | Permitted Actions | Edit Files? |
|------|-------------------|-------------|
| `implementer` | Write code, modify files | Yes |
| `frontend-implementer` | Write frontend code | Yes |
| `backend-implementer` | Write backend code | Yes |
| `debugger` | Investigate and fix bugs | Yes |
| `code-reviewer` | Review code, provide feedback | **No** (unless user overrides) |
| `tester` | Run and write tests | **No** (unless user overrides) |
| `planner` | Generate plans and architecture | **No** (unless user overrides) |
| `architect` | Design system architecture | **No** (unless user overrides) |
| `security-reviewer` | Audit for security issues | **No** (unless user overrides) |

## Model Selection Syntax
- **Syntax:** `[command] --model <model_name>` (Update based on tool's actual syntax)

## Command Patterns
- **Read-Only Task:** `[command] --read-only --task "..."`
- **Edit Task:** `[command] --task "..."`
*(Replace with actual safe CLI invocation patterns)*

## Prompt / Input Contract
When the orchestrator invokes this tool, the prompt MUST include:
1. **Role & Scope:** Explicitly define what the tool should do.
2. **Context:** Provide paths to PRD, architecture, and relevant `.ai/` rules.
3. **Permissions:** Explicitly state if the tool is allowed to read or write files.
4. **Acceptance Criteria:** Define what completion looks like.
5. **Output Format:** Require the output format below.

## Output / Report Contract
The tool MUST output its report in the following format so the orchestrator can parse it:
- **Role Used:** 
- **Task Performed:**
- **Files Read:**
- **Files Changed:** (If any)
- **Requirements Satisfied:**
- **Tests/Checks Run:**
- **Findings by Severity:** (Critical, Important, Minor)
- **Blockers:** 
- **Status:** (Complete / Incomplete)

## Strict Safety Constraints & Forbidden Actions
To prevent unauthorized access and system modification, the following constraints are strictly enforced:

- **No Unauthorized Network Calls:** The tool must NOT make outbound network requests (e.g., telemetry, external API calls) unless explicitly allowed by the user.
- **No Mutating Commands Without Approval:** The tool must NOT execute any commands that alter system state, git history, or configuration files outside of its approved scope without explicit user consent.
- **No Access to Secrets:** The tool's execution environment must be sanitized. It is strictly forbidden to access, request, or transmit secrets, credentials, or sensitive environment variables.
- **No Destructive Commands:** Do NOT run destructive commands (e.g., `rm -rf`, `git reset --hard`, database drops).
- **No Bypassing Permissions:** Do NOT bypass the read-only restrictions for reviewer/planner roles.
- **No Interactive Prompts:** Do NOT trigger interactive prompts or require manual login during execution.

## Failure Handling
- If the tool fails to parse the command syntax, STOP and ask the user.
- If the tool fails authentication, STOP and notify the user.
- If the tool repeatedly fails the same task (e.g., >2 attempts), fallback to the orchestrator and ask for direction.

## Orchestrator Handoff Rules
- When the task is marked as Complete, the orchestrator should verify the changes (if any) and pass the output to the next phase in the workflow.
- If Blockers are reported, the orchestrator MUST evaluate them. If unsolvable, halt and prompt the user.
