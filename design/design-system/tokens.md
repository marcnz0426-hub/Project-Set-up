---
type: design-system
title: Design Tokens
version: 1.0
last_updated: TBD
sections:
  - name: Colors
  - name: Typography
  - name: Spacing
  - name: Shadows
  - name: Borders
  - name: Animation
---

## Summary

<!-- TODO: Write a 200-word max summary of the design system tokens.
The values below are default template values. Replace hex colors, font names,
and spacing values with your actual brand/design choices.
This file is read by frontend-engineering, ui-designer, and any agent
working on UI components. -->

## Colors

### Primary Colors

| Token | Value | Usage |
|-------|-------|-------|
| --color-primary | #1A73E8 | Primary actions, links, active states |
| --color-primary-hover | #1557B0 | Hover state |
| --color-primary-active | #0D3F8A | Active/pressed state |
| --color-primary-light | #D2E3FC | Light backgrounds, badges |

### Secondary Colors

| Token | Value | Usage |
|-------|-------|-------|
| --color-secondary | #5F6368 | Secondary actions, muted UI |
| --color-secondary-hover | #4A4E53 | Hover state |

### Neutral Colors

| Token | Value | Usage |
|-------|-------|-------|
| --color-background | #FFFFFF | Page background |
| --color-surface | #F8F9FA | Card/panel background |
| --color-surface-hover | #F1F3F4 | Hover state on surfaces |
| --color-border | #DADCE0 | Borders, dividers |
| --color-text-primary | #202124 | Headings, body text |
| --color-text-secondary | #5F6368 | Captions, labels, hints |
| --color-text-disabled | #9AA0A6 | Disabled text |

### Semantic Colors

| Token | Value | Usage |
|-------|-------|-------|
| --color-success | #34A853 | Success states, positive feedback |
| --color-warning | #FBBC04 | Warning states, caution |
| --color-error | #EA4335 | Error states, destructive actions |
| --color-info | #4285F4 | Informational states |

<!-- TODO: Replace these default values with your brand colors.
To pick a palette, start with your primary brand color and derive
the rest using consistent hue/saturation/lightness relationships.
Tools: coolors.co, realtimecolors.com, or your brand guide. -->

## Typography

### Font Families

| Token | Value | Usage |
|-------|-------|-------|
| --font-family-primary | 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif | Body text |
| --font-family-heading | 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif | Headings |
| --font-family-mono | 'JetBrains Mono', 'Fira Code', monospace | Code, technical values |

### Font Sizes

| Token | Value | Usage |
|-------|-------|-------|
| --font-size-xs | 12px | Captions, helper text |
| --font-size-sm | 14px | Small text, labels |
| --font-size-base | 16px | Body text (default) |
| --font-size-lg | 18px | Large body, lead paragraphs |
| --font-size-xl | 20px | Subheadings |
| --font-size-2xl | 24px | H3 |
| --font-size-3xl | 30px | H2 |
| --font-size-4xl | 36px | H1 |

### Font Weights

| Token | Value | Usage |
|-------|-------|-------|
| --font-weight-normal | 400 | Body text |
| --font-weight-medium | 500 | Labels, emphasis |
| --font-weight-semibold | 600 | Subheadings, button text |
| --font-weight-bold | 700 | H1, strong emphasis |

### Line Heights

| Token | Value | Usage |
|-------|-------|-------|
| --line-height-tight | 1.25 | Headings, display text |
| --line-height-normal | 1.5 | Body text (default) |
| --line-height-relaxed | 1.75 | Long-form content, articles |

## Spacing

| Token | Value | Usage |
|-------|-------|-------|
| --spacing-0 | 0px | Reset, flush alignment |
| --spacing-1 | 4px | Tight spacing (icon gaps) |
| --spacing-2 | 8px | Small gaps (inline elements) |
| --spacing-3 | 12px | Medium gaps (form elements) |
| --spacing-4 | 16px | Default gap (between sections) |
| --spacing-5 | 20px | Section spacing |
| --spacing-6 | 24px | Component spacing |
| --spacing-8 | 32px | Large sections |
| --spacing-10 | 40px | Page sections |
| --spacing-12 | 48px | Major sections |
| --spacing-16 | 64px | Page margins |

## Shadows

| Token | Value | Usage |
|-------|-------|-------|
| --shadow-sm | 0 1px 2px rgba(0,0,0,0.05) | Subtle elevation (cards at rest) |
| --shadow-md | 0 4px 6px rgba(0,0,0,0.1) | Medium elevation (hovered cards) |
| --shadow-lg | 0 10px 15px rgba(0,0,0,0.1) | High elevation (dropdowns, modals) |
| --shadow-xl | 0 20px 25px rgba(0,0,0,0.15) | Maximum elevation (popovers) |

## Borders

| Token | Value | Usage |
|-------|-------|-------|
| --border-width-sm | 1px | Default borders |
| --border-width-md | 2px | Emphasis borders, active states |
| --border-radius-sm | 4px | Small radius (badges, chips) |
| --border-radius-md | 8px | Default radius (buttons, inputs) |
| --border-radius-lg | 12px | Large radius (cards, modals) |
| --border-radius-xl | 16px | Extra large (feature cards) |
| --border-radius-full | 9999px | Pills, circles, avatars |

## Animation

| Token | Value | Usage |
|-------|-------|-------|
| --duration-fast | 100ms | Micro-interactions (hover, focus) |
| --duration-normal | 200ms | Default transitions (fade, scale) |
| --duration-slow | 300ms | Complex animations (slide, expand) |
| --duration-slower | 500ms | Page transitions |
| --ease-default | cubic-bezier(0.4, 0, 0.2, 1) | Default easing |
| --ease-in | cubic-bezier(0.4, 0, 1, 1) | Entering elements |
| --ease-out | cubic-bezier(0, 0, 0.2, 1) | Exiting elements |
| --ease-in-out | cubic-bezier(0.4, 0, 0.2, 1) | Full enter/exit cycles |
