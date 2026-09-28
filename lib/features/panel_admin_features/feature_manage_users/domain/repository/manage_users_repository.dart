
import '../../../../../core/resources/data_state.dart';
import '../../../../feature_home/domain/entity/users_filter_params.dart';
import '../../../../feature_home/domain/entity/users_list_entity.dart';

abstract class ManageUsersRepository {
  Future<DataState<UsersListEntity>> fetchUsers(UsersFilterParams params);
  Future<DataState<String>> changeRepairmanStatus(String id);
  Future<DataState<String>> addUser(Map<String, dynamic> userData);
}
