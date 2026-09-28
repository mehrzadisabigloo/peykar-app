import 'package:dio/dio.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../domain/entity/payment_type_entity.dart';
import '../../domain/repository/manage_payment_types_repository.dart';
import '../data_source/remote/manage_payment_types_api_provider.dart';
import '../model/payment_type_model.dart';

class ManagePaymentTypesRepositoryImpl extends ManagePaymentTypesRepository {
  final ManagePaymentTypesApiProvider _apiProvider;
  ManagePaymentTypesRepositoryImpl(this._apiProvider);

  @override
  Future<DataState<List<PaymentTypeEntity>>> fetchPaymentTypes(Map<String, dynamic> params) async {
    try {
      final response = await _apiProvider.listPaymentTypes(params);
      if (response is Response && (response.statusCode == 200 || response.statusCode == 201)) {
        if (response.data['success'] == true) {
          final List<dynamic> data = response.data['data'] ?? [];
          final items = data.map((e) => PaymentTypeModel.fromJson(e)).toList();
          return DataSuccess(items.map((e) => PaymentTypeEntity(
            id: e.id,
            title: e.title,
            label: e.label,
            type: e.type,
            status: e.status,
            createdAt: e.createdAt,
            updatedAt: e.updatedAt,
          )).toList());
        } else {
          return DataFailed(response.data['message'] ?? "خطایی در دریافت لیست روش‌های پرداخت رخ داد");
        }
      } else {
        return DataFailed("خطای سرور: ${response is Response ? response.statusCode : 'نامشخص'}");
      }
    } catch (e) {
      return const DataFailed('پاسخی دریافت نشد');
    }
  }

  @override
  Future<DataState<dynamic>> changePaymentTypeStatus(int id) async {
    try {
      final response = await _apiProvider.changeStatus(id);
      if (response is Response && (response.statusCode == 200 || response.statusCode == 201)) {
        if (response.data['success'] == true) {
          return DataSuccess(response.data);
        } else {
          return DataFailed(response.data['message'] ?? "خطا در تغییر وضعیت");
        }
      } else {
        return DataFailed("خطای سرور: ${response is Response ? response.statusCode : 'نامشخص'}");
      }
    } catch (e) {
      return const DataFailed('پاسخی دریافت نشد');
    }
  }
}
