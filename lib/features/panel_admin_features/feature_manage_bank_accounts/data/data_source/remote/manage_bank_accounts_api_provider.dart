import '../../../../../../core/services/generic_api_service.dart';
import '../../../domain/entity/manage_bank_accounts_entity.dart';

class ManageBankAccountsApiProvider {
  final GenericApiService _apiService;

  ManageBankAccountsApiProvider(this._apiService);

  Future<dynamic> fetchBankAccounts(BankAccountFilterParams params) async {
    return await _apiService.post('/bank_account/list', params.toJson());
  }

  Future<dynamic> fetchActiveBankAccounts(BankAccountFilterParams params) async {
    return await _apiService.post('/bank_account/active', params.toJson());
  }

  Future<dynamic> fetchBankAccountInfo(String id) async {
    return await _apiService.get('/bank_account/info/$id');
  }

  Future<dynamic> addBankAccount(Map<String, dynamic> params) async {
    return await _apiService.post('/bank_account/add', params);
  }

  Future<dynamic> updateBankAccount(String id, Map<String, dynamic> params) async {
    return await _apiService.put('/bank_account/update/$id', params);
  }

  Future<dynamic> deleteBankAccount(String id) async {
    return await _apiService.delete('/bank_account/delete/$id');
  }

  Future<dynamic> changeBankAccountStatus(String id) async {
    return await _apiService.put('/bank_account/change-status/$id', {});
  }

  Future<dynamic> fetchBanks(BankFilterParams params) async {
    return await _apiService.post('/bank/list', params.toJson());
  }
}
