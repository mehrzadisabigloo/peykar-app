import '../../features/panel_admin_features/feature_manage_shop_settings/data/model/shop_setting_model.dart';

class ShopSettingsHolder {
  List<ShopSettingModel> _settings = [];

  void setSettings(List<ShopSettingModel> settings) {
    _settings = settings;
  }

  List<ShopSettingModel> get settings => _settings;

  bool isServiceActive(String key) {
    try {
      return _settings.firstWhere((element) => element.key == key).isActive ?? false;
    } catch (e) {
      return true; // Default to true if not found or error
    }
  }

  bool get isAdminShopActive => isServiceActive('admin_shop');
  bool get isRepairShopActive => isServiceActive('repairers_shop');
}
