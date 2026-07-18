import 'package:go_router/go_router.dart';
import '../../../../../core/services/feature_router.dart';
import '../screen/screen_manage_occupations.dart';

class OccupationRouter implements FeatureRouter {
  @override
  List<RouteBase> get routes => [
        GoRoute(
          name: 'manage_occupations',
          path: 'occupations', // This will be relative to /admin/panel
          builder: (context, state) => const ScreenManageOccupations(),
        ),
      ];
}
