# Design Folder

This folder contains global design guidelines and rules that AI agents must follow strictly when implementing user interfaces.

## Structure

```
design/
├── README.md                    ← This file
├── design-system/
│   └── tokens.md               ← Colors, typography, spacing, design tokens
├── layout/
│   └── guidelines.md           ← Grid, responsive breakpoints, spacing system
├── components/
│   └── inventory.md            ← Component list, variants, states, usage rules
├── accessibility/
│   └── rules.md                ← Contrast, focus, ARIA, keyboard navigation
└── brand/
    └── guidelines.md           ← Brand voice, tone, logo usage, visual identity
```

## When to Read

| Task Type | Files to Read |
|-----------|---------------|
| UI Implementation | design-system/tokens.md, components/inventory.md |
| Layout/Responsive | layout/guidelines.md |
| Accessibility Pass | accessibility/rules.md |
| Visual Design | design-system/tokens.md, brand/guidelines.md |
| Component Creation | components/inventory.md, design-system/tokens.md |

## Design Token Format

All design files use consistent formatting:

```markdown
---
type: design-system|layout|components|accessibility|brand
title: Human-readable title
version: 1.0
last_updated: YYYY-MM-DD
---

## Summary

[200-word max summary]

## Tokens/ Guidelines

[Structured content with clear naming and values]
```

## Enforcement Rules

1. **Never override design tokens** without explicit user approval
2. **Always follow** accessibility rules (contrast, focus, ARIA)
3. **Use existing components** before creating new ones
4. **Reference design tokens** in code comments when implementing
5. **Flag conflicts** between design specs and implementation feasibility