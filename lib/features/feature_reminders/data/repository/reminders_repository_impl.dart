import 'package:dio/dio.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/entity/reminders_entity.dart';
import '../../domain/repository/reminders_repository.dart';
import '../data_source/remote/reminders_api_provider.dart';
import '../model/reminder_request_models.dart';
import '../model/reminder_response_model.dart';

class RemindersRepositoryImpl extends RemindersRepository {
  final RemindersApiProvider _apiProvider;
  RemindersRepositoryImpl(this._apiProvider);

  @override
  Future<DataState<List<RemindersEntity>>> fetchReminders(ListUserRemindersRequest request) async {
    try {
      final response = await _apiProvider.listUserReminders(request);
      if (response is Response && (response.statusCode == 200 || response.statusCode == 201)) {
        if (response.data['success'] == true) {
          final listModel = ReminderListModel.fromApiResponse(response.data);
          return DataSuccess(listModel.items.map((e) => e.toEntity()).toList());
        } else {
          return DataFailed(response.data['message'] ?? "خطایی در دریافت لیست یادآورها رخ داد");
        }
      } else {
        return DataFailed("خطای سرور: ${response is Response ? response.statusCode : 'نامشخص'}");
      }
    } catch (e) {
      return const DataFailed('پاسخی دریافت نشد');
    }
  }

  @override
  Future<DataState<dynamic>> addReminder(AddReminderRequest request) async {
    try {
      final response = await _apiProvider.addReminder(request);
      if (response is Response && (response.statusCode == 200 || response.statusCode == 201)) {
        if (response.data['success'] == true) {
          return DataSuccess(response.data);
        } else {
          return DataFailed(response.data['message'] ?? "خطا در ثبت یادآور");
        }
      } else {
        return DataFailed("خطای سرور: ${response is Response ? response.statusCode : 'نامشخص'}");
      }
    } catch (e) {
      return const DataFailed('پاسخی دریافت نشد');
    }
  }
}
