import '../../../../../../core/services/generic_api_service.dart';

class ManagePaymentTypesApiProvider {
  final GenericApiService _genericApiService;

  ManagePaymentTypesApiProvider(this._genericApiService);

  Future<dynamic> listPaymentTypes(Map<String, dynamic> params) async {
    return await _genericApiService.post("/payment_type/list", params);
  }

  Future<dynamic> activePaymentTypes(Map<String, dynamic> params) async {
    return await _genericApiService.post("/payment_type/active", params);
  }

  Future<dynamic> changeStatus(int id) async {
    return await _genericApiService.put("/payment_type/change-status/$id", {});
  }
}
