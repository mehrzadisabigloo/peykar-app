import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:resturant_app/core/presentation/screen/splash_screen.dart';
import 'package:resturant_app/core/presentation/widget/main_shell.dart';
import 'package:resturant_app/core/services/locator.dart';
import 'package:resturant_app/features/feature_auth/presentation/router/auth_router.dart';
import 'package:resturant_app/features/feature_home/presentation/bloc/main_home_page_bloc.dart';
import 'package:resturant_app/features/feature_home/presentation/router/home_router.dart';
import 'package:resturant_app/features/feature_manage_products/presentation/router/manage_products_router.dart';
import 'package:resturant_app/features/feature_manage_services/presentation/router/manage_services_router.dart';
import 'package:resturant_app/features/feature_dashboard/presentation/router/dashboard_router.dart';
import 'package:resturant_app/features/feature_orders/presentation/router/orders_router.dart';
import 'package:resturant_app/features/feature_appointments/presentation/router/appointments_router.dart';
import 'package:resturant_app/features/feature_reminders/presentation/router/reminders_router.dart';
import 'package:resturant_app/features/feature_admin/presentation/router/admin_router.dart';
import 'package:resturant_app/features/feature_client_services/presentation/router/client_services_router.dart';
import 'package:resturant_app/features/feature_repair_shop/presentation/router/repair_shop_router.dart';
import 'package:resturant_app/features/feature_profile/presentation/router/profile_router.dart';
import 'package:resturant_app/features/feature_shop/presentation/router/shop_router.dart';
import 'package:resturant_app/features/feature_shop_basket/presentation/router/shop_basket_router.dart';
import 'package:resturant_app/features/panel_admin_features/feature_panel_admin/presentation/router/panel_admin_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    ...AuthRouter().routes,
    ShellRoute(
      builder: (context, state, child) {
        return BlocProvider(
          create: (context) => locator<MainHomePageBloc>()
            ..add(AppBarAlarms())
            ..add(GetRole()),
          child: MainShell(appUri: state.uri, child: child),
        );
      },
      routes: [
        ...HomeRouter().routes,
        ...ManageProductsRouter().routes,
        ...ManageServicesRouter().routes,
        ...DashboardRouter().routes,
        ...OrdersRouter().routes,
        ...AppointmentsRouter().routes,
        ...RemindersRouter().routes,
        ...AdminRouter().routes,
        ...ClientServicesRouter().routes,
        ...RepairShopRouter().routes,
        ...ProfileRouter().routes,
        ...ShopRouter().routes,
        ...ShopBasketRouter().routes,
        ...PanelAdminRouter().routes,
      ],
    ),
  ],
);
