import '../../../../../core/services/generic_api_service.dart';

class ShopBasketApiProvider {
  final GenericApiService _genericApiService = GenericApiService();

  Future<dynamic> getShopBasketData({
    String cartType = 'current',
    bool withPaymentInfo = true,
  }) async {
    final params = {
      "cart_type": cartType,
      "with_payment_info": withPaymentInfo,
    };
    return await _genericApiService.post("/cart/get", params);
  }

  Future<dynamic> addToCart({
    required String productId,
    required int quantity,
    String cartType = 'current',
    String? discountCodeId,
  }) async {
    final params = {
      "product_id": productId,
      "quantity": quantity,
      "cart_type": cartType,
      if (discountCodeId != null) "discount_code_id": discountCodeId,
    };
    return await _genericApiService.post("/cart/add", params);
  }
}
