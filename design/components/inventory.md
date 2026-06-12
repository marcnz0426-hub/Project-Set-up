---
type: components
title: Component Inventory
version: 1.0
last_updated: TBD
sections:
  - name: Button (lines 5-45)
  - name: Input (lines 47-85)
  - name: Card (lines 87-115)
  - name: Modal (lines 117-145)
  - name: Toast (lines 147-175)
  - name: Table (lines 177-205)
  - name: Navigation (lines 207-235)
---

## Summary

[Write a 200-word max summary of the component inventory]

## Button

### Variants

| Variant | Usage | Styles |
|---------|-------|--------|
| Primary | Main actions | Filled, primary color |
| Secondary | Secondary actions | Outlined, secondary color |
| Ghost | Tertiary actions | Text-only |
| Danger | Destructive actions | Filled, error color |

### Sizes

| Size | Height | Padding | Font Size |
|------|--------|---------|-----------|
| sm | 32px | 8px 16px | 14px |
| md | 40px | 12px 24px | 14px |
| lg | 48px | 16px 32px | 16px |

### States

| State | Behavior |
|-------|----------|
| Default | Normal appearance |
| Hover | Darken background |
| Active/Pressed | Darken further |
| Disabled | 50% opacity, no pointer events |
| Loading | Show spinner, disable interaction |

### Usage Rules

- Use Primary for the main action on a page
- Use only one Primary button per section
- Use Danger for destructive actions with confirmation
- Use Disabled state sparingly, prefer hiding or restructuring

---

## Input

### Types

| Type | Usage |
|------|-------|
| Text | General text input |
| Email | Email addresses |
| Password | Passwords with show/hide |
| Number | Numeric values |
| Search | Search queries |
| Textarea | Multi-line text |

### Sizes

| Size | Height | Padding | Font Size |
|------|--------|---------|-----------|
| sm | 32px | 8px 12px | 14px |
| md | 40px | 12px 16px | 14px |
| lg | 48px | 16px 20px | 16px |

### States

| State | Appearance |
|-------|-----------|
| Default | Border, background |
| Focus | Primary border, outline |
| Error | Error border, error message |
| Disabled | Gray background, no interaction |
| Success | Success border, checkmark icon |

### Usage Rules

- Always pair with a label
- Show helper text below for guidance
- Show error messages below the input
- Use required indicator (*) sparingly

---

## Card

### Variants

| Variant | Usage |
|---------|-------|
| Default | Standard content container |
| Interactive | Clickable, hover effect |
| Elevated | With shadow emphasis |
| Outlined | Border emphasis |

### Structure

```
┌──────────────────────────────┐
│ Header (optional)            │
├──────────────────────────────┤
│ Content                      │
│                              │
├──────────────────────────────┤
│ Footer (optional)            │
└──────────────────────────────┘
```

### Spacing

| Element | Spacing |
|---------|---------|
| Card padding | 24px |
| Header to content | 16px |
| Content to footer | 16px |
| Card to card (grid) | 24px |

---

## Modal

### Sizes

| Size | Width | Max Height |
|------|-------|-----------|
| sm | 400px | 60vh |
| md | 560px | 80vh |
| lg | 720px | 80vh |
| full | 90vw | 90vh |

### Structure

```
┌──────────────────────────────┐
│ Header (title + close)       │
├──────────────────────────────┤
│ Content (scrollable)         │
│                              │
├──────────────────────────────┤
│ Footer (actions)             │
└──────────────────────────────┘
```

### States

| State | Behavior |
|-------|----------|
| Open | Fade in backdrop + slide up content |
| Closing | Fade out backdrop + slide down content |
| Loading | Show spinner in content area |

---

## Toast

### Types

| Type | Icon | Color |
|------|------|-------|
| Success | Checkmark | Green |
| Error | X circle | Red |
| Warning | Alert triangle | Yellow |
| Info | Info circle | Blue |

### Positions

| Position | Usage |
|----------|-------|
| Top-right | Default |
| Bottom-right | Alternative |
| Top-center | Critical alerts |

### Duration

| Type | Duration |
|------|----------|
| Info | 5 seconds |
| Success | 3 seconds |
| Warning | 5 seconds |
| Error | 8 seconds (manual dismiss) |

---

## Table

### Structure

```
┌──────────────────────────────────────┐
│ Header (sortable columns)            │
├──────────────────────────────────────┤
│ Row 1                                │
├──────────────────────────────────────┤
│ Row 2                                │
├──────────────────────────────────────┤
│ ...                                  │
├──────────────────────────────────────┤
│ Footer (pagination)                  │
└──────────────────────────────────────┘
```

### Features

- Sortable columns (click header)
- Selectable rows (checkbox)
- Sticky header
- Alternating row colors
- Responsive: horizontal scroll on mobile

---

## Navigation

### Types

| Type | Usage |
|------|-------|
| Sidebar | Primary navigation |
| Top bar | Secondary navigation |
| Tabs | Section navigation |
| Breadcrumbs | Page hierarchy |

### Sidebar States

| State | Appearance |
|-------|-----------|
| Expanded | Full labels + icons |
| Collapsed | Icons only (64px) |
| Mobile | Overlay drawer |

### Active State

- Background: primary color at 10% opacity
- Text: primary color
- Border-left: 3px solid primary