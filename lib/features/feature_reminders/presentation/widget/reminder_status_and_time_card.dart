import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/jalali_date.dart';

class ReminderStatusAndTimeCard extends StatelessWidget {
  final bool isKilometer;
  final Color activeColor;
  final TextEditingController fromKmController;
  final TextEditingController toKmController;
  final DateTime selectedDate;
  final DateTime selectedNextDate;
  final VoidCallback onToggleDatePicker;
  final VoidCallback onToggleNextDatePicker;
  final String Function(String) toPersianDigit;

  const ReminderStatusAndTimeCard({
    super.key,
    required this.isKilometer,
    required this.activeColor,
    required this.fromKmController,
    required this.toKmController,
    required this.selectedDate,
    required this.selectedNextDate,
    required this.onToggleDatePicker,
    required this.onToggleNextDatePicker,
    required this.toPersianDigit,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(32.r),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.04),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          if (isKilometer) ...[
            Row(
              children: [
                Expanded(
                  child: _buildKMInputField(
                    theme,
                    'از (کیلومتر انجام)',
                    fromKmController,
                    hintText: '۱۸۰,۰۰۰',
                    icon: Icons.speed_outlined,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: _buildKMInputField(
                    theme,
                    'تا (کیلومتر بعدی)',
                    toKmController,
                    hintText: '۱۹۰,۰۰۰',
                    icon: Icons.flag_outlined,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: Divider(
                  color: activeColor.withValues(alpha: 0.1), thickness: 1),
            ),
          ],
          if (!isKilometer)
            Row(
              children: [
                Expanded(
                  child: _buildDateField(
                    theme,
                    'تاریخ انجام',
                    selectedDate,
                    onToggleDatePicker,
                    icon: Icons.calendar_today_outlined,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: _buildDateField(
                    theme,
                    'تاریخ یادآوری',
                    selectedNextDate,
                    onToggleNextDatePicker,
                    icon: Icons.notification_important_outlined,
                  ),
                ),
              ],
            )
          else
            _buildDateField(
              theme,
              'تاریخ انجام سرویس',
              selectedDate,
              onToggleDatePicker,
              icon: Icons.calendar_today_outlined,
            ),
        ],
      ),
    );
  }

  Widget _buildKMInputField(
    ThemeData theme,
    String label,
    TextEditingController controller, {
    String? hintText,
    IconData? icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 4.w),
          child: Text(
            label,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 12.sp,
              color: theme.colorScheme.onSurfaceVariant,
              fontFamily: 'BonyadeKoodak',
            ),
          ),
        ),
        SizedBox(height: 8.h),
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.right,
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontSize: 14.sp,
            color: theme.colorScheme.onSurface,
            fontFamily: 'BonyadeKoodak',
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: theme.colorScheme.surfaceContainerHighest,
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 14.sp,
              color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
              fontFamily: 'BonyadeKoodak',
            ),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            suffixIcon: icon != null
                ? Icon(icon,
                    color: activeColor.withValues(alpha: 0.6), size: 20.sp)
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: BorderSide(
                  color: activeColor.withValues(alpha: 0.3), width: 1.5),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDateField(
    ThemeData theme,
    String label,
    DateTime date,
    VoidCallback onTap, {
    IconData? icon,
  }) {
    final jalali = Jalali.fromDateTime(date);
    final dateText = toPersianDigit(
        '${jalali.year}/${jalali.month.toString().padLeft(2, '0')}/${jalali.day.toString().padLeft(2, '0')}');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 4.w),
          child: Text(
            label,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 12.sp,
              color: theme.colorScheme.onSurfaceVariant,
              fontFamily: 'BonyadeKoodak',
            ),
          ),
        ),
        SizedBox(height: 8.h),
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  dateText,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: theme.colorScheme.onSurface,
                    fontFamily: 'BonyadeKoodak',
                  ),
                ),
                Icon(icon ?? Icons.calendar_today_rounded,
                    color: activeColor, size: 20.sp),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
