# Implementation Plan - Admin Panel Loading States

Improve the user experience in the Admin Panel by implementing proper loading states for inline actions (Edit, Delete, Status Change, Sorting) across multiple management screens.

## User Review Required

> [!IMPORTANT]
> The implementation involves refactoring BLoC states to include `processingId` and `isDeleting` flags. This allows the UI to show a loader only for the item being processed instead of showing a full-screen shimmer.

## Proposed Changes

### Feature: Manage Bank Accounts

Implement loading states for status toggle and deletion in the bank accounts list.

#### [MODIFY] [manage_bank_accounts_state.dart](file:///E:/zino/chaharmahalShopFront/lib/features/panel_admin_features/feature_manage_bank_accounts/presentation/bloc/manage_bank_accounts_state.dart)
- Add `BankAccountActionLoading` state with `processingId`, `isDeleting`, and `accounts` list.

#### [MODIFY] [manage_bank_accounts_bloc.dart](file:///E:/zino/chaharmahalShopFront/lib/features/panel_admin_features/feature_manage_bank_accounts/presentation/bloc/manage_bank_accounts_bloc.dart)
- Update `_onDeleteBankAccount` and `_onChangeStatus` to emit `BankAccountActionLoading` instead of `ManageBankAccountsLoading`.

#### [MODIFY] [screen_manage_bank_accounts.dart](file:///E:/zino/chaharmahalShopFront/lib/features/panel_admin_features/feature_manage_bank_accounts/presentation/screen/screen_manage_bank_accounts.dart)
- Handle `BankAccountActionLoading` in `BlocBuilder`.
- Show `CircularProgressIndicator` instead of `TextButton` or `IconButton` for the processing item.

---

### Feature: Manage Payment Types

Implement loading state for the status switch in the payment types list.

#### [MODIFY] [manage_payment_types_state.dart](file:///E:/zino/chaharmahalShopFront/lib/features/panel_admin_features/feature_manage_payment_types/presentation/bloc/manage_payment_types_state.dart)
- Add `PaymentTypeActionLoading` state with `processingId` and `paymentTypes` list.

#### [MODIFY] [manage_payment_types_bloc.dart](file:///E:/zino/chaharmahalShopFront/lib/features/panel_admin_features/feature_manage_payment_types/presentation/bloc/manage_payment_types_bloc.dart)
- Update `_onChangeStatus` to emit `PaymentTypeActionLoading` instead of `ManagePaymentTypesLoading`.

#### [MODIFY] [screen_manage_payment_types.dart](file:///E:/zino/chaharmahalShopFront/lib/features/panel_admin_features/feature_manage_payment_types/presentation/screen/screen_manage_payment_types.dart)
- Handle `PaymentTypeActionLoading` in `BlocBuilder`.
- Show `CircularProgressIndicator` instead of the `Switch` for the processing item.

---

### Feature: Manage Occupations

Implement loading states for status switch and sorting (Move Up/Down) buttons.

#### [MODIFY] [occupation_state.dart](file:///E:/zino/chaharmahalShopFront/lib/features/panel_admin_features/feature_occupation/presentation/bloc/occupation_state.dart)
- Add `OccupationActionLoading` state with `processingId` and `occupationList`.

#### [MODIFY] [occupation_bloc.dart](file:///E:/zino/chaharmahalShopFront/lib/features/panel_admin_features/feature_occupation/presentation/bloc/occupation_bloc.dart)
- Update `_onChangeStatus`, `_onMoveUp`, and `_onMoveDown` to emit `OccupationActionLoading`.

#### [MODIFY] [screen_manage_occupations.dart](file:///E:/zino/chaharmahalShopFront/lib/features/panel_admin_features/feature_occupation/presentation/screen/screen_manage_occupations.dart)
- Handle `OccupationActionLoading` in `BlocBuilder`.
- Show loaders for the processing item's switch and sorting buttons.

## Verification Plan

### Automated Tests
- N/A (Manual UI verification is primary for these changes)

### Manual Verification
1. Navigate to "مدیریت حساب‌های بانکی" and delete an account; verify a red loader appears on the delete button.
2. Toggle status of a bank account; verify a loader appears instead of the status text.
3. Navigate to "مدیریت روش‌های پرداخت" and toggle a switch; verify a loader appears instead of the switch.
4. Navigate to "مدیریت مشاغل" and toggle status or change order; verify loaders appear for the specific occupation.
