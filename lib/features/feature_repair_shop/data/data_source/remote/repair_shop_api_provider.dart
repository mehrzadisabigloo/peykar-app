import '../../../../../core/services/generic_api_service.dart';

class RepairShopApiProvider {
  final GenericApiService _genericApiService = GenericApiService();

  Future<dynamic> getRepairShopData(String repairmanId) async {
    return await _genericApiService.get("/auth/get/$repairmanId");
  }

  Future<dynamic> getActiveProducts({
    required String repairmanId,
    bool isPaginate = true,
    int countItem = 10,
    String? title,
    double? priceFrom,
    double? priceTo,
  }) async {
    final params = {
      "is_paginate": isPaginate,
      "count_item": countItem,
      "repairman_id": repairmanId,
      if (title != null) "title": title,
      if (priceFrom != null) "price_from": priceFrom,
      if (priceTo != null) "price_to": priceTo,
    };
    return await _genericApiService.post("/products/list-active", params);
  }

  Future<dynamic> getActiveServices({
    required String repairmanId,
    bool isPaginate = true,
    int countItem = 10,
    String? title,
  }) async {
    final params = {
      "is_paginate": isPaginate,
      "count_item": countItem,
      "repairman_id": repairmanId,
      if (title != null) "title": title,
    };
    return await _genericApiService.post("/services/list-active", params);
  }
}
