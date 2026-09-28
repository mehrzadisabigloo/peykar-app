import 'package:equatable/equatable.dart';
import '../../../feature_manage_products/domain/entity/repairman_entity.dart';

class TimeSlotEntity extends Equatable {
  final String id;
  final String repairmanId;
  final String date;
  final String startTime;
  final String endTime;
  final int capacity;
  final String status;
  final int reservedCount;
  final int remainingCapacity;
  final bool isFull;
  final String jalaliDate;
  final String? feedbackNotifiedAt;
  final String createdAt;
  final String updatedAt;
  final List<TimeSlotReservationEntity>? reservations;
  final RepairmanEntity? repairman;

  const TimeSlotEntity({
    required this.id,
    required this.repairmanId,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.capacity,
    required this.status,
    required this.reservedCount,
    required this.remainingCapacity,
    required this.isFull,
    required this.jalaliDate,
    this.feedbackNotifiedAt,
    required this.createdAt,
    required this.updatedAt,
    this.reservations,
    this.repairman,
  });

  @override
  List<Object?> get props => [
        id,
        repairmanId,
        date,
        startTime,
        endTime,
        capacity,
        status,
        reservedCount,
        remainingCapacity,
        isFull,
        jalaliDate,
        feedbackNotifiedAt,
        createdAt,
        updatedAt,
        reservations,
        repairman,
      ];
}

class TimeSlotReservationEntity extends Equatable {
  final String id;
  final String userId;
  final String timeSlotId;
  final String? description;
  final String status;
  final String createdAt;
  final String updatedAt;
  final TimeSlotReservationUserEntity? user;

  const TimeSlotReservationEntity({
    required this.id,
    required this.userId,
    required this.timeSlotId,
    this.description,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.user,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        timeSlotId,
        description,
        status,
        createdAt,
        updatedAt,
        user,
      ];
}

class TimeSlotReservationUserEntity extends Equatable {
  final String id;
  final String firstName;
  final String lastName;
  final String mobile;
  final String? profileImageId;

  const TimeSlotReservationUserEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.mobile,
    this.profileImageId,
  });

  @override
  List<Object?> get props => [id, firstName, lastName, mobile, profileImageId];
}
