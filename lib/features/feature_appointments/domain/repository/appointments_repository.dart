import '../../../../core/resources/data_state.dart';
import '../entity/appointments_entity.dart';
import '../entity/appointments_list_entity.dart';

abstract class AppointmentsRepository {
  Future<DataState<AppointmentsListEntity>> fetchRepairmanAppointments({
    String? status,
    String? date,
    int page = 1,
    int perPage = 15,
  });

  Future<DataState<AppointmentsListEntity>> fetchUserAppointments({
    String? status,
    String? date,
    String? repairmanId,
    int page = 1,
    int perPage = 15,
  });

  Future<DataState<String>> confirmAppointment(String id);
  Future<DataState<String>> completeAppointment(String id);
  Future<DataState<String>> cancelAppointment(String id, String reason);
  Future<DataState<String>> submitRating({
    required String repairmanId,
    required int score,
    required String description,
  });
}
