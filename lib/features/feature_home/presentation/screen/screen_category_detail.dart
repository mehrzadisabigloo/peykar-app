import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:latlong2/latlong.dart';
import '../../../../core/presentation/screen/map_picker_screen.dart';
import '../../../../core/resources/consts.dart';
import '../../../../core/services/location_service.dart';
import '../../../../core/bloc/app/app_bloc.dart';
import '../../../../core/bloc/error/error_bloc.dart';
import '../../../../core/services/locator.dart';
import 'package:chaharmahal_shop_front/core/widgets/cstm_snakbar.dart';
import '../../../../core/themes/theme_main.dart';
import '../../../../core/widgets/empty_state_widget.dart';
import '../../../../core/widgets/error_state_widget.dart';
import '../../../../core/widgets/widget_infinite_list.dart';
import '../../domain/entity/user_entity.dart';
import '../../domain/entity/users_filter_params.dart';
import '../base/base_home_stateful_widget_state.dart';
import '../bloc/users_bloc.dart';
import '../widget/repairman_list_shimmer.dart';

class ScreenCategoryDetail extends StatefulWidget {
  final String categoryTitle;
  final String? occupationId;

  const ScreenCategoryDetail({super.key, required this.categoryTitle, this.occupationId});

  @override
  State<ScreenCategoryDetail> createState() => _ScreenCategoryDetailState();
}

class _ScreenCategoryDetailState extends BaseHomeStatefulWidgetState<ScreenCategoryDetail, UsersBloc> {
  _ScreenCategoryDetailState() : super(locator<UsersBloc>());

  bool _isLocationGranted = false;
  int _selectedDistanceIndex = 2; // Default to 5km
  final List<String> _distances = [ '۵ کیلومتر', '۲ کیلومتر', '۱ کیلومتر'];

  String _selectedRate = 'all';
  bool _isAutoLocationTriggered = false;


  void _fetchUsers() {
    double? distanceKm;
    if (_selectedDistanceIndex == 0) distanceKm = 5;
    if (_selectedDistanceIndex == 1) distanceKm = 2;
    if (_selectedDistanceIndex == 2) distanceKm = 1;

    bloc.add(FetchUsers(UsersFilterParams(
      role: 'repairman',
      isPaginate: true,
      countItem: 10,
      distanceKm: distanceKm,
      sortByRating: _selectedRate == '4' ? true : null,
      occupationId: widget.occupationId,
    )));
  }

  Future<void> _handleLocationPermission() async {
    setState(() => _isAutoLocationTriggered = true);
    bloc.add(StartLocationPermissionRequest());
    try {
      final position = await locator<LocationService>().getCurrentLocation();
      bloc.add(StoreUserLocation(
        latitude: position.latitude,
        longitude: position.longitude,
      ));
    } catch (e) {
      final errorMessage = e.toString().replaceAll('Exception: ', '');
      if (mounted) {
        CstmSnackBar.showError(context, errorMessage);
      }
      bloc.add(LocationPermissionDenied(errorMessage));
      debugPrint('Error handling location: $e');
    }
  }

  Future<void> _pickLocationManually() async {
    final result = await Navigator.of(context, rootNavigator: true).push<LatLng>(
      MaterialPageRoute(builder: (context) => const MapPickerScreen()),
    );

    if (result != null) {
      setState(() => _isAutoLocationTriggered = false);
      bloc.add(StoreUserLocation(
        latitude: result.latitude,
        longitude: result.longitude,
      ));
    }
  }

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
    final theme = Theme.of(context);
    return BlocListener<UsersBloc, UsersState>(
      listener: (context, state) {
        if (state is UsersLoaded && state.errorMessage != null && state.users.isNotEmpty) {
          CstmSnackBar.showError(context, state.errorMessage!);
        }
        if (state is LocationStoredSuccess) {
          setState(() {
            _isLocationGranted = true;
          });
          _fetchUsers();
        }
        if (state is LocationStoreFailed) {
          CstmSnackBar.showError(context, state.message);
        }
      },
      child: Container(
        color: _isLocationGranted ? theme.colorScheme.surfaceContainerLow : theme.colorScheme.surface,
        child: _isLocationGranted ? _buildShopListBody(theme) : _buildPermissionBody(theme),
      ),
    );
  }

  // --- Permission View Widgets ---

  Widget _buildPermissionBody(ThemeData theme) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 60.h),
          Container(
            height: 200.h,
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withValues(alpha: 0.05),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(
                    Icons.public_rounded,
                    size: 120.sp,
                    color: theme.colorScheme.primary.withValues(alpha: 0.1),
                  ),
                  Icon(
                    Icons.location_on_rounded,
                    size: 40.sp,
                    color: theme.colorScheme.error,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 40.h),
          Text(
            'دسترسی به موقعیت مکانی',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurface,
              fontFamily: 'BonyadeKoodak',
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            'با اشتراک‌گذاری موقعیت مکانی، نزدیک‌ترین ${widget.categoryTitle} به شما نمایش داده خواهند شد.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.sp,
              color: theme.colorScheme.onSurfaceVariant,
              height: 1.5,
              fontFamily: 'BonyadeKoodak',
            ),
          ),
          // SizedBox(height: 12.h),
          // Text(
          //   'با اشتراک‌گذاری موقعیت مکانی، نزدیک‌ترین ${widget.categoryTitle} به شما نمایش داده خواهند شد.',
          //   textAlign: TextAlign.center,
          //   style: TextStyle(
          //     fontSize: 13.sp,
          //     color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
          //     fontWeight: FontWeight.w500,
          //     fontFamily: 'BonyadeKoodak',
          //   ),
          // ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            height: 54.h,
            child: BlocBuilder<UsersBloc, UsersState>(
              builder: (context, state) {
                final isLoading = (state is LocationStoring || state is LocationPermissionProcessing) && _isAutoLocationTriggered;
                return ElevatedButton(
                  onPressed: isLoading ? null : _handleLocationPermission,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    elevation: 0,
                  ),
                  child: isLoading
                      ? SizedBox(
                          height: 24.sp,
                          width: 24.sp,
                          child: CircularProgressIndicator(
                            color: theme.colorScheme.surface,
                            strokeWidth: 2,
                          ),
                        )
                      : Text(
                          'موقعیت خودکار',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.surface,
                            fontFamily: 'BonyadeKoodak',
                          ),
                        ),
                );
              },
            ),
          ),
          SizedBox(height: 12.h),
          SizedBox(
            width: double.infinity,
            height: 54.h,
            child: BlocBuilder<UsersBloc, UsersState>(
              builder: (context, state) {
                final isLoading = (state is LocationStoring || state is LocationPermissionProcessing) && !_isAutoLocationTriggered;
                return OutlinedButton(
                  onPressed: isLoading ? null : _pickLocationManually,
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: theme.colorScheme.primary, width: 1.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                  child: isLoading
                      ? SizedBox(
                          height: 24.sp,
                          width: 24.sp,
                          child: CircularProgressIndicator(
                            color: theme.colorScheme.primary,
                            strokeWidth: 2,
                          ),
                        )
                      : Text(
                          'انتخاب دستی از نقشه',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.primary,
                            fontFamily: 'BonyadeKoodak',
                          ),
                        ),
                );
              },
            ),
          ),
          SizedBox(height: 16.h),
          TextButton(
            onPressed: () => context.pop(),
            child: Text(
              'بعداً انجام می‌دهم',
              style: TextStyle(
                fontSize: 14.sp,
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.w600,
                fontFamily: 'BonyadeKoodak',
              ),
            ),
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }

  // --- Shop List View Widgets ---

  Widget _buildShopListBody(ThemeData theme) {
    return Column(
      children: [
        _buildFilterBar(theme),
        Expanded(
          child: _buildShopList(),
        ),
      ],
    );
  }

  Widget _buildFilterBar(ThemeData theme) {
    return Container(
      padding: EdgeInsets.only(top: 20.h, bottom: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row 1: Label and Clear button
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'نزدیک‌ترین',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w900,
                        color: theme.colorScheme.onSurface,
                        fontFamily: 'BonyadeKoodak',
                      ),
                    ),
                    Text(
                      ' ${widget.categoryTitle}‌ها',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                        fontFamily: 'BonyadeKoodak',
                      ),
                    ),
                  ],
                ),
                if (_selectedDistanceIndex != 2 || _selectedRate == '4')
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedDistanceIndex = 2;
                        _selectedRate = 'all';
                      });
                      _fetchUsers();
                    },
                    child: Text(
                      'حذف فیلترها',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'BonyadeKoodak',
                      ),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          // Row 2: Filter Chips
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                // Fixed Distance Label (Moved to the end/left)
                Text(
                  'تا',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                    fontFamily: 'BonyadeKoodak',
                  ),
                ),
                SizedBox(width: 8.w),
                // Fixed Vertical Divider
                Container(
                  height: 20.h,
                  width: 1.w,
                  color: theme.colorScheme.outlineVariant,
                ),
                SizedBox(width: 8.w),
                // Scrollable Distance Content
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    reverse: true,
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                      children: [
                        ...List.generate(_distances.length, (index) {
                          final isSelected = _selectedDistanceIndex == index;
                          return GestureDetector(
                            onTap: () {
                              setState(() => _selectedDistanceIndex = index);
                              _fetchUsers();
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 250),
                              margin: EdgeInsets.symmetric(horizontal: 4.w),
                              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                              decoration: BoxDecoration(
                                color: isSelected ? theme.colorScheme.primary : theme.colorScheme.surface,
                                borderRadius: BorderRadius.circular(30.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: isSelected ? theme.colorScheme.primary.withValues(alpha: 0.25) : theme.colorScheme.onSurface.withValues(alpha: 0.03),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Text(
                                _distances[index],
                                style: TextStyle(
                                  color: isSelected ? theme.colorScheme.surface : theme.colorScheme.onSurface,
                                  fontSize: 12.sp,
                                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                                  fontFamily: 'BonyadeKoodak',
                                ),
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                // Fixed Vertical Divider
                Container(
                  height: 20.h,
                  width: 1.w,
                  color: theme.colorScheme.outlineVariant,
                ),
                SizedBox(width: 8.w),
                // Fixed Rating Toggle Chip (Moved to the end/right)
                GestureDetector(
                  onTap: () {
                    setState(() => _selectedRate = _selectedRate == '4' ? 'all' : '4');
                    _fetchUsers();
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      color: _selectedRate == '4' ? StatusColors.of(context).warning : theme.colorScheme.surface,
                      borderRadius: BorderRadius.circular(30.r),
                      boxShadow: [
                        BoxShadow(
                          color: _selectedRate == '4' ? StatusColors.of(context).warning.withValues(alpha: 0.3) : theme.colorScheme.onSurface.withValues(alpha: 0.03),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          _selectedRate == '4' ? Icons.star_rounded : Icons.star_border_rounded,
                          size: 16.sp,
                          color: _selectedRate == '4' ? theme.colorScheme.surface : StatusColors.of(context).warning,
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          'برترین‌ها',
                          style: TextStyle(
                            color: _selectedRate == '4' ? theme.colorScheme.surface : theme.colorScheme.onSurface,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'BonyadeKoodak',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildShopList() {
    return BlocBuilder<UsersBloc, UsersState>(
      builder: (context, state) {
        List<UserEntity> items = [];
        bool hasReachedBottom = false;
        bool hasError = false;
        String? errorMessage;

        if (state is UsersInitial) {
          return const SizedBox.shrink();
        }

        if (state is UsersLoading && state.filters.page == 1) {
          return const RepairmanListShimmer();
        }

        if (state is UsersFailed) {
          if (state.filters.page == 1) {
            return ErrorStateWidget(
              message: state.message,
              onRetry: () => _fetchUsers(),
            );
          } else {
            // This case should be handled by UsersLoaded with errorMessage in Bloc
            hasError = true;
            errorMessage = state.message;
          }
        }

        if (state is UsersLoaded) {
          items = state.users;
          hasReachedBottom = !state.hasMore;
          if (items.isEmpty && state.errorMessage != null) {
            hasError = true;
            errorMessage = state.errorMessage;
          }
        } else if (state is UsersLoadingMore) {
          items = state.users;
          hasReachedBottom = !state.hasMore;
        }

        if (items.isEmpty && !hasError && state is! UsersLoading) {
           return const EmptyStateWidget(
            title: 'موردی یافت نشد',
            description: 'در حال حاضر تعمیرکاری در این دسته یافت نشد.',
            icon: Icons.person_search_rounded,
          );
        }

        return WidgetInfiniteList(
          builder: (context, item) => _buildShopCard(item as UserEntity),
          items: items,
          bloc: bloc.listBloc,
          itemEquality: (first, second) => (first as UserEntity).id == (second as UserEntity).id,
          hasReachedTop: true,
          hasReachedBottom: hasReachedBottom,
          isLoading: false,
          loadingWidget: const RepairmanListShimmer(),
          errorWidget: ErrorStateWidget(
            message: errorMessage ?? "",
            onRetry: () => bloc.add(const LoadMoreUsers()),
          ),
          hasErrorOccurred: hasError,
          loadBottomData: () => bloc.add(const LoadMoreUsers()),
          padding: EdgeInsets.symmetric(horizontal: 20.w),
        );
      },
    );
  }

  Widget _buildShopCard(UserEntity user) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () => context.pushNamed(
        'repair_shop',
        pathParameters: {'repairman_id': user.id ?? ''},
        queryParameters: {'shop_name': user.displayName},
      ),
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(24.r),
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.03),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            // Image Placeholder
            Container(
              width: 105.r,
              height: 105.r,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withValues(alpha: 0.04),
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: (user.profileImageId != null && user.profileImageId!.isNotEmpty)
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(24.r),
                      child: CachedNetworkImage(
                        imageUrl: '${Consts.baseFileUrl}${user.profileImageId}',
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Center(
                          child: SizedBox(
                            width: 24.r,
                            height: 24.r,
                            child: const CircularProgressIndicator(strokeWidth: 2),
                          ),
                        ),
                        errorWidget: (context, url, error) => Icon(
                          Icons.store_rounded,
                          color: theme.colorScheme.primary.withValues(alpha: 0.4),
                          size: 48.sp,
                        ),
                      ),
                    )
                  : Icon(Icons.store_rounded, color: theme.colorScheme.primary.withValues(alpha: 0.4), size: 48.sp),
            ),
            SizedBox(width: 16.w),
            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    user.displayName,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w800,
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.87),
                      fontFamily: 'BonyadeKoodak',
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8.h),
                  // Rating Section
                  Row(
                    children: [
                      Icon(Icons.star_rounded, color: StatusColors.of(context).warning, size: 18.sp),
                      SizedBox(width: 4.w),
                      Text(
                        _toPersianDigit((user.ratingAverage ?? 0.0).toStringAsFixed(1)),
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w900,
                          color: theme.colorScheme.onSurface.withValues(alpha: 0.87),
                          fontFamily: 'BonyadeKoodak',
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        '/',
                        style: TextStyle(color: theme.colorScheme.outlineVariant, fontSize: 12.sp),
                      ),
                      SizedBox(width: 4.w),
                      Icon(Icons.person_rounded, color: theme.colorScheme.outlineVariant, size: 14.sp),
                      SizedBox(width: 4.w),
                      Text(
                        _toPersianDigit((user.ratingsCount ?? 0).toString()),
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: theme.colorScheme.onSurface.withValues(alpha: 0.4),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'BonyadeKoodak',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  // Address Section
                  Row(
                    children: [
                      Icon(Icons.location_on_rounded, size: 12.sp, color: theme.colorScheme.onSurface.withValues(alpha: 0.4)),
                      SizedBox(width: 4.w),
                      Expanded(
                        child: Text(
                          (user.address != null && user.address!.isNotEmpty)
                              ? user.address!
                              : 'آدرس ثبت نشده است',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                            fontWeight: FontWeight.w500,
                            fontFamily: 'BonyadeKoodak',
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (user.mobile != null) ...[
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.surfaceContainer,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.phone_android_rounded, size: 12.sp, color: theme.colorScheme.onSurface.withValues(alpha: 0.4)),
                              SizedBox(width: 4.w),
                              Text(
                                _toPersianDigit(user.mobile!),
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'BonyadeKoodak',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _toPersianDigit(String input) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const persian = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];
    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(english[i], persian[i]);
    }
    return input;
  }
}
