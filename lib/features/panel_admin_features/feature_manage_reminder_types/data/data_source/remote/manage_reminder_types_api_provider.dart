import '../../../../../../core/services/generic_api_service.dart';

class ManageReminderTypesApiProvider {
  final GenericApiService _genericApiService;

  ManageReminderTypesApiProvider(this._genericApiService);

  Future<dynamic> addReminderType(String title) async {
    return await _genericApiService.post("/reminder-types/add", {'title': title});
  }

  Future<dynamic> editReminderType(String id, String title) async {
    return await _genericApiService.put("/reminder-types/edit/$id", {'title': title});
  }

  Future<dynamic> deleteReminderType(String id) async {
    return await _genericApiService.delete("/reminder-types/delete/$id");
  }

  Future<dynamic> getReminderType(String id) async {
    return await _genericApiService.get("/reminder-types/get/$id");
  }

  Future<dynamic> changeStatus(String id) async {
    return await _genericApiService.patch("/reminder-types/change-status/$id", {});
  }

  Future<dynamic> listReminderTypes({
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

  Future<dynamic> listActiveReminderTypes({
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
