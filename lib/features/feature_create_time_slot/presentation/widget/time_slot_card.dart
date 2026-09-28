import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/themes/theme_main.dart';
import '../../domain/entity/create_time_slot_entity.dart';

class TimeSlotCard extends StatelessWidget {
  final String startTime;
  final String endTime;
  final int capacity;
  final bool isLocal;
  final String? status;
  final VoidCallback? onDelete;
  final VoidCallback? onTap;
  final List<TimeSlotReservationEntity>? reservations;
  final String Function(String) toPersianDigit;
  final String Function(String) formatTime;
  final bool isDeleting;
  final bool isFull;

  const TimeSlotCard({
    super.key,
    required this.startTime,
    required this.endTime,
    required this.capacity,
    this.isLocal = false,
    this.status,
    this.onDelete,
    this.onTap,
    this.reservations,
    required this.toPersianDigit,
    required this.formatTime,
    this.isDeleting = false,
    this.isFull = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    // Status priority: 1. Deactive, 2. Full, 3. Reservations, 4. Active/Free
    Color statusColor = theme.colorScheme.primary;
    String statusText = isLocal ? 'در انتظار ثبت' : 'آماده رزرو';
    IconData statusIcon = Icons.radio_button_checked_rounded;

    if (!isLocal) {
      if (status?.toLowerCase() == 'deactive') {
        statusColor = Theme.of(context).colorScheme.outline;
        statusText = 'غیرفعال';
        statusIcon = Icons.block_rounded;
      } else if (isFull) {
        statusColor = Theme.of(context).colorScheme.error;
        statusText = 'تکمیل ظرفیت';
        statusIcon = Icons.event_busy_rounded;
      } else if (reservations != null && reservations!.isNotEmpty) {
        final resStatus = reservations!.first.status.toLowerCase();
        if (resStatus == 'confirmed') {
          statusColor = StatusColors.of(context).info;
          statusText = 'تایید شده';
          statusIcon = Icons.verified_user_rounded;
        } else if (resStatus == 'pending') {
          statusColor = StatusColors.of(context).warning;
          statusText = 'در انتظار';
          statusIcon = Icons.pending_actions_rounded;
        } else if (resStatus == 'completed') {
          statusColor = StatusColors.of(context).success;
          statusText = 'انجام شده';
          statusIcon = Icons.check_circle_rounded;
        } else if (resStatus == 'cancelled') {
          statusColor = Theme.of(context).colorScheme.error;
          statusText = 'لغو شده';
          statusIcon = Icons.highlight_off_rounded;
        }
      }
    } else {
      statusColor = theme.colorScheme.primary;
      statusIcon = Icons.add_circle_outline_rounded;
    }

    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16.r),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.03),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
              border: Border.all(color: Theme.of(context).colorScheme.outlineVariant, width: 0.8),
            ),
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(2.r),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: statusColor.withValues(alpha: 0.2), width: 1.5),
                      ),
                      child: Icon(statusIcon, size: 14.sp, color: statusColor),
                    ),
                    Container(
                      width: 1.2.w,
                      height: 28.h,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            statusColor.withValues(alpha: 0.3),
                            statusColor.withValues(alpha: 0.02),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 12.w),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.access_time_rounded, size: 14.sp, color: theme.colorScheme.primary.withValues(alpha: 0.6)),
                          SizedBox(width: 6.w),
                          Text(
                            '${toPersianDigit(formatTime(startTime))} الی ${toPersianDigit(formatTime(endTime))}',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w900,
                              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.87),
                              fontFamily: 'BonyadeKoodak',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          Icon(Icons.groups_rounded, size: 14.sp, color: Theme.of(context).colorScheme.outline),
                          SizedBox(width: 6.w),
                          Text(
                            capacity > 1 
                              ? 'رزرو شده: ${toPersianDigit(reservations?.length.toString() ?? '0')} از ${toPersianDigit(capacity.toString())}'
                              : 'ظرفیت: ${toPersianDigit(capacity.toString())} نفر',
                            style: TextStyle(
                              fontSize: 11.sp,
                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'BonyadeKoodak',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.06),
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: statusColor.withValues(alpha: 0.1), width: 0.5),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 6.r,
                        height: 6.r,
                        decoration: BoxDecoration(
                          color: statusColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        statusText,
                        style: TextStyle(
                          fontSize: 10.5.sp,
                          fontWeight: FontWeight.w900,
                          color: statusColor,
                          fontFamily: 'BonyadeKoodak',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 12.w),
                if (onDelete != null)
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: isDeleting ? null : onDelete,
                      borderRadius: BorderRadius.circular(12.r),
                      child: Container(
                        padding: EdgeInsets.all(8.r),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.error.withValues(alpha: 0.03),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: isDeleting 
                          ? SizedBox(
                              height: 18.sp,
                              width: 18.sp,
                              child: CircularProgressIndicator(color: Theme.of(context).colorScheme.error.withValues(alpha: 0.4), strokeWidth: 2),
                            )
                          : Icon(
                              Icons.delete_outline_rounded,
                              color: Theme.of(context).colorScheme.error.withValues(alpha: 0.4),
                              size: 18.sp,
                            ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
