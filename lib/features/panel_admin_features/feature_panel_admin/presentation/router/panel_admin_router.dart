import 'package:go_router/go_router.dart';
import '../../../../../core/services/feature_router.dart';
import '../../../feature_manage_addresses/presentation/router/manage_addresses_router.dart';
import '../../../feature_manage_bank_accounts/presentation/router/manage_bank_accounts_router.dart';
import '../../../feature_manage_discounts/presentation/router/manage_discounts_router.dart';
import '../../../feature_manage_sending_methods/presentation/router/manage_sending_methods_router.dart';
import '../../../feature_occupation/presentation/router/occupation_router.dart';
import '../../../feature_manage_users/presentation/router/manage_users_router.dart';
import '../../../feature_manage_payment_types/presentation/router/manage_payment_types_router.dart';
import '../../../feature_manage_service/presentation/router/manage_service_router.dart';
import '../../../feature_manage_shop_products/presentation/router/manage_shop_products_router.dart';
import '../../../feature_manage_reminder_types/presentation/router/manage_reminder_types_router.dart';
import '../../../feature_manage_reminder_sub_items/presentation/router/manage_reminder_sub_items_router.dart';
import '../../../feature_manage_ratings/presentation/router/manage_ratings_router.dart';
import '../../../feature_manage_shop_settings/presentation/router/manage_shop_settings_router.dart';
import '../../../feature_banner/presentation/router/banner_router.dart';
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
            ...ManageUsersRouter().routes,
            ...ManagePaymentTypesRouter().routes,
            ...ManageServiceRouter().routes,
            ...ManageShopProductsRouter().routes,
            ...ManageReminderTypesRouter().routes,
            ...ManageReminderSubItemsRouter().routes,
            ...ManageRatingsRouter().routes,
            ...ManageShopSettingsRouter().routes,
            ...BannerRouter().routes,
          ],
        ),
      ];
}
