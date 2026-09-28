import 'package:dio/dio.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/entity/reminders_entity.dart';
import '../../domain/repository/reminders_repository.dart';
import '../data_source/remote/reminders_api_provider.dart';
import '../model/reminder_request_models.dart' as req;
import '../model/reminder_response_model.dart';
import '../../domain/entity/reminders_list_entity.dart';
import '../../domain/entity/reminder_type_entity.dart';

class RemindersRepositoryImpl extends RemindersRepository {
  final RemindersApiProvider _apiProvider;
  RemindersRepositoryImpl(this._apiProvider);

  @override
  Future<DataState<RemindersListEntity>> fetchReminders(req.ListUserRemindersRequest request) async {
    try {
      final response = await _apiProvider.listUserReminders(request);
      if (response is Response && (response.statusCode == 200 || response.statusCode == 201)) {
        if (response.data['success'] == true) {
          final listModel = ReminderListModel.fromApiResponse(response.data);
          return DataSuccess(listModel.toEntity());
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
  Future<DataState<dynamic>> addReminder(req.AddReminderRequest request) async {
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

  @override
  Future<DataState<dynamic>> completeReminder(String id) async {
    try {
      final response = await _apiProvider.completeReminder(id);
      if (response is Response && (response.statusCode == 200 || response.statusCode == 201)) {
        if (response.data['success'] == true) {
          return DataSuccess(response.data);
        } else {
          return DataFailed(response.data['message'] ?? "خطا در بروزرسانی یادآور");
        }
      } else {
        return DataFailed("خطای سرور: ${response is Response ? response.statusCode : 'نامشخص'}");
      }
    } catch (e) {
      return const DataFailed('پاسخی دریافت نشد');
    }
  }

  @override
  Future<DataState<dynamic>> deleteReminder(String id) async {
    try {
      final response = await _apiProvider.deleteReminder(id);
      if (response is Response && (response.statusCode == 200 || response.statusCode == 201)) {
        if (response.data['success'] == true) {
          return DataSuccess(response.data);
        } else {
          return DataFailed(response.data['message'] ?? "خطا در حذف یادآور");
        }
      } else {
        return DataFailed("خطای سرور: ${response is Response ? response.statusCode : 'نامشخص'}");
      }
    } catch (e) {
      return const DataFailed('پاسخی دریافت نشد');
    }
  }

  @override
  Future<DataState<RemindersEntity>> getReminder(String id) async {
    try {
      final response = await _apiProvider.getReminder(id);
      if (response is Response && response.statusCode == 200) {
        if (response.data['success'] == true) {
          final model = ReminderModel.fromJson(response.data['data']);
          return DataSuccess(model.toEntity());
        } else {
          return DataFailed(response.data['message'] ?? "خطا در دریافت اطلاعات یادآور");
        }
      } else {
        return DataFailed("خطای سرور: ${response is Response ? response.statusCode : 'نامشخص'}");
      }
    } catch (e) {
      return const DataFailed('پاسخی دریافت نشد');
    }
  }

  @override
  Future<DataState<dynamic>> editReminder(String id, req.AddReminderRequest request) async {
    try {
      final response = await _apiProvider.editReminder(id, request);
      if (response is Response && (response.statusCode == 200 || response.statusCode == 201)) {
        if (response.data['success'] == true) {
          return DataSuccess(response.data);
        } else {
          return DataFailed(response.data['message'] ?? "خطا در ویرایش یادآور");
        }
      } else {
        return DataFailed("خطای سرور: ${response is Response ? response.statusCode : 'نامشخص'}");
      }
    } catch (e) {
      return const DataFailed('پاسخی دریافت نشد');
    }
  }

  @override
  Future<DataState<dynamic>> addKilometerLog(String id, req.KilometerLog log) async {
    try {
      final response = await _apiProvider.addKilometerLog(id, log);
      if (response is Response && (response.statusCode == 200 || response.statusCode == 201)) {
        if (response.data['success'] == true) {
          return DataSuccess(response.data);
        } else {
          return DataFailed(response.data['message'] ?? "خطا در افزودن لاگ کیلومتر");
        }
      } else {
        return DataFailed("خطای سرور: ${response is Response ? response.statusCode : 'نامشخص'}");
      }
    } catch (e) {
      return const DataFailed('پاسخی دریافت نشد');
    }
  }

  @override
  Future<DataState<dynamic>> addTimeLog(String id, req.TimeLog log) async {
    try {
      final response = await _apiProvider.addTimeLog(id, log);
      if (response is Response && (response.statusCode == 200 || response.statusCode == 201)) {
        if (response.data['success'] == true) {
          return DataSuccess(response.data);
        } else {
          return DataFailed(response.data['message'] ?? "خطا در افزودن لاگ زمان");
        }
      } else {
        return DataFailed("خطای سرور: ${response is Response ? response.statusCode : 'نامشخص'}");
      }
    } catch (e) {
      return const DataFailed('پاسخی دریافت نشد');
    }
  }

  @override
  Future<DataState<List<ReminderTypeEntity>>> fetchActiveReminderTypes() async {
    try {
      final response = await _apiProvider.listActiveReminderTypes({
        "is_paginate": true,
        "count_item": 10
      });
      if (response is Response && (response.statusCode == 200 || response.statusCode == 201)) {
        if (response.data['success'] == true) {
          final List<dynamic> rawData = response.data['data']['data'] ?? [];
          final types = rawData.map((e) {
            final List<dynamic> rawSubItems = e['active_sub_items'] ?? [];
            return ReminderTypeEntity(
              id: e['id'] ?? '',
              title: e['title'] ?? '',
              subItems: rawSubItems.map((s) => ReminderSubItemEntity(
                id: s['id'] ?? '',
                title: s['title'] ?? '',
              )).toList(),
            );
          }).toList();
          return DataSuccess(types);
        } else {
          return DataFailed(response.data['message'] ?? "خطا در دریافت انواع یادآور");
        }
      } else {
        return DataFailed("خطای سرور: ${response is Response ? response.statusCode : 'نامشخص'}");
      }
    } catch (e) {
      return const DataFailed('پاسخی دریافت نشد');
    }
  }
}
