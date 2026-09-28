# Profile and Drawer Sync Walkthrough

I have implemented a synchronization mechanism to ensure that the `AppDrawer` updates immediately when a user modifies their profile.

## Changes Made

### Auth / Screen
- **[auth_verify.dart](file:///E:/zino/chaharmahalShopFront/lib/features/feature_auth/presentation/screen/auth_verify.dart)**:
    - Wrapped the OTP digit boxes in a `Directionality` widget with `TextDirection.rtl`.
    - This changes the visual order of the input boxes so that they are filled from right to left, providing a more natural experience for Persian-speaking users.
- **[sign_up.dart](file:///E:/zino/chaharmahalShopFront/lib/features/feature_auth/presentation/screen/sign_up.dart)**:
    - Updated `blocListener` to display a success SnackBar ("ثبت‌نام با موفقیت انجام شد") when a user or repairman successfully completes the registration process.
    - This ensures users receive immediate visual confirmation of their successful signup before being redirected to the home page.

### Core / Entities
- **[profile_entity.dart](file:///E:/zino/chaharmahalShopFront/lib/features/feature_profile/domain/entity/profile_entity.dart)**: Modified `ProfileEntity` to extend `Equatable`. This allows BLoC to correctly identify when profile data has changed, preventing unnecessary rebuilds while ensuring updates are detected.

### Home / BLoC
- **[main_home_page_bloc.dart](file:///E:/zino/chaharmahalShopFront/lib/features/feature_home/presentation/bloc/main_home_page_bloc.dart)**:
    - Added `UpdateProfile` event to the `MainHomePageBloc`.
    - Implemented a handler for this event that updates the profile information, role, and status in the global home state.

### Profile / Screen
- **[screen_profile.dart](file:///E:/zino/chaharmahalShopFront/lib/features/feature_profile/presentation/screen/screen_profile.dart)**:
    - Added a `BlocListener` for the `ProfileBloc`.
    - Whenever `ProfileLoaded` state is emitted (both on initial fetch and after an update), it now dispatches an `UpdateProfile` event to the `MainHomePageBloc`.

## Verification Results

### Automated Verification
- **Static Analysis**: Ran `analyze_file` on all modified files. No errors or warnings were found, ensuring syntax and type safety.

### Logical Verification
- **Data Flow**: The flow of data is now:
    1. User updates profile on `ScreenProfile`.
    2. `ProfileBloc` handles the API call and emits `ProfileUpdateSuccess`.
    3. `ScreenProfile` listener catches success and calls `FetchProfileDataEvent`.
    4. `ProfileBloc` fetches fresh data and emits `ProfileLoaded`.
    5. `ScreenProfile` listener catches `ProfileLoaded` and dispatches `UpdateProfile` to `MainHomePageBloc`.
    6. `MainHomePageBloc` updates its state.
    7. `AppDrawer` (listening to `MainHomePageBloc`) rebuilds with new data.

This ensures the UI remains consistent across the application.
