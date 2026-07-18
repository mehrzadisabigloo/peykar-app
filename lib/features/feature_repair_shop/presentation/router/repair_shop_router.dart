import 'package:go_router/go_router.dart';
import '../../../../core/services/feature_router.dart';
import '../screen/screen_repair_shop.dart';
import '../screen/screen_booking.dart';

class RepairShopRouter implements FeatureRouter {
  @override
  List<RouteBase> get routes => [
        GoRoute(
          name: 'repair_shop',
          path: '/repair_shop/:repairman_id',
          builder: (context, state) {
            final repairmanId = state.pathParameters['repairman_id'] ?? '';
            return ScreenRepairShop(repairmanId: repairmanId);
          },
        ),
        GoRoute(
          name: 'booking',
          path: '/booking',
          builder: (context, state) => const ScreenBooking(),
        ),
      ];
}
