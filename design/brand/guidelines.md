---
type: brand
title: Brand Guidelines
version: 1.0
last_updated: TBD
sections:
  - name: Brand Voice
  - name: Tone
  - name: Visual Identity
  - name: Logo Usage
  - name: Photography
  - name: Co-branding
---

## Summary

<!-- TODO: Write a 200-word max summary of your brand guidelines.
This file is read by frontend-engineering, ui-designer, and ux-writing
agents to ensure consistent brand expression. Cover: brand personality,
visual approach, and voice principles. -->

## Brand Voice

### Core Attributes

| Attribute | Description | Example |
|-----------|-------------|---------|
| Clear | Simple, direct language | "Save your work" not "Commit changes to the repository" |
| Helpful | Supportive, not condescending | "Here's how to fix this" not "You made an error" |
| Professional | Confident but not stiff | "We recommend" not "You must" |
| Human | Approachable, not robotic | "Got it!" not "Operation completed successfully" |

### Writing Principles

1. **Be direct** — say what you mean without filler
2. **Be helpful** — guide users toward solutions
3. **Be human** — write like a person, not a manual
4. **Be consistent** — use the same terms for the same things

## Tone

### Tone by Context

| Context | Tone | Example |
|---------|------|---------|
| Success messages | Positive, brief | "Changes saved" |
| Error messages | Helpful, specific | "Couldn't save. Check your connection and try again." |
| Onboarding | Welcoming, clear | "Welcome! Let's set up your workspace." |
| Empty states | Encouraging, actionable | "No projects yet. Create your first one to get started." |
| Loading states | Informative, brief | "Loading your projects..." |
| Confirmations | Clear, direct | "Delete this project? This can't be undone." |

### Words to Use

| Use | Instead of |
|-----|-----------|
| Save | Commit, Submit, Store |
| Delete | Remove, Destroy, Erase |
| Cancel | Abort, Dismiss |
| Edit | Modify, Update, Alter |
| Create | Add, New, Generate |
| Search | Find, Query, Lookup |

### Words to Avoid

| Avoid | Why |
|-------|-----|
| Simple, Easy | Dismissive if user is struggling |
| Just | Implies task is trivial |
| Please | Unnecessary in UI copy |
| Sorry | Over-apologizing undermines confidence |
| Error | Use "Couldn't" or specific description |

## Visual Identity

### Brand Colors

<!-- TODO: Replace #XXXXXX with your actual brand hex values.
These should match (or complement) the primary colors in design-system/tokens.md.
The tokens file is for implementation; this file explains brand meaning. -->

| Color | Hex | Usage |
|-------|-----|-------|
| Primary | #1A73E8 | Logo, primary actions, brand identity |
| Secondary | #5F6368 | Accents, highlights, supporting UI |
| Neutral | #202124 | Text, backgrounds, structure |

### Brand Typography

<!-- TODO: Replace [Brand Font] with your actual brand font name.
If you don't have a custom brand font, use the primary font from tokens.md.
The brand font is for marketing/branding; the design tokens font is for product UI. -->

| Usage | Font | Weight |
|-------|------|--------|
| Headlines | Inter | Bold (700) |
| Body | Inter | Regular (400) |
| Code | JetBrains Mono | Regular (400) |

### Visual Style

- **Clean**: Minimal clutter, clear hierarchy
- **Modern**: Contemporary patterns, not trendy
- **Professional**: Polished but not corporate
- **Approachable**: Friendly but not childish

## Logo Usage

### Minimum Size

| Platform | Minimum Width |
|----------|---------------|
| Print | 1 inch |
| Digital | 80px |
| Favicon | 16px |

### Clear Space

Maintain clear space around the logo equal to the height of the logomark.

```
┌──────────────────────────────┐
│                              │
│   ┌──────────────────────┐   │
│   │                      │   │
│   │       LOGO           │   │
│   │                      │   │
│   └──────────────────────┘   │
│                              │
└──────────────────────────────┘
     ↑ Clear space = logo height
```

### Logo on Backgrounds

| Background | Logo Version |
|-----------|--------------|
| White/Light | Full color |
| Dark | White or reversed |
| Colored | White or reversed |
| Photography | White with subtle shadow |

### Don'ts

- Don't stretch or distort the logo
- Don't change the logo colors
- Don't add effects (shadows, gradients, outlines)
- Don't rotate the logo
- Don't use the logo as a pattern
- Don't place logo on busy backgrounds without container

## Photography

### Style

- Authentic, not stock-looking
- Diverse representation
- Natural lighting preferred
- Warm, inviting tones
- Contextual (show product in use)

### Do's

- Use real product screenshots
- Show diverse users
- Use consistent filter/treatment
- Crop intentionally

### Don'ts

- Don't use obvious stock photos
- Don't use overly staged scenes
- Don't use low-resolution images
- Don't use images with text overlays

## Co-branding

### When Partner Logo Appears

- Minimum clear space between logos
- Both logos at similar visual weight
- Use approved co-branding templates

### When Our Logo Appears with Partners

- Our logo on left or top
- Equal or greater visual prominence
- Maintain clear space requirements
