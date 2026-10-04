import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/jalali_date.dart';
import '../../../feature_create_time_slot/data/model/time_slot_model.dart';

class BookingDateSelector extends StatelessWidget {
  final List<TimeSlotModel> availableSlots;
  final String? selectedDate;
  final ValueChanged<String> onDateSelected;
  final String Function(String) toPersianDigit;

  const BookingDateSelector({
    super.key,
    required this.availableSlots,
    required this.selectedDate,
    required this.onDateSelected,
    required this.toPersianDigit,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dates = availableSlots.map((s) => s.date).toSet().toList()..sort();

    if (dates.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'تاریخ مراجعه',
          style: theme.textTheme.headlineMedium?.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(height: 12.h),
        SizedBox(
          height: 100.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: dates.length,
            padding: EdgeInsets.symmetric(vertical: 4.h),
            separatorBuilder: (context, index) => SizedBox(width: 12.w),
            itemBuilder: (context, index) {
              final date = dates[index];
              final isSelected = selectedDate == date;

              String dayName = '';
              String dayNumber = '';
              String monthName = '';

              try {
                DateTime dateTime;
                if (date.contains('T')) {
                  dateTime = DateTime.parse(date);
                } else {
                  final parts = date.split('-');
                  if (parts.length == 3) {
                    final y = int.parse(parts[0]);
                    final m = int.parse(parts[1]);
                    final d = int.parse(parts[2]);
                    dateTime = Jalali(y, m, d).toDateTime();
                  } else {
                    dateTime = DateTime.now();
                  }
                }

                final jalali = Jalali.fromDateTime(dateTime);
                const weekDays = [
                  'دوشنبه',
                  'سه‌شنبه',
                  'چهارشنبه',
                  'پنج‌شنبه',
                  'جمعه',
                  'شنبه',
                  'یکشنبه'
                ];
                dayName = weekDays[dateTime.weekday - 1];
                dayNumber = jalali.day.toString();
                monthName = Jalali.monthNames[jalali.month - 1];
              } catch (_) {}

              return GestureDetector(
                onTap: () => onDateSelected(date),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 75.w,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? theme.colorScheme.primary
                        : theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(
                      color: isSelected
                          ? theme.colorScheme.primary
                          : theme.colorScheme.outline,
                      width: 1.0,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: isSelected
                            ? theme.colorScheme.primary.withValues(alpha: 0.25)
                            : theme.shadowColor.withValues(alpha: 0.03),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        dayName,
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight:
                              isSelected ? FontWeight.w700 : FontWeight.w500,
                          color: isSelected
                              ? theme.colorScheme.onPrimary
                                  .withValues(alpha: 0.9)
                              : theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        toPersianDigit(dayNumber),
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w900,
                          color: isSelected
                              ? theme.colorScheme.onPrimary
                              : theme.colorScheme.onSurface,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        monthName,
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight:
                              isSelected ? FontWeight.w700 : FontWeight.w500,
                          color: isSelected
                              ? theme.colorScheme.onPrimary
                                  .withValues(alpha: 0.9)
                              : theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
