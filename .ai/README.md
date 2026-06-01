# `.ai` Control Center

This folder contains everything an AI agent needs to coordinate work across models.

## Contents

- `workflow/`: ordered project workflow and skill mapping.
- `commands/`: reusable prompt commands any model can follow.
- `rules/`: durable collaboration, coding, testing, git, and memory rules.
- `agents/`: role personas and their skill bundles.
- `skills/`: copied local skill library arranged by workflow phase.
- `memory/`: project-local self-healing memory.
- `templates/`: structured templates for logs, handoffs, and review packets.
- `settings.json`: project-level configuration for agents.

## Required Behavior

Before making changes, agents must understand the current project state. Before stopping, agents must leave enough context for another model to continue safely.