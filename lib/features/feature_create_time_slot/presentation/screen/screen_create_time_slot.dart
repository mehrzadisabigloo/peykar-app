import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/bloc/app/app_bloc.dart';
import '../../../../core/widgets/cstm_snakbar.dart';
import '../../../../core/bloc/error/error_bloc.dart';
import '../../../../core/services/locator.dart';
import '../../../../core/utils/jalali_date.dart';
import '../../../../core/widgets/app_bottom_sheet.dart';
import '../../../../core/widgets/empty_state_widget.dart';
import '../../../../core/widgets/error_state_widget.dart';
import '../../../feature_reminders/presentation/widget/persian_calendar_view.dart';
import '../base/base_create_time_slot_stateful_widget_state.dart';
import '../bloc/create_time_slot_bloc.dart';
import '../../domain/entity/create_time_slot_entity.dart';
import '../widget/add_time_slot_form.dart';
import '../widget/date_navigator.dart';
import '../widget/time_slot_card.dart';
import '../widget/time_slot_shimmer.dart';
import '../../../../core/widgets/unified_time_picker_modal.dart';
import '../../../../core/themes/theme_main.dart';

class ScreenCreateTimeSlot extends StatefulWidget {
  const ScreenCreateTimeSlot({super.key});

  @override
  State<ScreenCreateTimeSlot> createState() => _ScreenCreateTimeSlotState();
}

class _ScreenCreateTimeSlotState extends BaseCreateTimeSlotStatefulWidgetState<ScreenCreateTimeSlot, CreateTimeSlotBloc> {
  _ScreenCreateTimeSlotState() : super(locator<CreateTimeSlotBloc>());

  final _capacityController = TextEditingController(text: '1');
  final _startTimeController = TextEditingController();
  final _endTimeController = TextEditingController();
  final int _defaultCapacity = 1;
  bool _isAddSectionExpanded = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    final now = DateTime.now();
    final jalali = Jalali.fromDateTime(now);
    bloc.add(FetchTimeSlotsEvent(_formatJalali(jalali)));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _capacityController.dispose();
    _startTimeController.dispose();
    _endTimeController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      if (bloc.state is CreateTimeSlotInitial) {
        final state = bloc.state as CreateTimeSlotInitial;
        if (!state.isLoading && state.hasNextPage) {
          bloc.add(FetchTimeSlotsEvent(
            _formatJalali(state.selectedDate),
            page: state.currentPage + 1,
            isRefresh: false,
          ));
        }
      }
    }
  }

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocConsumer<CreateTimeSlotBloc, CreateTimeSlotState>(
        listener: (context, state) {
          if (state is CreateTimeSlotInitial) {
            if (state.successMessage != null) {
              CstmSnackBar.showSuccess(context, state.successMessage!);
              setState(() {
                _isAddSectionExpanded = false;
              });
            } else if (state.error != null) {
              CstmSnackBar.showError(context, state.error!);
            }
          }
        },
        builder: (context, state) {
          if (state is CreateTimeSlotInitial) {
            return Column(
              children: [
                SizedBox(height: 20.h),
                DateNavigator(
                  selectedDate: state.selectedDate,
                  showCalendar: state.showCalendar,
                  onToggleCalendar: () => bloc.add(const ToggleCalendarEvent()),
                  onPrevDate: () => bloc.add(const ChangeDateStepEvent(next: false)),
                  onNextDate: () => bloc.add(const ChangeDateStepEvent(next: true)),
                  toPersianDigit: _toPersianDigit,
                ),
                ClipRect(
                  child: AnimatedAlign(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                    alignment: Alignment.topCenter,
                    heightFactor: state.showCalendar ? 1.0 : 0.0,
                    child: Padding(
                      padding: EdgeInsets.only(top: 16.h, right: 15.w, left: 15.w),
                      child: PersianCalendarView(
                        initialDate: state.selectedDate,
                        onDateSelected: (date) {
                          bloc.add(ChangeSelectedDateEvent(date));
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    controller: _scrollController,
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                    children: [
                      AddTimeSlotForm(
                        isExpanded: _isAddSectionExpanded,
                        onToggleExpansion: () => setState(() => _isAddSectionExpanded = !_isAddSectionExpanded),
                        startTimeController: _startTimeController,
                        endTimeController: _endTimeController,
                        capacityController: _capacityController,
                        defaultCapacity: _defaultCapacity,
                        onStartTimePick: () => _showTimePicker(isStart: true),
                        onEndTimePick: () => _showTimePicker(isStart: false),
                        isLoading: state.isLoading,
                        onAdd: (start, end, capacity) {
                          final formattedStart = _formatTime(start);
                          final formattedEnd = _formatTime(end);
                          bloc.add(AddTimeSlotEvent(startTime: formattedStart, endTime: formattedEnd, capacity: capacity));
                          setState(() {
                            _startTimeController.text = formattedEnd;
                            _endTimeController.text = '';
                          });
                        },
                      ),
                      SizedBox(height: 24.h),
                      if (state.remoteSlots.isNotEmpty) ...[
                        _buildSectionTitle(
                          'بازه‌های ثبت شده (${_toPersianDigit(state.remoteSlots.length.toString())})',
                          trailing: _buildDayStatusActions(state),
                        ),
                        SizedBox(height: 12.h),
                        _buildRemoteSlotsList(state),
                      ] else if (!state.isLoading && state.error == null) ...[
                        SizedBox(height: 40.h),
                        const EmptyStateWidget(
                          title: 'هیچ بازه‌ای یافت نشد',
                          description: 'برای این تاریخ هنوز هیچ بازه زمانی ثبت نشده است. می‌توانید از بخش بالا بازه جدید اضافه کنید.',
                          icon: Icons.event_busy_rounded,
                        ),
                      ] else if (!state.isLoading && state.error != null && state.isFetchError) ...[
                        SizedBox(height: 40.h),
                        ErrorStateWidget(
                          message: state.error!,
                          onRetry: () => bloc.add(FetchTimeSlotsEvent(_formatJalali(state.selectedDate))),
                        ),
                      ] else if (!state.isLoading && state.error != null && !state.isFetchError && state.remoteSlots.isEmpty) ...[
                        SizedBox(height: 40.h),
                        const EmptyStateWidget(
                          title: 'هیچ بازه‌ای یافت نشد',
                          description: 'برای این تاریخ هنوز هیچ بازه زمانی ثبت نشده است. می‌توانید از بخش بالا بازه جدید اضافه کنید.',
                          icon: Icons.event_busy_rounded,
                        ),
                      ],
                      if (state.isLoading) 
                        const TimeSlotShimmer(),
                      SizedBox(height: 120.h),
                    ],
                  ),
                ),
              ],
            );
          }
          return const SizedBox();
        },
      ),
      bottomNavigationBar: const SizedBox(height: 0),
    );
  }

  Widget _buildSectionTitle(String title, {Widget? trailing}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w900,
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.87),
            fontFamily: 'BonyadeKoodak',
          ),
        ),
        if (trailing != null) trailing,
      ],
    );
  }

  Widget _buildDayStatusActions(CreateTimeSlotInitial state) {
    final hasActive = state.remoteSlots.any((s) => s.status == 'Active');
    final hasDeactive = state.remoteSlots.any((s) => s.status == 'Deactive');

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (hasActive)
          _buildActionButton(
            onPressed: state.isLoading ? null : () => _showDayStatusDialog(false),
            icon: Icons.visibility_off_rounded,
            label: 'بستن نوبت‌های امروز',
            color: Theme.of(context).colorScheme.error,
          ),
        if (!hasActive && hasDeactive)
          _buildActionButton(
            onPressed: state.isLoading ? null : () => _showDayStatusDialog(true),
            icon: Icons.visibility_rounded,
            label: 'فعال‌سازی نوبت‌های امروز',
            color: StatusColors.of(context).success,
          ),
      ],
    );
  }

  Widget _buildActionButton({
    required VoidCallback? onPressed,
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return TextButton.icon(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: color,
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        backgroundColor: color.withValues(alpha: 0.05),
      ),
      icon: Icon(icon, size: 16.sp),
      label: Text(
        label,
        style: TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.bold,
          fontFamily: 'BonyadeKoodak',
        ),
      ),
    );
  }

  void _showDayStatusDialog(bool activate) {
    AppBottomSheet.show(
      context,
      title: activate ? 'فعال‌سازی تمام بازه‌ها' : 'غیرفعال‌سازی تمام بازه‌ها',
      icon: activate ? Icons.visibility_rounded : Icons.visibility_off_rounded,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Text(
          activate
              ? 'آیا از فعال‌سازی تمام بازه‌های زمانی غیرفعال این روز اطمینان دارید؟'
              : 'آیا از غیرفعال‌سازی تمام بازه‌های زمانی فعال این روز اطمینان دارید؟',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14.sp,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            fontFamily: 'BonyadeKoodak',
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('انصراف', style: TextStyle(fontFamily: 'BonyadeKoodak')),
        ),
        ElevatedButton(
          onPressed: () {
            bloc.add(ToggleDayStatusEvent(activate: activate));
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: activate ? StatusColors.of(context).success : Theme.of(context).colorScheme.error,
            foregroundColor: Theme.of(context).colorScheme.surface,
          ),
          child: Text(activate ? 'فعال‌سازی' : 'غیرفعال‌سازی', style: TextStyle(fontFamily: 'BonyadeKoodak', color: Theme.of(context).colorScheme.surface)),
        ),
      ],
    );
  }

  void _showTimePicker({required bool isStart}) async {
    final controller = isStart ? _startTimeController : _endTimeController;
    TimeOfDay initialTime = TimeOfDay.now();
    
    if (controller.text.isNotEmpty) {
      final parts = controller.text.split(':');
      if (parts.length >= 2) {
        initialTime = TimeOfDay(
          hour: int.tryParse(parts[0]) ?? 0,
          minute: int.tryParse(parts[1]) ?? 0,
        );
      }
    }

    UnifiedTimePickerModal.show(
      context,
      title: isStart ? 'انتخاب زمان شروع' : 'انتخاب زمان پایان',
      initialTime: initialTime,
      onTimeSelected: (picked) {
        setState(() {
          final timeStr = '${picked.hour.toString().padLeft(2, '0')}:${picked.minute.toString().padLeft(2, '0')}';
          if (isStart) {
            _startTimeController.text = timeStr;
          } else {
            _endTimeController.text = timeStr;
          }
        });
      },
    );
  }

  Widget _buildRemoteSlotsList(CreateTimeSlotInitial state) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: state.remoteSlots.length,
      itemBuilder: (context, index) {
        final slot = state.remoteSlots[index];
        final bool hasReservations = slot.reservations != null && slot.reservations!.isNotEmpty;
        
        return TimeSlotCard(
          startTime: slot.startTime,
          endTime: slot.endTime,
          capacity: slot.capacity,
          status: slot.status,
          isFull: slot.isFull,
          reservations: slot.reservations,
          // onTap: hasReservations ? () => _showReservationDetails(slot) : null,
          onDelete: (!hasReservations && (slot.status == 'free' || slot.status == 'Active')) 
              ? () => _showDeleteDialog(slot.id) 
              : null,
          toPersianDigit: _toPersianDigit,
          formatTime: _formatTime,
          isDeleting: state.deletingSlotId == slot.id,
        );
      },
    );
  }

  void _showReservationDetails(TimeSlotEntity slot) {
    if (slot.reservations == null || slot.reservations!.isEmpty) return;

    AppBottomSheet.show(
      context,
      title: 'لیست رزروها (${_toPersianDigit(slot.reservations!.length.toString())})',
      icon: Icons.groups_rounded,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.55,
        child: ListView.separated(
          padding: EdgeInsets.only(bottom: 20.h),
          itemCount: slot.reservations!.length,
          separatorBuilder: (context, index) => SizedBox(height: 16.h),
          itemBuilder: (context, index) {
            final reservation = slot.reservations![index];
            final user = reservation.user;
            final statusColor = _getStatusColor(reservation.status);

            return Container(
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(24.r),
                border: Border.all(color: Theme.of(context).colorScheme.outlineVariant, width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.03),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      // Avatar
                      Container(
                        width: 54.r,
                        height: 54.r,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.05),
                          borderRadius: BorderRadius.circular(18.r),
                        ),
                        child: Icon(Icons.person_outline_rounded, color: Theme.of(context).colorScheme.primary, size: 30.sp),
                      ),
                      SizedBox(width: 16.w),
                      // Info
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user != null ? '${user.firstName} ${user.lastName}' : 'نامشخص',
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w900,
                                fontFamily: 'BonyadeKoodak',
                                color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.87),
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Row(
                              children: [
                                Icon(Icons.phone_android_rounded, size: 12.sp, color: Theme.of(context).colorScheme.outline),
                                SizedBox(width: 6.w),
                                Text(
                                  user != null ? _toPersianDigit(user.mobile) : 'نامشخص',
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'BonyadeKoodak',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Status Badge
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                        decoration: BoxDecoration(
                          color: statusColor.withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(color: statusColor.withValues(alpha: 0.1), width: 0.5),
                        ),
                        child: Text(
                          _mapReservationStatus(reservation.status),
                          style: TextStyle(
                            fontSize: 10.5.sp,
                            fontWeight: FontWeight.w900,
                            color: statusColor,
                            fontFamily: 'BonyadeKoodak',
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (reservation.description != null && reservation.description!.isNotEmpty) ...[
                    SizedBox(height: 16.h),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(14.r),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceContainer,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.chat_bubble_outline_rounded, size: 14.sp, color: Theme.of(context).colorScheme.outline),
                              SizedBox(width: 8.w),
                              Text(
                                'توضیحات مشتری:',
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: 'BonyadeKoodak',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            reservation.description!,
                            style: TextStyle(
                              fontSize: 12.5.sp,
                              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.87),
                              height: 1.6,
                              fontFamily: 'BonyadeKoodak',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            );
          },
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.surface,
            elevation: 0,
            minimumSize: Size(double.infinity, 54.h),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
          ),
          child: Text(
            'متوجه شدم',
            style: TextStyle(
              fontFamily: 'BonyadeKoodak',
              fontWeight: FontWeight.w900,
              fontSize: 15.sp,
              color: Theme.of(context).colorScheme.surface,
            ),
          ),
        ),
      ],
    );
  }

  String _mapReservationStatus(String status) {
    switch (status.toLowerCase()) {
      case 'confirmed': return 'تایید شده';
      case 'pending': return 'در انتظار';
      case 'completed': return 'انجام شده';
      case 'cancelled': return 'لغو شده';
      default: return status;
    }
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'confirmed': return StatusColors.of(context).info;
      case 'pending': return StatusColors.of(context).warning;
      case 'completed': return StatusColors.of(context).success;
      case 'cancelled': return Theme.of(context).colorScheme.error;
      default: return Theme.of(context).colorScheme.outline;
    }
  }

  void _showDeleteDialog(String id) {
    final theme = Theme.of(context);
    
    AppBottomSheet.show(
      context,
      title: 'حذف بازه زمانی',
      icon: Icons.delete_outline_rounded,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'آیا از حذف این بازه زمانی اطمینان دارید؟ این عمل غیرقابل بازگشت است.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.sp,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              height: 1.6,
              fontFamily: 'BonyadeKoodak',
            ),
          ),
          SizedBox(height: 16.h),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          style: TextButton.styleFrom(
            foregroundColor: Theme.of(context).colorScheme.onSurfaceVariant,
            padding: EdgeInsets.symmetric(vertical: 14.h),
          ),
          child: const Text('انصراف', style: TextStyle(fontFamily: 'BonyadeKoodak', fontWeight: FontWeight.bold)),
        ),
        ElevatedButton(
          onPressed: () {
            bloc.add(DeleteTimeSlotEvent(id));
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.colorScheme.error,
            foregroundColor: theme.colorScheme.surface,
            elevation: 0,
            padding: EdgeInsets.symmetric(vertical: 14.h),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
          ),
          child: const Text('حذف شود', style: TextStyle(fontFamily: 'BonyadeKoodak', fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  String _formatTime(String time) {
    if (time.isEmpty) return '--:--';
    
    // If it contains a colon, ensure HH:mm format
    if (time.contains(':')) {
      final parts = time.split(':');
      if (parts.length >= 2) {
        final hour = parts[0].padLeft(2, '0');
        final minute = parts[1].padLeft(2, '0');
        return '$hour:$minute';
      }
    }
    
    // If it's just a number (hour only), convert to HH:00
    final hourOnly = int.tryParse(time);
    if (hourOnly != null) {
      if (time.length <= 2) {
        return '${time.padLeft(2, '0')}:00';
      }
    }

    // Handle 4 digits (HHmm) -> HH:mm
    if (time.length == 4 && int.tryParse(time) != null) {
      return '${time.substring(0, 2)}:${time.substring(2, 4)}';
    }
    
    // Handle 3 digits (Hmm) -> 0H:mm
    if (time.length == 3 && int.tryParse(time) != null) {
      return '0${time.substring(0, 1)}:${time.substring(1, 3)}';
    }

    return time;
  }

  String _toPersianDigit(String input) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const persian = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];
    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(english[i], persian[i]);
    }
    return input;
  }

  String _formatJalali(Jalali date) {
    return "${date.year}/${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}";
  }
}
