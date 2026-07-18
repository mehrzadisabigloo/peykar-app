import '../../../../core/resources/data_state.dart';
import '../entity/users_filter_params.dart';
import '../entity/users_list_entity.dart';

abstract class HomeRepository {
  Future<DataState<UsersListEntity>> fetchActiveUsers(UsersFilterParams params);
}
