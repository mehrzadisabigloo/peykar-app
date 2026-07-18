import 'package:go_router/go_router.dart';
import '../../../../core/services/feature_router.dart';
import '../screen/screen_orders.dart';

class OrdersRouter implements FeatureRouter {
  @override
  List<RouteBase> get routes => [
        GoRoute(
          name: 'orders',
          path: '/orders',
          builder: (context, state) => const ScreenOrders(),
        ),
      ];
}
