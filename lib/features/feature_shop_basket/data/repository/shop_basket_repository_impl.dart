import 'package:dio/dio.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/entity/shop_basket_entity.dart';
import '../../domain/repository/shop_basket_repository.dart';
import '../data_source/remote/shop_basket_api_provider.dart';
import '../model/shop_basket_model.dart';

class ShopBasketRepositoryImpl extends ShopBasketRepository {
  final ShopBasketApiProvider _apiProvider;
  ShopBasketRepositoryImpl(this._apiProvider);

  @override
  Future<DataState<ShopBasketEntity>> fetchShopBasketData() async {
    try {
      final Response response = await _apiProvider.getShopBasketData();

      if (response.statusCode == 200) {
        final dynamic rootData = response.data;
        Map<String, dynamic>? basketData;

        if (rootData is Map<String, dynamic>) {
          basketData = rootData['data'] ?? rootData;
        }

        if (basketData != null) {
          final ShopBasketEntity entity = ShopBasketModel.fromJson(Map<String, dynamic>.from(basketData));
          return DataSuccess(entity);
        } else {
          return const DataFailed("اطلاعات سبد خرید یافت نشد");
        }
      } else {
        return DataFailed(response.statusMessage ?? "Error fetching basket");
      }
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<dynamic>> addToCart({
    required String productId,
    required int quantity,
    String cartType = 'current',
    String? discountCodeId,
  }) async {
    try {
      final Response response = await _apiProvider.addToCart(
        productId: productId,
        quantity: quantity,
        cartType: cartType,
        discountCodeId: discountCodeId,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return DataSuccess(response.data);
      } else {
        return DataFailed(response.statusMessage ?? "Error adding to cart");
      }
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
