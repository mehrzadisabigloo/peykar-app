import 'package:go_router/go_router.dart';
import '../../../../../../core/services/feature_router.dart';
import '../../domain/entity/admin_product_entity.dart';
import '../screen/screen_manage_shop_products.dart';
import '../screen/screen_add_edit_admin_product.dart';

class ManageShopProductsRouter implements FeatureRouter {
  @override
  List<RouteBase> get routes => [
        GoRoute(
          name: 'manage_shop_products',
          path: 'shop-products',
          builder: (context, state) => const ScreenManageShopProducts(),
        ),
        GoRoute(
          name: 'add_edit_admin_product',
          path: 'shop-products/add-edit',
          builder: (context, state) {
            final product = state.extra as AdminProductEntity?;
            return ScreenAddEditAdminProduct(product: product);
          },
        ),
      ];
}
