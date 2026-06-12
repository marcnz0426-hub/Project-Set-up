---
type: accessibility
title: Accessibility Rules
version: 1.0
last_updated: TBD
sections:
  - name: Color Contrast (lines 5-30)
  - name: Focus Management (lines 32-60)
  - name: Keyboard Navigation (lines 62-90)
  - name: ARIA (lines 92-120)
  - name: Text and Typography (lines 122-145)
  - name: Motion and Animation (lines 147-165)
  - name: Forms (lines 167-195)
  - name: Testing Checklist (lines 197-220)
---

## Summary

[Write a 200-word max summary of the accessibility rules]

## Color Contrast

### Requirements

| Element | Minimum Ratio | Target Ratio |
|---------|--------------|--------------|
| Normal text (< 24px) | 4.5:1 | 7:1 |
| Large text (≥ 24px) | 3:1 | 4.5:1 |
| UI components | 3:1 | 4.5:1 |
| Focus indicators | 3:1 | 4.5:1 |
| Graphical objects | 3:1 | 4.5:1 |

### Testing

- Use WebAIM Contrast Checker
- Test with color blindness simulators
- Never rely on color alone to convey information

## Focus Management

### Requirements

1. All interactive elements must have visible focus indicators
2. Focus order must follow logical reading order
3. Focus must be trapped in modals and dialogs
4. Focus must return to trigger element when modal closes
5. Skip links must be provided for repeated content

### Focus Styles

```css
/* Default focus */
:focus {
  outline: 2px solid var(--color-primary);
  outline-offset: 2px;
}

/* Keyboard-only focus */
:focus-visible {
  outline: 2px solid var(--color-primary);
  outline-offset: 2px;
}

/* Remove default focus for mouse users */
:focus:not(:focus-visible) {
  outline: none;
}
```

### Focus Trap Pattern

```javascript
// Modal focus trap
function trapFocus(modal) {
  const focusableElements = modal.querySelectorAll(
    'button, [href], input, select, textarea, [tabindex]:not([tabindex="-1"])'
  );
  const firstElement = focusableElements[0];
  const lastElement = focusableElements[focusableElements.length - 1];
  
  modal.addEventListener('keydown', (e) => {
    if (e.key === 'Tab') {
      if (e.shiftKey && document.activeElement === firstElement) {
        lastElement.focus();
        e.preventDefault();
      } else if (!e.shiftKey && document.activeElement === lastElement) {
        firstElement.focus();
        e.preventDefault();
      }
    }
  });
}
```

## Keyboard Navigation

### Key Mapping

| Key | Action |
|-----|--------|
| Tab | Move to next interactive element |
| Shift+Tab | Move to previous interactive element |
| Enter | Activate button/link |
| Space | Activate button/checkbox |
| Arrow keys | Navigate within components |
| Escape | Close modal/dropdown |

### Requirements

- All functionality available via keyboard
- No keyboard traps
- Logical tab order (left-to-right, top-to-bottom)
- Skip navigation link as first focusable element

### Skip Link Pattern

```html
<a href="#main-content" class="skip-link">
  Skip to main content
</a>

<style>
.skip-link {
  position: absolute;
  top: -40px;
  left: 0;
  background: var(--color-primary);
  color: white;
  padding: 8px;
  z-index: 100;
}

.skip-link:focus {
  top: 0;
}
</style>
```

## ARIA

### When to Use

| Situation | ARIA Needed |
|-----------|-------------|
| Custom components | role, aria-label, aria-describedby |
| Dynamic content | aria-live, aria-atomic |
| State changes | aria-expanded, aria-selected |
| Loading states | aria-busy, aria-progressbar |
| Errors | aria-invalid, aria-errormessage |

### Common Patterns

```html
<!-- Button with icon -->
<button aria-label="Close dialog">
  <svg aria-hidden="true">...</svg>
</button>

<!-- Loading state -->
<div aria-busy="true" aria-live="polite">
  Loading...
</div>

<!-- Expandable section -->
<button aria-expanded="false" aria-controls="section-1">
  Section Title
</button>
<div id="section-1" role="region" aria-labelledby="button-1">
  Content...
</div>

<!-- Error message -->
<input aria-invalid="true" aria-describedby="email-error" />
<span id="email-error" role="alert">
  Please enter a valid email
</span>
```

### Rules

- Use native HTML elements when possible
- Don't add ARIA to native elements (button, input, etc.)
- Test with screen readers (VoiceOver, NVDA, JAWS)

## Text and Typography

### Requirements

- Minimum font size: 16px for body text
- Line height: minimum 1.5 for body text
- Paragraph spacing: minimum 1.5x font size
- Text must be resizable to 200% without loss of content
- No images of text (use actual text with CSS styling)

### Line Length

- Optimal: 50-75 characters per line
- Maximum: 80 characters per line
- Use max-width on text containers

## Motion and Animation

### Requirements

- Respect `prefers-reduced-motion` media query
- Provide alternatives for all animations
- No content that flashes more than 3 times per second
- Animations should be subtle and purposeful

### Reduced Motion

```css
@media (prefers-reduced-motion: reduce) {
  *,
  *::before,
  *::after {
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.01ms !important;
  }
}
```

## Forms

### Requirements

- All form fields must have visible labels
- Error messages must be associated with fields
- Required fields must be indicated (not just by color)
- Group related fields with fieldset/legend
- Provide clear instructions before complex fields

### Label Pattern

```html
<label for="email">Email address</label>
<input 
  type="email" 
  id="email" 
  aria-describedby="email-help email-error"
  aria-required="true"
/>
<span id="email-help">We'll never share your email</span>
<span id="email-error" role="alert" aria-live="assertive">
  <!-- Error message appears here -->
</span>
```

## Testing Checklist

### Automated Testing

- [ ] axe-core passes with 0 violations
- [ ] Lighthouse accessibility score ≥ 90
- [ ] No color contrast issues

### Manual Testing

- [ ] Navigate entire page with keyboard only
- [ ] Test with screen reader (VoiceOver/NVDA)
- [ ] Test with 200% zoom
- [ ] Test with Windows High Contrast Mode
- [ ] Test with prefers-reduced-motion
- [ ] Verify focus indicators on all interactive elements
- [ ] Verify skip navigation link
- [ ] Verify form error announcements

### Content Testing

- [ ] All images have alt text
- [ ] All form fields have labels
- [ ] All buttons have accessible names
- [ ] All headings are hierarchical (h1 → h2 → h3)
- [ ] All links have descriptive text (not "click here")