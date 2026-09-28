import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/bloc/app/app_bloc.dart';
import '../../../../core/bloc/error/error_bloc.dart';
import '../../../../core/services/locator.dart';
import '../../../../core/widgets/cstm_snakbar.dart';
import '../../../../core/widgets/app_bottom_sheet.dart';
import '../../domain/entity/reminders_entity.dart';
import '../base/base_reminders_stateful_widget_state.dart';
import '../bloc/reminders_bloc.dart';
import '../widget/reminder_details_shimmer.dart';
import '../../../../core/themes/theme_main.dart';
import '../widget/reminder_info_card.dart';
import '../widget/service_management_section.dart';
import '../../../feature_manage_services/domain/entity/manage_services_entity.dart';
import '../../domain/entity/reminder_type_entity.dart';

class ScreenReminderDetails extends StatefulWidget {
  final String reminderId;
  const ScreenReminderDetails({super.key, required this.reminderId});

  @override
  State<ScreenReminderDetails> createState() => _ScreenReminderDetailsState();
}

class _ScreenReminderDetailsState extends BaseRemindersStatefulWidgetState<ScreenReminderDetails, RemindersBloc> {
  _ScreenReminderDetailsState() : super(locator<RemindersBloc>());

  RemindersEntity? _currentReminder;
  List<ManageServicesEntity> _dynamicServices = [];
  List<ReminderSubItemEntity> _subItems = [];

  @override
  void initState() {
    super.initState();
    bloc.add(GetReminderEvent(widget.reminderId));
    bloc.add(const FetchServicesForReminderEvent());
  }

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
    return BlocConsumer<RemindersBloc, RemindersState>(
      listener: (context, state) {
        if (state is GetReminderSuccess) {
          _currentReminder = state.reminder;
          if (_currentReminder?.reminderTypeId != null) {
            bloc.add(FetchSubItemsByReminderTypeEvent(_currentReminder!.reminderTypeId!));
          }
        } else if (state is AddLogSuccess) {
          CstmSnackBar.showSuccess(context, 'لاگ جدید با موفقیت ثبت شد');
          emitOperation(EnumAppOperationType.refresh, 'reminders');
          bloc.add(GetReminderEvent(widget.reminderId));
        } else if (state is ServicesForReminderLoaded) {
          setState(() {
            _dynamicServices = state.services.cast<ManageServicesEntity>();
          });
        } else if (state is SubItemsByReminderTypeLoaded) {
          setState(() {
            _subItems = state.subItems;
          });
        } else if (state is CompleteReminderSuccess) {
          CstmSnackBar.showSuccess(context, 'یادآور با موفقیت بروزرسانی شد');
          emitOperation(EnumAppOperationType.refresh, 'reminders');
          bloc.add(GetReminderEvent(widget.reminderId));
        } else if (state is DeleteReminderSuccess) {
          CstmSnackBar.showSuccess(context, 'یادآور با موفقیت حذف شد');
          Navigator.pop(context, true);
        }
      },
      builder: (context, state) {
        if (state is GetReminderLoading || _currentReminder == null) {
          return const Scaffold(body: ReminderDetailsShimmer());
        }

        if (state is GetReminderError) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.message),
                  SizedBox(height: 16.h),
                  ElevatedButton(
                    onPressed: () => bloc.add(GetReminderEvent(widget.reminderId)),
                    child: const Text('تلاش مجدد'),
                  ),
                ],
              ),
            ),
          );
        }

        final reminder = _currentReminder!;
        final theme = Theme.of(context);
        final colorScheme = theme.colorScheme;
        final reminderColors = theme.extension<ReminderColors>()!;
        
        Color accentColor = reminder.progressColor;
        // Map semantic colors from entity to theme colors
        if (accentColor.value == Colors.blue.value || 
            accentColor.value == const Color(0xFF3F51B5).value) {
          accentColor = reminderColors.timeColor;
        } else if (accentColor.value == Colors.orange.value || 
                   accentColor.value == const Color(0xFFE65100).value) {
          accentColor = reminderColors.kilometerColor;
        } else if (accentColor.value == Colors.red.value) {
          accentColor = colorScheme.error;
        }

        return Scaffold(
          backgroundColor: accentColor.withValues(alpha: 0.03),
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReminderInfoCard(reminder: reminder),
                      SizedBox(height: 32.h),
                      ServiceManagementSection(
                        reminder: reminder,
                        bloc: bloc,
                        state: state,
                        dynamicServices: _dynamicServices,
                        subItems: _subItems,
                        onSuccess: () {},
                      ),
                      SizedBox(height: 100.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomSheet: _buildBottomActions(theme, reminder, state),
        );
      },
    );
  }

  Widget _buildBottomActions(ThemeData theme, RemindersEntity reminder, RemindersState state) {
    final bool isDeleting = state is DeleteReminderLoading;
    final colorScheme = theme.colorScheme;

    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 32.h),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32.r)),
        boxShadow: [
          BoxShadow(
            color: colorScheme.onSurface.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              height: 56.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: ElevatedButton(
                onPressed: () async {
                  final result = await context.pushNamed(
                    'edit_reminder',
                    pathParameters: {'id': reminder.id},
                    extra: reminder,
                  );

                  if (result == true) {
                    bloc.add(GetReminderEvent(widget.reminderId));
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  foregroundColor: colorScheme.onPrimary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
                  elevation: 0,
                ),
                child: Text(
                  'ویرایش یادآور',
                  style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w900, fontFamily: 'BonyadeKoodak'),
                ),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: SizedBox(
              height: 56.h,
              child: OutlinedButton(
                onPressed: isDeleting ? null : () => _showDeleteDialog(context, reminder),
                style: OutlinedButton.styleFrom(
                  foregroundColor: colorScheme.error,
                  side: BorderSide(color: colorScheme.error.withValues(alpha: 0.2), width: 1.5),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
                ),
                child: isDeleting
                    ? SizedBox(height: 24.h, width: 24.h, child: CircularProgressIndicator(color: colorScheme.error, strokeWidth: 2.5))
                    : Text(
                        'حذف',
                        style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w900, fontFamily: 'BonyadeKoodak'),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, RemindersEntity reminder) {
    final theme = Theme.of(context);
    AppBottomSheet.show(
      context,
      title: 'حذف یادآور',
      icon: Icons.delete_outline_rounded,
      child: Text(
        'آیا از حذف این یادآور اطمینان دارید؟ این عمل غیرقابل بازگشت است.',
        style: TextStyle(fontFamily: 'BonyadeKoodak', color: theme.colorScheme.onSurfaceVariant),
        textAlign: TextAlign.right,
      ),
      actions: [
        OutlinedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('انصراف', style: TextStyle(fontFamily: 'BonyadeKoodak')),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            bloc.add(DeleteReminderEvent(reminder.id));
          },
          style: ElevatedButton.styleFrom(backgroundColor: theme.colorScheme.error, foregroundColor: theme.colorScheme.onError),
          child: const Text('حذف', style: TextStyle(fontFamily: 'BonyadeKoodak')),
        ),
      ],
    );
  }
}
