import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_bottom_sheet.dart';

class UnifiedTimePickerModal extends StatefulWidget {
  final TimeOfDay initialTime;
  final Function(TimeOfDay) onTimeSelected;

  const UnifiedTimePickerModal({
    super.key,
    required this.initialTime,
    required this.onTimeSelected,
  });

  static void show(
    BuildContext context, {
    required TimeOfDay initialTime,
    required Function(TimeOfDay) onTimeSelected,
    String? title,
  }) {
    AppBottomSheet.show(
      context,
      title: title ?? 'انتخاب زمان',
      icon: Icons.access_time_rounded,
      initialChildSize: 0.85,
      minChildSize: 0.4,
      child: UnifiedTimePickerModal(
        initialTime: initialTime,
        onTimeSelected: onTimeSelected,
      ),
    );
  }

  @override
  State<UnifiedTimePickerModal> createState() => _UnifiedTimePickerModalState();
}

class _UnifiedTimePickerModalState extends State<UnifiedTimePickerModal> {
  late TimeOfDay _selectedTime;
  late DateTime _tempCupertinoDateTime;

  @override
  void initState() {
    super.initState();
    _selectedTime = widget.initialTime;
    _tempCupertinoDateTime = DateTime(2000, 1, 1, _selectedTime.hour, _selectedTime.minute);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Minimal Time Header
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            _buildTimeUnitIndicator(theme, _selectedTime.minute.toString().padLeft(2, '0')),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Text(':', style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w300, color: theme.colorScheme.outline)),
            ),
            _buildTimeUnitIndicator(theme, _selectedTime.hour.toString().padLeft(2, '0')),
          ],
        ),
        
        SizedBox(height: 24.h),
        
        // Scrolling Wheel Picker
        _buildScrollingPicker(theme),
        
        SizedBox(height: 32.h),
        
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'انصراف', 
                style: TextStyle(
                  fontFamily: 'BonyadeKoodak',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.outline,
                )
              ),
            ),
            SizedBox(width: 8.w),
            IntrinsicWidth(
              child: ElevatedButton(
                onPressed: () {
                  widget.onTimeSelected(_selectedTime);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: theme.colorScheme.onPrimary,
                  elevation: 0,
                  minimumSize: Size(0, 52.h),
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r)),
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
    );
  }

  Widget _buildTimeUnitIndicator(ThemeData theme, String value) {
    return Text(
      _toPersianDigit(value),
      style: TextStyle(
        fontSize: 48.sp,
        fontWeight: FontWeight.w900,
        fontFamily: 'BonyadeKoodak',
        color: theme.colorScheme.onSurface,
        letterSpacing: -1,
      ),
    );
  }

  Widget _buildScrollingPicker(ThemeData theme) {
    return SizedBox(
      height: 200.h,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: CupertinoTheme(
          data: CupertinoThemeData(
            textTheme: CupertinoTextThemeData(
              dateTimePickerTextStyle: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.w900,
                fontFamily: 'BonyadeKoodak',
                color: theme.colorScheme.onSurface,
              ),
            ),
          ),
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.time,
            initialDateTime: _tempCupertinoDateTime,
            use24hFormat: true,
            onDateTimeChanged: (DateTime newDateTime) {
              setState(() {
                _tempCupertinoDateTime = newDateTime;
                _selectedTime = TimeOfDay(hour: newDateTime.hour, minute: newDateTime.minute);
              });
            },
          ),
        ),
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
