# Build Discipline Rules

These rules ensure the AI agent follows the PRD and design specs strictly without adding unrequested features or scope creep.

## Core Principle

**Build exactly what is specified. Nothing more, nothing less.**

## Rules

### 1. PRD is the Source of Truth

- Read the PRD before starting any implementation
- Every feature must trace back to a PRD requirement
- If a requirement is unclear, ask for clarification — don't assume
- Never add features not in the PRD without explicit user approval

### 2. No Scope Creep

- Don't add "nice to have" features unless requested
- Don't refactor unrelated code while implementing
- Don't upgrade dependencies unless required by the feature
- Don't add documentation beyond what's needed for the feature

### 3. No Over-Engineering

- Use existing patterns in the codebase
- Don't add abstractions until they're needed
- Don't add configuration for things that won't change
- Don't add logging/monitoring beyond what's required

### 4. Design Specs are Mandatory

- Follow the design system tokens exactly
- Implement all states specified in the design (loading, error, empty, success)
- Use the exact copy from UX Writing for all user-facing text
- Don't invent UI patterns not in the design specs

### 5. Stay Within Context

- Read all uploaded context files (PRD, UX, UI, Copy)
- Don't deviate from the specified user flows
- Don't add interactions not in the wireframes
- Don't change the information architecture

### 6. Track Changes

- Update PROJECT_STATUS.md with what was implemented
- Log any deviations from the PRD in the handoff notes
- Record assumptions made during implementation
- Note any conflicts found between context files

## Exceptions

Deviations from the PRD are allowed ONLY when:

1. The user explicitly requests a change
2. A technical constraint makes the PRD spec impossible
3. A security vulnerability is discovered that requires immediate action

In all cases, document the deviation and get user approval before proceeding.

## Enforcement

Before claiming any task is complete, verify:

- [ ] Every implemented feature traces to a PRD requirement
- [ ] All design specs are followed exactly
- [ ] All UX copy matches the provided content
- [ ] No unrequested features were added
- [ ] No unrelated refactoring was done
- [ ] Changes are logged in PROJECT_STATUS.md