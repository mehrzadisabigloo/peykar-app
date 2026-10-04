import '../../../../../core/services/generic_api_service.dart';
import '../../../domain/entity/users_filter_params.dart';

class HomeApiProvider {
  final GenericApiService _genericApiService;

  HomeApiProvider(this._genericApiService);

  Future<dynamic> fetchActiveUsers(UsersFilterParams params) async {
    return _genericApiService.post('/auth/users-active', params.toJson());
  }

  Future<dynamic> storeUserLocation(Map<String, dynamic> data) async {
    return _genericApiService.post('/user-locations/store', data);
  }
}
