import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/themes/theme_main.dart';
import '../../domain/entity/appointments_entity.dart';

class AppointmentStatusChip extends StatelessWidget {
  final AppointmentStatus status;
  final bool isFooter;

  const AppointmentStatusChip({
    super.key,
    required this.status,
    this.isFooter = false,
  });

  @override
  Widget build(BuildContext context) {
    final statusColors = StatusColors.of(context);
    Color color;
    String text;
    IconData icon;

    switch (status) {
      case AppointmentStatus.confirmed:
        color = statusColors.success;
        text = 'تأیید شده';
        icon = Icons.check_circle_rounded;
        break;
      case AppointmentStatus.pending:
        color = statusColors.warning;
        text = 'در انتظار تایید';
        icon = Icons.hourglass_empty_rounded;
        break;
      case AppointmentStatus.canceled:
        color = Theme.of(context).colorScheme.error;
        text = 'لغو شده';
        icon = Icons.cancel_rounded;
        break;
      case AppointmentStatus.completed:
        color = statusColors.info;
        text = 'تکمیل شده';
        icon = Icons.task_alt_rounded;
        break;
    }

    if (isFooter) {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.05),
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(32.r)),
          border: Border(top: BorderSide(color: color.withValues(alpha: 0.03))),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 14.sp, color: color.withValues(alpha: 0.7)),
            SizedBox(width: 8.w),
            Text(
              text,
              style: TextStyle(
                color: color.withValues(alpha: 0.8),
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                fontFamily: 'BonyadeKoodak',
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14.sp, color: color),
          SizedBox(width: 8.w),
          Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: 12.sp,
              fontWeight: FontWeight.w900,
              fontFamily: 'BonyadeKoodak',
            ),
          ),
        ],
      ),
    );
  }
}
