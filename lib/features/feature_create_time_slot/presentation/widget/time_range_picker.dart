import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeRangePicker extends StatefulWidget {
  final int? initialStart;
  final int? initialEnd;
  final Function(int start, int end) onSelected;

  const TimeRangePicker({
    super.key,
    this.initialStart,
    this.initialEnd,
    required this.onSelected,
  });

  @override
  State<TimeRangePicker> createState() => _TimeRangePickerState();
}

class _TimeRangePickerState extends State<TimeRangePicker> {
  int? _start;
  int? _end;

  @override
  void initState() {
    super.initState();
    _start = widget.initialStart;
    _end = widget.initialEnd;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      padding: EdgeInsets.all(20.r),
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
            'انتخاب بازه زمانی',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w900,
              fontFamily: 'BonyadeKoodak',
              color: theme.colorScheme.onSurface,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'ساعت شروع و پایان را لمس کنید',
            style: TextStyle(
              fontSize: 12.sp,
              color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
              fontFamily: 'BonyadeKoodak',
            ),
          ),
          SizedBox(height: 24.h),
          Wrap(
            spacing: 10.w,
            runSpacing: 10.h,
            alignment: WrapAlignment.center,
            children: List.generate(25, (index) {
              final hour = index;
              bool isSelected = _start == hour || _end == hour;
              bool isInRange = false;
              if (_start != null && _end != null) {
                if (hour > _start! && hour < _end!) isInRange = true;
              }

              return InkWell(
                onTap: () => _handleTap(hour),
                borderRadius: BorderRadius.circular(16.r),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  width: 54.w,
                  height: 48.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isSelected 
                        ? theme.colorScheme.primary 
                        : (isInRange ? theme.colorScheme.primary.withValues(alpha: 0.12) : theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3)),
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(
                      color: isSelected 
                          ? theme.colorScheme.primary 
                          : (isInRange ? theme.colorScheme.primary.withValues(alpha: 0.3) : Colors.transparent),
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
                      color: isSelected ? theme.colorScheme.surface : (isInRange ? theme.colorScheme.primary : theme.colorScheme.onSurface),
                      fontWeight: isSelected ? FontWeight.w900 : (isInRange ? FontWeight.w700 : FontWeight.w600),
                      fontSize: 15.sp,
                      fontFamily: 'BonyadeKoodak',
                    ),
                  ),
                ),
              );
            }),
          ),
          SizedBox(height: 32.h),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 14.h),
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
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: ElevatedButton(
                  onPressed: (_start != null && _end != null) 
                      ? () {
                          widget.onSelected(_start!, _end!);
                          Navigator.pop(context);
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    foregroundColor: theme.colorScheme.onPrimary,
                    elevation: 0,
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                  ),
                  child: Text(
                    'تایید', 
                    style: TextStyle(
                      fontFamily: 'BonyadeKoodak',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w900,
                    )
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _handleTap(int hour) {
    setState(() {
      if (_start == null || (_start != null && _end != null)) {
        _start = hour;
        _end = null;
      } else {
        if (hour > _start!) {
          _end = hour;
        } else {
          _start = hour;
        }
      }
    });
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
