import 'package:go_router/go_router.dart';
import '../../../../core/services/feature_router.dart';
import '../screen/screen_shop.dart';

class ShopRouter implements FeatureRouter {
  @override
  List<RouteBase> get routes => [
        GoRoute(
          name: 'shop',
          path: '/shop',
          builder: (context, state) => const ScreenShop(),
        ),
      ];
}
