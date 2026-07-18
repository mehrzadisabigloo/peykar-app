
import '../../../../../core/services/generic_api_service.dart';

class ManageProductsApiProvider {
  final GenericApiService _genericApiService = GenericApiService();

  Future<dynamic> getManageProductsData({
    bool isPaginate = true,
    int countItem = 10,
    String? title,
    double? priceFrom,
    double? priceTo,
  }) async {
    final params = {
      "is_paginate": isPaginate,
      "count_item": countItem,
      // "title": title,
      // "price_from": priceFrom,
      // "price_to": priceTo,
    };
    
    return await _genericApiService.post("/products/list-repairman-active", params);
  }

  Future<dynamic> addProduct({
    required String title,
    required String description,
    required List<String> images,
    required List<String> keywords,
    required double price,
    required int stock,
    required int maxPurchaseQuantity,
  }) async {
    final params = {
      "title": title,
      "description": description,
      "images": images,
      "keywords": keywords,
      "price": price,
      "stock": stock,
      "max_purchase_quantity": maxPurchaseQuantity,
    };

    return await _genericApiService.post("/products/add", params);
  }

  Future<dynamic> getProductById(String productId) async {
    return await _genericApiService.get("/products/get/$productId");
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
