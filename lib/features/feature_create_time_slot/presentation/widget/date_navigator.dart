import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/jalali_date.dart';

class DateNavigator extends StatelessWidget {
  final Jalali selectedDate;
  final bool showCalendar;
  final VoidCallback onToggleCalendar;
  final VoidCallback onPrevDate;
  final VoidCallback onNextDate;
  final String Function(String) toPersianDigit;

  const DateNavigator({
    super.key,
    required this.selectedDate,
    required this.showCalendar,
    required this.onToggleCalendar,
    required this.onPrevDate,
    required this.onNextDate,
    required this.toPersianDigit,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dateStr = '${Jalali.monthNames[selectedDate.month - 1]} ${toPersianDigit(selectedDate.day.toString())}, ${toPersianDigit(selectedDate.year.toString())}';

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavButton(
            onTap: onPrevDate,
            icon: Icons.chevron_left_rounded,
            theme: theme,
          ),
          Expanded(
            child: GestureDetector(
              onTap: onToggleCalendar,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.03),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      dateStr,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w900,
                        color: theme.colorScheme.onSurface,
                        fontFamily: 'BonyadeKoodak',
                      ),
                    ),
                    SizedBox(width: 6.w),
                    AnimatedRotation(
                      turns: showCalendar ? 0.5 : 0,
                      duration: const Duration(milliseconds: 300),
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 18.sp,
                        color: theme.colorScheme.primary.withValues(alpha: 0.5),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          _buildNavButton(
            onTap: onNextDate,
            icon: Icons.chevron_right_rounded,
            theme: theme,
          ),
        ],
      ),
    );
  }

  Widget _buildNavButton({required VoidCallback onTap, required IconData icon, required ThemeData theme}) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(icon, size: 28.sp, color: theme.colorScheme.onSurface.withValues(alpha: 0.3)),
      padding: EdgeInsets.all(8.r),
      constraints: const BoxConstraints(),
    );
  }
}
