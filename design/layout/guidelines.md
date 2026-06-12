---
type: layout
title: Layout Guidelines
version: 1.0
last_updated: TBD
sections:
  - name: Grid System (lines 5-35)
  - name: Responsive Breakpoints (lines 37-65)
  - name: Container Widths (lines 67-85)
  - name: Spacing System (lines 87-110)
  - name: Layout Patterns (lines 112-140)
  - name: Page Templates (lines 142-170)
---

## Summary

[Write a 200-word max summary of the layout guidelines]

## Grid System

### Desktop (12-column)

| Property | Value |
|----------|-------|
| Columns | 12 |
| Gutter | 24px |
| Margin | 32px |
| Max Width | 1200px |

### Tablet (8-column)

| Property | Value |
|----------|-------|
| Columns | 8 |
| Gutter | 16px |
| Margin | 24px |
| Max Width | 768px |

### Mobile (4-column)

| Property | Value |
|----------|-------|
| Columns | 4 |
| Gutter | 16px |
| Margin | 16px |
| Max Width | 100% |

## Responsive Breakpoints

| Breakpoint | Width | Target |
|-----------|-------|--------|
| xs | 0-479px | Mobile portrait |
| sm | 480-767px | Mobile landscape |
| md | 768-1023px | Tablet portrait |
| lg | 1024-1279px | Tablet landscape / Desktop |
| xl | 1280-1439px | Desktop |
| 2xl | 1440px+ | Large desktop |

## Container Widths

| Breakpoint | Max Width | Padding |
|-----------|-----------|---------|
| xs | 100% | 16px |
| sm | 100% | 16px |
| md | 720px | 24px |
| lg | 960px | 32px |
| xl | 1140px | 32px |
| 2xl | 1200px | 32px |

## Spacing System

### Component Spacing

| Context | Spacing |
|---------|---------|
| Between form fields | 16px |
| Between card grid items | 24px |
| Between section headings | 32px |
| Between page sections | 48px |
| Page margin (mobile) | 16px |
| Page margin (desktop) | 32px |

### Element Spacing

| Element | Spacing |
|---------|---------|
| Icon + Label | 8px |
| Label + Input | 8px |
| Input + Helper Text | 4px |
| Button + Button | 12px |
| Badge + Badge | 8px |

## Layout Patterns

### Sidebar + Main Content

```
┌─────────────┬────────────────────┐
│             │                    │
│   Sidebar   │    Main Content    │
│   (240px)   │                    │
│             │                    │
└─────────────┴────────────────────┘
```

### Header + Content

```
┌──────────────────────────────────┐
│            Header                │
├──────────────────────────────────┤
│                                  │
│         Main Content             │
│                                  │
└──────────────────────────────────┘
```

### Card Grid

```
┌──────────┐ ┌──────────┐ ┌──────────┐
│  Card 1  │ │  Card 2  │ │  Card 3  │
└──────────┘ └──────────┘ └──────────┘
┌──────────┐ ┌──────────┐ ┌──────────┐
│  Card 4  │ │  Card 5  │ │  Card 6  │
└──────────┘ └──────────┘ └──────────┘
```

## Page Templates

### Dashboard

- Header: 64px height
- Sidebar: 240px width, collapsible to 64px
- Content: Flex-1, padding 32px
- Cards: 12-column grid, min 280px

### Form Page

- Header: 64px height
- Content: Max-width 640px, centered
- Form fields: Full-width, 16px spacing
- Actions: Sticky bottom, 64px height

### List/Table Page

- Header: 64px height
- Toolbar: 56px height
- Table: Full-width, alternating row colors
- Pagination: Sticky bottom, 48px height