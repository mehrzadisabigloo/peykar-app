import 'package:dio/dio.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/entity/appointments_list_entity.dart';
import '../../domain/repository/appointments_repository.dart';
import '../data_source/remote/appointments_api_provider.dart';
import '../model/reservation_model.dart';

class AppointmentsRepositoryImpl extends AppointmentsRepository {
  final AppointmentsApiProvider _apiProvider;
  AppointmentsRepositoryImpl(this._apiProvider);

  @override
  Future<DataState<AppointmentsListEntity>> fetchRepairmanAppointments({
    String? status,
    String? date,
    int page = 1,
    int perPage = 15,
  }) async {
    try {
      final response = await _apiProvider.getRepairmanReservations(
        status: status,
        date: date,
        page: page,
        perPage: perPage,
      );

      if (response is Response && response.statusCode == 200) {
        final body = response.data;
        if (body['success'] == true && body['data'] is Map) {
          final Map<String, dynamic> dataMap = body['data'];
          final List<dynamic> dataList = dataMap['data'] is List ? dataMap['data'] : [];
          final appointments = dataList.map((json) => ReservationModel.fromJson(json).toEntity()).toList();
          return DataSuccess(AppointmentsListEntity(
            appointments: appointments,
            currentPage: dataMap['current_page'] ?? 1,
            lastPage: dataMap['last_page'] ?? 1,
            total: dataMap['total'] ?? 0,
          ));
        } else if (body['success'] == true && body['data'] is List) {
           final List<dynamic> data = body['data'];
           final appointments = data.map((json) => ReservationModel.fromJson(json).toEntity()).toList();
           return DataSuccess(AppointmentsListEntity(appointments: appointments));
        } else {
          return DataFailed(body['message'] ?? "خطا در دریافت اطلاعات");
        }
      } else {
        return DataFailed(response?.data['message'] ?? "خطا در دریافت اطلاعات");
      }
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<AppointmentsListEntity>> fetchUserAppointments({
    String? status,
    String? date,
    String? repairmanId,
    int page = 1,
    int perPage = 15,
  }) async {
    try {
      final response = await _apiProvider.getUserReservations(
        status: status,
        date: date,
        repairmanId: repairmanId,
        page: page,
        perPage: perPage,
      );

      if (response is Response && response.statusCode == 200) {
        final body = response.data;
        if (body['success'] == true && body['data'] is Map) {
          final Map<String, dynamic> dataMap = body['data'];
          final List<dynamic> dataList = dataMap['data'] is List ? dataMap['data'] : [];
          final appointments = dataList.map((json) => ReservationModel.fromJson(json).toEntity()).toList();
          return DataSuccess(AppointmentsListEntity(
            appointments: appointments,
            currentPage: dataMap['current_page'] ?? 1,
            lastPage: dataMap['last_page'] ?? 1,
            total: dataMap['total'] ?? 0,
          ));
        } else if (body['success'] == true && body['data'] is List) {
           final List<dynamic> data = body['data'];
           final appointments = data.map((json) => ReservationModel.fromJson(json).toEntity()).toList();
           return DataSuccess(AppointmentsListEntity(appointments: appointments));
        } else {
          return DataFailed(body['message'] ?? "خطا در دریافت اطلاعات");
        }
      } else {
        return DataFailed(response?.data['message'] ?? "خطا در دریافت اطلاعات");
      }
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<String>> confirmAppointment(String id) async {
    try {
      final response = await _apiProvider.confirmReservation(id);
      if (response is Response && response.statusCode == 200) {
        return DataSuccess(response.data['message'] ?? "رزرو با موفقیت تأیید شد");
      } else {
        return DataFailed(response?.data['message'] ?? "خطا در تأیید رزرو");
      }
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<String>> completeAppointment(String id) async {
    try {
      final response = await _apiProvider.completeReservation(id);
      if (response is Response && response.statusCode == 200) {
        return DataSuccess(response.data['message'] ?? "رزرو با موفقیت تکمیل شد");
      } else {
        return DataFailed(response?.data['message'] ?? "خطا در تکمیل رزرو");
      }
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<String>> cancelAppointment(String id, String reason) async {
    try {
      final response = await _apiProvider.cancelReservation(id, reason);
      if (response is Response && response.statusCode == 200) {
        return DataSuccess(response.data['message'] ?? "رزرو با موفقیت لغو شد");
      } else {
        return DataFailed(response?.data['message'] ?? "خطا در لغو رزرو");
      }
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<String>> submitRating({
    required String repairmanId,
    required int score,
    required String description,
  }) async {
    try {
      final response = await _apiProvider.storeRating(
        repairmanId: repairmanId,
        score: score,
        description: description,
      );
      if (response is Response && (response.statusCode == 200 || response.statusCode == 201)) {
        return DataSuccess(response.data['message'] ?? "امتیاز با موفقیت ثبت شد");
      } else {
        return DataFailed(response?.data['message'] ?? "خطا در ثبت امتیاز");
      }
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
