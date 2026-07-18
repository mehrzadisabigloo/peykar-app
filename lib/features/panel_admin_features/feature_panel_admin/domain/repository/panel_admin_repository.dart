import '../../../../../core/resources/data_state.dart';
import '../entity/panel_admin_entity.dart';

abstract class PanelAdminRepository {
  Future<DataState<PanelAdminEntity>> fetchPanelAdminData();
}
