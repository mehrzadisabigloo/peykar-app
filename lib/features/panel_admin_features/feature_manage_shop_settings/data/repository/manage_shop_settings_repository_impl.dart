import 'package:dio/dio.dart';
import '../../../../../core/resources/data_state.dart';
import '../../domain/repository/manage_shop_settings_repository.dart';
import '../data_source/remote/manage_shop_settings_api_provider.dart';
import '../model/shop_setting_model.dart';

class ManageShopSettingsRepositoryImpl extends ManageShopSettingsRepository {
  final ManageShopSettingsApiProvider _apiProvider;
  ManageShopSettingsRepositoryImpl(this._apiProvider);

  @override
  Future<DataState<List<ShopSettingModel>>> getShopSettings() async {
    try {
      final response = await _apiProvider.getShopSettings();
      if (response is Response && (response.statusCode == 200 || response.statusCode == 201)) {
        if (response.data['success'] == true) {
          final List<dynamic> data = response.data['data'] ?? [];
          final items = data.map((e) => ShopSettingModel.fromJson(e)).toList();
          return DataSuccess(items);
        } else {
          return DataFailed(response.data['message'] ?? "خطایی در دریافت تنظیمات فروشگاه رخ داد");
        }
      } else {
        return DataFailed("خطای سرور: ${response is Response ? response.statusCode : 'نامشخص'}");
      }
    } catch (e) {
      return const DataFailed('پاسخی دریافت نشد');
    }
  }

  @override
  Future<DataState<dynamic>> changeStatus(String key) async {
    try {
      final response = await _apiProvider.changeStatus(key);
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
