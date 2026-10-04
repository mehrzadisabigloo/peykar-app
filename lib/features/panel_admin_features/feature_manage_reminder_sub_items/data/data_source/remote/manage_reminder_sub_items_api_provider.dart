import '../../../../../../core/services/generic_api_service.dart';

class ManageReminderSubItemsApiProvider {
  final GenericApiService _genericApiService;

  ManageReminderSubItemsApiProvider(this._genericApiService);

  Future<dynamic> addSubItem(String reminderTypeId, String title) async {
    return await _genericApiService.post("/reminder-sub-items/add/$reminderTypeId", {'title': title});
  }

  Future<dynamic> addSubItemsBulk(String reminderTypeId, List<String> titles) async {
    final items = titles.map((t) => {'title': t}).toList();
    return await _genericApiService.post("/reminder-sub-items/add-bulk/$reminderTypeId", {'items': items});
  }

  Future<dynamic> editSubItem(String id, String title) async {
    return await _genericApiService.put("/reminder-sub-items/edit/$id", {'title': title});
  }

  Future<dynamic> deleteSubItem(String id) async {
    return await _genericApiService.delete("/reminder-sub-items/delete/$id");
  }

  Future<dynamic> getSubItem(String id) async {
    return await _genericApiService.get("/reminder-sub-items/get/$id");
  }

  Future<dynamic> changeStatus(String id) async {
    return await _genericApiService.patch("/reminder-sub-items/change-status/$id", {});
  }

  Future<dynamic> listSubItems({
    String? reminderTypeId,
    String? title,
    bool isPaginate = false,
    int countItem = 10,
    int page = 1,
  }) async {
    return await _genericApiService.post("/reminder-sub-items/list", {
      if (reminderTypeId != null) 'reminder_type_id': reminderTypeId,
      if (title != null) 'title': title,
      'is_paginate': isPaginate,
      'count_item': countItem,
      'page': page,
    });
  }

  Future<dynamic> listActiveSubItems({
    String? reminderTypeId,
    String? title,
    bool isPaginate = false,
    int countItem = 10,
    int page = 1,
  }) async {
    return await _genericApiService.post("/reminder-sub-items/list-active", {
      if (reminderTypeId != null) 'reminder_type_id': reminderTypeId,
      if (title != null) 'title': title,
      'is_paginate': isPaginate,
      'count_item': countItem,
      'page': page,
    });
  }
}
