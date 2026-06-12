---
type: ui
title: UI Design
version: 1.0
last_updated: YYYY-MM-DD
sections:
  - name: Visual System
  - name: Component Specs
  - name: Layout & Grid
  - name: Responsive Behavior
  - name: Animation & Transition
  - name: Design Asset References
---

## Summary

<!-- Write a 200-word max summary of the UI design system. Cover: the visual
approach, key component patterns, layout strategy, and responsive behavior.
Agents read this to understand how things should look and feel. Cross-reference
with design-system/tokens.md for exact values. -->

## Visual System

<!-- Describe the overall visual approach. Reference design tokens by name rather
than duplicating values. -->

### Typography Scale

<!-- Reference design-system/tokens.md font sizes. Describe any deviations or
additions specific to this product. -->

| Token | Usage | Notes |
|-------|-------|-------|
| --font-size-4xl | Page heading (h1) | |
| --font-size-3xl | Section heading (h2) | |
| --font-size-base | Body text | |

### Color Usage

<!-- Describe how colors are applied. Reference tokens, don't duplicate values. -->

| Token | Where Used | Notes |
|-------|------------|-------|
| --color-primary | Buttons, links, active states | |
| --color-error | Destructive actions, error states | |
| --color-background | Page background | |

### Spacing & Rhythm

<!-- Describe spacing conventions. Reference tokens. -->

- Page margins: --spacing-8
- Section gaps: --spacing-12
- Component padding: --spacing-6

## Component Specs

<!-- For each component variant, specify: purpose, structure, states, and which
design tokens apply. Cross-reference design/components/inventory.md. -->

### [Component Name]

**Purpose**: 

**Variants**:
| Variant | When to Use | Token Overrides |
|---------|-------------|-----------------|
| | | |

**States**:
| State | Visual | Behavioral |
|-------|--------|------------|
| | | |

**Structure**:
```
┌──────────────────────┐
│                      │
└──────────────────────┘
```

## Layout & Grid

<!-- Describe the page layout system. Cross-reference design/layout/guidelines.md. -->

| Page Type | Grid Columns | Max Width | Layout Pattern |
|-----------|-------------|-----------|----------------|
| | | | |

## Responsive Behavior

<!-- Describe how layouts adapt across breakpoints. -->

| Breakpoint | Behavior Change |
|------------|-----------------|
| Desktop → Tablet | |
| Tablet → Mobile | |

## Animation & Transition

<!-- Describe animation patterns. Reference tokens. -->

| Element | Trigger | Animation | Duration |
|---------|---------|-----------|----------|
| | | | |

## Design Asset References

<!-- Link to Figma files, mockups, or other design assets. -->

- Figma: [URL]
- Prototype: [URL]
- Design system: [URL]
