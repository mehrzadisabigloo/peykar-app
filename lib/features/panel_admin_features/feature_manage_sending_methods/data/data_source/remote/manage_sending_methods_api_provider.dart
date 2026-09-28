import 'package:dio/dio.dart';
import '../../../../../../core/services/generic_api_service.dart';

class ManageSendingMethodsApiProvider {
  final GenericApiService _apiService = GenericApiService();

  Future<Response> addSendingMethod(Map<String, dynamic> data) async {
    return await _apiService.post('/sending-method/add', data);
  }

  Future<Response> updateSendingMethod(String id, Map<String, dynamic> data) async {
    return await _apiService.patch('/sending-method/update/$id', data);
  }

  Future<Response> listSendingMethods({int countItem = 10, bool isPaginate = true}) async {
    return await _apiService.post('/sending-method/list', {
      'count_item': countItem,
      'is_paginate': isPaginate,
    });
  }

  Future<Response> getSendingMethod(String id) async {
    return await _apiService.get('/sending-method/$id');
  }

  Future<Response> deleteSendingMethod(String id) async {
    return await _apiService.delete('/sending-method/delete/$id');
  }

  Future<Response> changeStatus(String id) async {
    return await _apiService.patch('/sending-method/change-status/$id', {});
  }

  Future<Response> fetchOstans() async {
    return await _apiService.get('/location/ostan');
  }

  Future<Response> fetchShahrestans(int ostanId) async {
    return await _apiService.get('/location/shahrestan/$ostanId');
  }
}
