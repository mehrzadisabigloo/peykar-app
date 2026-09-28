import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/themes/theme_main.dart';
import '../../../../core/utils/extensions.dart';
import '../../../feature_appointments/domain/entity/appointments_entity.dart';

class WorkshopReservationCard extends StatelessWidget {
  final AppointmentsEntity reservation;

  const WorkshopReservationCard({super.key, required this.reservation});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final res = reservation;
    final color = _getStatusColor(context, res.status);

    return Container(
      width: 250.w,
      margin: EdgeInsets.only(left: 16.w, bottom: 10.h, top: 2.h),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: colorScheme.onSurface.withValues(alpha: 0.03),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 32.r,
                height: 32.r,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.08),
                  shape: BoxShape.circle,
                ),
                child: Icon(_getStatusIcon(res.status), size: 16.sp, color: color),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      res.serviceName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    Text(
                      res.jalaliDate?.toPersianDigit ?? 'بدون تاریخ',
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: colorScheme.onSurface.withValues(alpha: 0.5),
                        fontFamily: 'BonyadeKoodak',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          Divider(height: 1, color: colorScheme.onSurface.withValues(alpha: 0.05)),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.access_time_rounded, size: 14.sp, color: colorScheme.onSurface.withValues(alpha: 0.5)),
                  SizedBox(width: 6.w),
                  Text(
                    res.time.toPersianDigit,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w900,
                      color: colorScheme.onSurface.withValues(alpha: 0.5),
                      fontFamily: 'BonyadeKoodak',
                    ),
                  ),
                ],
              ),
              Text(
                _getStatusText(res.status),
                style: TextStyle(
                  fontSize: 11.sp,
                  color: color,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'BonyadeKoodak',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  IconData _getStatusIcon(AppointmentStatus status) {
    switch (status) {
      case AppointmentStatus.confirmed: return Icons.check_circle_rounded;
      case AppointmentStatus.pending: return Icons.hourglass_empty_rounded;
      case AppointmentStatus.canceled: return Icons.cancel_rounded;
      case AppointmentStatus.completed: return Icons.task_alt_rounded;
    }
  }

  Color _getStatusColor(BuildContext context, AppointmentStatus status) {
    switch (status) {
      case AppointmentStatus.confirmed: return StatusColors.of(context).success;
      case AppointmentStatus.pending: return StatusColors.of(context).warning;
      case AppointmentStatus.canceled: return Theme.of(context).colorScheme.error;
      case AppointmentStatus.completed: return StatusColors.of(context).info;
    }
  }

  String _getStatusText(AppointmentStatus status) {
    switch (status) {
      case AppointmentStatus.confirmed: return 'تأیید شده';
      case AppointmentStatus.pending: return 'در انتظار';
      case AppointmentStatus.canceled: return 'لغو شده';
      case AppointmentStatus.completed: return 'تکمیل شده';
    }
  }
}
