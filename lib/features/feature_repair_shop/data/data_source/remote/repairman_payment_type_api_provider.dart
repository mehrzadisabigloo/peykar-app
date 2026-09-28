import '../../../../../core/services/generic_api_service.dart';

class RepairmanPaymentTypeApiProvider {
  final GenericApiService _genericApiService = GenericApiService();

  Future<dynamic> addPaymentType(int paymentTypeId) async {
    final body = {
      "payment_type_id": paymentTypeId,
    };
    return await _genericApiService.post("/custom/add", body);
  }

  Future<dynamic> removePaymentType(int paymentTypeId) async {
    return await _genericApiService.delete("/custom/remove/$paymentTypeId");
  }

  Future<dynamic> getMyPaymentTypes() async {
    return await _genericApiService.post("/custom/my-list", {});
  }

  Future<dynamic> getRepairmanPaymentTypes(String repairmanId) async {
    return await _genericApiService.post("/custom/list/$repairmanId", {});
  }

  Future<dynamic> getAllActivePaymentTypes() async {
    final params = {
      "is_paginate": false,
    };
    return await _genericApiService.post("/payment_type/active", params);
  }
}
