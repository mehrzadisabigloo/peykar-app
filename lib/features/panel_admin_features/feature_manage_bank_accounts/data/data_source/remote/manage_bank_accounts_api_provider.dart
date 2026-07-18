import 'package:dio/dio.dart';
import '../../../../../../core/services/generic_api_service.dart';
import '../../../domain/entity/manage_bank_accounts_entity.dart';

class ManageBankAccountsApiProvider {
  final GenericApiService _apiService = GenericApiService();

  Future<Response> fetchBankAccounts(BankAccountFilterParams params) async {
    return await _apiService.post('/bank_account/list', params.toJson());
  }

  Future<Response> fetchActiveBankAccounts(BankAccountFilterParams params) async {
    return await _apiService.post('/bank_account/active', params.toJson());
  }

  Future<Response> fetchBankAccountInfo(String id) async {
    return await _apiService.get('/bank_account/info/$id');
  }

  Future<Response> addBankAccount(Map<String, dynamic> params) async {
    return await _apiService.post('/bank_account/add', params);
  }

  Future<Response> updateBankAccount(String id, Map<String, dynamic> params) async {
    return await _apiService.put('/bank_account/update/$id', params);
  }

  Future<Response> deleteBankAccount(String id) async {
    return await _apiService.delete('/bank_account/delete/$id');
  }

  Future<Response> changeBankAccountStatus(String id) async {
    return await _apiService.put('/bank_account/change-status/$id', {});
  }

  Future<Response> fetchBanks(BankFilterParams params) async {
    return await _apiService.post('/bank/list', params.toJson());
  }
}
