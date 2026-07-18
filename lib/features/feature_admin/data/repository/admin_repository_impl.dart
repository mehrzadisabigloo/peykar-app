import '../../../../core/resources/data_state.dart';
import '../../domain/entity/admin_entity.dart';
import '../../domain/repository/admin_repository.dart';
import '../data_source/remote/admin_api_provider.dart';

class AdminRepositoryImpl extends AdminRepository {
  final AdminApiProvider _apiProvider;
  AdminRepositoryImpl(this._apiProvider);

  @override
  Future<DataState<AdminEntity>> fetchAdminData() async {
    try {
      final response = await _apiProvider.getAdminData();
      if (response.statusCode == 200) {
        // TODO: Map to Entity
        return DataSuccess(AdminEntity());
      } else {
        return DataFailed(response.statusMessage ?? "Error");
      }
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
