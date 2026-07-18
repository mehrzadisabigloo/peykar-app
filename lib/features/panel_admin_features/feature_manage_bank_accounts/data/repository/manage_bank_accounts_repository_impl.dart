import 'package:dio/dio.dart';
import '../../../../../../core/resources/data_state.dart';
import 'package:resturant_app/features/panel_admin_features/feature_manage_bank_accounts/domain/entity/manage_bank_accounts_entity.dart';
import '../../domain/repository/manage_bank_accounts_repository.dart';
import '../data_source/remote/manage_bank_accounts_api_provider.dart';
import '../model/bank_account_model.dart';

class ManageBankAccountsRepositoryImpl extends ManageBankAccountsRepository {
  // Implementation of ManageBankAccountsRepository
  final ManageBankAccountsApiProvider _apiProvider;

  ManageBankAccountsRepositoryImpl(this._apiProvider);

  @override
  Future<DataState<List<BankEntity>>> fetchBanks({BankFilterParams? params}) async {
    try {
      final Response response = await _apiProvider.fetchBanks(params ?? const BankFilterParams());
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'] is List ? response.data['data'] : [];
        final List<BankEntity> banks = data
            .whereType<Map<String, dynamic>>()
            .map((json) => BankModel.fromJson(json).toEntity())
            .toList();
        return DataSuccess<List<BankEntity>>(banks);
      } else {
        return DataFailed<List<BankEntity>>(response.data['message'] ?? "خطایی در دریافت لیست بانک‌ها رخ داد");
      }
    } catch (e) {
      return const DataFailed<List<BankEntity>>('پاسخی دریافت نشد');
    }
  }

  @override
  Future<DataState<List<BankAccountEntity>>> fetchBankAccounts(BankAccountFilterParams params) async {
    try {
      final Response response = await _apiProvider.fetchBankAccounts(params);
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'] is List ? response.data['data'] : [];
        final accounts = data
            .whereType<Map<String, dynamic>>()
            .map((json) => BankAccountModel.fromJson(json).toEntity())
            .toList();
        return DataSuccess(accounts);
      } else {
        return DataFailed(response.data['message'] ?? "خطایی در دریافت لیست حساب‌ها رخ داد");
      }
    } catch (e) {
      return const DataFailed('پاسخی دریافت نشد');
    }
  }

  @override
  Future<DataState<List<BankAccountEntity>>> fetchActiveBankAccounts(BankAccountFilterParams params) async {
    try {
      final Response response = await _apiProvider.fetchActiveBankAccounts(params);
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'] is List ? response.data['data'] : [];
        final accounts = data
            .whereType<Map<String, dynamic>>()
            .map((json) => BankAccountModel.fromJson(json).toEntity())
            .toList();
        return DataSuccess(accounts);
      } else {
        return DataFailed(response.data['message'] ?? "خطایی در دریافت لیست حساب‌های فعال رخ داد");
      }
    } catch (e) {
      return const DataFailed('پاسخی دریافت نشد');
    }
  }

  @override
  Future<DataState<BankAccountEntity>> fetchBankAccountInfo(String id) async {
    try {
      final Response response = await _apiProvider.fetchBankAccountInfo(id);
      if (response.statusCode == 200) {
        final model = BankAccountModel.fromJson(response.data['data']);
        return DataSuccess(model.toEntity());
      } else {
        return DataFailed(response.data['message'] ?? "حساب بانکی یافت نشد");
      }
    } catch (e) {
      return const DataFailed('پاسخی دریافت نشد');
    }
  }

  @override
  Future<DataState<bool>> addBankAccount(BankAccountEntity bankAccount) async {
    try {
      final model = BankAccountModel.fromEntity(bankAccount);
      final Response response = await _apiProvider.addBankAccount({
        "bank_id": model.bankId,
        "full_name": model.fullName,
        "card_number": model.cardNumber,
        "account_number": model.accountNumber,
        "sheba_number": model.shebaNumber,
      });
      if (response.statusCode == 200) {
        return const DataSuccess(true);
      } else {
        return DataFailed(response.data['message'] ?? "خطا در ثبت حساب بانکی");
      }
    } catch (e) {
      return const DataFailed('پاسخی دریافت نشد');
    }
  }

  @override
  Future<DataState<bool>> updateBankAccount(String id, BankAccountEntity bankAccount) async {
    try {
      final model = BankAccountModel.fromEntity(bankAccount);
      final Response response = await _apiProvider.updateBankAccount(id, {
        "bank_id": model.bankId,
        "full_name": model.fullName,
        "card_number": model.cardNumber,
        "account_number": model.accountNumber,
        "sheba_number": model.shebaNumber,
      });
      if (response.statusCode == 200) {
        return const DataSuccess(true);
      } else {
        return DataFailed(response.data['message'] ?? "خطا در بروزرسانی حساب بانکی");
      }
    } catch (e) {
      return const DataFailed('پاسخی دریافت نشد');
    }
  }

  @override
  Future<DataState<bool>> deleteBankAccount(String id) async {
    try {
      final Response response = await _apiProvider.deleteBankAccount(id);
      if (response.statusCode == 200) {
        return const DataSuccess(true);
      } else {
        return DataFailed(response.data['message'] ?? "خطا در حذف حساب بانکی");
      }
    } catch (e) {
      return const DataFailed('پاسخی دریافت نشد');
    }
  }

  @override
  Future<DataState<bool>> changeBankAccountStatus(String id) async {
    try {
      final Response response = await _apiProvider.changeBankAccountStatus(id);
      if (response.statusCode == 200) {
        return const DataSuccess(true);
      } else {
        return DataFailed(response.data['message'] ?? "خطا در تغییر وضعیت حساب بانکی");
      }
    } catch (e) {
      return const DataFailed('پاسخی دریافت نشد');
    }
  }
}
