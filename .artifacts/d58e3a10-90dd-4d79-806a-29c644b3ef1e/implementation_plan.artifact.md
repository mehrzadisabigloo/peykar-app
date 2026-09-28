# Fix Submit Action in Reminder Types and Sub-Items

The submit button in "Add/Edit Reminder Type" and "Add/Edit Reminder Sub-Item" screens is not working because the corresponding Bloc events (`AddReminderTypeEvent`, `EditReminderTypeEvent`, `AddSubItemEvent`, etc.) return early if the Bloc state is not `Loaded`. Since these screens use new Bloc instances (registered as factories in the locator), they start in the `Initial` state, causing the events to be ignored.

## Proposed Changes

### Reminder Types Feature

#### [MODIFY] [manage_reminder_types_bloc.dart](file:///E:/zino/chaharmahalShopFront/lib/features/panel_admin_features/feature_manage_reminder_types/presentation/bloc/manage_reminder_types_bloc.dart)
- Remove the `if (state is! ManageReminderTypesLoaded) return;` check from `_onAddReminderType` and `_onEditReminderType`.
- Ensure the state transitions to `ManageReminderTypesLoaded` (or a state that supports the submission flags) during the process.

### Reminder Sub-Items Feature

#### [MODIFY] [manage_reminder_sub_items_bloc.dart](file:///E:/zino/chaharmahalShopFront/lib/features/panel_admin_features/feature_manage_reminder_sub_items/presentation/bloc/manage_reminder_sub_items_bloc.dart)
- Remove the `if (state is! ManageReminderSubItemsLoaded) return;` check from `_onAddSubItem`, `_onAddSubItemsBulk`, and `_onEditSubItem`.
- Ensure the state transitions correctly to handle submission status.

## Verification Plan

### Manual Verification
- Navigate to the Admin Panel -> Manage Reminder Types.
- Try to add a new reminder type. The submit button should now trigger the API call and show a success message/pop the screen.
- Try to edit an existing reminder type.
- Navigate to a reminder type's sub-items.
- Try to add a new sub-item (single and bulk).
- Try to edit an existing sub-item.
