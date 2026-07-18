import '../../../../core/resources/data_state.dart';
import '../entity/appointments_entity.dart';

abstract class AppointmentsRepository {
  Future<DataState<List<AppointmentsEntity>>> fetchAppointments();
}
