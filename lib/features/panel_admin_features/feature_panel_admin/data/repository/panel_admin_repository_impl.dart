import '../../../../../core/resources/data_state.dart';
import '../../domain/entity/panel_admin_entity.dart';
import '../../domain/repository/panel_admin_repository.dart';
import '../data_source/remote/panel_admin_api_provider.dart';

class PanelAdminRepositoryImpl extends PanelAdminRepository {
  final PanelAdminApiProvider _apiProvider;
  PanelAdminRepositoryImpl(this._apiProvider);

  @override
  Future<DataState<PanelAdminEntity>> fetchPanelAdminData() async {
    try {
      final response = await _apiProvider.getPanelAdminData();
      if (response.statusCode == 200) {
        // TODO: Map to Entity
        return DataSuccess(PanelAdminEntity());
      } else {
        return DataFailed(response.statusMessage ?? "Error");
      }
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
