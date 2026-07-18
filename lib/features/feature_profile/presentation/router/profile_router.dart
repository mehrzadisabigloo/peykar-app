import 'package:go_router/go_router.dart';
import '../../../../core/services/feature_router.dart';
import '../screen/screen_profile.dart';

class ProfileRouter implements FeatureRouter {
  @override
  List<RouteBase> get routes => [
        GoRoute(
          name: 'profile',
          path: '/profile',
          builder: (context, state) => const ScreenProfile(),
        ),
      ];
}
