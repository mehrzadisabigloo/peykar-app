import '../../../../../core/services/generic_api_service.dart';

class ManageServicesApiProvider {
  final GenericApiService _genericApiService = GenericApiService();

  Future<dynamic> getManageServicesData({
    bool isPaginate = true,
    int countItem = 10,
  }) async {
    final params = {
      "is_paginate": isPaginate,
      "count_item": countItem,
    };
    
    return await _genericApiService.post("/services/list-repairman-active", params);
  }

  Future<dynamic> addService({
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

    return await _genericApiService.post("/services/add", params);
  }

  Future<dynamic> getServiceById(String serviceId) async {
    return await _genericApiService.get("/services/get/$serviceId");
  }
}
