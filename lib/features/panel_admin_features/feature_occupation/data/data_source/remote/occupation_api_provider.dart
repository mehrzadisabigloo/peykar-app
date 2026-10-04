import '../../../../../../core/services/generic_api_service.dart';
import '../../../domain/entity/occupation_entity.dart';

class OccupationApiProvider {
  final GenericApiService _apiService;

  OccupationApiProvider(this._apiService);

  Future<dynamic> fetchOccupations(OccupationFilterParams params) async {
    return await _apiService.post('/occupations/list', params.toJson());
  }

  Future<dynamic> fetchActiveOccupations(OccupationFilterParams params) async {
    return await _apiService.post('/occupations/list-active', params.toJson());
  }

  Future<dynamic> changeOccupationStatus(String id) async {
    return await _apiService.patch('/occupations/change-status/$id', {});
  }

  Future<dynamic> moveOccupationUp(String id) async {
    return await _apiService.patch('/occupations/move-up/$id', {});
  }

  Future<dynamic> moveOccupationDown(String id) async {
    return await _apiService.patch('/occupations/move-down/$id', {});
  }
}
