import 'package:go_router/go_router.dart';
import '../../../../../../core/services/feature_router.dart';
import '../screen/screen_manage_sending_methods.dart';
import '../screen/screen_add_sending_method.dart';

class ManageSendingMethodsRouter implements FeatureRouter {
  @override
  List<RouteBase> get routes => [
        GoRoute(
          name: 'manage_sending_methods',
          path: 'sending_methods',
          builder: (context, state) => const ScreenManageSendingMethods(),
        ),
        GoRoute(
          name: 'add_sending_method',
          path: 'sending_methods/add',
          builder: (context, state) => const ScreenAddSendingMethod(),
        ),
        GoRoute(
          name: 'edit_sending_method',
          path: 'sending_methods/edit/:id',
          builder: (context, state) => ScreenAddSendingMethod(methodId: state.pathParameters['id']),
        ),
      ];
}
