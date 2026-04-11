# DESIGN.md

## Purpose
BLab Design System is the shared visual language for Byungsker's products.
This file is the primary entry point for both humans and AI agents.

## Scope
BLab is intended to support product surfaces such as mobile apps, web apps, admin tools, and landing pages.
The system should preserve consistency while allowing context-appropriate adaptation.

## Read in this order
1. `docs/design/BRAND.md`
2. `docs/design/TOKENS.md`
3. `docs/design/COMPONENTS.md`
4. `docs/design/PATTERNS.md`
5. `docs/design/MOTION.md`
6. `docs/design/A11Y.md`
7. `docs/design/DO_DONT.md`

## Core Principles
- Prefer semantic tokens over raw values.
- Preserve consistency before adding novelty.
- Build systems, not one-off screens.
- Accessibility is required.
- Motion should improve clarity, not decorate for its own sake.
- Components should feel calm, polished, and intentional.

## Non-negotiables
- Do not introduce arbitrary colors, spacing, radius, or elevation values.
- Do not use component styling that breaks token hierarchy.
- Do not add decorative motion that slows down core tasks.
- Do not sacrifice readability for visual flair.
- Reuse existing component patterns before creating new ones.

## Notes for AI agents
When generating or modifying UI:
- Read this file first.
- Follow semantic token usage.
- Reuse existing component patterns before inventing new ones.
- If a new visual rule is needed, propose an update to the relevant design document.
- Treat accessibility and consistency as hard constraints.
