import 'package:go_router/go_router.dart';
import '../../../../core/services/feature_router.dart';
import '../screen/screen_service_providers.dart';
import '../screen/screen_transactions.dart';
import '../screen/screen_settlements.dart';
import '../screen/screen_admin_dashboard.dart';

class AdminRouter implements FeatureRouter {
  @override
  List<RouteBase> get routes => [
        GoRoute(
          name: 'admin_dashboard',
          path: '/admin/dashboard',
          builder: (context, state) => const ScreenAdminDashboard(),
        ),
        GoRoute(
          name: 'admin_service_providers',
          path: '/admin/service_providers',
          builder: (context, state) => const ScreenServiceProviders(),
        ),
        GoRoute(
          name: 'admin_transactions',
          path: '/admin/transactions',
          builder: (context, state) => const ScreenTransactions(),
        ),
        GoRoute(
          name: 'admin_settlements',
          path: '/admin/settlements',
          builder: (context, state) => const ScreenSettlements(),
        ),
      ];
}
