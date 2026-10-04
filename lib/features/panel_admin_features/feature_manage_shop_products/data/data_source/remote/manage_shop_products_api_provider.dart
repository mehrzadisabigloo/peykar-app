import '../../../../../../core/services/generic_api_service.dart';

class ManageShopProductsApiProvider {
  final GenericApiService _apiService;

  ManageShopProductsApiProvider(this._apiService);

  Future<dynamic> listAdminProducts(Map<String, dynamic> params) async {
    return await _apiService.post('/products/admin-product/list', params);
  }

  Future<dynamic> listActiveAdminProducts(Map<String, dynamic> params) async {
    return await _apiService.post('/products/admin-product/list-active', params);
  }

  Future<dynamic> getAdminProduct(String productId) async {
    return await _apiService.get('/products/admin-product/get/$productId');
  }

  Future<dynamic> addAdminProduct(Map<String, dynamic> data) async {
    return await _apiService.post('/products/admin-product/add', data);
  }

  Future<dynamic> editAdminProduct(String productId, Map<String, dynamic> data) async {
    return await _apiService.put('/products/admin-product/edit/$productId', data);
  }

  Future<dynamic> deleteAdminProduct(String productId) async {
    return await _apiService.delete('/products/admin-product/delete/$productId');
  }

  Future<dynamic> changeAdminProductStatus(String productId) async {
    return await _apiService.patch('/products/admin-product/change-status/$productId', {});
  }

  Future<dynamic> fetchCategories() async {
    final params = {
      "is_paginate": false,
      "tree": true,
    };
    return await _apiService.post("/categories/list-active", params);
  }
}
