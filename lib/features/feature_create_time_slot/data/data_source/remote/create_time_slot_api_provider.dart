import '../../../../../core/services/generic_api_service.dart';

class CreateTimeSlotApiProvider {
  final GenericApiService _apiService;

  CreateTimeSlotApiProvider(this._apiService);

  Future<dynamic> createTimeSlots({
    required String date,
    required List<Map<String, dynamic>> timeSlots,
  }) async {
    return _apiService.post('/reservations/time-slots/create', {
      'date': date,
      'time_slots': timeSlots,
    });
  }

  Future<dynamic> deleteTimeSlot(String timeSlotId) async {
    return _apiService.delete('/reservations/time-slots/$timeSlotId');
  }

  Future<dynamic> getRepairmanTimeSlots({
    String? date,
    String? status,
    bool isPaginate = true,
    int countItem = 15,
    int page = 1,
  }) async {
    final body = {
      if (date != null) 'date': date,
      'is_paginate': isPaginate,
      'count_item': countItem,
      'page': page,
    };

    return _apiService.post('/reservations/repairman/time-slots/all', body);
  }

  Future<dynamic> deactivateDay(String date) async {
    return _apiService.post('/reservations/time-slots/deactivate-day', {
      'date': date,
    });
  }

  Future<dynamic> activateDay(String date) async {
    return _apiService.post('/reservations/time-slots/activate-day', {
      'date': date,
    });
  }
}
