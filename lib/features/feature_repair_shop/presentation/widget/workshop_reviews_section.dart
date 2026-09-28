import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../feature_appointments/presentation/widget/comment_input_bottom_sheet.dart';
import '../bloc/repair_shop_bloc.dart';
import 'workshop_section_header.dart';
import 'ratings_shimmer.dart';
import 'workshop_rating_card.dart';

class WorkshopReviewsSection extends StatelessWidget {
  final String repairmanId;
  final String? workshopName;

  const WorkshopReviewsSection({
    super.key,
    required this.repairmanId,
    this.workshopName,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bloc = context.read<RepairShopBloc>();

    return Column(
      children: [
        WorkshopSectionHeader(
          title: 'نظرات مشتریان',
          onSeeAll: () {},
          showSeeAll: false,
        ),
        SizedBox(height: 8.h),
        Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: InkWell(
            onTap: () async {
              final result = await CommentInputBottomSheet.show(
                context,
                shopName: workshopName ?? 'این تعمیرگاه',
                repairmanId: repairmanId,
              );
              if (result == true) {
                bloc.add(FetchRepairmanRatingsEvent(repairmanId));
              }
            },
            borderRadius: BorderRadius.circular(16.r),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
              decoration: BoxDecoration(
                border: Border.all(color: theme.colorScheme.primary.withValues(alpha: 0.3)),
                borderRadius: BorderRadius.circular(16.r),
                color: theme.colorScheme.primary.withValues(alpha: 0.05),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add_comment_rounded, size: 20.sp, color: theme.colorScheme.primary),
                  SizedBox(width: 8.w),
                  Text(
                    'ثبت نظر جدید',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        BlocBuilder<RepairShopBloc, RepairShopState>(
          builder: (context, state) {
            if (state.ratingsStatus == RatingsStatus.loading) {
              return const RatingsShimmer();
            }
            if (state.ratingsStatus == RatingsStatus.error) {
              return Center(
                child: Text(state.ratingsError ?? 'خطا در دریافت نظرات', style: theme.textTheme.bodySmall),
              );
            }
            if (state.ratingsStatus == RatingsStatus.loaded) {
              final ratings = state.ratings;
              if (ratings.isEmpty) {
                return Center(
                  child: Text('هنوز نظری برای این تعمیرگاه ثبت نشده است', style: theme.textTheme.bodySmall),
                );
              }
              return Column(
                children: ratings.map((r) => WorkshopRatingCard(rating: r)).toList(),
              );
            }
            if (state.ratingsStatus == RatingsStatus.initial) {
              return const RatingsShimmer();
            }
            return const SizedBox();
          },
        ),
      ],
    );
  }
}
