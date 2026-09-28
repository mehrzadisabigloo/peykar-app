import 'appointments_entity.dart';

class AppointmentsListEntity {
  final List<AppointmentsEntity> appointments;
  final int currentPage;
  final int lastPage;
  final int total;

  const AppointmentsListEntity({
    required this.appointments,
    this.currentPage = 1,
    this.lastPage = 1,
    this.total = 0,
  });

  bool get hasMore => currentPage < lastPage;
}
