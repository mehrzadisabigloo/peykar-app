import 'package:go_router/go_router.dart';
import '../../../../../core/services/feature_router.dart';
import '../screen/screen_manage_bank_accounts.dart';
import '../screen/screen_add_bank_account.dart';
import '../../domain/entity/manage_bank_accounts_entity.dart';

class ManageBankAccountsRouter implements FeatureRouter {
  @override
  List<RouteBase> get routes => [
        GoRoute(
          name: 'manage_bank_accounts',
          path: 'bank_accounts',
          builder: (context, state) => const ScreenManageBankAccounts(),
        ),
        GoRoute(
          name: 'add_bank_account',
          path: 'bank_accounts/add',
          builder: (context, state) => const ScreenAddBankAccount(),
        ),
        GoRoute(
          name: 'edit_bank_account',
          path: 'bank_accounts/edit/:id',
          builder: (context, state) => ScreenAddBankAccount(
            account: state.extra as BankAccountEntity?,
          ),
        ),
      ];
}
