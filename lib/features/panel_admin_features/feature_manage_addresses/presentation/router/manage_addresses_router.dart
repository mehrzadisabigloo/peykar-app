import 'package:go_router/go_router.dart';
import '../../../../../core/services/feature_router.dart';
import '../screen/screen_manage_addresses.dart';
import '../screen/screen_edit_address.dart';

class ManageAddressesRouter implements FeatureRouter {
  @override
  List<RouteBase> get routes => [
        GoRoute(
          name: 'manage_addresses',
          path: 'addresses',
          builder: (context, state) => const ScreenManageAddresses(),
        ),
        GoRoute(
          name: 'add_address',
          path: 'addresses/add',
          builder: (context, state) => const ScreenEditAddress(),
        ),
        GoRoute(
          name: 'edit_address',
          path: 'addresses/edit/:id',
          builder: (context, state) => ScreenEditAddress(addressId: state.pathParameters['id']),
        ),
      ];
}
