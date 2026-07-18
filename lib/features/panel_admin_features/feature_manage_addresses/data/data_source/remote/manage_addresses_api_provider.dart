import 'package:dio/dio.dart';

import '../../../../../../core/services/generic_api_service.dart';

class ManageAddressesApiProvider {
  final GenericApiService _apiService = GenericApiService();

  Future<Response> addAddress(Map<String, dynamic> data) async {
    return await _apiService.post('/address/add', data);
  }

  Future<Response> editAddress(String addressId, Map<String, dynamic> data) async {
    return await _apiService.put('/address/edit/$addressId', data);
  }

  Future<Response> getAddress(String addressId) async {
    return await _apiService.get('/address/get/$addressId');
  }

  Future<Response> deleteAddress(String addressId) async {
    return await _apiService.delete('/address/delete/$addressId');
  }

  Future<Response> listAddresses({bool isPaginate = true, int countItem = 10}) async {
    return await _apiService.post('/address/list', {
      'is_paginate': isPaginate,
      'count_item': countItem,
    });
  }
}
