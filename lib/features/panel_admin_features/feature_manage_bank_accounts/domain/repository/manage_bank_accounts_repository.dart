import '../../../../../../core/resources/data_state.dart';
import 'package:resturant_app/features/panel_admin_features/feature_manage_bank_accounts/domain/entity/manage_bank_accounts_entity.dart';

abstract class ManageBankAccountsRepository {
  Future<DataState<List<BankAccountEntity>>> fetchBankAccounts(BankAccountFilterParams params);
  Future<DataState<List<BankAccountEntity>>> fetchActiveBankAccounts(BankAccountFilterParams params);
  Future<DataState<BankAccountEntity>> fetchBankAccountInfo(String id);
  Future<DataState<bool>> addBankAccount(BankAccountEntity bankAccount);
  Future<DataState<bool>> updateBankAccount(String id, BankAccountEntity bankAccount);
  Future<DataState<bool>> deleteBankAccount(String id);
  Future<DataState<bool>> changeBankAccountStatus(String id);
  Future<DataState<List<BankEntity>>> fetchBanks({BankFilterParams? params});
}
