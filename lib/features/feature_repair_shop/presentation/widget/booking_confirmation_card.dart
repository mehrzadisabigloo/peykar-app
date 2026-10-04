import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/themes/theme_main.dart';
import '../../../../core/utils/jalali_date.dart';
import '../../../feature_create_time_slot/data/model/time_slot_model.dart';

class BookingConfirmationCard extends StatelessWidget {
  final bool isSuccess;
  final TimeSlotModel? selectedSlot;
  final String? shopName;
  final String description;
  final String Function(String) toPersianDigit;

  const BookingConfirmationCard({
    super.key,
    required this.isSuccess,
    required this.selectedSlot,
    this.shopName,
    required this.description,
    required this.toPersianDigit,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (selectedSlot == null) return const SizedBox.shrink();

    final color = isSuccess
        ? StatusColors.of(context).success
        : theme.colorScheme.primary;
    final headerText =
        isSuccess ? 'جزئیات نوبت ثبت شده' : 'بازبینی و تایید نوبت';
    final headerIcon =
        isSuccess ? Icons.check_circle_rounded : Icons.fact_check_rounded;

    String displayDate = selectedSlot!.date;
    try {
      DateTime dateTime;
      if (selectedSlot!.date.contains('T')) {
        dateTime = DateTime.parse(selectedSlot!.date);
      } else {
        final parts = selectedSlot!.date.split('-');
        final y = int.parse(parts[0]);
        final m = int.parse(parts[1]);
        final d = int.parse(parts[2]);
        dateTime = Jalali(y, m, d).toDateTime();
      }
      final jalali = Jalali.fromDateTime(dateTime);
      displayDate =
          '${jalali.day} ${Jalali.monthNames[jalali.month - 1]} ${jalali.year}';
    } catch (_) {}

    String repairmanName = selectedSlot!.repairman != null
        ? '${selectedSlot!.repairman!.firstName ?? ''} ${selectedSlot!.repairman!.lastName ?? ''}'
            .trim()
        : shopName ?? 'تعمیرگاه تخصصی';

    if (repairmanName.isEmpty) {
      repairmanName = 'تعمیرگاه تخصصی';
    }

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: color.withValues(alpha: 0.3), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
            ),
            child: Row(
              children: [
                Icon(headerIcon, color: color, size: 22.sp),
                SizedBox(width: 12.w),
                Text(
                  headerText,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 15.sp,
                    color: isSuccess
                        ? StatusColors.of(context).success
                        : theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              children: [
                _buildInfoRow(
                    Icons.store_rounded, 'تعمیرگاه:', repairmanName, theme),
                Divider(
                    height: 32.h,
                    color: theme.dividerColor.withValues(alpha: 0.5)),
                _buildInfoRow(Icons.calendar_today_outlined, 'تاریخ رزرو:',
                    displayDate, theme),
                Divider(
                    height: 32.h,
                    color: theme.dividerColor.withValues(alpha: 0.5)),
                _buildInfoRow(
                    Icons.access_time_outlined,
                    'ساعت مراجعه:',
                    '${selectedSlot!.startTime.substring(0, 5)} الی ${selectedSlot!.endTime.substring(0, 5)}',
                    theme),
                if (description.isNotEmpty) ...[
                  Divider(
                      height: 32.h,
                      color: theme.dividerColor.withValues(alpha: 0.5)),
                  _buildInfoRow(Icons.description_rounded, 'توضیحات شما:',
                      description, theme),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(
      IconData icon, String label, String value, ThemeData theme) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18.sp, color: theme.colorScheme.onSurfaceVariant),
        SizedBox(width: 8.w),
        Text(label,
            style: TextStyle(
                color: theme.colorScheme.onSurfaceVariant, fontSize: 13.sp)),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            toPersianDigit(value),
            style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 14.sp,
                color: theme.colorScheme.onSurface),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}
