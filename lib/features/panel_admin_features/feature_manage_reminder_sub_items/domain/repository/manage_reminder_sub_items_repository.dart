import '../../../../../core/resources/data_state.dart';
import '../entity/manage_reminder_sub_item_entity.dart';

abstract class ManageReminderSubItemsRepository {
  Future<DataState<List<ManageReminderSubItemEntity>>> listSubItems({
    String? reminderTypeId,
    String? title,
    bool isPaginate = false,
    int countItem = 10,
    int page = 1,
  });

  Future<DataState<List<ManageReminderSubItemEntity>>> listActiveSubItems({
    String? reminderTypeId,
    String? title,
    bool isPaginate = false,
    int countItem = 10,
    int page = 1,
  });

  Future<DataState<ManageReminderSubItemEntity>> getSubItem(String id);

  Future<DataState<dynamic>> addSubItem({
    required String reminderTypeId,
    required String title,
  });

  Future<DataState<dynamic>> addSubItemsBulk({
    required String reminderTypeId,
    required List<String> titles,
  });

  Future<DataState<dynamic>> editSubItem({
    required String id,
    required String title,
  });

  Future<DataState<dynamic>> deleteSubItem(String id);

  Future<DataState<dynamic>> changeStatus(String id);
}
