import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/themes/theme_main.dart';
import '../../../../core/utils/extensions.dart';
import '../../data/model/rating_model.dart';

class WorkshopRatingCard extends StatelessWidget {
  final RatingModel rating;

  const WorkshopRatingCard({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.1)),
        boxShadow: [
          BoxShadow(
            color: colorScheme.onSurface.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundColor: colorScheme.primary.withValues(alpha: 0.1),
                child: Text(
                  rating.user.firstName.isNotEmpty ? rating.user.firstName.substring(0, 1) : 'U',
                  style: TextStyle(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${rating.user.firstName} ${rating.user.lastName}',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      (rating.createdAtJalali?.split(' ').first ?? rating.createdAt.split('T').first.replaceAll('-', '/')).toPersianDigit,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontFamily: 'BonyadeKoodak',
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: StatusColors.of(context).warning.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  children: [
                    Text(
                      '${rating.score.toString().toPersianDigit} / ${'5'.toPersianDigit}',
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w900,
                        color: StatusColors.of(context).warning,
                        fontFamily: 'BonyadeKoodak',
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Icon(
                      Icons.star_rounded,
                      size: 18.sp,
                      color: StatusColors.of(context).warning,
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (rating.description != null && rating.description!.isNotEmpty) ...[
            SizedBox(height: 12.h),
            Container(
              padding: EdgeInsets.all(12.r),
              width: double.infinity,
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerLow,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(
                rating.description!,
                style: theme.textTheme.bodySmall?.copyWith(
                  height: 1.6,
                  color: colorScheme.onSurface.withValues(alpha: 0.8),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
