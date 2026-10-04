import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../../feature_create_time_slot/data/model/time_slot_model.dart';

class BookingTimeSlotsGrid extends StatelessWidget {
  final List<TimeSlotModel> availableSlots;
  final String? selectedDate;
  final String? selectedTimeSlotId;
  final bool isLoadingSlots;
  final ValueChanged<String> onSlotSelected;
  final String Function(String) toPersianDigit;

  const BookingTimeSlotsGrid({
    super.key,
    required this.availableSlots,
    required this.selectedDate,
    required this.selectedTimeSlotId,
    required this.isLoadingSlots,
    required this.onSlotSelected,
    required this.toPersianDigit,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (isLoadingSlots) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'زمان‌های در دسترس',
            style: theme.textTheme.headlineMedium?.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 16.h),
          _buildTimeSlotShimmer(theme),
        ],
      );
    }

    final filteredSlots =
        availableSlots.where((s) => s.date == selectedDate).toList();

    if (filteredSlots.isEmpty) {
      return Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(20.r),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest
                      .withValues(alpha: 0.5),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.event_busy_rounded,
                    size: 48.sp, color: theme.colorScheme.outline),
              ),
              SizedBox(height: 16.h),
              Text(
                'هیچ نوبت آزادی یافت نشد.',
                style: TextStyle(
                  color: theme.colorScheme.onSurfaceVariant,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'لطفاً تاریخ دیگری را انتخاب کنید.',
                style: TextStyle(
                  color: theme.colorScheme.outline,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'زمان‌های در دسترس',
          style: theme.textTheme.headlineMedium?.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(height: 16.h),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: filteredSlots.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2.4,
            crossAxisSpacing: 12.w,
            mainAxisSpacing: 12.h,
          ),
          itemBuilder: (context, index) {
            final slot = filteredSlots[index];
            final isSelected = selectedTimeSlotId == slot.id;
            final isFull = slot.isFull ||
                (slot.capacity > 0 && slot.remainingCapacity == 0);

            return InkWell(
              onTap: isFull ? null : () => onSlotSelected(slot.id),
              borderRadius: BorderRadius.circular(16.r),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  color: isSelected
                      ? theme.colorScheme.primary
                      : isFull
                          ? theme.colorScheme.surfaceContainerHighest
                          : theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    color: isSelected
                        ? theme.colorScheme.primary
                        : theme.colorScheme.outline,
                    width: isSelected ? 1.5 : 1.0,
                  ),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: theme.colorScheme.primary
                                .withValues(alpha: 0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          )
                        ]
                      : null,
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      isFull
                          ? Icons.block_flipped
                          : Icons.access_time_rounded,
                      size: 16.sp,
                      color: isSelected
                          ? theme.colorScheme.onPrimary
                          : isFull
                              ? theme.colorScheme.onSurfaceVariant
                                  .withValues(alpha: 0.5)
                              : theme.colorScheme.primary
                                  .withValues(alpha: 0.6),
                    ),
                    SizedBox(width: 8.w),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${toPersianDigit(slot.startTime.substring(0, 5))} الی ${toPersianDigit(slot.endTime.substring(0, 5))}',
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: isSelected
                                ? FontWeight.w900
                                : FontWeight.w700,
                            color: isSelected
                                ? theme.colorScheme.onPrimary
                                : isFull
                                    ? theme.colorScheme.onSurfaceVariant
                                        .withValues(alpha: 0.5)
                                    : theme.colorScheme.onSurface,
                          ),
                        ),
                        if (!isFull &&
                            slot.remainingCapacity > 0 &&
                            slot.remainingCapacity <= 2)
                          Text(
                            'فقط ${toPersianDigit(slot.remainingCapacity.toString())} ظرفیت باقی‌مانده',
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
                              color: isSelected
                                  ? theme.colorScheme.onPrimary
                                      .withValues(alpha: 0.8)
                                  : theme.colorScheme.onSurface
                                      .withValues(alpha: 0.5),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildTimeSlotShimmer(ThemeData theme) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2.4,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.h,
      ),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
                color: theme.colorScheme.outline.withValues(alpha: 0.5)),
          ),
          child: Shimmer.fromColors(
            baseColor: theme.colorScheme.surfaceContainer,
            highlightColor: theme.colorScheme.surface,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 16.sp,
                  height: 16.sp,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 8.w),
                Container(
                  width: 80.w,
                  height: 14.h,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
