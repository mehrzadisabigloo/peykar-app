import '../../../../core/resources/data_state.dart';
import '../../domain/entity/appointments_entity.dart';
import '../../domain/repository/appointments_repository.dart';
import '../data_source/remote/appointments_api_provider.dart';

class AppointmentsRepositoryImpl extends AppointmentsRepository {
  final AppointmentsApiProvider _apiProvider;
  AppointmentsRepositoryImpl(this._apiProvider);

  @override
  Future<DataState<List<AppointmentsEntity>>> fetchAppointments() async {
    try {
      final appointments = await _apiProvider.getAppointments();
      return DataSuccess(appointments);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
