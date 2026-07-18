import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../feature_client_services/presentation/screen/screen_client_services.dart';
import '../../../feature_shop/presentation/screen/screen_shop.dart';
import '../../../feature_dashboard/presentation/screen/screen_dashboard.dart';
import '../bloc/main_home_page_bloc.dart';
import '../widget/main_bottom_nav.dart';
import '../widget/home_screen_content.dart';
import '../../../../features/feature_manage_products/presentation/screen/screen_manage_products.dart';
import '../../../../features/feature_manage_services/presentation/screen/screen_manage_services.dart';
import '../../../../features/feature_orders/presentation/screen/screen_orders.dart';
import '../../../../features/feature_appointments/presentation/screen/screen_appointments.dart';
import '../../../../features/feature_reminders/presentation/screen/screen_reminders.dart';
import '../../../../features/feature_profile/presentation/screen/screen_profile.dart';

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
          child: Scaffold(
            backgroundColor: Colors.transparent,
            extendBody: true,
            body: _getWidget(state),
            bottomNavigationBar: MainBottomNav(
              currentIndex: state.index,
              role: state.role,
              onTap: (index) {
                context.read<MainHomePageBloc>().add(ChangeScreen(index));
              },
            ),
          ),
        );
      },
    );
  }

  Widget _getWidget(MainHomePageState state) {
    // Add bottom padding to all screens to account for the floating bottom nav

    // Widget content;
    if (state.role == 'repairman' || state.role == 'admin') {
      switch (state.index) {
        case 0:
          return ScreenOrders();
        case 1:
         return ScreenManageProducts();
          // break;
        case 2:
          return ScreenAppointments();
          // break;
        case 3:
          return ScreenManageServices();
          // break;
        case 4:
          return ScreenDashboard();
          // break;
        default:
          return ScreenDashboard();
      }
    } else {
      switch (state.index) {
        case 0:
          return ScreenProfile();
          // break;
        case 1:
          return ScreenReminders();
          // break;
        case 2:
          return ScreenShop();
          // break;
        case 3:
          return ScreenClientServices();
          // break;
        case 4:
          return const HomeScreenContent();
          // break;
        default:
          return const HomeScreenContent();
      }
    }

    // return content;
  }
}
