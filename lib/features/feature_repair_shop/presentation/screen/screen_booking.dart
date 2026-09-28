import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/bloc/app/app_bloc.dart';
import '../../../../core/bloc/error/error_bloc.dart';
import '../../../../core/services/locator.dart';
import '../../../../core/widgets/cstm_snakbar.dart';
import '../../../../core/utils/jalali_date.dart';
import '../../../../core/themes/theme_main.dart';
import 'package:shimmer/shimmer.dart';
import '../../../feature_create_time_slot/data/model/time_slot_model.dart';
import '../base/base_repair_shop_stateful_widget_state.dart';
import '../bloc/repair_shop_bloc.dart';

class ScreenBooking extends StatefulWidget {
  final String? repairmanId;
  final String? shopName;
  const ScreenBooking({super.key, this.repairmanId, this.shopName});

  @override
  State<ScreenBooking> createState() => _ScreenBookingState();
}

class _ScreenBookingState extends BaseRepairShopStatefulWidgetState<ScreenBooking, RepairShopBloc> {
  _ScreenBookingState() : super(locator<RepairShopBloc>());

  int _currentStep = 1; // 1: Selection, 2: Review & Description, 3: Success Overview
  String? _selectedTimeSlotId;
  String? _selectedDate;
  final TextEditingController _descriptionController = TextEditingController();
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
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
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
        } else if (state.reservationStatus == ReservationStatus.submitting) {
          // Show loading overlay if needed
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
              final bool isReservationSuccess = state.reservationStatus == ReservationStatus.success || _currentStep == 3;
              
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
                            _buildDateSelector(),
                            SizedBox(height: 32.h),
                            _buildTimeSlotsList(),
                            SizedBox(height: 32.h),
                          ],
                          if (_currentStep == 2 && !isReservationSuccess) ...[
                            SizedBox(height: 32.h),
                            _buildSectionTitle('تایید و ثبت نوبت'),
                            SizedBox(height: 16.h),
                            _buildConfirmationCard(isSuccess: false),
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
                            _buildConfirmationCard(isSuccess: true),
                            SizedBox(height: 32.h),
                          ],
                        ],
                      ),
                    ),
                  ),
                  _buildBottomBar(state, isReservationSuccess),
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

  Widget _buildStepper() {
    final theme = Theme.of(context);
    final List<String> steps = ['انتخاب نوبت', 'نتیجه رزرو'];
    final List<IconData> icons = [
      Icons.calendar_today_outlined,
      Icons.check_circle_outline_rounded,
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(steps.length, (index) {
          final isActive = index == _currentStep - 1;
          final isCompleted = index < _currentStep - 1;
          return Row(
            mainAxisSize: MainAxisSize.min,
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
                          : theme.colorScheme.surfaceContainerHighest,
                      border: isActive
                          ? Border.all(color: theme.colorScheme.primary, width: 2)
                          : null,
                    ),
                    child: Icon(
                      icons[index],
                      size: 18.sp,
                      color: isActive || isCompleted 
                          ? theme.colorScheme.onPrimary 
                          : theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    steps[index],
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: isActive ? FontWeight.w800 : FontWeight.w500,
                      color: isActive ? theme.colorScheme.primary : theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              if (index != steps.length - 1)
                Container(
                  width: 80.w, // Fixed width for the connector to keep it centered
                  height: 2.h,
                  margin: EdgeInsets.only(bottom: 24.h, left: 12.w, right: 12.w),
                  color: isCompleted ? theme.colorScheme.primary : theme.colorScheme.outline,
                ),
            ],
          );
        }),
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

  Widget _buildDateSelector() {
    final theme = Theme.of(context);
    final dates = _availableSlots.map((s) => s.date).toSet().toList()..sort();

    if (dates.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('تاریخ مراجعه'),
        SizedBox(height: 12.h),
        SizedBox(
          height: 100.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: dates.length,
            padding: EdgeInsets.symmetric(vertical: 4.h),
            separatorBuilder: (context, index) => SizedBox(width: 12.w),
            itemBuilder: (context, index) {
              final date = dates[index];
              final isSelected = _selectedDate == date;

              String dayName = '';
              String dayNumber = '';
              String monthName = '';

              try {
                DateTime dateTime;
                if (date.contains('T')) {
                  dateTime = DateTime.parse(date);
                } else {
                  final parts = date.split('-');
                  if (parts.length == 3) {
                    final y = int.parse(parts[0]);
                    final m = int.parse(parts[1]);
                    final d = int.parse(parts[2]);
                    dateTime = Jalali(y, m, d).toDateTime();
                  } else {
                    dateTime = DateTime.now();
                  }
                }

                final jalali = Jalali.fromDateTime(dateTime);
                const weekDays = ['دوشنبه', 'سه‌شنبه', 'چهارشنبه', 'پنج‌شنبه', 'جمعه', 'شنبه', 'یکشنبه'];
                dayName = weekDays[dateTime.weekday - 1];
                dayNumber = jalali.day.toString();
                monthName = Jalali.monthNames[jalali.month - 1];
              } catch (_) {}

              return GestureDetector(
                onTap: () => setState(() => _selectedDate = date),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 75.w,
                  decoration: BoxDecoration(
                    color: isSelected ? theme.colorScheme.primary : theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(
                      color: isSelected ? theme.colorScheme.primary : theme.colorScheme.outline,
                      width: 1.0,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: isSelected
                            ? theme.colorScheme.primary.withValues(alpha: 0.25)
                            : theme.shadowColor.withValues(alpha: 0.03),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        dayName,
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                          color: isSelected ? theme.colorScheme.onPrimary.withValues(alpha: 0.9) : theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        _toPersianDigit(dayNumber),
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w900,
                          color: isSelected ? theme.colorScheme.onPrimary : theme.colorScheme.onSurface,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        monthName,
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                          color: isSelected ? theme.colorScheme.onPrimary.withValues(alpha: 0.9) : theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTimeSlotsList() {
    final theme = Theme.of(context);
    if (_isLoadingSlots) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('زمان‌های در دسترس'),
          SizedBox(height: 16.h),
          _buildTimeSlotShimmer(theme),
        ],
      );
    }

    final filteredSlots = _availableSlots.where((s) => s.date == _selectedDate).toList();

    if (filteredSlots.isEmpty) {
      return Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(20.r),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.event_busy_rounded, size: 48.sp, color: theme.colorScheme.outline),
              ),
              SizedBox(height: 16.h),
              Text(
                'هیچ نوبت آزادی یافت نشد.',
                style: TextStyle(
                  color: theme.colorScheme.onSurfaceVariant,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'لطفاً تاریخ دیگری را انتخاب کنید.',
                style: TextStyle(
                  color: theme.colorScheme.outline,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('زمان‌های در دسترس'),
        SizedBox(height: 16.h),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: filteredSlots.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2.4,
            crossAxisSpacing: 12.w,
            mainAxisSpacing: 12.h,
          ),
          itemBuilder: (context, index) {
            final slot = filteredSlots[index];
            final isSelected = _selectedTimeSlotId == slot.id;
            final isFull = slot.isFull || (slot.capacity > 0 && slot.remainingCapacity == 0);

            return InkWell(
              onTap: isFull ? null : () => setState(() => _selectedTimeSlotId = slot.id),
              borderRadius: BorderRadius.circular(16.r),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  color: isSelected
                      ? theme.colorScheme.primary
                      : isFull
                          ? theme.colorScheme.surfaceContainerHighest
                          : theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    color: isSelected
                        ? theme.colorScheme.primary
                        : isFull
                            ? theme.colorScheme.outline
                            : theme.colorScheme.outline,
                    width: isSelected ? 1.5 : 1.0,
                  ),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: theme.colorScheme.primary.withValues(alpha: 0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          )
                        ]
                      : null,
                ),
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          isFull ? Icons.block_flipped : Icons.access_time_rounded,
                          size: 16.sp,
                          color: isSelected
                              ? theme.colorScheme.onPrimary
                              : isFull
                                  ? theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.5)
                                  : theme.colorScheme.primary.withValues(alpha: 0.6),
                        ),
                        SizedBox(width: 8.w),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${_toPersianDigit(slot.startTime.substring(0, 5))} الی ${_toPersianDigit(slot.endTime.substring(0, 5))}',
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: isSelected ? FontWeight.w900 : FontWeight.w700,
                                color: isSelected
                                    ? theme.colorScheme.onPrimary
                                    : isFull
                                        ? theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.5)
                                        : theme.colorScheme.onSurface,
                              ),
                            ),
                            if (!isFull && slot.remainingCapacity > 0 && slot.remainingCapacity <= 2)
                              Text(
                                'فقط ${_toPersianDigit(slot.remainingCapacity.toString())} ظرفیت باقی‌مانده',
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w600,
                                  color: isSelected ? theme.colorScheme.onPrimary.withValues(alpha: 0.8) : theme.colorScheme.onSurface.withValues(alpha: 0.5),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                    // if (isSelected)
                    //   Positioned(
                    //     top: 4.h,
                    //     right: 4.w,
                    //     child: Icon(
                    //       Icons.check_circle,
                    //       size: 14.sp,
                    //       color: theme.colorScheme.onPrimary,
                    //     ),
                    //   ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildTimeSlotShimmer(ThemeData theme) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2.4,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.h,
      ),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: theme.colorScheme.outline.withValues(alpha: 0.5)),
          ),
          child: Shimmer.fromColors(
            baseColor: theme.colorScheme.surfaceContainer,
            highlightColor: theme.colorScheme.surface,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 16.sp,
                  height: 16.sp,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 8.w),
                Container(
                  width: 80.w,
                  height: 14.h,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildConfirmationCard({required bool isSuccess}) {
    final theme = Theme.of(context);
    final selectedSlot = _availableSlots.firstWhere((s) => s.id == _selectedTimeSlotId);
    
    final color = isSuccess ? StatusColors.of(context).success : theme.colorScheme.primary;
    final headerText = isSuccess ? 'جزئیات نوبت ثبت شده' : 'بازبینی و تایید نوبت';
    final headerIcon = isSuccess ? Icons.check_circle_rounded : Icons.fact_check_rounded;

    String displayDate = selectedSlot.date;
    try {
      DateTime dateTime;
      if (selectedSlot.date.contains('T')) {
        dateTime = DateTime.parse(selectedSlot.date);
      } else {
        final parts = selectedSlot.date.split('-');
        final y = int.parse(parts[0]);
        final m = int.parse(parts[1]);
        final d = int.parse(parts[2]);
        dateTime = Jalali(y, m, d).toDateTime();
      }
      final jalali = Jalali.fromDateTime(dateTime);
      displayDate = '${jalali.day} ${Jalali.monthNames[jalali.month - 1]} ${jalali.year}';
    } catch (_) {}

    String repairmanName = selectedSlot.repairman != null 
        ? '${selectedSlot.repairman!.firstName ?? ''} ${selectedSlot.repairman!.lastName ?? ''}'.trim()
        : widget.shopName ?? 'تعمیرگاه تخصصی';
    
    if (repairmanName.isEmpty) {
      repairmanName = 'تعمیرگاه تخصصی';
    }

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: color.withValues(alpha: 0.3), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
            ),
            child: Row(
              children: [
                Icon(headerIcon, color: color, size: 22.sp),
                SizedBox(width: 12.w),
                Text(
                  headerText,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 15.sp,
                    color: isSuccess ? StatusColors.of(context).success : theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              children: [
                _buildInfoRow(Icons.store_rounded, 'تعمیرگاه:', repairmanName, theme),
                Divider(height: 32.h, color: theme.dividerColor.withValues(alpha: 0.5)),
                _buildInfoRow(Icons.calendar_today_outlined, 'تاریخ رزرو:', displayDate, theme),
                Divider(height: 32.h, color: theme.dividerColor.withValues(alpha: 0.5)),
                _buildInfoRow(Icons.access_time_outlined, 'ساعت مراجعه:', '${selectedSlot.startTime.substring(0, 5)} الی ${selectedSlot.endTime.substring(0, 5)}', theme),
                if (_descriptionController.text.isNotEmpty) ...[
                  Divider(height: 32.h, color: theme.dividerColor.withValues(alpha: 0.5)),
                  _buildInfoRow(Icons.description_rounded, 'توضیحات شما:', _descriptionController.text, theme),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value, ThemeData theme) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18.sp, color: theme.colorScheme.onSurfaceVariant),
        SizedBox(width: 8.w),
        Text(label, style: TextStyle(color: theme.colorScheme.onSurfaceVariant, fontSize: 13.sp)),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            _toPersianDigit(value),
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14.sp, color: theme.colorScheme.onSurface),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }

  Widget _buildDescriptionField() {
    final theme = Theme.of(context);
    return TextField(
      controller: _descriptionController,
      maxLines: 4,
      style: TextStyle(color: theme.colorScheme.onSurface),
      decoration: InputDecoration(
        hintText: 'توضیحات خود را اینجا بنویسید (مثلاً مدل خودرو و نوع مشکل)...',
        hintStyle: TextStyle(fontSize: 13.sp, color: theme.colorScheme.outline),
        filled: true,
        fillColor: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
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
          borderSide: BorderSide(color: theme.colorScheme.primary, width: 1.5),
        ),
      ),
    );
  }

  Widget _buildBottomBar(RepairShopState state, bool isSuccess) {
    final theme = Theme.of(context);
    bool canGoNext = _selectedTimeSlotId != null;

    return Container(
      padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 16.h + MediaQuery.of(context).padding.bottom),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Builder(
        builder: (context) {
          final isSubmitting = state.reservationStatus == ReservationStatus.submitting;
          final isReview = _currentStep == 2;

          return ElevatedButton(
            onPressed: (isSubmitting || (!canGoNext && !isSuccess)) ? null : () {
              if (isSuccess) {
                context.pop();
              } else if (isReview) {
                // Submit reservation
                if (_selectedTimeSlotId != null) {
                  bloc.add(SubmitReservationEvent(
                    _selectedTimeSlotId!,
                    _descriptionController.text,
                  ));
                }
              } else {
                // Move to review
                if (canGoNext) {
                  setState(() => _currentStep = 2);
                }
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: isSuccess 
                  ? StatusColors.of(context).success 
                  : (canGoNext || isReview ? theme.colorScheme.primary : theme.colorScheme.primary.withValues(alpha: 0.5)),
              minimumSize: Size(double.infinity, 54.h),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
              disabledBackgroundColor: isSuccess 
                  ? StatusColors.of(context).success.withValues(alpha: 0.5) 
                  : theme.colorScheme.primary.withValues(alpha: 0.5),
            ),
            child: isSubmitting 
              ? SizedBox(
                  height: 24.h,
                  width: 24.h,
                  child: CircularProgressIndicator(color: theme.colorScheme.surface, strokeWidth: 2),
                )
              : Text(
                  isSuccess ? 'بازگشت' : isReview ? 'تایید و رزرو نهایی' : 'ادامه',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w800,
                    color: theme.colorScheme.surface,
                  ),
                ),
          );
        },
      ),
    );
  }
}
