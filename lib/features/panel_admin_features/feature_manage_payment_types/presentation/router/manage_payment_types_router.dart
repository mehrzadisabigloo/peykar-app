import 'package:go_router/go_router.dart';
import '../../../../../../core/services/feature_router.dart';
import '../screen/screen_manage_payment_types.dart';

class ManagePaymentTypesRouter implements FeatureRouter {
  @override
  List<RouteBase> get routes => [
        GoRoute(
          name: 'manage_payment_types',
          path: 'manage_payment_types',
          builder: (context, state) => const ScreenManagePaymentTypes(),
        ),
      ];
}
