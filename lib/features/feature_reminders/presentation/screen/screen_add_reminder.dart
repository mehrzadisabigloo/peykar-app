import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/bloc/app/app_bloc.dart';
import '../../../../core/bloc/error/error_bloc.dart';
import '../../../../core/services/locator.dart';
import '../../../../core/utils/jalali_date.dart';
import '../../data/model/reminder_request_models.dart';
import '../base/base_reminders_stateful_widget_state.dart';
import '../bloc/reminders_bloc.dart';
import '../widget/persian_calendar_view.dart';

class ScreenAddReminder extends StatefulWidget {
  const ScreenAddReminder({super.key});

  @override
  State<ScreenAddReminder> createState() => _ScreenAddReminderState();
}

class _ScreenAddReminderState extends BaseRemindersStatefulWidgetState<ScreenAddReminder, RemindersBloc> {
  _ScreenAddReminderState() : super(locator<RemindersBloc>());

  bool isKilometer = true;
  bool isReminderActive = true;

  bool _showDatePicker = false;
  bool _showNextDatePicker = false;

  DateTime _selectedDate = DateTime.now();
  DateTime _selectedNextDate = DateTime.now().add(const Duration(days: 90));

  String? _selectedServiceType = 'تعویض روغن موتور';
  String? _selectedCurrentKm = '۱۸۸,۰۰۰';
  String? _selectedFromKm = '۱۸۰,۰۰۰';
  String? _selectedToKm = '۱۹۰,۰۰۰';

  final List<String> _serviceTypes = ['تعویض روغن موتور', 'تعویض فیلتر هوا', 'تعویض فیلتر روغن', 'سرویس گیربکس'];
  final List<String> _kmOptions = ['۱۸۰,۰۰۰', '۱۸۵,۰۰۰', '۱۸۸,۰۰۰', '۱۹۰,۰۰۰', '۱۹۵,۰۰۰', '۲۰۰,۰۰۰'];

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
    return Container(
      color: const Color(0xFFF8F9FB),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(20.r),
        child: Column(
          children: [
            _buildTypeSelector(),
            SizedBox(height: 30.h),
            _buildDropdownField(
              'نوع سرویس',
              _selectedServiceType,
              _serviceTypes,
              (val) => setState(() => _selectedServiceType = val),
            ),
            if (isKilometer) ...[
              SizedBox(height: 20.h),
              _buildDropdownField(
                'کیلومتر فعلی',
                _selectedCurrentKm,
                _kmOptions,
                (val) => setState(() => _selectedCurrentKm = val),
              ),
              SizedBox(height: 20.h),
              _buildDropdownField(
                'از (کیلومتر انجام شده)',
                _selectedFromKm,
                _kmOptions,
                (val) => setState(() => _selectedFromKm = val),
              ),
              SizedBox(height: 20.h),
              _buildDropdownField(
                'تا (کیلومتر بعدی)',
                _selectedToKm,
                _kmOptions,
                (val) => setState(() => _selectedToKm = val),
              ),
            ],
            SizedBox(height: 20.h),
            _buildDateField(
              'تاریخ انجام',
              _selectedDate,
              () => setState(() {
                _showDatePicker = !_showDatePicker;
                _showNextDatePicker = false;
              }),
            ),
            if (_showDatePicker) ...[
              SizedBox(height: 10.h),
              PersianCalendarView(
                initialDate: Jalali.fromDateTime(_selectedDate),
                onDateSelected: (jalali) => setState(() {
                  _selectedDate = jalali.toDateTime();
                  _showDatePicker = false;
                }),
              ),
            ],
            if (!isKilometer) ...[
              SizedBox(height: 20.h),
              _buildDateField(
                'تاریخ یادآوری بعدی',
                _selectedNextDate,
                () => setState(() {
                  _showNextDatePicker = !_showNextDatePicker;
                  _showDatePicker = false;
                }),
              ),
              if (_showNextDatePicker) ...[
                SizedBox(height: 10.h),
                PersianCalendarView(
                  initialDate: Jalali.fromDateTime(_selectedNextDate),
                  onDateSelected: (jalali) => setState(() {
                    _selectedNextDate = jalali.toDateTime();
                    _showNextDatePicker = false;
                  }),
                ),
              ],
            ],
            SizedBox(height: 30.h),
            _buildToggleRow(),
            SizedBox(height: 40.h),
            _buildSubmitButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildTypeSelector() {
    return Container(
      padding: EdgeInsets.all(4.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildTypeButton('زمانی', !isKilometer, () => setState(() => isKilometer = false)),
          ),
          Expanded(
            child: _buildTypeButton('کیلومتری', isKilometer, () => setState(() => isKilometer = true)),
          ),
        ],
      ),
    );
  }

  Widget _buildTypeButton(String title, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF3F51B5) : Colors.transparent,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              fontFamily: 'BonyadeKoodak',
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownField(String label, String? value, List<String> options, Function(String?) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12.sp,
            color: Colors.grey,
            fontFamily: 'BonyadeKoodak',
          ),
        ),
        SizedBox(height: 8.h),
        SizedBox(
          width: double.infinity,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: DropdownMenu<String>(
              initialSelection: value,
              width: 1.sw - 40.w, // Dynamic width based on screen width minus padding
              menuHeight: 300.h,
              enableSearch: false,
              textStyle: TextStyle(
                fontSize: 14.sp,
                color: Colors.black87,
                fontFamily: 'BonyadeKoodak',
              ),
              menuStyle: MenuStyle(
                backgroundColor: WidgetStateProperty.all(Colors.white),
                elevation: WidgetStateProperty.all(15),
                shadowColor: WidgetStateProperty.all(Colors.black.withValues(alpha: 0.2)),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                ),
              ),
              inputDecorationTheme: InputDecorationTheme(
                filled: true,
                fillColor: Colors.white,
                hoverColor: Colors.transparent,
                contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
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
                  borderSide: BorderSide(color: const Color(0xFF3F51B5).withValues(alpha: 0.2), width: 1),
                ),
              ),
              dropdownMenuEntries: options.map((String option) {
                final bool isSelected = option == value;
                return DropdownMenuEntry<String>(
                  value: option,
                  label: option,
                  style: MenuItemButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    backgroundColor: isSelected ? const Color(0xFF3F51B5).withValues(alpha: 0.05) : Colors.transparent,
                    foregroundColor: isSelected ? const Color(0xFF3F51B5) : Colors.black87,
                  ),
                  labelWidget: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        option,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'BonyadeKoodak',
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          color: isSelected ? const Color(0xFF3F51B5) : Colors.black87,
                        ),
                      ),
                      if (isSelected)
                        Icon(
                          Icons.check_circle_rounded,
                          color: const Color(0xFF3F51B5),
                          size: 18.sp,
                        ),
                    ],
                  ),
                );
              }).toList(),
              onSelected: onChanged,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildToggleRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Switch(
          value: isReminderActive,
          onChanged: (val) => setState(() => isReminderActive = val),
          activeThumbColor: const Color(0xFF3F51B5),
        ),
        Text(
          'یادآوری فعال باشد',
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.black87,
            fontFamily: 'BonyadeKoodak',
          ),
        ),
      ],
    );
  }

  Widget _buildDateField(String label, DateTime date, VoidCallback onTap) {
    final jalali = Jalali.fromDateTime(date);
    final dateText = _toPersianDigit('${jalali.year}/${jalali.month.toString().padLeft(2, '0')}/${jalali.day.toString().padLeft(2, '0')}');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12.sp,
            color: Colors.grey,
            fontFamily: 'BonyadeKoodak',
          ),
        ),
        SizedBox(height: 8.h),
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.calendar_today, color: const Color(0xFF3F51B5), size: 20.sp),
                Text(
                  dateText,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.black87,
                    fontFamily: 'BonyadeKoodak',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
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

  String _formatDateJalali(DateTime date) {
    final jalali = Jalali.fromDateTime(date);
    return '${jalali.year}/${jalali.month.toString().padLeft(2, '0')}/${jalali.day.toString().padLeft(2, '0')}';
  }

  int _parsePersianInt(String? text) {
    if (text == null) return 0;
    
    // Convert Persian digits to English digits
    const persianDigits = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];
    String englishText = text;
    for (int i = 0; i < persianDigits.length; i++) {
      englishText = englishText.replaceAll(persianDigits[i], i.toString());
    }
    
    // Remove non-digit characters (like commas)
    final cleaned = englishText.replaceAll(RegExp(r'\D'), '');
    return int.tryParse(cleaned) ?? 0;
  }

  Widget _buildSubmitButton() {
    return BlocConsumer<RemindersBloc, RemindersState>(
      listener: (context, state) {
        if (state is AddReminderSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('یادآور با موفقیت ثبت شد', style: TextStyle(fontFamily: 'BonyadeKoodak'))),
          );
          context.pop(true); // Return true to indicate success
        } else if (state is AddReminderError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message, style: const TextStyle(fontFamily: 'BonyadeKoodak'))),
          );
        }
      },
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: state is AddReminderLoading
                ? null
                : () {
                    final request = AddReminderRequest(
                      title: _selectedServiceType ?? '',
                      timeReminder: !isKilometer,
                      kilometerLogs: isKilometer
                          ? [
                              KilometerLog(
                                doneKm: _parsePersianInt(_selectedFromKm),
                                nextKm: _parsePersianInt(_selectedToKm),
                                date: _formatDateJalali(_selectedDate),
                                items: _selectedServiceType != null ? [_selectedServiceType!] : null,
                              )
                            ]
                          : null,
                      timeLogs: !isKilometer
                          ? [
                              TimeLog(
                                doneDate: _formatDateJalali(_selectedDate),
                                nextDate: _formatDateJalali(_selectedNextDate),
                                items: _selectedServiceType != null ? [_selectedServiceType!] : null,
                              )
                            ]
                          : null,
                      description: 'یادآور برای ${_selectedServiceType ?? 'سرویس'}',
                      serviceProviderId: null, // Can be added later if needed
                    );

                    context.read<RemindersBloc>().add(AddReminderEvent(request));
                  },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3F51B5),
              padding: EdgeInsets.symmetric(vertical: 16.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
            ),
            child: state is AddReminderLoading
                ? SizedBox(
                    height: 20.h,
                    width: 20.h,
                    child: const CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                  )
                : Text(
                    'ثبت یادآور',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'BonyadeKoodak',
                    ),
                  ),
          ),
        );
      },
    );
  }
}
