import '../../../../../core/services/generic_api_service.dart';
import '../../../domain/entity/users_filter_params.dart';

class HomeApiProvider {
  Future<dynamic> fetchActiveUsers(UsersFilterParams params) async {
    final genericApiService = GenericApiService();
    return genericApiService.post('/auth/users-active', params.toJson());
  }
}
