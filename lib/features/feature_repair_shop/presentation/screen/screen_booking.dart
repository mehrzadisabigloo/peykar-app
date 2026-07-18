import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/bloc/app/app_bloc.dart';
import '../../../../core/bloc/error/error_bloc.dart';
import '../../../../core/services/locator.dart';
import '../../../../core/utils/jalali_date.dart';
import '../base/base_repair_shop_stateful_widget_state.dart';
import '../bloc/repair_shop_bloc.dart';

class ScreenBooking extends StatefulWidget {
  const ScreenBooking({super.key});

  @override
  State<ScreenBooking> createState() => _ScreenBookingState();
}

class _ScreenBookingState extends BaseRepairShopStatefulWidgetState<ScreenBooking, RepairShopBloc> {
  _ScreenBookingState() : super(locator<RepairShopBloc>());

  final int _currentStep = 1; // 0: Service, 1: Date, 2: Time, 3: Confirmation
  late Jalali _viewDate;
  Jalali? _selectedDate;

  @override
  void initState() {
    super.initState();
    _viewDate = Jalali.fromDateTime(DateTime.now());
    _selectedDate = _viewDate;
  }

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
    final theme = Theme.of(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(height: 16.h),
            _buildStepper(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 32.h),
                    _buildSectionTitle('انتخاب خدمت'),
                    SizedBox(height: 16.h),
                    _buildSelectedServiceCard(),
                    SizedBox(height: 32.h),
                    _buildSectionTitle('انتخاب تاریخ'),
                    SizedBox(height: 16.h),
                    _buildPersianCalendar(),
                    SizedBox(height: 32.h),
                  ],
                ),
              ),
            ),
            _buildBottomBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    final theme = Theme.of(context);
    return Text(
      title,
      style: theme.textTheme.headlineMedium?.copyWith(
        fontSize: 16.sp,
        fontWeight: FontWeight.w800,
      ),
    );
  }

  Widget _buildStepper() {
    final theme = Theme.of(context);
    final List<String> steps = ['خدمت', 'تاریخ', 'ساعت', 'تایید'];
    final List<IconData> icons = [
      Icons.settings_outlined,
      Icons.calendar_today_outlined,
      Icons.access_time_outlined,
      Icons.check_circle_outline_rounded,
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(steps.length, (index) {
          final isActive = index == _currentStep;
          final isCompleted = index < _currentStep;
          return Expanded(
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: 36.w,
                      height: 36.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isActive || isCompleted
                            ? theme.colorScheme.primary
                            : Colors.grey.shade200,
                        border: isActive
                            ? Border.all(color: theme.colorScheme.primary, width: 2)
                            : null,
                      ),
                      child: Icon(
                        icons[index],
                        size: 18.sp,
                        color: isActive || isCompleted ? Colors.white : Colors.grey,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      steps[index],
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: isActive ? FontWeight.w800 : FontWeight.w500,
                        color: isActive ? theme.colorScheme.primary : Colors.grey,
                      ),
                    ),
                  ],
                ),
                if (index != steps.length - 1)
                  Expanded(
                    child: Container(
                      height: 2.h,
                      margin: EdgeInsets.only(bottom: 24.h, left: 4.w, right: 4.w),
                      color: isCompleted ? theme.colorScheme.primary : Colors.grey.shade200,
                    ),
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildSelectedServiceCard() {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'تعویض روغن موتور',
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w800,
              fontSize: 15.sp,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'قیمت: از ۳۵۰،۰۰۰ تومان',
            style: theme.textTheme.bodySmall?.copyWith(
              color: Colors.grey.shade600,
              fontSize: 13.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPersianCalendar() {
    final theme = Theme.of(context);
    
    // Calculate the grid
    final firstDayOfMonth = Jalali(_viewDate.year, _viewDate.month, 1).toDateTime();
    // In Flutter, 7 is Sunday, 1 is Monday.
    // In Persian calendar, 6 is Friday, 0 is Saturday.
    // DateTime.weekday: 1(Mon) 2(Tue) 3(Wed) 4(Thu) 5(Fri) 6(Sat) 7(Sun)
    // We want Saturday to be index 0.
    int weekdayOffset = (firstDayOfMonth.weekday % 7); // 1->1, 6->6, 7->0 (Sun)
    // Actually, DateTime.weekday 6 is Saturday. We want Saturday to be 0.
    // Sat: 6 -> 0
    // Sun: 7 -> 1
    // Mon: 1 -> 2
    // Tue: 2 -> 3
    // Wed: 3 -> 4
    // Thu: 4 -> 5
    // Fri: 5 -> 6
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
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                  fontSize: 15.sp,
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
              });
            },
            child: Text(
              'امروز',
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w800,
                color: theme.colorScheme.primary,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: ['ش', 'ی', 'د', 'س', 'چ', 'پ', 'ج']
                .map((d) => Text(d, style: TextStyle(color: Colors.grey, fontSize: 13.sp)))
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

  Widget _buildBottomBar() {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 16.h + MediaQuery.of(context).padding.bottom),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.colorScheme.primary,
          minimumSize: Size(double.infinity, 54.h),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        ),
        child: Text(
          'مرحله بعد',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
