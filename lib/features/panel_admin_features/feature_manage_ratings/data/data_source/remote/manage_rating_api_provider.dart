import '../../../../../../core/services/generic_api_service.dart';

class ManageRatingApiProvider {
  final GenericApiService _apiService;

  ManageRatingApiProvider(this._apiService);

  Future<dynamic> getRatings({
    String? status,
    int page = 1,
    int perPage = 10,
  }) async {
    final body = {
      "is_paginate": true,
      "count_item": perPage,
      if (status != null) "status": status,
      "page": page,
    };
    return _apiService.post('/ratings/list', body);
  }

  Future<dynamic> changeRatingStatus(String ratingId) async {
    return _apiService.post('/ratings/change-status/$ratingId', {});
  }
}
