# Refactor Hard-coded Colors to Theme-based Colors

This plan outlines the steps to replace over 700 instances of hard-coded colors with semantic, theme-based colors using `Theme.of(context).colorScheme` and `ThemeExtension`s. This will improve maintainability, enable easier theming (e.g., dark mode support in the future), and ensure UI consistency.

## User Review Required

> [!IMPORTANT]
> The refactor will map hard-coded colors to their closest semantic equivalent in the theme. Some subtle visual differences might occur if multiple slightly different hard-coded colors are mapped to the same theme property.

> [!WARNING]
> This is a wide-reaching change affecting almost every UI file. Automated replacement will be used where possible, but manual verification of key screens (Dashboard, Auth, Shop) is recommended.

## Proposed Changes

### 1. Core Theme Enhancement
Update `ThemeMain` to include a more comprehensive `ColorScheme` and new `ThemeExtension`s for semantic colors.

#### [MODIFY] [theme_main.dart](file:///E:/zino/chaharmahalShopFront/lib/core/themes/theme_main.dart)
- Expand `ColorScheme` to include `surfaceContainer`, `onSurfaceVariant`, `outlineVariant`, etc.
- Add `StatusColors` extension (Success, Warning, Info).
- Add `DashboardColors` extension for feature-specific palettes (e.g., Admin Indigo/Teal).

### 2. Base Class Updates
Refactor helper methods in base classes to use the updated theme.

#### [MODIFY] [base_stateless_widget.dart](file:///E:/zino/chaharmahalShopFront/lib/core/base/base_stateless_widget.dart)
- Replace hard-coded colors in `colorGreyText`, `colorGreyOutline`, etc., with `Theme.of(context).colorScheme` references.

#### [MODIFY] [base_widget_state.dart](file:///E:/zino/chaharmahalShopFront/lib/core/base/base_widget_state.dart)
- Same as above, ensuring `context` is used correctly.

### 3. Global Color Replacement
Iterate through the project and replace hard-coded patterns.

#### Mappings:
- `Color(0xFFF8F9FB)`, `Color(0xFFF8F9FA)` -> `colorScheme.surfaceContainer`
- `Color(0xffeeeeee)`, `Color(0xffE8E8E8)` -> `colorScheme.outlineVariant`
- `Color(0xff707070)`, `Color(0xff9E9E9E)` -> `colorScheme.onSurfaceVariant`
- `Colors.white` -> `colorScheme.surface` or `colorScheme.onPrimary` (context dependent)
- `Colors.black` -> `colorScheme.onSurface`
- `Colors.red` -> `colorScheme.error`
- `Colors.green` -> `StatusColors.of(context).success`
- `Colors.orange` -> `StatusColors.of(context).warning`
- `Colors.blue` -> `StatusColors.of(context).info`
- `Color(0xFF1A237E)` (Indigo) -> `DashboardColors.of(context).adminAccent`

## Verification Plan

### Manual Verification
- **Admin Dashboard**: Verify the indigo banner and stat cards look correct.
- **Shop/Product Pages**: Check that background greys and text variants are consistent.
- **Auth Flow**: Verify buttons and input fields adhere to the theme.
- **Popups/Sheets**: Ensure transparent backgrounds and overlays are preserved correctly.

### Automated Checks
- Run `flutter analyze` to ensure no errors were introduced (e.g., missing `context` where needed).
