import '../../../../../core/resources/data_state.dart';
import '../entity/manage_reminder_types_entity.dart';

abstract class ManageReminderTypesRepository {
  Future<DataState<List<ManageReminderTypeEntity>>> listReminderTypes({
    String? title,
    bool isPaginate = false,
    int countItem = 10,
    int page = 1,
  });

  Future<DataState<List<ManageReminderTypeEntity>>> listActiveReminderTypes({
    String? title,
    bool isPaginate = false,
    int countItem = 10,
    int page = 1,
  });

  Future<DataState<ManageReminderTypeEntity>> getReminderType(String id);

  Future<DataState<dynamic>> addReminderType({
    required String title,
  });

  Future<DataState<dynamic>> editReminderType({
    required String id,
    required String title,
  });

  Future<DataState<dynamic>> deleteReminderType(String id);

  Future<DataState<dynamic>> changeStatus(String id);
}
