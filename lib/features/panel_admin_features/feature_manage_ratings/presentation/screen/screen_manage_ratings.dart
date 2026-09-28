import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/bloc/app/app_bloc.dart';
import '../../../../../../core/bloc/error/error_bloc.dart';
import '../../../../../../core/services/locator.dart';
import '../../../../../../core/widgets/cstm_snakbar.dart';
import '../../../../../../core/widgets/empty_state_widget.dart';
import '../../../../../../core/widgets/error_state_widget.dart';
import '../../../../../../core/widgets/widget_infinite_list.dart';
import '../base/base_manage_ratings_stateful_widget_state.dart';
import '../bloc/manage_rating_bloc.dart';
import '../../domain/entity/manage_rating_entity.dart';
import '../widget/rating_card.dart';
import '../widget/rating_card_shimmer.dart';

class ScreenManageRatings extends StatefulWidget {
  const ScreenManageRatings({super.key});

  @override
  State<ScreenManageRatings> createState() => _ScreenManageRatingsState();
}

class _ScreenManageRatingsState extends BaseManageRatingsStatefulWidgetState<ScreenManageRatings, ManageRatingBloc> {
  _ScreenManageRatingsState() : super(locator<ManageRatingBloc>());

  String? _selectedStatus;

  @override
  void initState() {
    super.initState();
    bloc.add(FetchManageRatings(status: _selectedStatus));
  }

  @override
  Widget buildManageRatingsWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      body: Column(
        children: [
          _buildFilterBar(colorScheme),
          Expanded(
            child: BlocConsumer<ManageRatingBloc, ManageRatingState>(
              listener: (context, state) {
                if (state is ManageRatingLoaded) {
                  if (state.successMessage != null) {
                    CstmSnackBar.showSuccess(context, state.successMessage!);
                    bloc.add(const ClearRatingMessages());
                  }
                  if (state.errorMessage != null) {
                    CstmSnackBar.showError(context, state.errorMessage!);
                    bloc.add(const ClearRatingMessages());
                  }
                }
              },
              builder: (context, state) {
                if (state is ManageRatingInitial || (state is ManageRatingLoading && state.page == 1)) {
                  return ListView.builder(
                    padding: EdgeInsets.only(top: 10.h),
                    itemCount: 5,
                    itemBuilder: (context, index) => const RatingCardShimmer(),
                  );
                }

                if (state is ManageRatingFailed) {
                  return ErrorStateWidget(
                    message: state.message,
                    onRetry: () => bloc.add(FetchManageRatings(status: state.status)),
                  );
                }

                List<ManageRatingEntity> ratings = [];
                bool hasMore = false;
                String? processingId;

                if (state is ManageRatingLoaded) {
                  ratings = state.ratings;
                  hasMore = state.hasMore;
                  processingId = state.processingId;
                } else if (state is ManageRatingLoadingMore) {
                  ratings = state.ratings;
                  hasMore = state.hasMore;
                }

                if (ratings.isEmpty) {
                  return const EmptyStateWidget(
                    title: 'امتیازی یافت نشد',
                    description: 'در حال حاضر هیچ امتیازی با این وضعیت ثبت نشده است.',
                    icon: Icons.star_outline_rounded,
                  );
                }

                return WidgetInfiniteList(
                  bloc: bloc.listBloc,
                  items: ratings,
                  hasReachedTop: true,
                  hasReachedBottom: !hasMore,
                  isLoading: false,
                  hasErrorOccurred: false,
                  padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 40.h),
                  errorWidget: const SizedBox.shrink(),
                  loadingWidget: const RatingCardShimmer(),
                  loadBottomData: () => bloc.add(const LoadMoreManageRatings()),
                  itemEquality: (f, s) => (f as ManageRatingEntity).id == (s as ManageRatingEntity).id,
                  builder: (context, item) {
                    final rating = item as ManageRatingEntity;
                    return RatingCard(
                      rating: rating,
                      isProcessing: processingId == rating.id,
                      onStatusToggle: () => bloc.add(ChangeRatingStatus(rating.id)),
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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 8.h),
      child: Row(
        children: [
          _buildFilterItem('همه', null, colorScheme),
          SizedBox(width: 8.w),
          _buildFilterItem('فعال', 'Active', colorScheme),
          SizedBox(width: 8.w),
          _buildFilterItem('غیرفعال', 'Deactive', colorScheme),
          SizedBox(width: 8.w),
          _buildFilterItem('در انتظار تایید', 'Draft', colorScheme),
        ],
      ),
    );
  }

  Widget _buildFilterItem(String label, String? status, ColorScheme colorScheme) {
    final bool isSelected = _selectedStatus == status;

    return GestureDetector(
      onTap: () {
        setState(() => _selectedStatus = status);
        bloc.add(FetchManageRatings(status: status));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? colorScheme.primary : Theme.of(context).colorScheme.surfaceContainer,
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
          label,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
            color: isSelected ? Theme.of(context).colorScheme.surface : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.54),
          ),
        ),
      ),
    );
  }
}
