import '../../../../../core/services/generic_api_service.dart';
import '../../model/reminder_request_models.dart';

class RemindersApiProvider {
  final GenericApiService _genericApiService = GenericApiService();

  Future<dynamic> listUserReminders(ListUserRemindersRequest request) async {
    return await _genericApiService.post("/reminders/list-user", request.toJson());
  }

  Future<dynamic> addReminder(AddReminderRequest request) async {
    return await _genericApiService.post("/reminders/add", request.toJson());
  }
}
