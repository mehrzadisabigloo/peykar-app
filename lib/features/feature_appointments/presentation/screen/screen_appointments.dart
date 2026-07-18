import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/bloc/app/app_bloc.dart';
import '../../../../core/bloc/error/error_bloc.dart';
import '../../../../core/services/locator.dart';
import '../base/base_appointments_stateful_widget_state.dart';
import '../bloc/appointments_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widget/appointment_card.dart';
import '../widget/appointment_card_shimmer.dart';

class ScreenAppointments extends StatefulWidget {
  const ScreenAppointments({super.key});

  @override
  State<ScreenAppointments> createState() => _ScreenAppointmentsState();
}

class _ScreenAppointmentsState extends BaseAppointmentsStatefulWidgetState<ScreenAppointments, AppointmentsBloc> {
  _ScreenAppointmentsState() : super(locator<AppointmentsBloc>());

  @override
  void initState() {
    super.initState();
    bloc.add(FetchAppointmentsEvent());
  }

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
    return Container(
      color: const Color(0xFFF8F9FB),
      child: BlocBuilder<AppointmentsBloc, AppointmentsState>(
        builder: (context, state) {
          if (state is AppointmentsLoading) {
            return Column(
              children: [
                SizedBox(height: 20.h),
                _buildDateNavigatorPlaceholder(),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(20.r),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return const AppointmentCardShimmer();
                    },
                  ),
                ),
              ],
            );
          }
          if (state is AppointmentsError) {
            return Center(child: Text(state.message));
          }
          if (state is AppointmentsLoaded) {
            return Column(
              children: [
                SizedBox(height: 20.h),
                _buildDateNavigator(state.currentDate),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(20.r),
                    itemCount: state.appointments.length,
                    itemBuilder: (context, index) {
                      return AppointmentCard(appointment: state.appointments[index]);
                    },
                  ),
                ),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _buildDateNavigatorPlaceholder() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      height: 56.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
      ),
    );
  }

  Widget _buildDateNavigator(String currentDate) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => bloc.add(ChangeDateEvent(next: false)),
            icon: Icon(Icons.chevron_left, size: 24.sp, color: Colors.black54),
          ),
          Text(
            currentDate,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              fontFamily: 'BonyadeKoodak',
              color: Colors.black87,
            ),
          ),
          IconButton(
            onPressed: () => bloc.add(ChangeDateEvent(next: true)),
            icon: Icon(Icons.chevron_right, size: 24.sp, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
