enum AppointmentStatus {
  confirmed,
  pending,
  canceled,
}

class AppointmentsEntity {
  final String id;
  final String time;
  final String serviceName;
  final String subTitle;
  final AppointmentStatus status;

  AppointmentsEntity({
    required this.id,
    required this.time,
    required this.serviceName,
    required this.subTitle,
    required this.status,
  });
}
