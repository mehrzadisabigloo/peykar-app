import '../../../../../../core/services/generic_api_service.dart';

class ManageAddressesApiProvider {
  final GenericApiService _apiService;

  ManageAddressesApiProvider(this._apiService);

  Future<dynamic> addAddress(Map<String, dynamic> data) async {
    return await _apiService.post('/address/add', data);
  }

  Future<dynamic> editAddress(String addressId, Map<String, dynamic> data) async {
    return await _apiService.put('/address/edit/$addressId', data);
  }

  Future<dynamic> getAddress(String addressId) async {
    return await _apiService.get('/address/get/$addressId');
  }

  Future<dynamic> deleteAddress(String addressId) async {
    return await _apiService.delete('/address/delete/$addressId');
  }

  Future<dynamic> listAddresses({bool isPaginate = true, int countItem = 10}) async {
    return await _apiService.post('/address/list', {
      'is_paginate': isPaginate,
      'count_item': countItem,
    });
  }

  Future<dynamic> fetchOstans() async {
    return await _apiService.get('/location/ostan');
  }

  Future<dynamic> fetchShahrestans(int ostanId) async {
    return await _apiService.get('/location/shahrestan/$ostanId');
  }
}
