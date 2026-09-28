enum AppointmentStatus {
  confirmed,
  pending,
  canceled,
  completed,
}

class AppointmentsEntity {
  final String id;
  final String time;
  final String? date;
  final String? jalaliDate;
  final String serviceName;
  final String subTitle;
  final String? description;
  final AppointmentStatus status;
  final String? repairmanId;
  final String? repairmanName;
  final String? repairmanAddress;
  final String? repairmanImageId;
  final String? repairmanMobile;
  final String? userMobile;
  final String? userName;
  final String? userImageId;
  final String? userAddress;
  final double? repairmanLat;
  final double? repairmanLng;
  final double? userLat;
  final double? userLng;

  AppointmentsEntity({
    required this.id,
    required this.time,
    this.date,
    this.jalaliDate,
    required this.serviceName,
    required this.subTitle,
    this.description,
    required this.status,
    this.repairmanId,
    this.repairmanName,
    this.repairmanAddress,
    this.repairmanImageId,
    this.repairmanMobile,
    this.userMobile,
    this.userName,
    this.userImageId,
    this.userAddress,
    this.repairmanLat,
    this.repairmanLng,
    this.userLat,
    this.userLng,
  });
}
