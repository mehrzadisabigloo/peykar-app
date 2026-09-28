
import '../../../../../../core/services/generic_api_service.dart';

class ManageServiceApiProvider {
  final GenericApiService _genericApiService = GenericApiService();

  Future<dynamic> listServices({
    bool isPaginate = true,
    int countItem = 10,
    String? title,
    String? repairmanId,
  }) async {
    final params = {
      "is_paginate": isPaginate,
      "count_item": countItem,
      if (title != null) "title": title,
      if (repairmanId != null) "repairman_id": repairmanId,
    };
    return await _genericApiService.post("/services/list", params);
  }

  Future<dynamic> addServiceByAdmin({
    required String repairmanId,
    required String title,
    required String description,
    required List<String> images,
    required List<String> keywords,
    required double priceMin,
    required double priceMax,
  }) async {
    final params = {
      "title": title,
      "description": description,
      "images": images,
      "keywords": keywords,
      "price_range": {
        "min": priceMin,
        "max": priceMax,
      }
    };
    return await _genericApiService.post("/services/add-by-admin/$repairmanId", params);
  }

  Future<dynamic> editService({
    required String serviceId,
    required String title,
    required String description,
    required List<String> images,
    required List<String> keywords,
    required double priceMin,
    required double priceMax,
  }) async {
    final params = {
      "title": title,
      "description": description,
      "images": images,
      "keywords": keywords,
      "price_range": {
        "min": priceMin,
        "max": priceMax,
      }
    };
    return await _genericApiService.put("/services/edit/$serviceId", params);
  }

  Future<dynamic> changeStatus({
    required String serviceId,
    required String status,
  }) async {
    final params = {"status": status};
    return await _genericApiService.patch("/services/change-status/$serviceId", params);
  }

  Future<dynamic> deleteService(String serviceId) async {
    return await _genericApiService.delete("/services/delete/$serviceId");
  }

  Future<dynamic> getServiceById(String serviceId) async {
    return await _genericApiService.get("/services/get/$serviceId");
  }
}
