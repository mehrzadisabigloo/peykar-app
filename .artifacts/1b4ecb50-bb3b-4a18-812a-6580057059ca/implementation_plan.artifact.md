# Implementation Plan - Manage Shop Settings

Add a new page in the Admin Panel to manage shop settings, specifically toggling the status of "Admin Shop" and "Repairers Shop".

## Proposed Changes

### Data Layer

#### [NEW] [shop_setting_model.dart](file:///E:/zino/chaharmahalShopFront/lib/features/panel_admin_features/feature_manage_shop_settings/data/model/shop_setting_model.dart)
- Define `ShopSetting` model to match the API response: `key`, `label`, `status`, `is_active`.
- Add `fromJson` and `toJson` methods.

#### [NEW] [manage_shop_settings_api_provider.dart](file:///E:/zino/chaharmahalShopFront/lib/features/panel_admin_features/feature_manage_shop_settings/data/data_source/remote/manage_shop_settings_api_provider.dart)
- Implement `getShopSettings()` using `GET /shop-settings`.
- Implement `changeStatus(String key)` using `PATCH /shop-settings/change-status/{key}`.

#### [NEW] [manage_shop_settings_repository.dart](file:///E:/zino/chaharmahalShopFront/lib/features/panel_admin_features/feature_manage_shop_settings/domain/repository/manage_shop_settings_repository.dart)
- Define interface for fetching and changing shop settings status.

#### [NEW] [manage_shop_settings_repository_impl.dart](file:///E:/zino/chaharmahalShopFront/lib/features/panel_admin_features/feature_manage_shop_settings/data/repository/manage_shop_settings_repository_impl.dart)
- Implement the repository interface using the `ApiProvider`.

---

### Presentation Layer

#### [NEW] [manage_shop_settings_bloc.dart](file:///E:/zino/chaharmahalShopFront/lib/features/panel_admin_features/feature_manage_shop_settings/presentation/bloc/manage_shop_settings_bloc.dart)
- Implement `ManageShopSettingsBloc` with events: `FetchShopSettings`, `ChangeShopStatus`.
- Implement states: `Loading`, `Success`, `Error`.

#### [NEW] [manage_shop_settings_router.dart](file:///E:/zino/chaharmahalShopFront/lib/features/panel_admin_features/feature_manage_shop_settings/presentation/router/manage_shop_settings_router.dart)
- Define the route for the shop settings page.

#### [NEW] [screen_manage_shop_settings.dart](file:///E:/zino/chaharmahalShopFront/lib/features/panel_admin_features/feature_manage_shop_settings/presentation/screen/screen_manage_shop_settings.dart)
- Create a screen with a list of shop settings, each with a toggle switch.

---

### Wiring & Integration

#### [MODIFY] [locator.dart](file:///E:/zino/chaharmahalShopFront/lib/core/services/locator.dart)
- Register `ManageShopSettingsApiProvider`, `ManageShopSettingsRepository`, and `ManageShopSettingsBloc`.

#### [MODIFY] [panel_admin_router.dart](file:///E:/zino/chaharmahalShopFront/lib/features/panel_admin_features/feature_panel_admin/presentation/router/panel_admin_router.dart)
- Add `ManageShopSettingsRouter` to the admin panel routes.

#### [MODIFY] [screen_panel_admin.dart](file:///E:/zino/chaharmahalShopFront/lib/features/panel_admin_features/feature_panel_admin/presentation/screen/screen_panel_admin.dart)
- Add a new card for "Shop Settings" in the admin dashboard.

## Verification Plan

### Manual Verification
1. Open the Admin Panel.
2. Click on the new "Shop Settings" card.
3. Verify that the current status of "Admin Shop" and "Repairers Shop" is loaded correctly.
4. Toggle a setting and verify that the API is called and the status is updated.
5. Refresh the page to ensure the state persists (if the backend works).
