import '../../../../../core/services/generic_api_service.dart';

class AppointmentsApiProvider {
  final GenericApiService _apiService = GenericApiService();

  Future<dynamic> getRepairmanReservations({
    String? status,
    String? date,
    int page = 1,
    int perPage = 15,
  }) async {
    final body = {
      if (status != null) 'status': status,
      if (date != null) 'date': date,
      'page': page,
      'per_page': perPage,
      'is_paginate': true,
    };

    return _apiService.post('/reservations/repairman/list', body);
  }

  Future<dynamic> getUserReservations({
    String? status,
    String? date,
    String? repairmanId,
    int page = 1,
    int perPage = 15,
  }) async {
    final body = {
      if (status != null) 'status': status,
      if (date != null) 'date': date,
      if (repairmanId != null) 'repairman_id': repairmanId,
      'page': page,
      'per_page': perPage,
      'is_paginate': true,
    };

    return _apiService.post('/reservations/user/list', body);
  }

  Future<dynamic> confirmReservation(String reservationId) async {
    return _apiService.put('/reservations/confirm/$reservationId', {});
  }

  Future<dynamic> completeReservation(String reservationId) async {
    return _apiService.put('/reservations/complete/$reservationId', {});
  }

  Future<dynamic> cancelReservation(String reservationId, String reason) async {
    return _apiService.put('/reservations/cancel/$reservationId', {
      'cancel_reason': reason,
    });
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
    return _apiService.post("/ratings/store", body);
  }
}
