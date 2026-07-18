import '../../../../../core/services/generic_api_service.dart';

class OrdersApiProvider {
  final GenericApiService _genericApiService = GenericApiService();

  Future<dynamic> getOrders({
    int countItem = 10,
    bool isPaginate = true,
    String? orderNumber,
    String? trackingCode,
    String? orderStatus,
  }) async {
    final params = {
      "count_item": countItem,
      "is_paginate": isPaginate,
      if (orderNumber != null) "order_number": orderNumber,
      if (trackingCode != null) "tracking_code": trackingCode,
      if (orderStatus != null) "order_status": orderStatus,
    };
    return await _genericApiService.post("/order/user_list", params);
  }
}
