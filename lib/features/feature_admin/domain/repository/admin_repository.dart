import '../../../../core/resources/data_state.dart';
import '../entity/admin_entity.dart';

abstract class AdminRepository {
  Future<DataState<AdminEntity>> fetchAdminData();
}
