# Reminder Updates Sync and RTL OTP Input

This plan addresses:
1. Ensuring the reminder list updates immediately when a reminder is updated (completing logs, adding logs, editing).
2. Re-applying RTL (Right-to-Left) directionality for the OTP SMS code boxes.

## Proposed Changes

### Auth Feature

#### [auth_verify.dart](file:///E:/zino/chaharmahalShopFront/lib/features/feature_auth/presentation/screen/auth_verify.dart)

- Wrap the OTP boxes `Row` in a `Directionality` widget with `TextDirection.rtl`.

```dart
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(4, (index) => _otpBox(index)),
                      ),
                    ),
```

---

### Reminders Feature

#### [screen_reminder_details.dart](file:///E:/zino/chaharmahalShopFront/lib/features/feature_reminders/presentation/screen/screen_reminder_details.dart)

- Track if any update has occurred using a `_isUpdated` boolean.
- Update `listener` to set `_isUpdated = true` when `AddLogSuccess`, `CompleteReminderSuccess`, or `EditReminderEvent` (via result) happens.
- Add an `AppBar` with a leading back button that returns `_isUpdated`.

```dart
// Inside _ScreenReminderDetailsState
bool _isUpdated = false;

// In BlocConsumer listener
} else if (state is AddLogSuccess) {
  _isUpdated = true; // Mark as updated
  CstmSnackBar.showSuccess(context, 'لاگ جدید با موفقیت ثبت شد');
  bloc.add(GetReminderEvent(widget.reminderId));
} else if (state is CompleteReminderSuccess) {
  _isUpdated = true; // Mark as updated
  CstmSnackBar.showSuccess(context, 'یادآور با موفقیت بروزرسانی شد');
  bloc.add(GetReminderEvent(widget.reminderId));
}

// In the edit button logic
final result = await context.pushNamed(...);
if (result == true) {
  _isUpdated = true; // Mark as updated
  bloc.add(GetReminderEvent(widget.reminderId));
}

// Update Scaffold
return Scaffold(
  appBar: AppBar(
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios_new_rounded),
      onPressed: () => Navigator.pop(context, _isUpdated),
    ),
  ),
  // ...
);
```

#### [service_management_section.dart](file:///E:/zino/chaharmahalShopFront/lib/features/feature_reminders/presentation/widget/service_management_section.dart)

- Call `widget.onSuccess()` when `AddLogSuccess` occurs in the `BlocListener`.

```dart
        listener: (context, state) {
          if (state is AddLogSuccess) {
            setState(() => _isAddingLog = false);
            widget.onSuccess(); // Trigger the callback
          } else if (state is AddLogError) {
            setState(() => _isAddingLog = false);
          }
        },
```

---

## Verification Plan

### Automated Tests
- I will check if the project compiles after these changes.
- I will verify the logic flow for `_isUpdated` in `ScreenReminderDetails`.

### Manual Verification
1. **RTL OTP**: Navigate to the OTP page and verify digits fill from right to left.
2. **Reminder Update**:
    - Open the reminder list.
    - Click on a reminder to see details.
    - Add a new log or edit the reminder.
    - Go back to the reminder list.
    - Verify the reminder list has updated (the list screen already listens for `true` and calls `FetchRemindersEvent`).
