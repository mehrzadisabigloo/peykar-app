import 'package:dio/dio.dart';
import '../../../../../../core/services/generic_api_service.dart';

class ManageDiscountsApiProvider {
  final GenericApiService _apiService = GenericApiService();

  Future<Response> addDiscount(Map<String, dynamic> data) async {
    return await _apiService.post('/discount-code/add', data);
  }

  Future<Response> listDiscounts({int countItem = 10, bool isPaginate = true}) async {
    return await _apiService.post('/discount-code/list', {
      'count_item': countItem,
      'is_paginate': isPaginate,
    });
  }

  Future<Response> getDiscount(String id) async {
    return await _apiService.get('/discount-code/$id');
  }

  Future<Response> deleteDiscount(String id) async {
    return await _apiService.delete('/discount-code/delete/$id');
  }

  Future<Response> changeStatus(String id) async {
    return await _apiService.put('/discount-code/change-status/$id', {});
  }
}
