import 'package:go_router/go_router.dart';
import '../../../../core/services/feature_router.dart';
import '../screen/screen_shop_basket.dart';

class ShopBasketRouter implements FeatureRouter {
  @override
  List<RouteBase> get routes => [
        GoRoute(
          name: 'shop_basket',
          path: '/shop_basket',
          builder: (context, state) => const ScreenShopBasket(),
        ),
      ];
}
