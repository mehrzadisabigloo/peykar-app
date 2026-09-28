import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/themes/theme_main.dart';
import '../../domain/entity/manage_rating_entity.dart';

class RatingCard extends StatelessWidget {
  final ManageRatingEntity rating;
  final bool isProcessing;
  final VoidCallback onStatusToggle;

  const RatingCard({
    super.key,
    required this.rating,
    required this.isProcessing,
    required this.onStatusToggle,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final bool isActive = rating.status.toLowerCase() == 'active';
    final bool isDraft = rating.status.toLowerCase() == 'draft';

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.04),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Row(
                children: [
                  Container(
                    width: 48.r,
                    height: 48.r,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          colorScheme.primary.withValues(alpha: 0.1),
                          colorScheme.primary.withValues(alpha: 0.05),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      rating.user?.firstName?.isNotEmpty == true ? rating.user!.firstName!.substring(0, 1) : 'U',
                      style: TextStyle(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.w900,
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                  SizedBox(width: 14.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          rating.user?.fullName ?? 'کاربر ناشناس',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w800,
                            color: colorScheme.onSurface,
                            letterSpacing: -0.2,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Row(
                          children: [
                            Icon(Icons.calendar_today_rounded, size: 12.sp, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.38)),
                            SizedBox(width: 4.w),
                            Text(
                              rating.createdAtJalali ?? rating.createdAt,
                              style: TextStyle(
                                fontSize: 11.sp,
                                color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.45),
                                fontFamily: 'BonyadeKoodak',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  _buildScoreBadge(context, rating.score.toDouble()),
                ],
              ),
            ),
            
            // Content Section
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              padding: EdgeInsets.all(14.r),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainer,
                borderRadius: BorderRadius.circular(14.r),
                border: Border.all(color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.02)),
              ),
              child: Text(
                rating.description,
                style: TextStyle(
                  fontSize: 13.sp,
                  color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.87),
                  height: 1.6,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),

            SizedBox(height: 16.h),

            // Footer Section
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                border: Border(top: BorderSide(color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.03))),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatusBadge(context, rating.status),
                  Row(
                    children: [
                      if (isDraft)
                        _buildActionButton(
                          label: isProcessing ? 'تایید...' : 'تایید نظر',
                          icon: Icons.check_circle_outline_rounded,
                          color: StatusColors.of(context).success,
                          onTap: onStatusToggle,
                          isPrimary: true,
                          isLoading: isProcessing,
                        )
                      else
                        _buildActionButton(
                          label: isProcessing
                              ? (isActive ? 'غیرفعال...' : 'فعال...')
                              : (isActive ? 'غیرفعال سازی' : 'فعال سازی'),
                          icon: isActive ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                          color: isActive ? Theme.of(context).colorScheme.error : colorScheme.primary,
                          onTap: onStatusToggle,
                          isPrimary: false,
                          isLoading: isProcessing,
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScoreBadge(BuildContext context, double score) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: StatusColors.of(context).warning.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: StatusColors.of(context).warning.withValues(alpha: 0.15)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            score.toString(),
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w900,
              color: StatusColors.of(context).warning,
              fontFamily: 'BonyadeKoodak',
            ),
          ),
          SizedBox(width: 4.w),
          Icon(Icons.star_rounded, size: 18.sp, color: StatusColors.of(context).warning),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(BuildContext context, String status) {
    Color color;
    String text;
    IconData icon;

    switch (status.toLowerCase()) {
      case 'active':
        color = StatusColors.of(context).success;
        text = 'فعال شده';
        icon = Icons.check_circle_rounded;
        break;
      case 'deactive':
        color = Theme.of(context).colorScheme.error;
        text = 'غیرفعال';
        icon = Icons.cancel_rounded;
        break;
      case 'draft':
        color = StatusColors.of(context).warning;
        text = 'در انتظار تایید';
        icon = Icons.pending_rounded;
        break;
      default:
        color = Theme.of(context).colorScheme.outline;
        text = status;
        icon = Icons.help_outline_rounded;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14.sp, color: color),
          SizedBox(width: 6.w),
          Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required String label,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
    required bool isPrimary,
    bool isLoading = false,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isLoading ? null : onTap,
        borderRadius: BorderRadius.circular(10.r),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: isPrimary ? color.withValues(alpha: 0.1) : Colors.transparent,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              color: isPrimary ? color.withValues(alpha: 0.2) : color.withValues(alpha: 0.4),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isLoading)
                Padding(
                  padding: EdgeInsets.only(left: 6.w),
                  child: SizedBox(
                    width: 14.sp,
                    height: 14.sp,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: color,
                    ),
                  ),
                )
              else
                Icon(icon, size: 18.sp, color: color),
              SizedBox(width: 6.w),
              Text(
                label,
                style: TextStyle(
                  color: color,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
