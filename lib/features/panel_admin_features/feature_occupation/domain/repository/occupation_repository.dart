import '../../../../../../core/resources/data_state.dart';
import '../entity/occupation_entity.dart';
import '../entity/occupation_list_entity.dart';

abstract class OccupationRepository {
  Future<DataState<OccupationListEntity>> fetchOccupations(OccupationFilterParams params);
  Future<DataState<OccupationListEntity>> fetchActiveOccupations(OccupationFilterParams params);
  Future<DataState<OccupationEntity>> changeOccupationStatus(String id);
  Future<DataState<OccupationEntity>> moveOccupationUp(String id);
  Future<DataState<OccupationEntity>> moveOccupationDown(String id);
}
