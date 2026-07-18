import '../../../../core/resources/data_state.dart';
import '../entity/shop_basket_entity.dart';

abstract class ShopBasketRepository {
  Future<DataState<ShopBasketEntity>> fetchShopBasketData();
  
  Future<DataState<dynamic>> addToCart({
    required String productId,
    required int quantity,
    String cartType = 'current',
    String? discountCodeId,
  });
}
