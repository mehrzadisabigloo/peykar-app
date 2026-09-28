import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_app/features/feature_auth/presentation/screen/pending_approval_screen.dart';
import '../../../feature_dashboard/presentation/screen/screen_dashboard.dart';
import '../bloc/main_home_page_bloc.dart';
import '../widget/main_bottom_nav.dart';
import '../widget/home_screen_content.dart';
import '../../../../features/feature_orders/presentation/screen/screen_orders.dart';
import '../../../../features/feature_appointments/presentation/screen/screen_appointments.dart';
import '../../../../features/feature_create_time_slot/presentation/screen/screen_create_time_slot.dart';
import '../../../../features/feature_reminders/presentation/screen/screen_reminders.dart';
import '../../../feature_profile/presentation/screen/screen_profile.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainHomePageBloc, MainHomePageState>(
      builder: (context, state) {
        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            if (didPop) return;
            if (state.index != 4) {
              context.read<MainHomePageBloc>().add(ChangeScreen(4));
            }
          },
          child: _getWidget(state),
        );
      },
    );
  }

  Widget _getWidget(MainHomePageState state) {
    // Add bottom padding to all screens to account for the floating bottom nav

    // Allow Profile screen regardless of status
    if (state.index == 0 && (state.role == 'repairman' || state.role == 'admin')) {
      return const ScreenProfile();
    }

    if (state.role == 'repairman' && state.status == 'Draft') {
      return const PendingApprovalScreen();
    }

    // Widget content;
    if (state.role == 'repairman' || state.role == 'admin') {
      switch (state.index) {
        case 0:
          return const ScreenProfile();
        case 1:
          return ScreenOrders();
        case 2:
          return const ScreenDashboard();
        case 3:
          return const ScreenCreateTimeSlot();
        default:
          return const ScreenDashboard();
      }
    } else {
      switch (state.index) {
        case 1:
          return const ScreenReminders();
        case 3:
          return const ScreenAppointments();
        case 4:
          return const HomeScreenContent();
        default:
          return const HomeScreenContent();
      }
    }

    // return content;
  }
}
