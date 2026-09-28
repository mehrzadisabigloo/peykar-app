# Implement Banner Management Feature

This plan outlines the implementation of a new feature for managing banners in the `panel_admin_features` section. Banners can be displayed in three main areas: `shop`, `service_provider`, and `customer`. Each banner contains a mapping of destination keys to image IDs.

## User Review Required

> [!IMPORTANT]
> The `images` field in the API is a dynamic mapping (e.g., `{"home": "uuid", "shop": "uuid"}`). I will implement this as a `Map<String, String>` in the entity and model.

## Proposed Changes

### 1. Domain Layer

#### [NEW] [banner_entity.dart](file:///E:/zino/chaharmahalShopFront/lib/features/panel_admin_features/feature_banner/domain/entity/banner_entity.dart)
Define the `BannerEntity` and `BannerFilterParams`.

#### [NEW] [banner_repository.dart](file:///E:/zino/chaharmahalShopFront/lib/features/panel_admin_features/feature_banner/domain/repository/banner_repository.dart)
Define the repository interface for banner operations.

### 2. Data Layer

#### [NEW] [banner_model.dart](file:///E:/zino/chaharmahalShopFront/lib/features/panel_admin_features/feature_banner/data/model/banner_model.dart)
Implement the data model with Freezed for serialization and mapping to the entity.

#### [NEW] [banner_api_provider.dart](file:///E:/zino/chaharmahalShopFront/lib/features/panel_admin_features/feature_banner/data/data_source/remote/banner_api_provider.dart)
Implement API calls for all endpoints specified.

#### [NEW] [banner_repository_impl.dart](file:///E:/zino/chaharmahalShopFront/lib/features/panel_admin_features/feature_banner/data/repository/banner_repository_impl.dart)
Implement the repository interface.

### 3. Presentation Layer

#### [NEW] [banner_bloc.dart](file:///E:/zino/chaharmahalShopFront/lib/features/panel_admin_features/feature_banner/presentation/bloc/banner_bloc.dart)
Implement Bloc, Events, and States for managing banners.

#### [NEW] [screen_manage_banners.dart](file:///E:/zino/chaharmahalShopFront/lib/features/panel_admin_features/feature_banner/presentation/screen/screen_manage_banners.dart)
A screen to list, add, edit, and delete banners.

#### [NEW] [banner_card.dart](file:///E:/zino/chaharmahalShopFront/lib/features/panel_admin_features/feature_banner/presentation/widget/banner_card.dart)
A card widget to display banner information in the list.

#### [NEW] [add_banner_bottom_sheet.dart](file:///E:/zino/chaharmahalShopFront/lib/features/panel_admin_features/feature_banner/presentation/widget/add_banner_bottom_sheet.dart)
A bottom sheet for creating or editing banners.

### 4. Integration

#### [MODIFY] [locator.dart](file:///E:/zino/chaharmahalShopFront/lib/core/services/locator.dart)
Register the new API provider, repository, and Bloc.

## Verification Plan

### Automated Tests
- I'll rely on the existing infrastructure for Bloc and repository patterns.
- Ensure all API endpoints are correctly called in the provider.

### Manual Verification
- Navigate to the "Manage Banners" screen.
- Verify listing active and all banners.
- Test creating a new banner with multiple image mappings.
- Test editing an existing banner.
- Test changing status and deleting a banner.
