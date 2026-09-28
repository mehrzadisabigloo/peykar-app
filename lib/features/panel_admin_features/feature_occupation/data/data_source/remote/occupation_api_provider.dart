import 'package:dio/dio.dart';
import '../../../../../../core/services/generic_api_service.dart';
import '../../../domain/entity/occupation_entity.dart';

class OccupationApiProvider {
  final GenericApiService _apiService = GenericApiService();

  Future<Response> fetchOccupations(OccupationFilterParams params) async {
    return await _apiService.post('/occupations/list', params.toJson());
  }

  Future<Response> fetchActiveOccupations(OccupationFilterParams params) async {
    return await _apiService.post('/occupations/list-active', params.toJson());
  }

  Future<Response> changeOccupationStatus(String id) async {
    return await _apiService.patch('/occupations/change-status/$id', {});
  }

  Future<Response> moveOccupationUp(String id) async {
    return await _apiService.patch('/occupations/move-up/$id', {});
  }

  Future<Response> moveOccupationDown(String id) async {
    return await _apiService.patch('/occupations/move-down/$id', {});
  }
}
