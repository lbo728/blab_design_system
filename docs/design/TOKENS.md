# TOKENS.md

## Token Principles
- Prefer semantic tokens over raw values.
- Token names should describe intent, not only appearance.
- Tokens should scale across product surfaces without losing meaning.
- Avoid one-off visual values unless they are promoted into the token system.

## Color Tokens
### Surface
Define semantic surface levels such as:
- `surface.base`
- `surface.raised`
- `surface.overlay`
- `surface.glass`

### Text
Define readable text hierarchy such as:
- `text.primary`
- `text.secondary`
- `text.tertiary`
- `text.inverse`

### Border
Define structural boundaries such as:
- `border.subtle`
- `border.default`
- `border.strong`

### Action
Define interactive emphasis such as:
- `action.primary`
- `action.secondary`
- `action.tertiary`
- `action.destructive`

### Status
Define semantic states such as:
- `status.success`
- `status.warning`
- `status.error`
- `status.info`

## Typography Tokens
### Font Families
Define font roles rather than isolated picks.
Example roles:
- `font.heading`
- `font.body`
- `font.mono`

### Type Scale
Define a consistent scale for:
- display
- heading
- title
- body
- caption
- label

### Typography Rules
- Preserve clear hierarchy.
- Avoid overly tight spacing in reading-heavy surfaces.
- Optimize readability before style expression.

## Spacing Tokens
Use a constrained spacing scale.
Spacing should create rhythm and grouping, not visual noise.

## Radius Tokens
Use consistent corner radius tiers.
Avoid arbitrary corner styling at the component level.

## Elevation Tokens
Define depth intentionally.
Elevation should signal hierarchy, not decoration.

## Overlay and Blur Tokens
If BLab uses glass-like surfaces, define them as tokens rather than ad-hoc effects.
Examples:
- overlay opacity levels
- blur intensity levels
- glass border strength

## Responsive Tokens
Define breakpoint concepts and adaptive spacing or density rules as needed.

## Rules
- Use semantic tokens first.
- Avoid raw hex usage in component-level decisions where tokens exist.
- Avoid ad-hoc spacing values.
- Promote repeated exceptions into the official token system.
