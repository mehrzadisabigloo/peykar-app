import '../../../../../core/services/generic_api_service.dart';
import '../../../../feature_home/domain/entity/users_filter_params.dart';

class ClientServicesApiProvider {
  final GenericApiService _genericApiService;

  ClientServicesApiProvider(this._genericApiService);

  Future<dynamic> fetchActiveUsers(UsersFilterParams params) async {
    return _genericApiService.post('/auth/users-active', params.toJson());
  }

  Future<dynamic> getClientServicesData() async {
    throw UnimplementedError();
  }
}
