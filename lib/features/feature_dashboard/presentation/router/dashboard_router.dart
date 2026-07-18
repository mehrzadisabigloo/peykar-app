import 'package:go_router/go_router.dart';
import '../../../../core/services/feature_router.dart';
import '../screen/screen_dashboard.dart';
import '../screen/screen_financial_report.dart';

class DashboardRouter implements FeatureRouter {
  @override
  List<RouteBase> get routes => [
        GoRoute(
          name: 'dashboard',
          path: '/dashboard',
          builder: (context, state) => const ScreenDashboard(),
        ),
        GoRoute(
          name: 'financial_report',
          path: '/financial_report',
          builder: (context, state) => const ScreenFinancialReport(),
        ),
      ];
}
