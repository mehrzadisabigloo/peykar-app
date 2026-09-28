import 'package:dio/dio.dart';
import '../../../../../../core/services/generic_api_service.dart';

class ManageReminderTypesApiProvider {
  final GenericApiService _genericApiService = GenericApiService();

  Future<Response> addReminderType(String title) async {
    return await _genericApiService.post("/reminder-types/add", {'title': title});
  }

  Future<Response> editReminderType(String id, String title) async {
    return await _genericApiService.put("/reminder-types/edit/$id", {'title': title});
  }

  Future<Response> deleteReminderType(String id) async {
    return await _genericApiService.delete("/reminder-types/delete/$id");
  }

  Future<Response> getReminderType(String id) async {
    return await _genericApiService.get("/reminder-types/get/$id");
  }

  Future<Response> changeStatus(String id) async {
    return await _genericApiService.patch("/reminder-types/change-status/$id", {});
  }

  Future<Response> listReminderTypes({
    String? title,
    bool isPaginate = false,
    int countItem = 10,
    int page = 1,
  }) async {
    return await _genericApiService.post("/reminder-types/list", {
      if (title != null) 'title': title,
      'is_paginate': isPaginate,
      'count_item': countItem,
      'page': page,
    });
  }

  Future<Response> listActiveReminderTypes({
    String? title,
    bool isPaginate = false,
    int countItem = 10,
    int page = 1,
  }) async {
    return await _genericApiService.post("/reminder-types/list-active", {
      if (title != null) 'title': title,
      'is_paginate': isPaginate,
      'count_item': countItem,
      'page': page,
    });
  }
}
