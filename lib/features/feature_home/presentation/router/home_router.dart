import 'package:go_router/go_router.dart';
import '../../../../core/services/feature_router.dart';
import '../screen/main_home_screen.dart';

class HomeRouter implements FeatureRouter {
  @override
  List<RouteBase> get routes => [
        GoRoute(
          name: 'home',
          path: '/home',
          builder: (context, state) => const MainHomeScreen(),
        ),
      ];
}
