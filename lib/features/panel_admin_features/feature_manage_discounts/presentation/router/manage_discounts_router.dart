import 'package:go_router/go_router.dart';
import '../../../../../core/services/feature_router.dart';
import '../screen/screen_manage_discounts.dart';
import '../screen/screen_add_discount.dart';

class ManageDiscountsRouter implements FeatureRouter {
  @override
  List<RouteBase> get routes => [
        GoRoute(
          name: 'manage_discounts',
          path: 'discounts',
          builder: (context, state) => const ScreenManageDiscounts(),
        ),
        GoRoute(
          name: 'add_discount',
          path: 'discounts/add',
          builder: (context, state) => const ScreenAddDiscount(),
        ),
      ];
}
