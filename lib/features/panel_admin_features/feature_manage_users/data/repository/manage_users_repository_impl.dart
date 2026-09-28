import 'package:dio/dio.dart';
import '../../../../../core/resources/data_state.dart';
import '../../../../feature_home/data/model/users_list_model.dart';
import '../../../../feature_home/domain/entity/users_filter_params.dart';
import '../../../../feature_home/domain/entity/users_list_entity.dart';
import '../../domain/repository/manage_users_repository.dart';
import '../data_source/remote/manage_users_api_provider.dart';

class ManageUsersRepositoryImpl implements ManageUsersRepository {
  final ManageUsersApiProvider _apiProvider;

  ManageUsersRepositoryImpl(this._apiProvider);

  @override
  Future<DataState<UsersListEntity>> fetchUsers(UsersFilterParams params) async {
    try {
      final Response response = await _apiProvider.fetchUsers(params);
      if (response.statusCode == 200) {
        final usersListModel = UsersListModel.fromApiResponse(response.data);
        return DataSuccess(usersListModel.toEntity());
      } else {
        return DataFailed(response.data['message'] ?? 'خطا در دریافت لیست کاربران');
      }
    } catch (e) {
      return const DataFailed('خطای شبکه');
    }
  }

  @override
  Future<DataState<String>> changeRepairmanStatus(String id) async {
    try {
      final Response response = await _apiProvider.changeRepairmanStatus(id);
      if (response.statusCode == 200) {
        return DataSuccess(response.data['message'] ?? 'وضعیت با موفقیت تغییر کرد');
      } else {
        return DataFailed(response.data['message'] ?? 'خطا در تغییر وضعیت');
      }
    } catch (e) {
      return const DataFailed('خطای شبکه');
    }
  }

  @override
  Future<DataState<String>> addUser(Map<String, dynamic> userData) async {
    try {
      final Response response = await _apiProvider.addUser(userData);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return DataSuccess(response.data['message'] ?? 'کاربر با موفقیت اضافه شد');
      } else {
        return DataFailed(response.data['message'] ?? 'خطا در افزودن کاربر');
      }
    } catch (e) {
      return const DataFailed('خطای شبکه');
    }
  }
}
