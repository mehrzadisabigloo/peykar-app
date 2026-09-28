# Refactor Hard-coded Colors to Theme-based Colors

This plan outlines the steps to replace hard-coded colors across the project with semantic, theme-based colors using `Theme.of(context).colorScheme` and custom `ThemeExtension`s (`StatusColors`, `DashboardColors`, `ReminderColors`).

## User Review Required

> [!IMPORTANT]
> The refactor will map hard-coded colors to their closest semantic equivalent in the theme. This might lead to subtle visual changes if slightly different hard-coded values are mapped to the same theme property.

> [!WARNING]
> This is a project-wide change. While most replacements are straightforward, some context-dependent colors (like `Colors.white` used as a background vs. as an icon color) require careful mapping.

## Proposed Mappings

| Hard-coded Color | Semantic Theme Mapping |
| :--- | :--- |
| `Color(0xff7358F5)` (Primary) | `Theme.of(context).colorScheme.primary` |
| `Color(0xffF8F8F8)` (Grey BG) | `Theme.of(context).colorScheme.surfaceContainerHighest` |
| `Color(0xffE8E8E8)` (Grey Border) | `Theme.of(context).colorScheme.outline` |
| `Color(0xff9E9E9E)` (Grey Text) | `Theme.of(context).colorScheme.onSurfaceVariant` |
| `Color(0xffFF3F3F)` (Error) | `Theme.of(context).colorScheme.error` |
| `Colors.white` (Surface/BG) | `Theme.of(context).colorScheme.surface` |
| `Colors.black` (Text/Icons) | `Theme.of(context).colorScheme.onSurface` |
| `Color(0xFF4CAF50)` (Green) | `StatusColors.of(context).success` |
| `Color(0xFFFFA000)` (Orange) | `StatusColors.of(context).warning` |
| `Color(0xFF2196F3)` (Blue) | `StatusColors.of(context).info` |
| `Color(0xFF1A237E)` (Indigo) | `DashboardColors.of(context).adminAccent` |
| `Color(0xFF00897B)` (Teal) | `DashboardColors.of(context).adminTeal` |
| `Color(0xFFE64A19)` (Deep Orange) | `DashboardColors.of(context).adminOrange` |
| `Color(0xFFF9A825)` (Yellow) | `DashboardColors.of(context).adminYellow` |
| `Color(0xFF3F51B5)` (Indigo) | `DashboardColors.of(context).adminIndigo` |
| `Colors.transparent` | *Keep as is* (usually intentional) |

## Proposed Changes

### 1. Identify and Categorize
I will use the `task` tool to iterate through all files identified by `grep` and apply the mappings.

### 2. Feature-by-Feature Refactor
I will focus on the following key areas:
- `lib/core/widgets/`
- `lib/features/feature_auth/`
- `lib/features/feature_home/`
- `lib/features/feature_admin/`
- `lib/features/feature_shop/`
- `lib/features/feature_dashboard/`

### 3. Handle Special Cases
- In `BaseStatelessWidget` and `BaseWidgetState`, use the existing helper getters (`primaryColor`, `colorGreyText`, etc.) where appropriate.
- Ensure `Colors.white` used inside `ElevatedButton` or similar components with `onPrimary` color schemes are mapped to `Theme.of(context).colorScheme.onPrimary`.

## Verification Plan

### Automated Tests
- Run `flutter analyze` to catch any compilation errors.

### Manual Verification
- Inspect key screens using `ui_state` and screenshots where possible.
- Verify that `ThemeMain` is correctly applied.
