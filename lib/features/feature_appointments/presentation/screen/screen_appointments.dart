import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturant_app/core/widgets/widget_infinite_list.dart';
import '../../../../core/bloc/app/app_bloc.dart';
import '../../../../core/bloc/error/error_bloc.dart';
import '../../../../core/services/locator.dart';
import '../../../../core/utils/jalali_date.dart';
import '../../../../core/widgets/cstm_snakbar.dart';
import '../../../../core/widgets/empty_state_widget.dart';
import '../../../../core/widgets/error_state_widget.dart';
import '../../../feature_reminders/presentation/widget/persian_calendar_view.dart';
import '../base/base_appointments_stateful_widget_state.dart';
import '../bloc/appointments_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widget/appointment_card.dart';
import '../widget/appointment_card_shimmer.dart';
import '../../../feature_home/presentation/bloc/main_home_page_bloc.dart';
import '../../domain/entity/appointments_entity.dart';

class ScreenAppointments extends StatefulWidget {
  final String? repairmanId;
  final String? initialDate;
  const ScreenAppointments({super.key, this.repairmanId, this.initialDate});

  @override
  State<ScreenAppointments> createState() => _ScreenAppointmentsState();
}

class _ScreenAppointmentsState extends BaseAppointmentsStatefulWidgetState<ScreenAppointments, AppointmentsBloc> {
  _ScreenAppointmentsState() : super(locator<AppointmentsBloc>());

  @override
  void initState() {
    super.initState();
    // Initial fetch happens in buildNinoWidget once we have homeState for the role
  }

  bool _isFirstFetch = true;

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState,
      AppBlocState appState) {
    final theme = Theme.of(context);
    return BlocBuilder<MainHomePageBloc, MainHomePageState>(
      builder: (context, homeState) {
        if (_isFirstFetch) {
          _isFirstFetch = false;
          final initialJalali = Jalali.parse(widget.initialDate);
          final initialDateTime = initialJalali?.toDateTime();
          
          bloc.add(FetchAppointmentsEvent(
            role: homeState.role,
            repairmanId: widget.repairmanId,
            initialDate: initialDateTime,
          ));
        }

        return Container(
          color: theme.colorScheme.surfaceContainerLow,
          child: BlocListener<AppointmentsBloc, AppointmentsState>(
            listener: (context, state) {
              if (state is AppointmentsLoaded) {
                if (state.errorToastMessage != null) {
                  CstmSnackBar.showError(context, state.errorToastMessage!);
                  context.read<AppointmentsBloc>().add(
                      const ClearErrorToastEvent());
                }
              } else if (state is RatingSuccess) {
                CstmSnackBar.showSuccess(context, state.message);
                if (Navigator.canPop(context)) {
                  Navigator.pop(context); // Close the rating bottom sheet on success
                }
              } else if (state is RatingError) {
                CstmSnackBar.showError(context, state.message);
              }
            },
            child: BlocBuilder<AppointmentsBloc, AppointmentsState>(
              builder: (context, state) {
                if (state is AppointmentsLoading) {
                  return ListView.builder(
                    padding: EdgeInsets.all(20.r),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return const AppointmentCardShimmer();
                    },
                  );
                }
                if (state is AppointmentsError) {
                  return ErrorStateWidget(
                    message: state.message,
                    onRetry: () =>
                        bloc.add(FetchAppointmentsEvent(role: homeState.role)),
                  );
                }

                List<AppointmentsEntity> appointments = [];
                bool hasMore = false;
                bool hasError = false;
                String? errorMessage;
                String currentDate = "";
                bool showDatePicker = false;

                if (state is AppointmentsLoaded) {
                  appointments = state.appointments;
                  hasMore = state.hasMore;
                  currentDate = state.currentDate;
                  showDatePicker = state.showDatePicker;
                } else if (state is AppointmentsLoadingMore) {
                  appointments = state.appointments;
                  hasMore = state.hasMore;
                  currentDate = state.currentDate;
                }

                if (appointments.isEmpty && !hasError &&
                    state is! AppointmentsLoading) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 20.h),
                        _buildDateNavigator(
                            currentDate, showDatePicker, theme, homeState.role),
                        ClipRect(
                          child: AnimatedAlign(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                            alignment: Alignment.topCenter,
                            heightFactor: showDatePicker ? 1.0 : 0.0,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 16.h, right: 15.w, left: 15.w),
                              child: PersianCalendarView(
                                initialDate: Jalali.fromDateTime(state is AppointmentsLoaded ? (state.selectedDateTime ?? DateTime.now()) : DateTime.now()),
                                onDateSelected: (jalali) {
                                  bloc.add(SelectDateEvent(jalali.toDateTime()));
                                },
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 40.h),
                          child: const EmptyStateWidget(
                            title: 'رزروی یافت نشد',
                            description: 'در حال حاضر هیچ رزرو فعالی برای شما ثبت نشده است.',
                            icon: Icons.event_busy_rounded,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                // Header items: Spacing, Date Navigator, Date Picker
                final List<dynamic> allItems = [
                  'SPACER_TOP',
                  'DATE_NAVIGATOR',
                  'DATE_PICKER',
                  'SPACER_LIST',
                  ...appointments,
                ];

                return WidgetInfiniteList(
                  bloc: bloc.listBloc,
                  items: allItems,
                  hasReachedTop: true,
                  hasReachedBottom: !hasMore,
                  isLoading: false,
                  hasErrorOccurred: hasError,
                  errorWidget: ErrorStateWidget(
                    message: errorMessage ?? "خطا در دریافت نوبت‌ها",
                    onRetry: () =>
                        bloc.add(LoadMoreAppointmentsEvent(role: homeState
                            .role)),
                  ),
                  loadingWidget: const AppointmentCardShimmer(),
                  loadBottomData: () =>
                      bloc.add(LoadMoreAppointmentsEvent(role: homeState.role)),
                  itemEquality: (f, s) {
                    if (f is AppointmentsEntity && s is AppointmentsEntity) {
                      return f.id == s.id;
                    }
                    return f == s;
                  },
                  padding: EdgeInsets.zero,
                  builder: (context, item) {
                    if (item == 'SPACER_TOP') return SizedBox(height: 20.h);
                    if (item == 'DATE_NAVIGATOR') {
                      return _buildDateNavigator(
                        currentDate, showDatePicker, theme, homeState.role);
                    }
                    if (item == 'DATE_PICKER') {
                      return ClipRect(
                        child: AnimatedAlign(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                          alignment: Alignment.topCenter,
                          heightFactor: showDatePicker ? 1.0 : 0.0,
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 16.h, right: 15.w, left: 15.w),
                            child: PersianCalendarView(
                              key: ValueKey(state is AppointmentsLoaded ? state.selectedDateTime : null),
                              initialDate: Jalali.fromDateTime(state is AppointmentsLoaded ? (state.selectedDateTime ?? DateTime.now()) : DateTime.now()),
                              onDateSelected: (jalali) {
                                bloc.add(SelectDateEvent(jalali.toDateTime()));
                              },
                            ),
                          ),
                        ),
                      );
                    }
                    if (item == 'SPACER_LIST') return SizedBox(height: 10.h);

                    return AppointmentCard(
                      appointment: item as AppointmentsEntity,
                      isRepairman: homeState.role == 'repairman' ||
                          homeState.role == 'admin',
                    );
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildDateNavigatorPlaceholder(ThemeData theme) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      height: 56.h,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(20.r),
      ),
    );
  }

  Widget _buildDateNavigator(String currentDate, bool showDatePicker,
      ThemeData theme, String role) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavButton(
            onTap: () => bloc.add(ChangeDateEvent(next: false, role: role)),
            icon: Icons.chevron_left_rounded,
            theme: theme,
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => bloc.add(const ToggleDatePickerEvent()),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [
                    BoxShadow(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.03),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      currentDate,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w900,
                        color: theme.colorScheme.onSurface,
                        fontFamily: 'BonyadeKoodak',
                      ),
                    ),
                    SizedBox(width: 6.w),
                    AnimatedRotation(
                      turns: showDatePicker ? 0.5 : 0,
                      duration: const Duration(milliseconds: 300),
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 18.sp,
                        color: theme.colorScheme.primary.withValues(alpha: 0.5),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          _buildNavButton(
            onTap: () => bloc.add(ChangeDateEvent(next: true, role: role)),
            icon: Icons.chevron_right_rounded,
            theme: theme,
          ),
        ],
      ),
    );
  }

  Widget _buildNavButton(
      {required VoidCallback onTap, required IconData icon, required ThemeData theme}) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(icon, size: 28.sp,
          color: theme.colorScheme.onSurface.withValues(alpha: 0.3)),
      padding: EdgeInsets.all(8.r),
      constraints: const BoxConstraints(),
    );
  }

}
