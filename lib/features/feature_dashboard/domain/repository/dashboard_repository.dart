import '../../../../core/resources/data_state.dart';
import '../entity/dashboard_entity.dart';

abstract class DashboardRepository {
  Future<DataState<DashboardEntity>> fetchDashboardData();
}
