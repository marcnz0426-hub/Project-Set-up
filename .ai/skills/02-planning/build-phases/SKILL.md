---
name: build-phases
description: Use after reading uploaded context files (PRD, UX, UI) to break down work into ordered, dependency-aware phases with tasks and acceptance criteria
requires:
  - brainstorming
  - writing-plans
---

# Build Phases

## Overview

After reading context files (PRD.md, UX-design.md, UX-copy.md, UI-design.md), synthesize them into ordered implementation phases with clear dependencies.

**Announce at start:** "I'm using the build-phases skill to create a phased implementation breakdown."

## Process

### Step 1: Cross-reference context files
- Read all uploaded context files (PRD, UX design, UX copy, UI design)
- Identify conflicts, gaps, and dependencies between requirements
- Flag anything that needs clarification before planning

### Step 2: Identify phase boundaries
Group work into phases based on:
- **Dependencies**: What must exist before something else can be built
- **Risk**: Risky or uncertain work should go early (fail fast)
- **Value**: Core functionality before enhancements
- **Team boundaries**: Frontend vs backend, schema vs API vs UI

Each phase must be independently testable and deliver value.

### Step 3: Write BUILD-PHASES.md

Write to `.ai/context/BUILD-PHASES.md` using the existing template structure (see that file for the format).

Each phase entry must include:
- **Name**: Short, descriptive
- **Dependencies**: Which phases must be complete first
- **Context References**: Which context files this phase draws from
- **Tasks**: Numbered, with source requirement and acceptance criteria
- **Verification**: Checklist for phase completion

### Step 4: Validate
- Every PRD requirement maps to at least one task
- No orphan tasks (tasks that don't trace to a requirement)
- Phases are ordered correctly (no circular dependencies)
- Each task has testable acceptance criteria

### Step 5: Handoff
- Update `PROJECT_STATUS.md` with current state
- Report phase summary to user: "Phase breakdown complete — [N] phases, [M] total tasks. Ready for planning."

## Example

```markdown
## Phase 1: Authentication

**Dependencies**: None
**Context References**: PRD.md §2.1, UX-design.md §Flow 1

### Tasks

- [ ] 1.1: Implement email/password login
  - Source: PRD.md FR-1
  - Acceptance Criteria: User can log in with valid email+password; invalid credentials return clear error
- [ ] 1.2: Implement session management  
  - Source: PRD.md FR-2
  - Acceptance Criteria: Session persists across page reloads; expires after 24h
- [ ] 1.3: Implement logout
  - Source: PRD.md FR-3
  - Acceptance Criteria: Session destroyed; user redirected to login

### Verification

- [ ] All tasks complete
- [ ] Login, logout, and session persistence tested
- [ ] Security rules for auth verified
```

## BUILD-PHASES.md Lifecycle

| Stage | When | Action |
|-------|------|--------|
| **Create** | Phase 00.4 | Write `.ai/context/BUILD-PHASES.md` with full phase breakdown |
| **Update** | After Phase 02 (Planning) | Revise tasks if planning reveals missing details |
| **Update** | After Phase 04 (Parallelization) | Add agent assignments per phase if work is split |
| **Read** | Before Phase 07 (Coding) | Reference current task and acceptance criteria |
| **Verify against** | During Phase 12 (Verification) | Check each task's acceptance criteria is met |
| **Archive** | After Phase 13 (Branch Finish) | Move to `.ai/memory/archive/` or delete — no longer needed for this cycle |
| **Recreate** | Each new feature cycle | Start fresh — previous BUILD-PHASES.md is stale |

**Rule:** Never edit BUILD-PHASES.md during Phase 07 (Coding) except to mark tasks complete. If coding reveals missing tasks, add them to a new "Discovered" section rather than inline.

## Verification Checklist

- [ ] All context files cross-referenced
- [ ] Phases ordered by dependency
- [ ] Every task has acceptance criteria
- [ ] Tasks trace to specific PRD requirements
- [ ] No orphan tasks or unmapped requirements
- [ ] BUILD-PHASES.md written to `.ai/context/BUILD-PHASES.md`
- [ ] PROJECT_STATUS.md updated
