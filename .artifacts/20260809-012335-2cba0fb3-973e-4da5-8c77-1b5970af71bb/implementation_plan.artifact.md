# Admin Reminder Management Features Implementation

This plan outlines the implementation of two new admin features: `ReminderTypes` and `ReminderSubItems`. These features allow administrators to manage categories and sub-items for reminders.

## User Review Required

- **UI Flow**: Sub-items will be managed from a separate screen accessible from the `ReminderType` card.
- **Bulk Addition**: The `ReminderSubItem` feature includes a "Bulk Add" API. I will implement a simple UI to support adding multiple sub-items at once.

## Proposed Changes

### Reminder Types Feature (Done)
- Domain, Data, and Presentation layers for `ManageReminderTypes`.
- Integration into `locator.dart`, `PanelAdminRouter`, and `AppDrawer`.

---

### Reminder Sub-Items Feature (New)

#### [manage_reminder_sub_item_entity.dart](file:///E:/zino/chaharmahalShopFront/lib/features/panel_admin_features/feature_manage_reminder_sub_items/domain/entity/manage_reminder_sub_item_entity.dart)
- Define `ManageReminderSubItemEntity` with fields: `id`, `title`, `status`, `reminderTypeId`, `createdAt`, `updatedAt`.

#### [manage_reminder_sub_items_repository.dart](file:///E:/zino/chaharmahalShopFront/lib/features/panel_admin_features/feature_manage_reminder_sub_items/domain/repository/manage_reminder_sub_items_repository.dart)
- Define interface for CRUD operations.

#### [manage_reminder_sub_item_model.dart](file:///E:/zino/chaharmahalShopFront/lib/features/panel_admin_features/feature_manage_reminder_sub_items/data/model/manage_reminder_sub_item_model.dart)
- Freezed model for sub-items.

#### [manage_reminder_sub_items_api_provider.dart](file:///E:/zino/chaharmahalShopFront/lib/features/panel_admin_features/feature_manage_reminder_sub_items/data/data_source/remote/manage_reminder_sub_items_api_provider.dart)
- API calls for all `reminder-sub-items` endpoints.

#### [manage_reminder_sub_items_bloc.dart](file:///E:/zino/chaharmahalShopFront/lib/features/panel_admin_features/feature_manage_reminder_sub_items/presentation/bloc/manage_reminder_sub_items_bloc.dart)
- BLoC for managing sub-items state.

#### [screen_manage_reminder_sub_items.dart](file:///E:/zino/chaharmahalShopFront/lib/features/panel_admin_features/feature_manage_reminder_sub_items/presentation/screen/screen_manage_reminder_sub_items.dart)
- Screen to list and manage sub-items of a specific `ReminderType`.

#### [screen_add_edit_reminder_sub_item.dart](file:///E:/zino/chaharmahalShopFront/lib/features/panel_admin_features/feature_manage_reminder_sub_items/presentation/screen/screen_add_edit_reminder_sub_item.dart)
- Form for adding/editing a sub-item.

#### [manage_reminder_sub_items_router.dart](file:///E:/zino/chaharmahalShopFront/lib/features/panel_admin_features/feature_manage_reminder_sub_items/presentation/router/manage_reminder_sub_items_router.dart)
- Routes for sub-items.

---

### Integration

#### [locator.dart](file:///E:/zino/chaharmahalShopFront/lib/core/services/locator.dart)
- Register new sub-item components.

#### [panel_admin_router.dart](file:///E:/zino/chaharmahalShopFront/lib/features/panel_admin_features/feature_panel_admin/presentation/router/panel_admin_router.dart)
- Add `ManageReminderSubItemsRouter` to routes.

## Verification Plan

### Automated Tests
- I will attempt to add unit tests for the BLoC if the project has a testing framework setup (I will research this).
- `flutter test` for running tests.

### Manual Verification
- Verify the list of reminder types loads correctly.
- Verify adding a new reminder type.
- Verify editing an existing reminder type.
- Verify deleting a reminder type (with confirmation).
- Verify changing the status (active/inactive).
- Verify the feature is only visible and accessible to admins via the drawer and routing.
