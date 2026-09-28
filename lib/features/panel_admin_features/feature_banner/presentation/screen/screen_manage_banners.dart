import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/bloc/app/app_bloc.dart';
import '../../../../../../core/bloc/error/error_bloc.dart';
import '../../../../../../core/services/locator.dart';
import '../../../../../../core/widgets/cstm_snakbar.dart';
import '../../../../../../core/widgets/empty_state_widget.dart';
import '../../../../../../core/widgets/error_state_widget.dart';
import '../../../../../../core/widgets/list_shimmer.dart';
import '../../../../../../core/widgets/management_card_shimmer.dart';
import '../../../../../../core/widgets/stylish_popup.dart';
import '../../../../../../core/widgets/widget_infinite_list.dart';
import '../base/base_banner_stateful_widget_state.dart';
import '../bloc/banner_bloc.dart';
import '../bloc/banner_event.dart';
import '../bloc/banner_state.dart';
import '../widget/banner_card.dart';
import 'package:resturant_app/features/panel_admin_features/feature_banner/domain/entity/banner_entity.dart';

class ScreenManageBanners extends StatefulWidget {
  const ScreenManageBanners({super.key});

  @override
  State<ScreenManageBanners> createState() => _ScreenManageBannersState();
}

class _ScreenManageBannersState extends BaseBannerStatefulWidgetState<ScreenManageBanners, BannerBloc> {
  _ScreenManageBannersState() : super(locator<BannerBloc>());

  String? _selectedPlace;

  @override
  void initState() {
    super.initState();
    bloc.add(const FetchBannersEvent(isRefresh: true));
  }

  void _onPlaceFilterChanged(String? place) {
    setState(() => _selectedPlace = place);
    bloc.add(FetchBannersEvent(isRefresh: true, place: _selectedPlace));
  }

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surfaceContainer,
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final result = await context.pushNamed('add_banner');
          if (result == true) {
            bloc.add(const FetchBannersEvent(isRefresh: true, place: null));
            setState(() => _selectedPlace = null);
          }
        },
        backgroundColor: colorScheme.primary,
        icon: Icon(Icons.add_rounded, color: colorScheme.surface),
        label: Text(
          'افزودن بنر جدید',
          style: TextStyle(
            color: colorScheme.surface,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            fontFamily: 'BonyadeKoodak',
          ),
        ),
      ),
      body: Column(
        children: [
          _buildFilterBar(colorScheme),
          Expanded(
            child: BlocConsumer<BannerBloc, BannerState>(
              listener: (context, state) {
                if (state.successMessage != null) {
                  CstmSnackBar.showSuccess(context, state.successMessage!);
                }
                if (state.errorMessage != null) {
                  CstmSnackBar.showError(context, state.errorMessage!);
                }
              },
              builder: (context, state) {
                if (state is BannerInitial || (state is BannerLoading && state.page == 1)) {
                  return ListView.builder(
                    padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 100.h),
                    itemCount: 5,
                    itemBuilder: (context, index) => const ManagementCardShimmer(height: 150),
                  );
                }

                if (state is BannerFailed) {
                  return ErrorStateWidget(
                    message: state.message,
                    onRetry: () => bloc.add(const FetchBannersEvent(isRefresh: true)),
                  );
                }

                final banners = state.banners;
                final hasMore = state.hasMore;

                if (banners.isEmpty) {
                  return const EmptyStateWidget(
                    title: 'هیچ بنری ثبت نشده است',
                    description: 'لیست بنرها در حال حاضر خالی است.',
                    icon: Icons.photo_library_outlined,
                  );
                }

                return WidgetInfiniteList(
                  bloc: bloc.listBloc,
                  items: banners,
                  hasReachedTop: true,
                  hasReachedBottom: !hasMore,
                  isLoading: state is BannerLoading,
                  hasErrorOccurred: false,
                  padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 100.h),
                  errorWidget: const SizedBox.shrink(),
                  loadingWidget: ListShimmer(height: 150, count: 1),
                  loadBottomData: () {
                    bloc.add(LoadMoreBannersEvent(place: _selectedPlace));
                  },
                  itemEquality: (f, s) {
                    if (f is BannerEntity && s is BannerEntity) {
                      return f.id == s.id;
                    }
                    return f == s;
                  },
                  builder: (context, item) {
                    final banner = item as BannerEntity;
                    final isProcessing = state.processingId == banner.id;
                    final isDeleting = isProcessing && state.isDeleting;
                    final isChangingStatus = isProcessing && !state.isDeleting;

                    return BannerCard(
                      banner: banner,
                      isDeleting: isDeleting,
                      isChangingStatus: isChangingStatus,
                      onEdit: () async {
                        final result = await context.pushNamed('edit_banner', extra: banner);
                        if (result == true) {
                          bloc.add(FetchBannersEvent(isRefresh: true, place: _selectedPlace));
                        }
                      },
                      onDelete: () => _showDeleteConfirmation(banner),
                      onStatusChange: (value) => bloc.add(ChangeBannerStatusEvent(banner.id!)),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterBar(ColorScheme colorScheme) {
    final List<Map<String, String>> places = [
      {'value': 'all', 'label': 'همه'},
      {'value': 'shop', 'label': 'فروشگاه'},
      {'value': 'service_provider', 'label': 'خدمات دهنده'},
      {'value': 'customer', 'label': 'مشتری'},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      reverse: true,
      padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 8.h),
      child: Row(
        children: places.map((place) {
          final bool isSelected = (_selectedPlace ?? 'all') == place['value'];
          final String? placeValue = place['value'] == 'all' ? null : place['value'];

          return GestureDetector(
            onTap: () => _onPlaceFilterChanged(placeValue),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: isSelected ? colorScheme.primary : colorScheme.surfaceContainer,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: isSelected ? [
                  BoxShadow(
                    color: colorScheme.primary.withValues(alpha: 0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  )
                ] : null,
              ),
              child: Text(
                place['label']!,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                  color: isSelected ? colorScheme.surface : colorScheme.onSurface.withValues(alpha: 0.54),
                  fontFamily: 'BonyadeKoodak',
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  void _showDeleteConfirmation(BannerEntity banner) {
    ConfirmationPopup.show(
      context,
      title: 'حذف بنر',
      description: 'آیا از حذف این بنر اطمینان دارید؟',
      confirmText: 'حذف',
      cancelText: 'انصراف',
      icon: Icons.delete_forever_rounded,
      onConfirm: () => bloc.add(DeleteBannerEvent(banner.id!)),
    );
  }
}
