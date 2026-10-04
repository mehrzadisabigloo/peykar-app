import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/bloc/app/app_bloc.dart';
import '../../../../core/bloc/error/error_bloc.dart';
import '../../../../core/services/locator.dart';
import '../../../../core/widgets/cstm_snakbar.dart';
import '../../../feature_create_time_slot/data/model/time_slot_model.dart';
import '../base/base_repair_shop_stateful_widget_state.dart';
import '../bloc/repair_shop_bloc.dart';
import '../widget/booking_bottom_bar.dart';
import '../widget/booking_confirmation_card.dart';
import '../widget/booking_date_selector.dart';
import '../widget/booking_time_slots_grid.dart';

class ScreenBooking extends StatefulWidget {
  final String? repairmanId;
  final String? shopName;
  const ScreenBooking({super.key, this.repairmanId, this.shopName});

  @override
  State<ScreenBooking> createState() => _ScreenBookingState();
}

class _ScreenBookingState extends BaseRepairShopStatefulWidgetState<
    ScreenBooking, RepairShopBloc> {
  _ScreenBookingState() : super(locator<RepairShopBloc>());

  int _currentStep = 1;
  String? _selectedTimeSlotId;
  String? _selectedDate;
  final TextEditingController _descriptionController =
      TextEditingController();
  List<TimeSlotModel> _availableSlots = [];
  bool _isLoadingSlots = false;

  @override
  void initState() {
    super.initState();
    _fetchTimeSlots();
  }

  void _fetchTimeSlots() {
    if (widget.repairmanId == null) return;
    bloc.add(FetchPublicTimeSlotsEvent(widget.repairmanId!));
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget buildNinoWidget(
      BuildContext context, ErrorState errorState, AppBlocState appState) {
    final theme = Theme.of(context);

    return BlocListener<RepairShopBloc, RepairShopState>(
      listener: (context, state) {
        if (state.timeSlotsStatus == TimeSlotsStatus.loading) {
          setState(() => _isLoadingSlots = true);
        } else if (state.timeSlotsStatus == TimeSlotsStatus.loaded) {
          setState(() {
            _isLoadingSlots = false;
            _availableSlots = state.timeSlots;
            if (_availableSlots.isNotEmpty && _selectedDate == null) {
              _selectedDate = _availableSlots.first.date;
            }
          });
        } else if (state.timeSlotsStatus == TimeSlotsStatus.error) {
          setState(() => _isLoadingSlots = false);
          CstmSnackBar.showError(context, state.timeSlotsError ?? 'خطا');
        } else if (state.reservationStatus == ReservationStatus.success) {
          setState(() {
            _currentStep = 3;
          });
        } else if (state.reservationStatus == ReservationStatus.error) {
          CstmSnackBar.showError(context, state.reservationError ?? 'خطا');
        }
      },
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          body: BlocBuilder<RepairShopBloc, RepairShopState>(
            builder: (context, state) {
              final bool isReservationSuccess =
                  state.reservationStatus == ReservationStatus.success ||
                      _currentStep == 3;
              final TimeSlotModel? selectedSlot = _selectedTimeSlotId != null
                  ? _availableSlots.firstWhere((s) => s.id == _selectedTimeSlotId,
                      orElse: () => _availableSlots.first)
                  : null;

              return Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (_currentStep == 1) ...[
                            SizedBox(height: 24.h),
                            BookingDateSelector(
                              availableSlots: _availableSlots,
                              selectedDate: _selectedDate,
                              toPersianDigit: _toPersianDigit,
                              onDateSelected: (date) {
                                setState(() => _selectedDate = date);
                              },
                            ),
                            SizedBox(height: 32.h),
                            BookingTimeSlotsGrid(
                              availableSlots: _availableSlots,
                              selectedDate: _selectedDate,
                              selectedTimeSlotId: _selectedTimeSlotId,
                              isLoadingSlots: _isLoadingSlots,
                              toPersianDigit: _toPersianDigit,
                              onSlotSelected: (slotId) {
                                setState(() => _selectedTimeSlotId = slotId);
                              },
                            ),
                            SizedBox(height: 32.h),
                          ],
                          if (_currentStep == 2 && !isReservationSuccess) ...[
                            SizedBox(height: 32.h),
                            _buildSectionTitle('تایید و ثبت نوبت'),
                            SizedBox(height: 16.h),
                            BookingConfirmationCard(
                              isSuccess: false,
                              selectedSlot: selectedSlot,
                              shopName: widget.shopName,
                              description: _descriptionController.text,
                              toPersianDigit: _toPersianDigit,
                            ),
                            SizedBox(height: 32.h),
                            _buildSectionTitle('توضیحات (اختیاری)'),
                            SizedBox(height: 12.h),
                            _buildDescriptionField(),
                            SizedBox(height: 32.h),
                          ],
                          if (isReservationSuccess) ...[
                            SizedBox(height: 32.h),
                            _buildSectionTitle('نوبت شما با موفقیت ثبت شد'),
                            SizedBox(height: 16.h),
                            BookingConfirmationCard(
                              isSuccess: true,
                              selectedSlot: selectedSlot,
                              shopName: widget.shopName,
                              description: _descriptionController.text,
                              toPersianDigit: _toPersianDigit,
                            ),
                            SizedBox(height: 32.h),
                          ],
                        ],
                      ),
                    ),
                  ),
                  BookingBottomBar(
                    state: state,
                    isSuccess: isReservationSuccess,
                    canGoNext: _selectedTimeSlotId != null,
                    currentStep: _currentStep,
                    onPressed: () {
                      if (isReservationSuccess) {
                        context.pop();
                      } else if (_currentStep == 2) {
                        if (_selectedTimeSlotId != null) {
                          bloc.add(SubmitReservationEvent(
                            _selectedTimeSlotId!,
                            _descriptionController.text,
                          ));
                        }
                      } else {
                        if (_selectedTimeSlotId != null) {
                          setState(() => _currentStep = 2);
                        }
                      }
                    },
                  ),
                ],
              );
            },
          ),
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

  Widget _buildDescriptionField() {
    final theme = Theme.of(context);
    return TextField(
      controller: _descriptionController,
      maxLines: 4,
      style: TextStyle(color: theme.colorScheme.onSurface),
      decoration: InputDecoration(
        hintText:
            'توضیحات خود را اینجا بنویسید (مثلاً مدل خودرو و نوع مشکل)...',
        hintStyle:
            TextStyle(fontSize: 13.sp, color: theme.colorScheme.outline),
        filled: true,
        fillColor:
            theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: theme.colorScheme.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: theme.colorScheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide:
              BorderSide(color: theme.colorScheme.primary, width: 1.5),
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
