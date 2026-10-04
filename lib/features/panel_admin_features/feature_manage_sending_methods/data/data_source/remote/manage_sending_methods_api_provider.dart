import '../../../../../../core/services/generic_api_service.dart';

class ManageSendingMethodsApiProvider {
  final GenericApiService _apiService;

  ManageSendingMethodsApiProvider(this._apiService);

  Future<dynamic> addSendingMethod(Map<String, dynamic> data) async {
    return await _apiService.post('/sending-method/add', data);
  }

  Future<dynamic> updateSendingMethod(String id, Map<String, dynamic> data) async {
    return await _apiService.patch('/sending-method/update/$id', data);
  }

  Future<dynamic> listSendingMethods({int countItem = 10, bool isPaginate = true}) async {
    return await _apiService.post('/sending-method/list', {
      'count_item': countItem,
      'is_paginate': isPaginate,
    });
  }

  Future<dynamic> getSendingMethod(String id) async {
    return await _apiService.get('/sending-method/$id');
  }

  Future<dynamic> deleteSendingMethod(String id) async {
    return await _apiService.delete('/sending-method/delete/$id');
  }

  Future<dynamic> changeStatus(String id) async {
    return await _apiService.patch('/sending-method/change-status/$id', {});
  }

  Future<dynamic> fetchOstans() async {
    return await _apiService.get('/location/ostan');
  }

  Future<dynamic> fetchShahrestans(int ostanId) async {
    return await _apiService.get('/location/shahrestan/$ostanId');
  }
}
