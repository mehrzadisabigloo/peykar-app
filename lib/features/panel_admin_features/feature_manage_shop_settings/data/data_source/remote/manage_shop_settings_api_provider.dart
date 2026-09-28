import '../../../../../../core/services/generic_api_service.dart';

class ManageShopSettingsApiProvider {
  final GenericApiService _genericApiService = GenericApiService();

  Future<dynamic> getShopSettings() async {
    return await _genericApiService.get("/shop-settings");
  }

  Future<dynamic> changeStatus(String key) async {
    return await _genericApiService.patch("/shop-settings/change-status/$key", {});
  }
}
