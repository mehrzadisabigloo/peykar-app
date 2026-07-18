import 'package:go_router/go_router.dart';
import '../../../../core/services/feature_router.dart';
import '../screen/screen_manage_services.dart';
import '../screen/screen_add_service.dart';
import '../screen/screen_service_detail.dart';

class ManageServicesRouter implements FeatureRouter {
  @override
  List<RouteBase> get routes => [
        GoRoute(
          name: 'manage_services',
          path: '/manage_services',
          builder: (context, state) => const ScreenManageServices(),
        ),
        GoRoute(
          name: 'add_service',
          path: '/add_service',
          builder: (context, state) => const ScreenAddService(),
        ),
        GoRoute(
          name: 'service_detail',
          path: '/service_detail/:serviceId',
          builder: (context, state) {
            final serviceId = state.pathParameters['serviceId'] ?? '';
            return ScreenServiceDetail(serviceId: serviceId);
          },
        ),
      ];
}
