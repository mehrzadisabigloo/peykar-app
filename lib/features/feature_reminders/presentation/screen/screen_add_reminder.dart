import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/bloc/app/app_bloc.dart';
import '../../../../core/bloc/error/error_bloc.dart';
import '../../../../core/services/locator.dart';
import '../../../../core/widgets/cstm_snakbar.dart';
import '../../../../core/utils/jalali_date.dart';
import '../../../../core/widgets/error_state_widget.dart';
import '../../domain/entity/reminder_type_entity.dart';
import '../../domain/entity/reminders_entity.dart';
import '../../data/model/reminder_request_models.dart' as req;
import '../base/base_reminders_stateful_widget_state.dart';
import '../bloc/reminders_bloc.dart';
import '../widget/persian_calendar_view.dart';
import '../../../../core/themes/theme_main.dart';


class ScreenAddReminder extends StatefulWidget {
  final String? reminderId;
  final RemindersEntity? extra;
  const ScreenAddReminder({super.key, this.reminderId, this.extra});

  @override
  State<ScreenAddReminder> createState() => _ScreenAddReminderState();
}

class _ScreenAddReminderState extends BaseRemindersStatefulWidgetState<ScreenAddReminder, RemindersBloc> {
  _ScreenAddReminderState() : super(locator<RemindersBloc>());

  late final TextEditingController _fromKmController;
  late final TextEditingController _toKmController;
  late final TextEditingController _descriptionController;

  bool isKilometer = true;
  bool isReminderActive = true;

  bool _showDatePicker = false;
  bool _showNextDatePicker = false;

  DateTime _selectedDate = DateTime.now();
  DateTime _selectedNextDate = DateTime.now().add(const Duration(days: 90));

  String? _selectedServiceTypeId;
  final List<String> _selectedSubServiceIds = [];


  List<ReminderTypeEntity> _reminderTypes = [];
  int _dropdownResetKey = 0;

  @override
  void initState() {
    super.initState();
    _fromKmController = TextEditingController();
    _toKmController = TextEditingController();
    _descriptionController = TextEditingController();

    bloc.add(const FetchActiveReminderTypesEvent());

    if (widget.reminderId != null) {
      if (widget.extra != null) {
        _prefillData(widget.extra!);
      } else {
        bloc.add(GetReminderEvent(widget.reminderId!));
      }
    } else {
      _fromKmController.text = '۱۸۰,۰۰۰';
      _toKmController.text = '۱۹۰,۰۰۰';
    }
  }

  void _prefillData(RemindersEntity reminder) {
    isKilometer = reminder.type == ReminderType.kilometer;
    _descriptionController.text = reminder.description;

    // Use specific fields if available
    _selectedServiceTypeId = reminder.reminderTypeId;
    _selectedSubServiceIds.clear();
    if (reminder.selectedSubItemIds != null) {
      _selectedSubServiceIds.addAll(reminder.selectedSubItemIds!);
    }

    if (isKilometer && reminder.kilometerLogs != null && reminder.kilometerLogs!.isNotEmpty) {
      final log = reminder.kilometerLogs!.first;
      _fromKmController.text = _toPersianDigit(log.doneKm.toString());
      _toKmController.text = _toPersianDigit(log.nextKm.toString());
      _selectedDate = _parseJalali(log.date) ?? DateTime.now();
    } else if (!isKilometer && reminder.timeLogs != null && reminder.timeLogs!.isNotEmpty) {
      final log = reminder.timeLogs!.first;
      _selectedDate = _parseJalali(log.doneDate) ?? DateTime.now();
      _selectedNextDate = _parseJalali(log.nextDate) ?? DateTime.now();
    }
  }

  DateTime? _parseJalali(String jalaliStr) {
    try {
      final parts = jalaliStr.split('/');
      if (parts.length == 3) {
        final year = int.parse(parts[0]);
        final month = int.parse(parts[1]);
        final day = int.parse(parts[2]);
        return Jalali(year, month, day).toDateTime();
      }
    } catch (_) {}
    return null;
  }

  @override
  void dispose() {
    _fromKmController.dispose();
    _toKmController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
    final theme = Theme.of(context);

    return BlocListener<RemindersBloc, RemindersState>(
      listener: (context, state) {
        if (state is GetReminderSuccess) {
          _prefillData(state.reminder);
          setState(() {});
        } else if (state is ActiveReminderTypesLoaded) {
          setState(() {
            _reminderTypes = List.from(state.reminderTypes);

            // Fallback logic for editing: ensure the current type is in the list
            if (widget.reminderId != null && widget.extra != null) {
              final currentTypeId = widget.extra!.reminderTypeId;
              if (currentTypeId != null && !_reminderTypes.any((e) => e.id == currentTypeId)) {
                _reminderTypes.add(ReminderTypeEntity(
                  id: currentTypeId,
                  title: widget.extra!.reminderTypeTitle ?? widget.extra!.title,
                  subItems: [],
                ));
              }
            }

            // If we are editing and don't have a type ID yet, try to find it by title
            if (widget.reminderId != null && _selectedServiceTypeId == null && widget.extra != null) {
              final type = _reminderTypes.firstWhere(
                (e) => e.id == widget.extra!.reminderTypeId || e.title == (widget.extra!.reminderTypeTitle ?? widget.extra!.title),
                orElse: () => ReminderTypeEntity(id: '', title: '', subItems: []),
              );
              if (type.id.isNotEmpty) {
                _selectedServiceTypeId = type.id;
              }
            }
          });
        } else if (state is ActiveReminderTypesError) {
          // Even on error, ensure current type is available if editing
          if (widget.reminderId != null && widget.extra != null) {
            setState(() {
              final currentTypeId = widget.extra!.reminderTypeId;
              if (currentTypeId != null) {
                _reminderTypes = [
                  ReminderTypeEntity(
                    id: currentTypeId,
                    title: widget.extra!.reminderTypeTitle ?? widget.extra!.title,
                    subItems: [],
                  )
                ];
                _selectedServiceTypeId = currentTypeId;
              }
            });
          }
          CstmSnackBar.showError(context, state.message);
        }
      },
      child: BlocBuilder<RemindersBloc, RemindersState>(
        builder: (context, state) {
          if (state is GetReminderLoading && widget.reminderId != null && _selectedServiceTypeId == null) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is GetReminderError) {
            return ErrorStateWidget(
              message: state.message,
              onRetry: () => bloc.add(GetReminderEvent(widget.reminderId!)),
            );
          }
          final reminderColors = theme.extension<ReminderColors>()!;

          return Container(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.4),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTypeSelector(theme),
                        SizedBox(height: 24.h),
                        
                        _buildSectionTitle(theme, 'جزییات سرویس'),
                        SizedBox(height: 12.h),
                        _buildServiceCard(theme),
                        
                        SizedBox(height: 24.h),
                        _buildSectionTitle(theme, 'وضعیت کارکرد و زمان'),
                        SizedBox(height: 12.h),
                        _buildStatusCard(theme),
                        
                        if (!isKilometer && _showNextDatePicker) ...[
                          SizedBox(height: 16.h),
                          _buildCalendarCard(
                            theme,
                            'انتخاب تاریخ بعدی',
                            Jalali.fromDateTime(_selectedNextDate),
                            (jalali) => setState(() {
                              _selectedNextDate = jalali.toDateTime();
                              _showNextDatePicker = false;
                            }),
                          ),
                        ],
                        if (_showDatePicker) ...[
                          SizedBox(height: 16.h),
                          _buildCalendarCard(
                            theme,
                            'انتخاب تاریخ انجام',
                            Jalali.fromDateTime(_selectedDate),
                            (jalali) => setState(() {
                              _selectedDate = jalali.toDateTime();
                              _showDatePicker = false;
                            }),
                          ),
                        ],
                        SizedBox(height: 24.h),
                        _buildSectionTitle(theme, 'توضیحات'),
                        SizedBox(height: 12.h),
                        _buildDescriptionField(theme),
                        
                        SizedBox(height: 30.h),
                      ],
                    ),
                  ),
                ),
                _buildBottomAction(theme),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionTitle(ThemeData theme, String title) {
    final reminderColors = theme.extension<ReminderColors>()!;
    final Color activeColor = isKilometer ? reminderColors.kilometerColor : reminderColors.timeColor;

    return Padding(
      padding: EdgeInsets.only(right: 4.w),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: activeColor.withValues(alpha: 0.8),
          fontFamily: 'BonyadeKoodak',
        ),
      ),
    );
  }

  Widget _buildServiceCard(ThemeData theme) {
    final reminderColors = theme.extension<ReminderColors>()!;
    final Color activeColor = isKilometer ? reminderColors.kilometerColor : reminderColors.timeColor;

    final selectedType = _reminderTypes.firstWhere(
      (e) => e.id == _selectedServiceTypeId,
      orElse: () => ReminderTypeEntity(id: '', title: '', subItems: []),
    );
    final selectedTitle = selectedType.id.isNotEmpty ? selectedType.title : null;

    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(32.r),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.04),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildDropdownField(
            theme,
            'منوع یادآور',
            selectedTitle,
            _reminderTypes.map((e) => e.title).toList(),
            (val) {
              final type = _reminderTypes.firstWhere((e) => e.title == val);
              setState(() {
                _selectedServiceTypeId = type.id;
                _selectedSubServiceIds.clear();
              });
            },
            icon: Icons.settings_suggest_outlined,
            hint: 'انتخاب کنید...',
            isLoading: _reminderTypes.isEmpty && widget.reminderId == null,
            onRetry: () => bloc.add(const FetchActiveReminderTypesEvent()),
          ),
          if (_selectedServiceTypeId != null) ...[
             Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: Divider(color: activeColor.withValues(alpha: 0.1), thickness: 1),
            ),
            _buildMultiSelectSubServices(theme),
          ],
        ],
      ),
    );
  }

  Widget _buildStatusCard(ThemeData theme) {
    final reminderColors = theme.extension<ReminderColors>()!;
    final Color activeColor = isKilometer ? reminderColors.kilometerColor : reminderColors.timeColor;

    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(32.r),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.04),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          if (isKilometer) ...[
            Row(
              children: [
                Expanded(
                  child: _buildKMInputField(
                    theme,
                    'از (کیلومتر انجام)',
                    _fromKmController,
                    hintText: '۱۸۰,۰۰۰',
                    icon: Icons.speed_outlined,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: _buildKMInputField(
                    theme,
                    'تا (کیلومتر بعدی)',
                    _toKmController,
                    hintText: '۱۹۰,۰۰۰',
                    icon: Icons.flag_outlined,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: Divider(color: activeColor.withValues(alpha: 0.1), thickness: 1),
            ),
          ],
          if (!isKilometer)
            Row(
              children: [
                Expanded(
                  child: _buildDateField(
                    theme,
                    'تاریخ انجام',
                    _selectedDate,
                    () => setState(() {
                      _showDatePicker = !_showDatePicker;
                      _showNextDatePicker = false;
                    }),
                    icon: Icons.calendar_today_outlined,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: _buildDateField(
                    theme,
                    'تاریخ یادآوری',
                    _selectedNextDate,
                    () => setState(() {
                      _showNextDatePicker = !_showNextDatePicker;
                      _showDatePicker = false;
                    }),
                    icon: Icons.notification_important_outlined,
                  ),
                ),
              ],
            )
          else
            _buildDateField(
              theme,
              'تاریخ انجام سرویس',
              _selectedDate,
              () => setState(() {
                _showDatePicker = !_showDatePicker;
                _showNextDatePicker = false;
              }),
              icon: Icons.calendar_today_outlined,
            ),
        ],
      ),
    );
  }

  Widget _buildCalendarCard(ThemeData theme, String title, Jalali date, Function(Jalali) onSelected) {
    final reminderColors = theme.extension<ReminderColors>()!;
    final Color activeColor = isKilometer ? reminderColors.kilometerColor : reminderColors.timeColor;

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(32.r),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.04),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.r),
            child: Text(
              title,
              style: TextStyle(
                fontFamily: 'BonyadeKoodak',
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
                color: theme.colorScheme.onSurface,
              ),
            ),
          ),
          PersianCalendarView(
            initialDate: date,
            onDateSelected: onSelected,
          ),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }

  Widget _buildBottomAction(ThemeData theme) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 32.h),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32.r)),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: _buildSubmitButton(theme),
    );
  }

  Widget _buildTypeSelector(ThemeData theme) {
    final reminderColors = theme.extension<ReminderColors>()!;
    final Color activeColor = isKilometer ? reminderColors.kilometerColor : reminderColors.timeColor;

    return Container(
      padding: EdgeInsets.all(6.r),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.04),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildTypeButton(theme, 'زمانی', !isKilometer, reminderColors.timeColor, () => setState(() {
              isKilometer = false;
              _selectedServiceTypeId = null;
              _selectedSubServiceIds.clear();
              _dropdownResetKey++;
              
              // Reset inputs
              _descriptionController.clear();
              _fromKmController.text = '۱۸۰,۰۰۰';
              _toKmController.text = '۱۹۰,۰۰۰';
              _selectedDate = DateTime.now();
              _selectedNextDate = DateTime.now().add(const Duration(days: 90));
              _showDatePicker = false;
              _showNextDatePicker = false;
            })),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: _buildTypeButton(theme, 'کیلومتری', isKilometer, reminderColors.kilometerColor, () => setState(() {
              isKilometer = true;
              _selectedServiceTypeId = null;
              _selectedSubServiceIds.clear();
              _dropdownResetKey++;
              
              // Reset inputs
              _descriptionController.clear();
              _fromKmController.text = '۱۸۰,۰۰۰';
              _toKmController.text = '۱۹۰,۰۰۰';
              _selectedDate = DateTime.now();
              _selectedNextDate = DateTime.now().add(const Duration(days: 90));
              _showDatePicker = false;
              _showNextDatePicker = false;
            })),
          ),
        ],
      ),
    );
  }

  Widget _buildTypeButton(ThemeData theme, String title, bool isSelected, Color activeColor, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected ? activeColor : Colors.transparent,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? theme.colorScheme.surface : theme.colorScheme.onSurfaceVariant,
              fontSize: 14.sp,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              fontFamily: 'BonyadeKoodak',
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildKMInputField(ThemeData theme, String label, TextEditingController controller, {String? hintText, IconData? icon}) {
    final reminderColors = theme.extension<ReminderColors>()!;
    final Color activeColor = isKilometer ? reminderColors.kilometerColor : reminderColors.timeColor;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 4.w),
          child: Text(
            label,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 12.sp,
              color: theme.colorScheme.onSurfaceVariant,
              fontFamily: 'BonyadeKoodak',
            ),
          ),
        ),
        SizedBox(height: 8.h),
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.right,
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontSize: 14.sp,
            color: theme.colorScheme.onSurface,
            fontFamily: 'BonyadeKoodak',
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: theme.colorScheme.surfaceContainerHighest,
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 14.sp,
              color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
              fontFamily: 'BonyadeKoodak',
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            suffixIcon: icon != null ? Icon(icon, color: activeColor.withValues(alpha: 0.6), size: 20.sp) : null,
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
              borderSide: BorderSide(color: activeColor.withValues(alpha: 0.3), width: 1.5),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField(ThemeData theme, String label, String? value, List<String> options, Function(String?) onChanged, {double? width, IconData? icon, String? hint, bool isLoading = false, VoidCallback? onRetry}) {
    final reminderColors = theme.extension<ReminderColors>()!;
    final Color activeColor = isKilometer ? reminderColors.kilometerColor : reminderColors.timeColor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 4.w),
          child: Text(
            label,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 12.sp,
              color: theme.colorScheme.onSurfaceVariant,
              fontFamily: 'BonyadeKoodak',
            ),
          ),
        ),
        SizedBox(height: 8.h),
        LayoutBuilder(
          builder: (context, constraints) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: DropdownMenu<String>(
                key: ValueKey(_dropdownResetKey),
                initialSelection: value,
                width: width ?? constraints.maxWidth,
                menuHeight: 300.h,
                enableSearch: false,
                hintText: hint,
                trailingIcon: isLoading 
                  ? SizedBox(width: 20.r, height: 20.r, child: CircularProgressIndicator(strokeWidth: 2, color: activeColor))
                  : (options.isEmpty && onRetry != null)
                    ? IconButton(onPressed: onRetry, icon: Icon(Icons.refresh_rounded, color: theme.colorScheme.error, size: 20.sp), padding: EdgeInsets.zero, constraints: const BoxConstraints())
                    : Icon(Icons.keyboard_arrow_down_rounded, color: activeColor, size: 24.sp),
                selectedTrailingIcon: Icon(Icons.keyboard_arrow_up_rounded, color: activeColor, size: 24.sp),
                leadingIcon: icon != null ? Icon(icon, color: activeColor.withValues(alpha: 0.6), size: 20.sp) : null,
                textStyle: TextStyle(
                  fontSize: 14.sp,
                  color: theme.colorScheme.onSurface,
                  fontFamily: 'BonyadeKoodak',
                ),
                menuStyle: MenuStyle(
                  backgroundColor: WidgetStateProperty.all(theme.colorScheme.surface),
                  surfaceTintColor: WidgetStateProperty.all(theme.colorScheme.surface),
                  elevation: WidgetStateProperty.all(15),
                  shadowColor: WidgetStateProperty.all(theme.colorScheme.onSurface.withValues(alpha: 0.2)),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                ),
                inputDecorationTheme: InputDecorationTheme(
                  filled: true,
                  fillColor: theme.colorScheme.surfaceContainerHighest,
                  hoverColor: Colors.transparent,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
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
                    borderSide: BorderSide(color: activeColor.withValues(alpha: 0.3), width: 1.5),
                  ),
                ),
                dropdownMenuEntries: options.map((String option) {
                  final bool isSelected = option == value;
                  return DropdownMenuEntry<String>(
                    value: option,
                    label: option,
                    style: MenuItemButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                      backgroundColor: isSelected ? activeColor.withValues(alpha: 0.05) : Colors.transparent,
                      foregroundColor: isSelected ? activeColor : theme.colorScheme.onSurface,
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
                            color: isSelected ? activeColor : theme.colorScheme.onSurface,
                          ),
                        ),
                        if (isSelected)
                          Icon(
                            Icons.check_circle_rounded,
                            color: activeColor,
                            size: 18.sp,
                          ),
                      ],
                    ),
                  );
                }).toList(),
                onSelected: onChanged,
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildMultiSelectSubServices(ThemeData theme) {
    if (_selectedServiceTypeId == null) return const SizedBox.shrink();
    
    final reminderColors = theme.extension<ReminderColors>()!;
    final Color activeColor = isKilometer ? reminderColors.kilometerColor : reminderColors.timeColor;
    
    final selectedType = _reminderTypes.firstWhere(
      (element) => element.id == _selectedServiceTypeId, 
      orElse: () => ReminderTypeEntity(id: '', title: '', subItems: [])
    );
    final subServices = selectedType.subItems;

    if (subServices.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 4.w),
          child: Text(
            'زیر مجموعه عا',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 12.sp,
              color: theme.colorScheme.onSurfaceVariant,
              fontFamily: 'BonyadeKoodak',
            ),
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          padding: EdgeInsets.all(4.r),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Column(
            children: subServices.map((sub) {
              final isSelected = _selectedSubServiceIds.contains(sub.id);
              return InkWell(
                onTap: () {
                  setState(() {
                    if (isSelected) {
                      _selectedSubServiceIds.remove(sub.id);
                    } else {
                      _selectedSubServiceIds.add(sub.id);
                    }
                  });
                },
                borderRadius: BorderRadius.circular(12.r),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        sub.title,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: isSelected ? activeColor : theme.colorScheme.onSurface,
                          fontFamily: 'BonyadeKoodak',
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: EdgeInsets.all(2.r),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isSelected ? activeColor : Colors.transparent,
                          border: Border.all(
                            color: isSelected ? activeColor : theme.colorScheme.outline.withValues(alpha: 0.5),
                            width: 2,
                          ),
                        ),
                        child: Icon(
                          Icons.check,
                          size: 14.sp,
                          color: isSelected ? theme.colorScheme.onPrimary : Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildDateField(ThemeData theme, String label, DateTime date, VoidCallback onTap, {IconData? icon}) {
    final reminderColors = theme.extension<ReminderColors>()!;
    final Color activeColor = isKilometer ? reminderColors.kilometerColor : reminderColors.timeColor;

    final jalali = Jalali.fromDateTime(date);
    final dateText = _toPersianDigit('${jalali.year}/${jalali.month.toString().padLeft(2, '0')}/${jalali.day.toString().padLeft(2, '0')}');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 4.w),
          child: Text(
            label,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 12.sp,
              color: theme.colorScheme.onSurfaceVariant,
              fontFamily: 'BonyadeKoodak',
            ),
          ),
        ),
        SizedBox(height: 8.h),
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  dateText,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: theme.colorScheme.onSurface,
                    fontFamily: 'BonyadeKoodak',
                  ),
                ),
                Icon(icon ?? Icons.calendar_today_rounded, color: activeColor, size: 20.sp),

              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDescriptionField(ThemeData theme) {
    final reminderColors = theme.extension<ReminderColors>()!;
    final Color activeColor = isKilometer ? reminderColors.kilometerColor : reminderColors.timeColor;

    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(32.r),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.04),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: TextField(
        controller: _descriptionController,
        maxLines: 4,
        textAlign: TextAlign.right,
        textDirection: TextDirection.rtl,
        style: TextStyle(
          fontSize: 14.sp,
          color: theme.colorScheme.onSurface,
          fontFamily: 'BonyadeKoodak',
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: theme.colorScheme.surfaceContainerHighest,
          hintText: 'توضیحات خود را اینجا بنویسید...',
          hintStyle: TextStyle(
            fontSize: 14.sp,
            color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
            fontFamily: 'BonyadeKoodak',
          ),
          contentPadding: EdgeInsets.all(16.r),
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
            borderSide: BorderSide(color: activeColor.withValues(alpha: 0.3), width: 1.5),
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

  Widget _buildSubmitButton(ThemeData theme) {
    return BlocConsumer<RemindersBloc, RemindersState>(
      listener: (context, state) {
        if (state is AddReminderSuccess) {
          CstmSnackBar.showSuccess(context, 'یادآور با موفقیت ثبت شد');
          emitOperation(EnumAppOperationType.refresh, 'reminders');
          context.pop(true); // Return true to indicate success
        } else if (state is AddReminderError) {
          CstmSnackBar.showError(context, state.message);
        } else if (state is EditReminderSuccess) {
          CstmSnackBar.showSuccess(context, 'یادآور با موفقیت بروزرسانی شد');
          emitOperation(EnumAppOperationType.refresh, 'reminders');
          context.pop(true);
        } else if (state is EditReminderError) {
          CstmSnackBar.showError(context, state.message);
        }
      },
      builder: (context, state) {
        final bool isLoading = state is AddReminderLoading || state is EditReminderLoading;
        final reminderColors = theme.extension<ReminderColors>()!;
        final Color activeColor = isKilometer ? reminderColors.kilometerColor : reminderColors.timeColor;

        return SizedBox(
          width: double.infinity,
          height: 56.h,
          child: ElevatedButton(
            onPressed: isLoading
                ? null
                : () {
                    final selectedType = _reminderTypes.firstWhere(
                      (e) => e.id == _selectedServiceTypeId,
                      orElse: () => ReminderTypeEntity(id: '', title: '', subItems: []),
                    );

                    final List<String> selectedNames = selectedType.subItems
                        .where((sub) => _selectedSubServiceIds.contains(sub.id))
                        .map((sub) => sub.title)
                        .toList();

                    final request = req.AddReminderRequest(
                      reminderTypeId: (_selectedServiceTypeId != null && _selectedServiceTypeId!.isNotEmpty)
                          ? _selectedServiceTypeId!
                          : (widget.extra?.reminderTypeId ?? ''),
                      reminderSubItems: _selectedSubServiceIds.isNotEmpty ? _selectedSubServiceIds : null,
                      kilometerLogs: isKilometer
                          ? [
                              req.KilometerLog(
                                doneKm: _parsePersianInt(_fromKmController.text),
                                nextKm: _parsePersianInt(_toKmController.text),
                                date: _formatDateJalali(_selectedDate),
                                items: selectedNames,
                              )
                            ]
                          : null,
                      timeLogs: !isKilometer
                          ? [
                              req.TimeLog(
                                doneDate: _formatDateJalali(_selectedDate),
                                nextDate: _formatDateJalali(_selectedNextDate),
                                items: selectedNames,
                              )
                            ]
                          : null,
                      description: _descriptionController.text.isNotEmpty ? _descriptionController.text : 'یادآور جدید',
                    );

                    if (widget.reminderId != null) {
                      context.read<RemindersBloc>().add(EditReminderEvent(widget.reminderId!, request));
                    } else {
                      context.read<RemindersBloc>().add(AddReminderEvent(request));
                    }
                  },
            style: ElevatedButton.styleFrom(
              backgroundColor: activeColor,
              foregroundColor: theme.colorScheme.surface,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
            ),
            child: isLoading
                ? SizedBox(
                    height: 24.h,
                    width: 24.h,
                    child: CircularProgressIndicator(color: theme.colorScheme.surface, strokeWidth: 2.5),
                  )
                : Text(
                    widget.reminderId != null ? 'بروزرسانی یادآور' : 'ثبت یادآور',
                    style: TextStyle(
                      color: theme.colorScheme.surface,
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
