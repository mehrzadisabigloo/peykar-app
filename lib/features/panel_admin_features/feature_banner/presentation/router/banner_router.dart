import 'package:go_router/go_router.dart';
import '../../../../../core/services/feature_router.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_banner/domain/entity/banner_entity.dart';
import '../screen/screen_add_edit_banner.dart';
import '../screen/screen_manage_banners.dart';

class BannerRouter implements FeatureRouter {
  @override
  List<RouteBase> get routes => [
        GoRoute(
          name: 'manage_banners',
          path: 'banners',
          builder: (context, state) => const ScreenManageBanners(),
          routes: [
            GoRoute(
              name: 'add_banner',
              path: 'add',
              builder: (context, state) => const ScreenAddEditBanner(),
            ),
            GoRoute(
              name: 'edit_banner',
              path: 'edit',
              builder: (context, state) {
                final banner = state.extra as BannerEntity?;
                return ScreenAddEditBanner(banner: banner);
              },
            ),
          ],
        ),
      ];
}
