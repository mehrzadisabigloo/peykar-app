# Implementation Plan - Add Payment Methods and Discount Tabs for Repairman

Add two new tabs to the Repairman Dashboard and implement the Repairman Payment Methods management feature.

## User Review Required

> [!IMPORTANT]
> - The "کد تخفیف" (Discount Code) tab will be added to the UI but will not have any navigation or functionality as requested.
> - The "روش های پرداخت" (Payment Methods) feature will allow repairmen to manage their active payment types via the provided APIs.

## Proposed Changes

### Dashboard Integration
#### [MODIFY] [screen_dashboard.dart](file:///E:/zino/chaharmahalShopFront/lib/features/feature_dashboard/presentation/screen/screen_dashboard.dart)
- Add "روش های پرداخت" tab with navigation to the new screen.
- Add "کد تخفیف" tab (UI only).

### New Feature: Repairman Payment Type
#### [NEW] [repairman_payment_type_model.dart](file:///E:/zino/chaharmahalShopFront/lib/features/feature_repair_shop/data/model/repairman_payment_type_model.dart)
- Define data model for repairman payment types.
#### [NEW] [repairman_payment_type_api_provider.dart](file:///E:/zino/chaharmahalShopFront/lib/features/feature_repair_shop/data/data_source/remote/repairman_payment_type_api_provider.dart)
- Implement API calls: `/add`, `/remove/{id}`, `/my-list`.
#### [NEW] [repairman_payment_type_repository.dart](file:///E:/zino/chaharmahalShopFront/lib/features/feature_repair_shop/domain/repository/repairman_payment_type_repository.dart)
- Define repository interface.
#### [NEW] [repairman_payment_type_repository_impl.dart](file:///E:/zino/chaharmahalShopFront/lib/features/feature_repair_shop/data/repository/repairman_payment_type_repository_impl.dart)
- Implement repository.
#### [NEW] [repairman_payment_type_bloc.dart](file:///E:/zino/chaharmahalShopFront/lib/features/feature_repair_shop/presentation/bloc/repairman_payment_type_bloc.dart)
- Handle fetching, adding, and removing payment types.
#### [NEW] [screen_repairman_payment_type.dart](file:///E:/zino/chaharmahalShopFront/lib/features/feature_repair_shop/presentation/screen/screen_repairman_payment_type.dart)
- UI for managing payment types.

### Infrastructure
#### [MODIFY] [router.dart](file:///E:/zino/chaharmahalShopFront/lib/core/services/router.dart) & [repair_shop_router.dart](file:///E:/zino/chaharmahalShopFront/lib/features/feature_repair_shop/presentation/router/repair_shop_router.dart)
- Register the new route for `repairman_payment_type`.
#### [MODIFY] [locator.dart](file:///E:/zino/chaharmahalShopFront/lib/core/services/locator.dart)
- Register new API provider, repository, and BLoC.

## Verification Plan
### Manual Verification
- Verify that both new tabs appear on the Repairman Dashboard.
- Click "روش های پرداخت" and ensure it navigates to the payment management screen.
- Test fetching the list of payment methods.
- Test adding a new payment method.
- Test removing a payment method.
