import '../../../../core/resources/data_state.dart';
import '../../domain/entity/dashboard_entity.dart';
import '../../domain/repository/dashboard_repository.dart';
import '../data_source/remote/dashboard_api_provider.dart';

class DashboardRepositoryImpl extends DashboardRepository {
  final DashboardApiProvider _apiProvider;
  DashboardRepositoryImpl(this._apiProvider);

  @override
  Future<DataState<DashboardEntity>> fetchDashboardData() async {
    try {
      final response = await _apiProvider.getDashboardData();
      if (response.statusCode == 200) {
        // TODO: Map to Entity
        return DataSuccess(DashboardEntity());
      } else {
        return DataFailed(response.statusMessage ?? "Error");
      }
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
