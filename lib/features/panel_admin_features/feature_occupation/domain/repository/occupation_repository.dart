import '../../../../../../core/resources/data_state.dart';
import '../entity/occupation_entity.dart';

abstract class OccupationRepository {
  Future<DataState<List<OccupationEntity>>> fetchOccupations(OccupationFilterParams params);
  Future<DataState<List<OccupationEntity>>> fetchActiveOccupations(OccupationFilterParams params);
  Future<DataState<OccupationEntity>> changeOccupationStatus(String id);
  Future<DataState<OccupationEntity>> moveOccupationUp(String id);
  Future<DataState<OccupationEntity>> moveOccupationDown(String id);
}
