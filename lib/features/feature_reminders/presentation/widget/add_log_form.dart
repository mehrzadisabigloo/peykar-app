import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../domain/entity/reminders_entity.dart';
import '../bloc/reminders_bloc.dart';
import '../../../feature_manage_services/domain/entity/manage_services_entity.dart';
import '../../domain/entity/reminder_type_entity.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/jalali_date.dart';
import '../widget/persian_calendar_view.dart';
import '../../data/model/reminder_request_models.dart' as req;

class AddLogForm extends StatefulWidget {
  final RemindersEntity reminder;
  final RemindersBloc bloc;
  final RemindersState state;
  final List<ManageServicesEntity> dynamicServices;
  final List<ReminderSubItemEntity> subItems;
  final VoidCallback onSuccess;

  const AddLogForm({
    super.key,
    required this.reminder,
    required this.bloc,
    required this.state,
    required this.dynamicServices,
    required this.subItems,
    required this.onSuccess,
  });

  @override
  State<AddLogForm> createState() => _AddLogFormState();
}

class _AddLogFormState extends State<AddLogForm> {
  final List<String> _selectedItems = [];
  final _fromController = TextEditingController();
  final _toController = TextEditingController();

  DateTime _doneDate = DateTime.now();
  DateTime _nextDate = DateTime.now().add(const Duration(days: 90));

  bool _showDoneDatePicker = false;
  bool _showNextDatePicker = false;

  @override
  void dispose() {
    _fromController.dispose();
    _toController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final accentColor = widget.reminder.progressColor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.reminder.type == ReminderType.kilometer) ...[
          _buildInputSection(
            theme,
            'جزئیات کارکرد',
            Icons.speed_rounded,
            accentColor,
            Row(
              children: [
                Expanded(
                  child: _buildKMInputField(
                    theme,
                    'از (کیلومتر انجام)',
                    _fromController,
                    accentColor,
                    hintText: 'مثلا ۱۸۰,۰۰۰'.toPersianDigit,
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: _buildKMInputField(
                    theme,
                    'تا (کیلومتر بعدی)',
                    _toController,
                    accentColor,
                    hintText: 'مثلا ۱۹۰,۰۰۰'.toPersianDigit,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          _buildInputSection(
            theme,
            'زمان انجام',
            Icons.calendar_today_rounded,
            accentColor,
            _buildDateField(
              theme,
              'تاریخ انجام سرویس',
              _doneDate,
              accentColor,
              () => setState(() {
                _showDoneDatePicker = !_showDoneDatePicker;
                _showNextDatePicker = false;
              }),
            ),
          ),
        ] else ...[
          _buildInputSection(
            theme,
            'زمان‌بندی سرویس',
            Icons.date_range_rounded,
            accentColor,
            Row(
              children: [
                Expanded(
                  child: _buildDateField(
                    theme,
                    'تاریخ انجام',
                    _doneDate,
                    accentColor,
                    () => setState(() {
                      _showDoneDatePicker = !_showDoneDatePicker;
                      _showNextDatePicker = false;
                    }),
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: _buildDateField(
                    theme,
                    'تاریخ یادآوری',
                    _nextDate,
                    accentColor,
                    () => setState(() {
                      _showNextDatePicker = !_showNextDatePicker;
                      _showDoneDatePicker = false;
                    }),
                  ),
                ),
              ],
            ),
          ),
        ],

        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: _showNextDatePicker || _showDoneDatePicker
              ? Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: _buildCalendarCard(
                    theme,
                    _showNextDatePicker ? 'انتخاب تاریخ یادآوری' : 'انتخاب تاریخ انجام',
                    Jalali.fromDateTime(_showNextDatePicker ? _nextDate : _doneDate),
                    accentColor,
                    (jalali) => setState(() {
                      if (_showNextDatePicker) {
                        _nextDate = jalali.toDateTime();
                      } else {
                        _doneDate = jalali.toDateTime();
                      }
                      _showNextDatePicker = false;
                      _showDoneDatePicker = false;
                    }),
                  ),
                )
              : const SizedBox.shrink(),
        ),

        SizedBox(height: 24.h),
        _buildLogItemsSelector(theme, accentColor),

        SizedBox(height: 32.h),
        _buildLogSubmitButton(theme, accentColor),
      ],
    );
  }

  Widget _buildInputSection(ThemeData theme, String title, IconData icon, Color accentColor, Widget child) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 18.sp, color: accentColor.withValues(alpha: 0.6)),
            SizedBox(width: 8.w),
            Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w900,
                color: theme.colorScheme.onSurfaceVariant,
                fontFamily: 'BonyadeKoodak',
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        child,
      ],
    );
  }

  Widget _buildKMInputField(ThemeData theme, String label, TextEditingController controller, Color accentColor, {String? hintText}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 4.w, bottom: 8.h),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
              fontFamily: 'BonyadeKoodak',
            ),
          ),
        ),
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w900, fontFamily: 'BonyadeKoodak'),
          onChanged: (value) {
            if (value.isNotEmpty) {
              final persian = value.toPersianDigit;
              if (persian != value) {
                controller.value = TextEditingValue(
                  text: persian,
                  selection: TextSelection.collapsed(offset: persian.length),
                );
              }
            }
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 13.sp, color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.3), fontFamily: 'BonyadeKoodak'),
            contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.r), borderSide: BorderSide.none),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16.r), borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(color: accentColor.withValues(alpha: 0.4), width: 1.5),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDateField(ThemeData theme, String label, DateTime date, Color accentColor, VoidCallback onTap) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 4.w, bottom: 8.h),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
              fontFamily: 'BonyadeKoodak',
            ),
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(
                color: (_showDoneDatePicker || _showNextDatePicker) 
                  ? accentColor.withValues(alpha: 0.4) 
                  : Colors.transparent,
                width: 1.5,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  date.formatJalali,
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w900, fontFamily: 'BonyadeKoodak', color: theme.colorScheme.onSurface),
                ),
                SizedBox(width: 12.w),
                Icon(Icons.edit_calendar_rounded, color: accentColor, size: 20.sp),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCalendarCard(ThemeData theme, String title, Jalali date, Color accentColor, Function(Jalali) onSelected) {
    return Container(
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: accentColor.withValues(alpha: 0.1)),
        boxShadow: [
          BoxShadow(
            color: accentColor.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15.sp, fontFamily: 'BonyadeKoodak', color: accentColor),
            ),
          ),
          PersianCalendarView(
            initialDate: date,
            onDateSelected: onSelected,
          ),
        ],
      ),
    );
  }

  Widget _buildLogItemsSelector(ThemeData theme, Color accentColor) {
    final subServices = widget.subItems;
    if (subServices.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Row(
          children: [
            Icon(Icons.checklist_rounded, size: 18.sp, color: accentColor.withValues(alpha: 0.6)),
            SizedBox(width: 8.w),
            Text(
              'خدمات انجام شده',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w900,
                color: theme.colorScheme.onSurfaceVariant,
                fontFamily: 'BonyadeKoodak',
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Wrap(
          spacing: 10.w,
          runSpacing: 10.h,
          children: subServices.map((item) {
            final isSelected = _selectedItems.contains(item.title);
            return FilterChip(
              label: Text(
                item.title,
                style: TextStyle(
                  fontFamily: 'BonyadeKoodak',
                  fontSize: 13.sp,
                  fontWeight: isSelected ? FontWeight.w900 : FontWeight.bold,
                  color: isSelected ? theme.colorScheme.onPrimary : theme.colorScheme.onSurfaceVariant,
                ),
              ),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    _selectedItems.add(item.title);
                  } else {
                    _selectedItems.remove(item.title);
                  }
                });
              },
              backgroundColor: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
              selectedColor: accentColor,
              checkmarkColor: theme.colorScheme.onPrimary,
              elevation: isSelected ? 4 : 0,
              pressElevation: 8,
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r)),
              side: BorderSide.none,
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildLogSubmitButton(ThemeData theme, Color accentColor) {
    final bool isLoading = widget.state is AddLogLoading;
    return SizedBox(
      width: double.infinity,
      height: 60.h,
      child: ElevatedButton(
        onPressed: isLoading ? null : () {
          if (widget.reminder.type == ReminderType.kilometer) {
            final log = req.KilometerLog(
              doneKm: _fromController.text.parsePersianInt,
              nextKm: _toController.text.parsePersianInt,
              date: _doneDate.formatJalaliRaw,
              items: List.from(_selectedItems),
            );
            widget.bloc.add(AddKilometerLogEvent(widget.reminder.id, log));
          } else {
            final log = req.TimeLog(
              doneDate: _doneDate.formatJalaliRaw,
              nextDate: _nextDate.formatJalaliRaw,
              items: List.from(_selectedItems),
            );
            widget.bloc.add(AddTimeLogEvent(widget.reminder.id, log));
          }
        },
        style:  ElevatedButton.styleFrom(
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: theme.colorScheme.onPrimary,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
        child: isLoading
            ? SizedBox(
          height: 24.h,
          width: 24.h,
          child: CircularProgressIndicator(color: theme.colorScheme.onPrimary, strokeWidth: 2.5),
        )
            : Text(
                'ثبت نهایی',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w900, fontFamily: 'BonyadeKoodak'),
              ),
      ),
    );
  }
}
