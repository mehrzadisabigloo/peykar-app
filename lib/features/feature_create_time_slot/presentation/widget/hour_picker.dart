import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HourPicker extends StatelessWidget {
  final int? initialHour;
  final String title;
  final Function(int hour) onSelected;

  const HourPicker({
    super.key,
    this.initialHour,
    required this.title,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      padding: EdgeInsets.all(24.r),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(32.r),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.1),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40.w,
            height: 4.h,
            margin: EdgeInsets.only(bottom: 20.h),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.outlineVariant.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w900,
              fontFamily: 'BonyadeKoodak',
              color: theme.colorScheme.onSurface,
            ),
          ),
          SizedBox(height: 24.h),
          SizedBox(
            height: 300.h,
            child: SingleChildScrollView(
              child: Wrap(
                spacing: 12.w,
                runSpacing: 12.h,
                alignment: WrapAlignment.center,
                children: List.generate(24, (index) {
                  final hour = index;
                  bool isSelected = initialHour == hour;

                  return InkWell(
                    onTap: () {
                      onSelected(hour);
                      Navigator.pop(context);
                    },
                    borderRadius: BorderRadius.circular(16.r),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 56.w,
                      height: 52.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isSelected 
                            ? theme.colorScheme.primary 
                            : theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: isSelected ? theme.colorScheme.primary : Colors.transparent,
                          width: 1.5,
                        ),
                        boxShadow: isSelected ? [
                          BoxShadow(
                            color: theme.colorScheme.primary.withValues(alpha: 0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          )
                        ] : null,
                      ),
                      child: Text(
                        _toPersianDigit(hour.toString().padLeft(2, '0')),
                        style: TextStyle(
                          color: isSelected ? theme.colorScheme.surface : theme.colorScheme.onSurface,
                          fontWeight: isSelected ? FontWeight.w900 : FontWeight.w600,
                          fontSize: 16.sp,
                          fontFamily: 'BonyadeKoodak',
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          SizedBox(height: 24.h),
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: TextButton.styleFrom(
              minimumSize: Size(double.infinity, 50.h),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
            ),
            child: Text(
              'انصراف', 
              style: TextStyle(
                fontFamily: 'BonyadeKoodak',
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              )
            ),
          ),
        ],
      ),
    );
  }

  String _toPersianDigit(String input) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const persian = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];
    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(english[i], persian[i]);
    }
    return input;
  }
}
