import 'package:dio/dio.dart';
import '../../../../core/resources/data_state.dart';
import '../../../panel_admin_features/feature_manage_payment_types/data/model/payment_type_model.dart';
import '../../domain/repository/repairman_payment_type_repository.dart';
import '../data_source/remote/repairman_payment_type_api_provider.dart';
import '../model/repairman_payment_type_model.dart';

class RepairmanPaymentTypeRepositoryImpl extends RepairmanPaymentTypeRepository {
  final RepairmanPaymentTypeApiProvider _apiProvider;

  RepairmanPaymentTypeRepositoryImpl(this._apiProvider);

  @override
  Future<DataState<RepairmanPaymentTypeModel>> addPaymentType(int paymentTypeId) async {
    try {
      final response = await _apiProvider.addPaymentType(paymentTypeId);
      if (response is Response && response.statusCode == 200) {
        final body = response.data;
        if (body is Map && body['success'] == true) {
          final model = RepairmanPaymentTypeModel.fromJson(body['data']);
          return DataSuccess(model);
        }
        return DataFailed(body is Map ? (body['message'] ?? "خطایی رخ داد") : "خطایی رخ داد");
      }
      return DataFailed(response is Response && response.data is Map 
          ? (response.data['message'] ?? "خطا در اضافه کردن روش پرداخت") 
          : "خطا در اضافه کردن روش پرداخت");
    } catch (e) {
      return const DataFailed("خطایی رخ داد");
    }
  }

  @override
  Future<DataState<String>> removePaymentType(int paymentTypeId) async {
    try {
      final response = await _apiProvider.removePaymentType(paymentTypeId);
      if (response is Response && response.statusCode == 200) {
        final body = response.data;
        if (body is Map && body['success'] == true) {
          return DataSuccess(body['message'] ?? "با موفقیت حذف شد");
        }
        return DataFailed(body is Map ? (body['message'] ?? "خطایی رخ داد") : "خطایی رخ داد");
      }
      return DataFailed(response is Response && response.data is Map 
          ? (response.data['message'] ?? "خطا در حذف روش پرداخت") 
          : "خطا در حذف روش پرداخت");
    } catch (e) {
      return const DataFailed("خطایی رخ داد");
    }
  }

  @override
  Future<DataState<List<PaymentTypeModel>>> getMyPaymentTypes() async {
    try {
      final response = await _apiProvider.getMyPaymentTypes();
      if (response is Response && response.statusCode == 200) {
        final body = response.data;
        if (body is Map && body['success'] == true) {
          final data = body['data'];
          if (data is List) {
            final list = data.map((e) => PaymentTypeModel.fromJson(e)).toList();
            return DataSuccess(list);
          }
        }
        return DataFailed(body is Map ? (body['message'] ?? "خطایی رخ داد") : "خطایی رخ داد");
      }
      return DataFailed(response is Response && response.data is Map 
          ? (response.data['message'] ?? "خطا در دریافت لیست") 
          : "خطا در دریافت لیست");
    } catch (e) {
      return const DataFailed("خطایی رخ داد");
    }
  }

  @override
  Future<DataState<List<PaymentTypeModel>>> getRepairmanPaymentTypes(String repairmanId) async {
    try {
      final response = await _apiProvider.getRepairmanPaymentTypes(repairmanId);
      if (response is Response && response.statusCode == 200) {
        final body = response.data;
        if (body is Map && body['success'] == true) {
          final data = body['data'];
          if (data is List) {
            final list = data.map((e) => PaymentTypeModel.fromJson(e)).toList();
            return DataSuccess(list);
          }
        }
        return DataFailed(body is Map ? (body['message'] ?? "خطایی رخ داد") : "خطایی رخ داد");
      }
      return DataFailed(response is Response && response.data is Map 
          ? (response.data['message'] ?? "خطا در دریافت لیست") 
          : "خطا در دریافت لیست");
    } catch (e) {
      return const DataFailed("خطایی رخ داد");
    }
  }

  @override
  Future<DataState<List<PaymentTypeModel>>> getAllActivePaymentTypes() async {
    try {
      final response = await _apiProvider.getAllActivePaymentTypes();
      if (response is Response && response.statusCode == 200) {
        final body = response.data;
        if (body is Map && body['success'] == true) {
          final data = body['data'];
          if (data is List) {
            final list = data.map((e) => PaymentTypeModel.fromJson(e)).toList();
            return DataSuccess(list);
          }
        }
        return DataFailed(body is Map ? (body['message'] ?? "خطایی رخ داد") : "خطایی رخ داد");
      }
      return DataFailed(response is Response && response.data is Map 
          ? (response.data['message'] ?? "خطا در دریافت لیست") 
          : "خطا در دریافت لیست");
    } catch (e) {
      return const DataFailed("خطایی رخ داد");
    }
  }
}
