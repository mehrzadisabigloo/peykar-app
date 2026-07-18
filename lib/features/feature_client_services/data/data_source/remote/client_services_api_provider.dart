import '../../../../../core/services/generic_api_service.dart';
import '../../../../feature_home/domain/entity/users_filter_params.dart';

class ClientServicesApiProvider {
  Future<dynamic> fetchActiveUsers(UsersFilterParams params) async {
    final genericApiService = GenericApiService();
    return genericApiService.post('/auth/users-active', params.toJson());
  }

  // Original script-generated method (kept for potential future use)
  Future<dynamic> getClientServicesData() async {
    throw UnimplementedError();
  }
}
