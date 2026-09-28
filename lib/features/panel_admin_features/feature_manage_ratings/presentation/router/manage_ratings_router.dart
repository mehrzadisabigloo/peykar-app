import 'package:go_router/go_router.dart';
import '../../../../../../core/services/feature_router.dart';
import '../screen/screen_manage_ratings.dart';

class ManageRatingsRouter implements FeatureRouter {
  @override
  List<RouteBase> get routes => [
        GoRoute(
          name: 'manage_ratings',
          path: 'manage-ratings',
          builder: (context, state) => const ScreenManageRatings(),
        ),
      ];
}
