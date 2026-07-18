import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/jalali_date.dart';

class PersianCalendarView extends StatefulWidget {
  final Jalali initialDate;
  final Function(Jalali) onDateSelected;

  const PersianCalendarView({
    super.key,
    required this.initialDate,
    required this.onDateSelected,
  });

  @override
  State<PersianCalendarView> createState() => _PersianCalendarViewState();
}

class _PersianCalendarViewState extends State<PersianCalendarView> {
  late Jalali _viewDate;
  late Jalali _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
    _viewDate = Jalali(_selectedDate.year, _selectedDate.month, 1);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    // Calculate the grid
    final firstDayOfMonth = Jalali(_viewDate.year, _viewDate.month, 1).toDateTime();
    // Sat: 6 -> 0, Sun: 7 -> 1, Mon: 1 -> 2, Tue: 2 -> 3, Wed: 3 -> 4, Thu: 4 -> 5, Fri: 5 -> 6
    int startPadding = (firstDayOfMonth.weekday + 1) % 7; 

    final daysInMonth = Jalali.monthLength(_viewDate.year, _viewDate.month);

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    int m = _viewDate.month - 1;
                    int y = _viewDate.year;
                    if (m < 1) {
                      m = 12;
                      y--;
                    }
                    _viewDate = Jalali(y, m, 1);
                  });
                },
                icon: const Icon(Icons.chevron_left_rounded),
              ),
              Text(
                '${Jalali.monthNames[_viewDate.month - 1]} ${_toPersianDigit(_viewDate.year.toString())}',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 15.sp,
                  fontFamily: 'BonyadeKoodak',
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    int m = _viewDate.month + 1;
                    int y = _viewDate.year;
                    if (m > 12) {
                      m = 1;
                      y++;
                    }
                    _viewDate = Jalali(y, m, 1);
                  });
                },
                icon: const Icon(Icons.chevron_right_rounded),
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              setState(() {
                final today = Jalali.fromDateTime(DateTime.now());
                _viewDate = Jalali(today.year, today.month, 1);
                _selectedDate = today;
                widget.onDateSelected(_selectedDate);
              });
            },
            child: Text(
              'امروز',
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w800,
                color: theme.colorScheme.primary,
                fontFamily: 'BonyadeKoodak',
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: ['ش', 'ی', 'د', 'س', 'چ', 'پ', 'ج']
                .map((d) => Text(d, style: TextStyle(color: Colors.grey, fontSize: 13.sp, fontFamily: 'BonyadeKoodak')))
                .toList(),
          ),
          SizedBox(height: 12.h),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: startPadding + daysInMonth,
            itemBuilder: (context, index) {
              if (index < startPadding) return const SizedBox.shrink();
              
              final day = index - startPadding + 1;
              final currentJalali = Jalali(_viewDate.year, _viewDate.month, day);
              final isSelected = _selectedDate == currentJalali;
              
              return InkWell(
                onTap: () {
                  setState(() {
                    _selectedDate = currentJalali;
                  });
                  widget.onDateSelected(currentJalali);
                },
                borderRadius: BorderRadius.circular(18.r),
                child: Center(
                  child: Container(
                    width: 36.w,
                    height: 36.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelected ? theme.colorScheme.primary : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      _toPersianDigit(day.toString()),
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black87,
                        fontWeight: isSelected ? FontWeight.w800 : FontWeight.w500,
                        fontSize: 13.sp,
                        fontFamily: 'BonyadeKoodak',
                      ),
                    ),
                  ),
                ),
              );
            },
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
