import 'package:dio/dio.dart';
import '../../../../../../core/services/generic_api_service.dart';
import '../../../../../feature_home/domain/entity/users_filter_params.dart';

class ManageUsersApiProvider {
  final GenericApiService _apiService = GenericApiService();

  Future<Response> fetchUsers(UsersFilterParams params) async {
    return await _apiService.post('/auth/users', params.toJson());
  }

  Future<Response> changeRepairmanStatus(String id) async {
    return await _apiService.patch('/auth/repairman/change-status/$id', {});
  }

  Future<Response> addUser(Map<String, dynamic> userData) async {
    return await _apiService.post('/auth/add/user', userData);
  }
}
