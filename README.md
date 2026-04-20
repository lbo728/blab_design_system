<div align="center">

# BLab Design System

**Calm, polished, trustworthy — a Liquid Glass design language for modern products.**

A Flutter UI component library that ships BLab's design tokens and Liquid Glass widgets. Designed as the shared visual foundation for Byungsker's apps (baroguni, bookgolas, …) and any new project that wants the same feel.

[![Flutter](https://img.shields.io/badge/Flutter-%3E%3D1.17.0-02569B?logo=flutter)](https://flutter.dev)
[![Dart SDK](https://img.shields.io/badge/Dart-%5E3.10.4-0175C2?logo=dart)](https://dart.dev)
[![Style](https://img.shields.io/badge/style-Liquid%20Glass-5B7FFF)](./docs/design/BRAND.md)

</div>

---

## Table of contents

- [Why BLab](#why-blab)
- [Install](#install)
- [Quick start](#quick-start)
- [Design tokens](#design-tokens)
- [Components](#components)
- [Architecture & SSOT](#architecture--ssot)
- [Design docs](#design-docs)
- [Versioning & compatibility](#versioning--compatibility)
- [Contributing](#contributing)

## Why BLab

BLab is the visual identity behind Byungsker's products. It is built around a single idea:

> Interfaces should feel **deliberate, smooth, and lightweight** — never noisy, never decorative, never dense-without-hierarchy.

The defining motif is **Liquid Glass** — translucent pill-shaped surfaces that float over content, with heavy backdrop blur, a hairline border, and an inner top-edge highlight that reads as refracted light.

| Principle | What it means in practice |
|---|---|
| Prefer semantic tokens over raw values | No arbitrary colors, spacing, radius, or elevation values in components |
| Consistency before novelty | Reuse patterns before inventing new ones |
| Motion improves clarity, not decoration | 150–300ms, easing `cubic(0.4, 0, 0.2, 1)`, respect reduced motion |
| Accessibility is required | 4.5:1 contrast, 44×44 touch targets, visible focus rings |

Read the full brand/foundations in [`DESIGN.md`](./DESIGN.md).

## Install

```yaml
# pubspec.yaml
dependencies:
  blab_design_system:
    git:
      url: https://github.com/byungsker/blab_design_system.git
      ref: main   # pin to a tag for production: ref: v1.0.0
```

Then:

```bash
flutter pub get
```

## Quick start

```dart
import 'package:flutter/material.dart';
import 'package:blab_design_system/blab_design_system.dart';

void main() => runApp(const BLabApp());

class BLabApp extends StatelessWidget {
  const BLabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello BLab',
      theme: BLabTheme.light,
      darkTheme: BLabTheme.dark,
      home: const Scaffold(body: _Demo()),
    );
  }
}

class _Demo extends StatelessWidget {
  const _Demo();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(BLabSpacing.lg),
      child: BLabCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome', style: BLabTypography.h2),
            SizedBox(height: BLabSpacing.sm),
            Text(
              'Calm, polished, trustworthy.',
              style: BLabTypography.body.copyWith(
                color: BLabColors.textSecondary(context),
              ),
            ),
            SizedBox(height: BLabSpacing.lg),
            BLabButton(text: 'Get started', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
```

## Design tokens

All tokens come from a single authoritative source: [`docs/design/tokens.css`](./docs/design/tokens.css). The Dart files under `lib/src/theme/` mirror that CSS 1:1 — CSS variable names appear as comments next to each Dart constant.

| Category | Import | Representative API |
|---|---|---|
| **Color** | `BLabColors` | `primary`, `textPrimary(context)`, `surface(context)`, `borderSubtle(context)` |
| **Typography** | `BLabTypography` | `display`, `h1`, `h2`, `title`, `subtitle`, `body`, `caption`, `label`, `button`, `tab`, `code` |
| **Spacing** | `BLabSpacing` | `xs` (2), `sm` (8), `md` (16), `lg` (20), `xl` (24), `xxl` (32) |
| **Radius** | `BLabRadius` | `xs` (6), `sm` (10), `md` (12), `lg` (16), `xl` (20), `pill` (100) |
| **Shadow** | `BLabShadow` | `one(context)` → `four(context)` — 4-level elevation, Light/Dark aware |
| **Motion** | `BLabMotion` | `ease` (cubic 0.4/0/0.2/1), `durPress` 150ms, `durSegment` 180ms, `durSurface` 300ms |
| **Glass** | `BLabGlass` | `blur` 25, `fill(context)`, `border(context)`, `highlight(context)` |

Both **light** and **dark** modes are first-class; context-aware accessors (`BLabColors.surface(context)`) flip automatically.

## Components

9 Liquid Glass widgets live under `lib/src/widgets/`. All of them consume the design tokens above — there are no raw color or radius literals inside component bodies.

| Widget | Purpose |
|---|---|
| `BLabButton` | Primary / Secondary / Destructive CTA with haptic press |
| `BLabCard` | Glass-fill container with 16px radius, 20px padding |
| `BLabTextField` | Focus-visible text input with label and optional clear affordance |
| `BLabBottomBar` | Pill-shaped tab bar with droplet indicator, long-press drag to switch |
| `BLabTabBar` | In-screen tab switcher built on Flutter's `TabBar` |
| `BLabSegmentedControl` | Small pill-shaped segmented picker |
| `BLabSnackbar` | Floating toast with `success / error / warning / info` types |
| `BLabKeyboardAccessoryBar` | iOS-style keyboard toolbar (navigation, copy, undo/redo, done) |
| `BLabPressableWrapper` | Press-scale + brightness overlay + haptics primitive |

Each widget supports light and dark mode out of the box.

## Architecture & SSOT

BLab's Single Source of Truth is the **`blab-design` skill bundle**. Everything else consumes from it.

```
   Claude.ai  ──(handoff bundle export)──►  ~/.claude/skills/blab-design/     ◄── SSOT
                                                  │
                                                  ▼
                                          docs/design/tokens.css   (repo mirror)
                                                  │
                            ┌─────────────────────┼─────────────────────┐
                            ▼                     ▼                     ▼
                  lib/src/theme/*.dart     Figma (optional)      Other projects
                  (Flutter tokens)         visual reference      consume the skill
```

- The **skill bundle** ships the CSS tokens, a JSX reference UI kit, Pretendard fonts, and brand/a11y/motion docs. Any project can invoke `/blab-design` in Claude Code to pick it up.
- **This repo** is the Flutter implementation. Dart constants under `lib/src/theme/` mirror `docs/design/tokens.css` 1:1.
- **Figma** is an optional distribution target for visual review/non-engineer collaboration — not required for code-level consistency.

When BLab evolves, update the skill bundle in Claude.ai, re-export, and sync this repo.

## Design docs

The prose side of the system lives under [`docs/design/`](./docs/design/). Read in this order:

1. [`BRAND.md`](./docs/design/BRAND.md) — personality, tone, surface philosophy
2. [`TOKENS.md`](./docs/design/TOKENS.md) — naming conventions for color, type, spacing, radius, elevation, glass
3. [`COMPONENTS.md`](./docs/design/COMPONENTS.md) — shared component rules (buttons, cards, inputs, …)
4. [`PATTERNS.md`](./docs/design/PATTERNS.md) — multi-component patterns (forms, lists, empty/loading/error states)
5. [`MOTION.md`](./docs/design/MOTION.md) — timing, easing, reduced-motion rules
6. [`A11Y.md`](./docs/design/A11Y.md) — contrast, focus, touch targets, forms, modals
7. [`DO_DONT.md`](./docs/design/DO_DONT.md) — contributor do's and don'ts

## Versioning & compatibility

- Dart SDK: `^3.10.4` · Flutter: `>=1.17.0`
- The public API surface of `BLabColors`, `BLabTheme`, and all `BLab*` widgets is kept stable across minor versions. Token additions are non-breaking; value changes are called out in commit messages.
- This package is a library; it does not ship `pubspec.lock` per [dart.dev guidance](https://dart.dev/guides/libraries/private-files#pubspeclock).

## Contributing

- **Do** prefer semantic tokens over raw values. **Don't** introduce arbitrary colors, spacing, or radii.
- **Do** reuse existing component patterns. **Don't** duplicate a widget with a new name just to tweak one style.
- If a new visual rule is needed, propose an update to the relevant file in [`docs/design/`](./docs/design/) first.
- Follow [Conventional Commits](https://www.conventionalcommits.org/) for commit messages (`feat:`, `fix:`, `refactor:`, …).

### Local development

```bash
flutter pub get
flutter analyze
flutter test
```

---

<sub>Made with care for the Byungsker product family.</sub>
