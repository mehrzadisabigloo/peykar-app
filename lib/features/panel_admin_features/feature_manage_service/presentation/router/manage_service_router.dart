import 'package:go_router/go_router.dart';
import '../../../../../../core/services/feature_router.dart';
import '../screen/screen_manage_service.dart';

class ManageServiceRouter implements FeatureRouter {
  @override
  List<RouteBase> get routes => [
        GoRoute(
          name: 'manage_service',
          path: 'services', // Relative path for panel_admin nested routes
          builder: (context, state) => const ScreenManageService(),
        ),
      ];
}
