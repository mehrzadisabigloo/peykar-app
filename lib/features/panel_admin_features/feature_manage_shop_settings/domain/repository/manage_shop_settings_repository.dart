import '../../../../../core/resources/data_state.dart';
import '../../data/model/shop_setting_model.dart';

abstract class ManageShopSettingsRepository {
  Future<DataState<List<ShopSettingModel>>> getShopSettings();
  Future<DataState<dynamic>> changeStatus(String key);
}
