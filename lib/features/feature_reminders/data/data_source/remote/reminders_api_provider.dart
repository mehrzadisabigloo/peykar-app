import '../../../../../core/services/generic_api_service.dart';
import '../../model/reminder_request_models.dart';

class RemindersApiProvider {
  final GenericApiService _genericApiService;

  RemindersApiProvider(this._genericApiService);

  Future<dynamic> listUserReminders(ListUserRemindersRequest request) async {
    return await _genericApiService.post("/reminders/list-user", request.toJson());
  }

  Future<dynamic> addReminder(AddReminderRequest request) async {
    return await _genericApiService.post("/reminders/add", request.toJson());
  }

  Future<dynamic> completeReminder(String id) async {
    return await _genericApiService.post("/reminders/complete", {'id': id});
  }

  Future<dynamic> deleteReminder(String id) async {
    return await _genericApiService.delete("/reminders/delete/$id");
  }

  Future<dynamic> getReminder(String id) async {
    return await _genericApiService.get("/reminders/get/$id");
  }

  Future<dynamic> editReminder(String id, AddReminderRequest request) async {
    return await _genericApiService.put("/reminders/edit/$id", request.toJson());
  }

  Future<dynamic> addKilometerLog(String id, KilometerLog log) async {
    return await _genericApiService.post("/reminders/add-kilometer-log/$id", log.toJson());
  }

  Future<dynamic> addTimeLog(String id, TimeLog log) async {
    return await _genericApiService.post("/reminders/add-time-log/$id", log.toJson());
  }

  Future<dynamic> listActiveReminderTypes(Map<String, dynamic> request) async {
    return await _genericApiService.post("/reminder-types/list-active", request);
  }
}
