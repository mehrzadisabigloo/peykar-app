import 'package:go_router/go_router.dart';
import '../../../../core/services/feature_router.dart';
import '../screen/screen_shop_basket.dart';
import '../screen/screen_checkout.dart';
import '../../domain/entity/shop_basket_entity.dart';

class ShopBasketRouter implements FeatureRouter {
  @override
  List<RouteBase> get routes => [
        GoRoute(
          name: 'shop_basket',
          path: '/shop_basket',
          builder: (context, state) => const ScreenShopBasket(),
        ),
        GoRoute(
          name: 'checkout',
          path: '/checkout',
          builder: (context, state) {
            final basket = state.extra as ShopBasketEntity;
            return ScreenCheckout(basket: basket);
          },
        ),
      ];
}
