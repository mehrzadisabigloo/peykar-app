# Update Repairman List with Ratings and Infinite Scrolling

This plan outlines the changes required to display `rating_average` and `ratings_count` for repairmen in the category detail screen and ensure infinite scrolling is fully functional.

## Proposed Changes

### Feature Home - Domain & Data Models
Updated the user entity and model to include missing fields from the API.

#### [user_entity.dart](file:///E:/zino/chaharmahalShopFront/lib/features/feature_home/domain/entity/user_entity.dart)
- Added `ratingAverage`, `ratingsCount`, `ostan`, and `shahrestan` fields.

#### [user_model.dart](file:///E:/zino/chaharmahalShopFront/lib/features/feature_home/data/model/user_model.dart)
- Added mapping for `rating_average`, `ratings_count`, `ostan`, and `shahrestan`.
- Added helper methods `_toDouble` and `_toInt` to handle various JSON types safely.

---

### Feature Appointments - Domain & Data Models
Updated the reservation models and entities to support Jalali dates.

#### [appointments_entity.dart](file:///E:/zino/chaharmahalShopFront/lib/features/feature_appointments/domain/entity/appointments_entity.dart)
- Added `jalaliDate` field.

#### [reservation_model.dart](file:///E:/zino/chaharmahalShopFront/lib/features/feature_appointments/data/model/reservation_model.dart)
- Added `jalali_date` to `ReservationTimeSlotModel`.
- Updated `toEntity` mapping to include `jalaliDate`.

---

### Feature Manage Services - Data Layer
Integrated the new `/services/list-active` API.

#### [manage_services_api_provider.dart](file:///E:/zino/chaharmahalShopFront/lib/features/feature_manage_services/data/data_source/remote/manage_services_api_provider.dart)
- Added `getActiveServices` method calling `/services/list-active`.

#### [manage_services_repository.dart](file:///E:/zino/chaharmahalShopFront/lib/features/feature_manage_services/domain/repository/manage_services_repository.dart)
- Added `fetchActiveServices` to the interface.

#### [manage_services_repository_impl.dart](file:///E:/zino/chaharmahalShopFront/lib/features/feature_manage_services/data/repository/manage_services_repository_impl.dart)
- Implemented `fetchActiveServices` to fetch all active services (not just repairman-specific).

### Feature Reminders - Integration (Updated)
Wired up the new active service list to the `Add Reminder` screen.

#### [reminders_bloc.dart](file:///E:/zino/chaharmahalShopFront/lib/features/feature_reminders/presentation/bloc/reminders_bloc.dart)
- Updated `_onFetchServicesForReminder` to use `fetchActiveServices` instead of `fetchManageServicesData`.

## Verification Plan

### Manual Verification
1. **List Display**: Open a category detail screen and verify that repairman cards show their ratings and cities (if available in API).
2. **Infinite Scrolling**: Scroll to the bottom of the list and ensure more items are loaded automatically.
3. **Filtering**: Change distance or rating filters and verify the list resets to page 1 and loads new results.
4. **Persian Digits**: Verify that ratings and counts are displayed using Persian digits as per `_toPersianDigit` helper.
