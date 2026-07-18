import '../../../../../core/resources/data_state.dart';
import '../../domain/entity/manage_sending_methods_entity.dart';
import '../../domain/repository/manage_sending_methods_repository.dart';
import '../data_source/remote/manage_sending_methods_api_provider.dart';
import '../model/sending_method_model.dart';

class ManageSendingMethodsRepositoryImpl extends ManageSendingMethodsRepository {
  final ManageSendingMethodsApiProvider _apiProvider;
  ManageSendingMethodsRepositoryImpl(this._apiProvider);

  @override
  Future<DataState<ManageSendingMethodsEntity>> listSendingMethods() async {
    try {
      final response = await _apiProvider.listSendingMethods();
      if (response.statusCode == 200) {
        if (response.data['success'] == true) {
          return DataSuccess(ManageSendingMethodsEntity.fromJson(response.data));
        } else {
          return DataFailed(response.data['message'] ?? "خطا در دریافت لیست روش‌های ارسال");
        }
      } else {
        return DataFailed("خطای سرور: ${response.statusCode}");
      }
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<bool>> addSendingMethod(SendingMethodModel method) async {
    try {
      final response = await _apiProvider.addSendingMethod(method.toJson());
      if (response.statusCode == 200) {
        if (response.data['success'] == true) {
          return DataSuccess(true);
        } else {
          return DataFailed(response.data['message'] ?? "خطا در ایجاد روش ارسال");
        }
      } else {
        return DataFailed("خطای سرور: ${response.statusCode}");
      }
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<bool>> updateSendingMethod(String id, SendingMethodModel method) async {
    try {
      final response = await _apiProvider.updateSendingMethod(id, method.toJson());
      if (response.statusCode == 200) {
        if (response.data['success'] == true) {
          return DataSuccess(true);
        } else {
          return DataFailed(response.data['message'] ?? "خطا در بروزرسانی روش ارسال");
        }
      } else {
        return DataFailed("خطای سرور: ${response.statusCode}");
      }
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<SendingMethodModel>> getSendingMethod(String id) async {
    try {
      final response = await _apiProvider.getSendingMethod(id);
      if (response.statusCode == 200) {
        if (response.data['success'] == true) {
          return DataSuccess(SendingMethodModel.fromJson(response.data['data']));
        } else {
          return DataFailed(response.data['message'] ?? "خطا در دریافت اطلاعات روش ارسال");
        }
      } else {
        return DataFailed("خطای سرور: ${response.statusCode}");
      }
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<bool>> deleteSendingMethod(String id) async {
    try {
      final response = await _apiProvider.deleteSendingMethod(id);
      if (response.statusCode == 200) {
        if (response.data['success'] == true) {
          return DataSuccess(true);
        } else {
          return DataFailed(response.data['message'] ?? "خطا در حذف روش ارسال");
        }
      } else {
        return DataFailed("خطای سرور: ${response.statusCode}");
      }
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<bool>> changeStatus(String id) async {
    try {
      final response = await _apiProvider.changeStatus(id);
      if (response.statusCode == 200) {
        if (response.data['success'] == true) {
          return DataSuccess(true);
        } else {
          return DataFailed(response.data['message'] ?? "خطا در تغییر وضعیت روش ارسال");
        }
      } else {
        return DataFailed("خطای سرور: ${response.statusCode}");
      }
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
