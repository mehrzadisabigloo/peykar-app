import '../../../../core/resources/data_state.dart';
import '../../data/model/reminder_request_models.dart' as req;
import '../entity/reminder_type_entity.dart';
import '../entity/reminders_entity.dart';
import '../entity/reminders_list_entity.dart';

abstract class RemindersRepository {
  Future<DataState<RemindersListEntity>> fetchReminders(req.ListUserRemindersRequest request);
  Future<DataState<dynamic>> addReminder(req.AddReminderRequest request);
  Future<DataState<dynamic>> completeReminder(String id);
  Future<DataState<dynamic>> deleteReminder(String id);
  Future<DataState<RemindersEntity>> getReminder(String id);
  Future<DataState<dynamic>> editReminder(String id, req.AddReminderRequest request);
  Future<DataState<dynamic>> addKilometerLog(String id, req.KilometerLog log);
  Future<DataState<dynamic>> addTimeLog(String id, req.TimeLog log);
  Future<DataState<List<ReminderTypeEntity>>> fetchActiveReminderTypes();
}
