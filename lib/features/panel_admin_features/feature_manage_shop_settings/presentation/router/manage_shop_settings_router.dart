import 'package:go_router/go_router.dart';
import '../../../../../../core/services/feature_router.dart';
import '../screen/screen_manage_shop_settings.dart';

class ManageShopSettingsRouter implements FeatureRouter {
  @override
  List<RouteBase> get routes => [
        GoRoute(
          name: 'manage_shop_settings',
          path: 'manage_shop_settings',
          builder: (context, state) => const ScreenManageShopSettings(),
        ),
      ];
}
