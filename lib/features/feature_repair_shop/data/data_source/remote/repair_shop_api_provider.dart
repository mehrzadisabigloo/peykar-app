import '../../../../../core/services/generic_api_service.dart';

class RepairShopApiProvider {
  final GenericApiService _genericApiService;

  RepairShopApiProvider(this._genericApiService);

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

  Future<dynamic> getPublicTimeSlots({
    required String repairmanId,
    String? date,
    bool isPaginate = true,
    int countItem = 50,
  }) async {
    final params = {
      "repairman_id": repairmanId,
      if (date != null) "date": date,
      "is_paginate": isPaginate,
      "count_item": countItem,
    };
    return await _genericApiService.post("/reservations/time-slots/active", params);
  }

  Future<dynamic> getUserReservationsForRepairman({
    required String repairmanId,
    int page = 1,
    int perPage = 15,
  }) async {
    final body = {
      'repairman_id': repairmanId,
      'page': page,
      'per_page': perPage,
      'is_paginate': true,
    };
    return await _genericApiService.post("/reservations/user/list", body);
  }

  Future<dynamic> reserveTimeSlot({
    required String timeSlotId,
    required String description,
  }) async {
    final body = {
      "time_slot_id": timeSlotId,
      "description": description,
    };
    return await _genericApiService.post("/reservations/reserve", body);
  }

  Future<dynamic> storeRating({
    required String repairmanId,
    required int score,
    required String description,
  }) async {
    final body = {
      "repairman_id": repairmanId,
      "score": score,
      "description": description,
    };
    return await _genericApiService.post("/ratings/store", body);
  }

  Future<dynamic> getRepairmanRatings({
    required String repairmanId,
    bool isPaginate = true,
    int countItem = 10,
    int page = 1,
  }) async {
    final body = {
      "is_paginate": isPaginate,
      "count_item": countItem,
      "page": page,
    };
    return await _genericApiService.post("/ratings/repairman/$repairmanId", body);
  }
}
