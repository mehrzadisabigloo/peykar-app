import 'package:go_router/go_router.dart';
import '../../../../../core/services/feature_router.dart';
import '../screen/screen_manage_users.dart';
import '../screen/screen_add_user.dart';

class ManageUsersRouter implements FeatureRouter {
  @override
  List<RouteBase> get routes => [
        GoRoute(
          name: 'manage_users',
          path: 'manage_users',
          builder: (context, state) => const ScreenManageUsers(),
        ),
        GoRoute(
          name: 'add_user',
          path: 'add_user',
          builder: (context, state) => const ScreenAddUser(),
        ),
      ];
}
