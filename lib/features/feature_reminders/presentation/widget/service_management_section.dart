import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../domain/entity/reminders_entity.dart';
import '../bloc/reminders_bloc.dart';
import '../../../feature_manage_services/domain/entity/manage_services_entity.dart';
import '../../domain/entity/reminder_type_entity.dart';
import 'add_log_form.dart';
import 'service_history_timeline.dart';

class ServiceManagementSection extends StatefulWidget {
  final RemindersEntity reminder;
  final RemindersBloc bloc;
  final RemindersState state;
  final List<ManageServicesEntity> dynamicServices;
  final List<ReminderSubItemEntity> subItems;
  final VoidCallback onSuccess;

  const ServiceManagementSection({
    super.key,
    required this.reminder,
    required this.bloc,
    required this.state,
    required this.dynamicServices,
    required this.subItems,
    required this.onSuccess,
  });

  @override
  State<ServiceManagementSection> createState() => _ServiceManagementSectionState();
}

class _ServiceManagementSectionState extends State<ServiceManagementSection> {
  bool _isAddingLog = false;
  final GlobalKey _managementKey = GlobalKey();

  void _toggleAddLog() {
    setState(() {
      _isAddingLog = !_isAddingLog;
    });

    if (_isAddingLog) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Scrollable.ensureVisible(
          _managementKey.currentContext!,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOutQuad,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      key: _managementKey,
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(32.r),
        boxShadow: [
          BoxShadow(
            color: widget.reminder.progressColor.withValues(alpha: 0.12),
            blurRadius: 40,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: BlocListener<RemindersBloc, RemindersState>(
        bloc: widget.bloc,
        listener: (context, state) {
          if (state is AddLogSuccess || state is AddLogError) {
            setState(() => _isAddingLog = false);
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Top Section: Header & Add Form
            Padding(
              padding: EdgeInsets.all(24.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 4.w,
                            height: 24.h,
                            decoration: BoxDecoration(
                              color: widget.reminder.progressColor,
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Text(
                            'مدیریت سرویس',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w900,
                              color: colorScheme.onSurface,
                              fontFamily: 'BonyadeKoodak',
                            ),
                          ),
                        ],
                      ),
                      _buildAddAction(theme, widget.reminder.progressColor),
                    ],
                  ),

                  // Expandable Add Form
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: SizeTransition(
                          sizeFactor: CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn),
                          alignment: const Alignment(0, -1.0),
                          child: child,
                        ),
                      );
                    },
                    child: _isAddingLog
                        ? Column(
                            key: const ValueKey('add_form_internal'),
                            children: [
                              SizedBox(height: 32.h),
                              Row(
                                children: [
                                  Icon(Icons.edit_note_rounded, color: widget.reminder.progressColor, size: 24.sp),
                                  SizedBox(width: 10.w),
                                  Text(
                                    'ثبت گزارش جدید',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w900,
                                      color: colorScheme.onSurface,
                                      fontFamily: 'BonyadeKoodak',
                                    ),
                                  ),
                                ],
                              ),
                              Divider(height: 32.h, color: colorScheme.outlineVariant.withValues(alpha: 0.1)),
                              AddLogForm(
                                reminder: widget.reminder,
                                bloc: widget.bloc,
                                state: widget.state,
                                dynamicServices: widget.dynamicServices,
                                subItems: widget.subItems,
                                onSuccess: () {
                                  widget.onSuccess();
                                },
                              ),
                            ],
                          )
                        : const SizedBox.shrink(),
                  ),
                ],
              ),
            ),

            // 2. Bottom Section: History Timeline (Tinted)
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(24.r),
              decoration: BoxDecoration(
                color: widget.reminder.progressColor.withValues(alpha: 0.04),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(32.r)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.history_rounded, size: 18.sp, color: widget.reminder.progressColor.withValues(alpha: 0.4)),
                      SizedBox(width: 10.w),
                      Text(
                        'تاریخچه و سوابق',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
                          fontFamily: 'BonyadeKoodak',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  ServiceHistoryTimeline(reminder: widget.reminder),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddAction(ThemeData theme, Color accentColor) {
    final colorScheme = theme.colorScheme;
    final active = _isAddingLog;

    return Material(
      color: active ? colorScheme.error.withValues(alpha: 0.08) : accentColor.withValues(alpha: 0.08),
      borderRadius: BorderRadius.circular(16.r),
      child: InkWell(
        onTap: _toggleAddLog,
        borderRadius: BorderRadius.circular(16.r),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                active ? Icons.close_rounded : Icons.add_rounded,
                size: 20.sp,
                color: active ? colorScheme.error : accentColor,
              ),
              SizedBox(width: 8.w),
              Text(
                active ? 'انصراف' : 'ثبت جدید',
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w900,
                  color: active ? colorScheme.error : accentColor,
                  fontFamily: 'BonyadeKoodak',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
