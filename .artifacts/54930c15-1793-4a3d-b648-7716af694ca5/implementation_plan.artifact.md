# Theme-Based Color Refactoring Plan

This plan outlines the steps to replace hard-coded colors with theme-based colors across the entire project. This will ensure consistency, better maintainability, and support for future theme changes (like Dark Mode).

## User Review Required

> [!IMPORTANT]
> The refactoring will replace direct usages of `Colors.white`, `Colors.black`, `Colors.grey`, and `Color(0xFF...)` literals with references to `Theme.of(context).colorScheme` or custom theme extensions (`StatusColors`, `DashboardColors`).

> [!WARNING]
> In some cases, `Colors.transparent` might be left as is if it represents the absence of color rather than a specific theme-able surface. I will only change it if it's used as a background where a themed surface might be expected.

## Proposed Changes

I will systematically go through the project and replace hard-coded colors with the following mappings:

| Hard-coded Color | Theme Equivalent |
| :--- | :--- |
| `Colors.white` (Backgrounds) | `theme.colorScheme.surface` |
| `Colors.black` (Text/Icons) | `theme.colorScheme.onSurface` |
| `greyText` / `Color(0xff9E9E9E)` | `theme.colorScheme.onSurfaceVariant` |
| `greyBorder` / `Color(0xffE8E8E8)` | `theme.colorScheme.outline` |
| `greyBackground` / `Color(0xffF8F8F8)` | `theme.colorScheme.surfaceContainerHighest` |
| `primaryColor` / `Color(0xff7358F5)` | `theme.colorScheme.primary` |
| `errorColor` / `Color(0xffFF3F3F)` | `theme.colorScheme.error` |
| `Colors.blue` (Reminder) | `ReminderColors.of(context).timeColor` |
| `Color(0xFFE65100)` (Kilometer) | `ReminderColors.of(context).kilometerColor` |

### Core Components
Refactor common widgets and base screens in `lib/core/`.
- [MODIFY] [app_bottom_sheet.dart](file:///E:/zino/chaharmahalShopFront/lib/core/widgets/app_bottom_sheet.dart)
- [MODIFY] [app_drawer.dart](file:///E:/zino/chaharmahalShopFront/lib/core/presentation/widget/app_drawer.dart)
- [MODIFY] [splash_screen.dart](file:///E:/zino/chaharmahalShopFront/lib/core/presentation/screen/splash_screen.dart)
- [MODIFY] [status_card.dart](file:///E:/zino/chaharmahalShopFront/lib/core/widgets/status_card.dart)

### Features
Refactor feature-specific screens and widgets.
- [MODIFY] `lib/features/feature_admin/`
- [MODIFY] `lib/features/feature_appointments/`
- [MODIFY] `lib/features/feature_auth/`
- [MODIFY] `lib/features/feature_client_services/`
- [MODIFY] `lib/features/feature_create_time_slot/`
- [MODIFY] `lib/features/feature_dashboard/`
- [MODIFY] `lib/features/feature_home/`

## Verification Plan

### Manual Verification
- I will inspect the UI using screenshots or by running the app (if possible) to ensure that the visual appearance remains unchanged.
- I will check the `theme_main.dart` consistency after replacements.
- I will ensure all files still compile after the `Theme.of(context)` additions.
