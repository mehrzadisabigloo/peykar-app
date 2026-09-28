# Implement User Reservations API

Integrate the `/reservations/user/list` API for "My Reservations" in user mode. Pagination will be handled within the BLoC and UI without external packages if needed, or by simply fetching the required data.

## Proposed Changes

### feature_appointments

#### [appointments_api_provider.dart](file:///E:/zino/chaharmahalShopFront/lib/features/feature_appointments/data/data_source/remote/appointments_api_provider.dart)
- Add `getUserReservations` method to fetch user reservations with status, date range, and pagination parameters.

#### [appointments_repository.dart](file:///E:/zino/chaharmahalShopFront/lib/features/feature_appointments/domain/repository/appointments_repository.dart)
- Add `fetchUserAppointments` method definition.

#### [appointments_repository_impl.dart](file:///E:/zino/chaharmahalShopFront/lib/features/feature_appointments/data/repository/appointments_repository_impl.dart)
- Implement `fetchUserAppointments`.

#### [appointments_bloc.dart](file:///E:/zino/chaharmahalShopFront/lib/features/feature_appointments/presentation/bloc/appointments_bloc.dart)
- Update fetching logic to detect if the user is a customer and call `fetchUserAppointments`.
- Support filtering by status and date range as provided by the new API.

#### [screen_appointments.dart](file:///E:/zino/chaharmahalShopFront/lib/features/feature_appointments/presentation/screen/screen_appointments.dart)
- Ensure the UI correctly displays user reservations fetched from the new API.

## Verification Plan

### Manual Verification
- Navigate to "My Reservations" in user mode.
- Verify that reservations are fetched from the new `/reservations/user/list` endpoint.
- Verify that filtering (by date) still works correctly.
- Ensure repairman mode still functions as expected.
