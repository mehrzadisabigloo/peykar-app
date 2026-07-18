import 'package:go_router/go_router.dart';
import '../../../../core/services/feature_router.dart';
import '../screen/screen_client_services.dart';
import '../screen/screen_all_top_repair_shops.dart';

class ClientServicesRouter implements FeatureRouter {
  @override
  List<RouteBase> get routes => [
        GoRoute(
          name: 'client_services',
          path: '/client_services',
          builder: (context, state) => const ScreenClientServices(),
        ),
        GoRoute(
          name: 'all_top_repair_shops',
          path: '/all_top_repair_shops',
          builder: (context, state) => const ScreenAllTopRepairShops(),
        ),
      ];
}
