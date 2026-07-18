import '../../../../core/resources/data_state.dart';
import '../../data/model/reminder_request_models.dart';
import '../entity/reminders_entity.dart';

abstract class RemindersRepository {
  Future<DataState<List<RemindersEntity>>> fetchReminders(ListUserRemindersRequest request);
  Future<DataState<dynamic>> addReminder(AddReminderRequest request);
}
