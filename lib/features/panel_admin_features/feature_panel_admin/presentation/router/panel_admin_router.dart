import 'package:go_router/go_router.dart';
import '../../../../../core/services/feature_router.dart';
import '../../../feature_manage_addresses/presentation/router/manage_addresses_router.dart';
import '../../../feature_manage_bank_accounts/presentation/router/manage_bank_accounts_router.dart';
import '../../../feature_manage_discounts/presentation/router/manage_discounts_router.dart';
import '../../../feature_manage_sending_methods/presentation/router/manage_sending_methods_router.dart';
import '../../../feature_occupation/presentation/router/occupation_router.dart';
import '../screen/screen_panel_admin.dart';

class PanelAdminRouter implements FeatureRouter {
  @override
  List<RouteBase> get routes => [
        GoRoute(
          name: 'panel_admin',
          path: '/admin/panel',
          builder: (context, state) => const ScreenPanelAdmin(),
          routes: [
            ...ManageAddressesRouter().routes,
            ...ManageBankAccountsRouter().routes,
            ...ManageDiscountsRouter().routes,
            ...ManageSendingMethodsRouter().routes,
            ...OccupationRouter().routes,
          ],
        ),
      ];
}
