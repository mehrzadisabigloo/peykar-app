import '../../../../core/resources/data_state.dart';
import '../entity/shop_entity.dart';

abstract class ShopRepository {
  Future<DataState<ShopEntity>> fetchShopData();
}
