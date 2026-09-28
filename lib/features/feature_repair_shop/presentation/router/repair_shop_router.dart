import 'package:go_router/go_router.dart';
import '../../../../core/services/feature_router.dart';
import '../../../feature_manage_products/domain/entity/manage_products_entity.dart';
import '../screen/screen_repair_shop.dart';
import '../screen/screen_booking.dart';
import '../screen/screen_all_repair_shop_products.dart';
import '../screen/screen_repairman_payment_type.dart';

class RepairShopRouter implements FeatureRouter {
  @override
  List<RouteBase> get routes => [
        GoRoute(
          name: 'repairman_payment_type',
          path: '/repairman/payment-type',
          builder: (context, state) => const ScreenRepairmanPaymentType(),
        ),
        GoRoute(
          name: 'repair_shop',
          path: '/repair_shop/:repairman_id',
          builder: (context, state) {
            final repairmanId = state.pathParameters['repairman_id'] ?? '';
            return ScreenRepairShop(repairmanId: repairmanId);
          },
        ),
        GoRoute(
          name: 'all_repair_shop_products',
          path: '/repair_shop/:repairman_id/products',
          builder: (context, state) {
            final repairmanId = state.pathParameters['repairman_id'] ?? '';
            final products = state.extra as List<ManageProductsEntity>? ?? [];
            return ScreenAllRepairShopProducts(repairmanId: repairmanId, products: products);
          },
        ),
        GoRoute(
          name: 'booking',
          path: '/booking/:repairman_id',
          builder: (context, state) {
            final repairmanId = state.pathParameters['repairman_id'];
            final shopName = state.uri.queryParameters['shop_name'];
            return ScreenBooking(repairmanId: repairmanId, shopName: shopName);
          },
        ),
      ];
}
