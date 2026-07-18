import 'package:go_router/go_router.dart';
import '../../../../core/services/feature_router.dart';
import '../screen/screen_manage_products.dart';
import '../screen/screen_add_product.dart';
import '../screen/screen_product_detail.dart';

class ManageProductsRouter implements FeatureRouter {
  @override
  List<RouteBase> get routes => [
        GoRoute(
          name: 'manage_products',
          path: '/manage_products',
          builder: (context, state) => const ScreenManageProducts(),
        ),
        GoRoute(
          name: 'add_product',
          path: '/add_product',
          builder: (context, state) => const ScreenAddProduct(),
        ),
        GoRoute(
          name: 'product_detail',
          path: '/product_detail/:productId',
          builder: (context, state) => ScreenProductDetail(
            productId: state.pathParameters['productId'] ?? '',
          ),
        ),
        // GoRoute(
        //   name: 'upload_file',
        //   path: '/upload_file',
        //   builder: (context, state) => const ScreenUploadFile(),
        // ),
      ];
}
