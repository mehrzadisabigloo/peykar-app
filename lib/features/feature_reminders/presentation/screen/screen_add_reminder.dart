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
import '../../../../core/themes/theme_main.dart';
import '../../domain/entity/reminder_type_entity.dart';
import '../../domain/entity/reminders_entity.dart';
import '../../data/model/reminder_request_models.dart' as req;
import '../base/base_reminders_stateful_widget_state.dart';
import '../bloc/reminders_bloc.dart';
import '../widget/persian_calendar_view.dart';
import '../widget/reminder_type_selector.dart';
import '../widget/reminder_service_details_card.dart';
import '../widget/reminder_status_and_time_card.dart';
import '../widget/reminder_description_card.dart';
import '../widget/add_reminder_bottom_bar.dart';

class ScreenAddReminder extends StatefulWidget {
  final String? reminderId;
  final RemindersEntity? extra;
  const ScreenAddReminder({super.key, this.reminderId, this.extra});

  @override
  State<ScreenAddReminder> createState() => _ScreenAddReminderState();
}

class _ScreenAddReminderState
    extends BaseRemindersStatefulWidgetState<ScreenAddReminder, RemindersBloc> {
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

    _selectedServiceTypeId = reminder.reminderTypeId;
    _selectedSubServiceIds.clear();
    if (reminder.selectedSubItemIds != null) {
      _selectedSubServiceIds.addAll(reminder.selectedSubItemIds!);
    }

    if (isKilometer &&
        reminder.kilometerLogs != null &&
        reminder.kilometerLogs!.isNotEmpty) {
      final log = reminder.kilometerLogs!.first;
      _fromKmController.text = _toPersianDigit(log.doneKm.toString());
      _toKmController.text = _toPersianDigit(log.nextKm.toString());
      _selectedDate = _parseJalali(log.date) ?? DateTime.now();
    } else if (!isKilometer &&
        reminder.timeLogs != null &&
        reminder.timeLogs!.isNotEmpty) {
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
  Widget buildNinoWidget(
      BuildContext context, ErrorState errorState, AppBlocState appState) {
    final theme = Theme.of(context);
    final reminderColors = theme.extension<ReminderColors>()!;
    final Color activeColor =
        isKilometer ? reminderColors.kilometerColor : reminderColors.timeColor;

    return BlocListener<RemindersBloc, RemindersState>(
      listener: (context, state) {
        if (state is GetReminderSuccess) {
          _prefillData(state.reminder);
          setState(() {});
        } else if (state is ActiveReminderTypesLoaded) {
          setState(() {
            _reminderTypes = List.from(state.reminderTypes);

            if (widget.reminderId != null && widget.extra != null) {
              final currentTypeId = widget.extra!.reminderTypeId;
              if (currentTypeId != null &&
                  !_reminderTypes.any((e) => e.id == currentTypeId)) {
                _reminderTypes.add(ReminderTypeEntity(
                  id: currentTypeId,
                  title:
                      widget.extra!.reminderTypeTitle ?? widget.extra!.title,
                  subItems: [],
                ));
              }
            }

            if (widget.reminderId != null &&
                _selectedServiceTypeId == null &&
                widget.extra != null) {
              final type = _reminderTypes.firstWhere(
                (e) =>
                    e.id == widget.extra!.reminderTypeId ||
                    e.title ==
                        (widget.extra!.reminderTypeTitle ??
                            widget.extra!.title),
                orElse: () =>
                    ReminderTypeEntity(id: '', title: '', subItems: []),
              );
              if (type.id.isNotEmpty) {
                _selectedServiceTypeId = type.id;
              }
            }
          });
        } else if (state is ActiveReminderTypesError) {
          if (widget.reminderId != null && widget.extra != null) {
            setState(() {
              final currentTypeId = widget.extra!.reminderTypeId;
              if (currentTypeId != null) {
                _reminderTypes = [
                  ReminderTypeEntity(
                    id: currentTypeId,
                    title: widget.extra!.reminderTypeTitle ??
                        widget.extra!.title,
                    subItems: [],
                  )
                ];
                _selectedServiceTypeId = currentTypeId;
              }
            });
          }
          CstmSnackBar.showError(context, state.message);
        } else if (state is AddReminderSuccess) {
          CstmSnackBar.showSuccess(context, 'یادآور با موفقیت ثبت شد');
          emitOperation(EnumAppOperationType.refresh, 'reminders');
          context.pop(true);
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
      child: BlocBuilder<RemindersBloc, RemindersState>(
        builder: (context, state) {
          if (state is GetReminderLoading &&
              widget.reminderId != null &&
              _selectedServiceTypeId == null) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is GetReminderError) {
            return ErrorStateWidget(
              message: state.message,
              onRetry: () => bloc.add(GetReminderEvent(widget.reminderId!)),
            );
          }

          final bool isLoading =
              state is AddReminderLoading || state is EditReminderLoading;

          return Container(
            color: theme.colorScheme.surfaceContainerHighest
                .withValues(alpha: 0.4),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                        horizontal: 20.w, vertical: 24.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReminderTypeSelector(
                          isKilometer: isKilometer,
                          activeColor: activeColor,
                          onTimeSelected: () => setState(() {
                            isKilometer = false;
                            _selectedServiceTypeId = null;
                            _selectedSubServiceIds.clear();
                            _dropdownResetKey++;
                            _descriptionController.clear();
                            _fromKmController.text = '۱۸۰,۰۰۰';
                            _toKmController.text = '۱۹۰,۰۰۰';
                            _selectedDate = DateTime.now();
                            _selectedNextDate =
                                DateTime.now().add(const Duration(days: 90));
                            _showDatePicker = false;
                            _showNextDatePicker = false;
                          }),
                          onKilometerSelected: () => setState(() {
                            isKilometer = true;
                            _selectedServiceTypeId = null;
                            _selectedSubServiceIds.clear();
                            _dropdownResetKey++;
                            _descriptionController.clear();
                            _fromKmController.text = '۱۸۰,۰۰۰';
                            _toKmController.text = '۱۹۰,۰۰۰';
                            _selectedDate = DateTime.now();
                            _selectedNextDate =
                                DateTime.now().add(const Duration(days: 90));
                            _showDatePicker = false;
                            _showNextDatePicker = false;
                          }),
                        ),
                        SizedBox(height: 24.h),
                        _buildSectionTitle(theme, 'جزییات سرویس', activeColor),
                        SizedBox(height: 12.h),
                        ReminderServiceDetailsCard(
                          activeColor: activeColor,
                          reminderTypes: _reminderTypes,
                          selectedServiceTypeId: _selectedServiceTypeId,
                          selectedSubServiceIds: _selectedSubServiceIds,
                          dropdownResetKey: _dropdownResetKey,
                          isLoading: _reminderTypes.isEmpty &&
                              widget.reminderId == null,
                          onRetry: () => bloc
                              .add(const FetchActiveReminderTypesEvent()),
                          onServiceTypeChanged: (typeId) {
                            setState(() {
                              _selectedServiceTypeId = typeId;
                              _selectedSubServiceIds.clear();
                            });
                          },
                          onSubServiceToggled: (subId) {
                            setState(() {
                              if (_selectedSubServiceIds.contains(subId)) {
                                _selectedSubServiceIds.remove(subId);
                              } else {
                                _selectedSubServiceIds.add(subId);
                              }
                            });
                          },
                        ),
                        SizedBox(height: 24.h),
                        _buildSectionTitle(
                            theme, 'وضعیت کارکرد و زمان', activeColor),
                        SizedBox(height: 12.h),
                        ReminderStatusAndTimeCard(
                          isKilometer: isKilometer,
                          activeColor: activeColor,
                          fromKmController: _fromKmController,
                          toKmController: _toKmController,
                          selectedDate: _selectedDate,
                          selectedNextDate: _selectedNextDate,
                          toPersianDigit: _toPersianDigit,
                          onToggleDatePicker: () => setState(() {
                            _showDatePicker = !_showDatePicker;
                            _showNextDatePicker = false;
                          }),
                          onToggleNextDatePicker: () => setState(() {
                            _showNextDatePicker = !_showNextDatePicker;
                            _showDatePicker = false;
                          }),
                        ),
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
                        _buildSectionTitle(theme, 'توضیحات', activeColor),
                        SizedBox(height: 12.h),
                        ReminderDescriptionCard(
                          controller: _descriptionController,
                          activeColor: activeColor,
                        ),
                        SizedBox(height: 30.h),
                      ],
                    ),
                  ),
                ),
                AddReminderBottomBar(
                  isLoading: isLoading,
                  isEditMode: widget.reminderId != null,
                  activeColor: activeColor,
                  onSubmit: _submitReminder,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionTitle(ThemeData theme, String title, Color activeColor) {
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

  Widget _buildCalendarCard(ThemeData theme, String title, Jalali date,
      Function(Jalali) onSelected) {
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

  void _submitReminder() {
    final selectedType = _reminderTypes.firstWhere(
      (e) => e.id == _selectedServiceTypeId,
      orElse: () => ReminderTypeEntity(id: '', title: '', subItems: []),
    );

    final List<String> selectedNames = selectedType.subItems
        .where((sub) => _selectedSubServiceIds.contains(sub.id))
        .map((sub) => sub.title)
        .toList();

    final request = req.AddReminderRequest(
      reminderTypeId: (_selectedServiceTypeId != null &&
              _selectedServiceTypeId!.isNotEmpty)
          ? _selectedServiceTypeId!
          : (widget.extra?.reminderTypeId ?? ''),
      reminderSubItems:
          _selectedSubServiceIds.isNotEmpty ? _selectedSubServiceIds : null,
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
      description: _descriptionController.text.isNotEmpty
          ? _descriptionController.text
          : 'یادآور جدید',
    );

    if (widget.reminderId != null) {
      context
          .read<RemindersBloc>()
          .add(EditReminderEvent(widget.reminderId!, request));
    } else {
      context.read<RemindersBloc>().add(AddReminderEvent(request));
    }
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
    const persianDigits = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];
    String englishText = text;
    for (int i = 0; i < persianDigits.length; i++) {
      englishText = englishText.replaceAll(persianDigits[i], i.toString());
    }
    final cleaned = englishText.replaceAll(RegExp(r'\D'), '');
    return int.tryParse(cleaned) ?? 0;
  }
}
