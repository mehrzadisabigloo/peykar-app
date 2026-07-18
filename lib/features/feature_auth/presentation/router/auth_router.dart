import 'package:go_router/go_router.dart';
import '../../../../core/services/feature_router.dart';
import '../screen/login.dart';
import '../screen/auth_verify.dart';
import '../screen/set_password.dart';
import '../screen/login_password.dart';
import '../screen/sign_up.dart';
import '../screen/forget_password.dart';
import '../screen/change_password.dart';

class AuthRouter implements FeatureRouter {
  @override
  List<RouteBase> get routes => [
        GoRoute(
          name: 'login',
          path: '/',
          builder: (context, state) => const DesignedLoginPage(force: false),
        ),
        GoRoute(
          name: 'verify',
          path: '/verify',
          builder: (context, state) {
            final extra = state.extra as Map<String, dynamic>;
            return AuthVerifyPage(
              phoneNumber: extra['phoneNumber'],
              hasPass: extra['hasPass'],
            );
          },
        ),
        GoRoute(
          name: 'set-password',
          path: '/set-password',
          builder: (context, state) {
            final extra = state.extra as Map<String, dynamic>;
            return SetPasswordPage(phoneNumber: extra['phoneNumber']);
          },
        ),
        GoRoute(
          name: 'login-password',
          path: '/login-password',
          builder: (context, state) {
            final extra = state.extra as Map<String, dynamic>;
            return LoginPasswordPage(phoneNumber: extra['phoneNumber']);
          },
        ),
        GoRoute(
          name: 'forget-password',
          path: '/forget-password',
          builder: (context, state) {
            final extra = state.extra as Map<String, dynamic>;
            return ForgetPasswordPage(phoneNumber: extra['phoneNumber']);
          },
        ),
        GoRoute(
          name: 'change-password',
          path: '/change-password',
          builder: (context, state) => const ChangePasswordPage(),
        ),
        GoRoute(
          name: 'signup',
          path: '/signup',
          builder: (context, state) {
            final extra = state.extra as Map<String, dynamic>;
            return SignUpPage(mobile: extra['mobile']);
          },
        ),
      ];
}
