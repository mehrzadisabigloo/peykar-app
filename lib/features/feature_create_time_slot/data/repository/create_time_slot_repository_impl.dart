import 'package:dio/dio.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/repository/create_time_slot_repository.dart';
import '../data_source/remote/create_time_slot_api_provider.dart';
import '../model/time_slot_model.dart';

class CreateTimeSlotRepositoryImpl extends CreateTimeSlotRepository {
  final CreateTimeSlotApiProvider _apiProvider;
  CreateTimeSlotRepositoryImpl(this._apiProvider);

  @override
  Future<DataState<Map<String, dynamic>>> createTimeSlots({
    required String date,
    required List<Map<String, dynamic>> timeSlots,
  }) async {
    try {
      final response = await _apiProvider.createTimeSlots(
        date: date,
        timeSlots: timeSlots,
      );

      if (response is Response && (response.statusCode == 201 || response.statusCode == 200)) {
        return DataSuccess(response.data);
      } else {
        return DataFailed(response?.data['message'] ?? "خطا در ایجاد بازه‌های زمانی");
      }
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<bool>> deleteTimeSlot(String timeSlotId) async {
    try {
      final response = await _apiProvider.deleteTimeSlot(timeSlotId);
      if (response is Response && response.statusCode == 200) {
        return const DataSuccess(true);
      } else {
        return DataFailed(response?.data['message'] ?? "خطا در حذف بازه زمانی");
      }
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<Map<String, dynamic>>> getRepairmanTimeSlots({
    String? date,
    String? status,
    bool isPaginate = true,
    int countItem = 15,
    int page = 1,
  }) async {
    try {
      final response = await _apiProvider.getRepairmanTimeSlots(
        date: date,
        status: status,
        isPaginate: isPaginate,
        countItem: countItem,
        page: page,
      );

      if (response is Response && response.statusCode == 200) {
        return DataSuccess(response.data['data']);
      } else {
        return DataFailed(response?.data['message'] ?? "خطا در دریافت بازه‌های زمانی");
      }
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<bool>> deactivateDay(String date) async {
    try {
      final response = await _apiProvider.deactivateDay(date);
      if (response is Response && response.statusCode == 200) {
        return const DataSuccess(true);
      } else {
        return DataFailed(response?.data['message'] ?? "خطا در غیرفعال‌سازی روز");
      }
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<bool>> activateDay(String date) async {
    try {
      final response = await _apiProvider.activateDay(date);
      if (response is Response && response.statusCode == 200) {
        return const DataSuccess(true);
      } else {
        return DataFailed(response?.data['message'] ?? "خطا در فعال‌سازی روز");
      }
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
