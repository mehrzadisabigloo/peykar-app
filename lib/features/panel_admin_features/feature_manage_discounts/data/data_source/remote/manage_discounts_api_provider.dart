import '../../../../../../core/services/generic_api_service.dart';

class ManageDiscountsApiProvider {
  final GenericApiService _apiService;

  ManageDiscountsApiProvider(this._apiService);

  Future<dynamic> addDiscount(Map<String, dynamic> data) async {
    return await _apiService.post('/discount-code/add', data);
  }

  Future<dynamic> listDiscounts({int countItem = 10, bool isPaginate = true}) async {
    return await _apiService.post('/discount-code/list', {
      'count_item': countItem,
      'is_paginate': isPaginate,
    });
  }

  Future<dynamic> getDiscount(String id) async {
    return await _apiService.get('/discount-code/$id');
  }

  Future<dynamic> deleteDiscount(String id) async {
    return await _apiService.delete('/discount-code/delete/$id');
  }

  Future<dynamic> changeStatus(String id) async {
    return await _apiService.put('/discount-code/change-status/$id', {});
  }
}
