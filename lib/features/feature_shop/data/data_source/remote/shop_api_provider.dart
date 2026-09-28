
import 'package:resturant_app/core/services/generic_api_service.dart';

class ShopApiProvider {
  final GenericApiService _apiService = GenericApiService();

  Future<dynamic> getShopData(Map<String, dynamic> params) async {
    return await _apiService.post('/products/admin-product/list-active', params);
  }

  Future<dynamic> fetchCategories({
    bool isPaginate = true,
    int countItem = 10,
  }) async {
    final params = {
      "is_paginate": isPaginate,
      "count_item": countItem,
      "tree": true,
    };
    return await _apiService.post("/categories/list-active", params);
  }
}
