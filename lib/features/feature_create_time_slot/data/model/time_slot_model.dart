// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entity/create_time_slot_entity.dart';
import '../../../feature_manage_products/data/model/repairman_model.dart';

part 'time_slot_model.freezed.dart';
part 'time_slot_model.g.dart';

String _anyToString(dynamic value) => value?.toString() ?? '';

int _anyToInt(dynamic value) =>
    value is num ? value.toInt() : int.tryParse(value?.toString() ?? '0') ?? 0;

bool _anyToBool(dynamic value) {
  if (value is bool) return value;
  final text = value?.toString().toLowerCase();
  return text == 'true' || text == '1';
}

@freezed
sealed class TimeSlotModel with _$TimeSlotModel {
  const factory TimeSlotModel({
    @JsonKey(fromJson: _anyToString)
    @Default('')
    String id,

    @JsonKey(name: 'repairman_id', fromJson: _anyToString)
    @Default('')
    String repairmanId,

    @JsonKey(fromJson: _anyToString)
    @Default('')
    String date,

    @JsonKey(name: 'start_time', fromJson: _anyToString)
    @Default('')
    String startTime,

    @JsonKey(name: 'end_time', fromJson: _anyToString)
    @Default('')
    String endTime,

    @JsonKey(fromJson: _anyToInt)
    @Default(0)
    int capacity,

    @JsonKey(fromJson: _anyToString)
    @Default('')
    String status,

    @JsonKey(name: 'reserved_count', fromJson: _anyToInt)
    @Default(0)
    int reservedCount,

    @JsonKey(name: 'remaining_capacity', fromJson: _anyToInt)
    @Default(0)
    int remainingCapacity,

    @JsonKey(name: 'is_full', fromJson: _anyToBool)
    @Default(false)
    bool isFull,

    @JsonKey(name: 'jalali_date', fromJson: _anyToString)
    @Default('')
    String jalaliDate,

    @JsonKey(name: 'feedback_notified_at', fromJson: _anyToString)
    String? feedbackNotifiedAt,

    @JsonKey(name: 'created_at', fromJson: _anyToString)
    @Default('')
    String createdAt,

    @JsonKey(name: 'updated_at', fromJson: _anyToString)
    @Default('')
    String updatedAt,

    List<TimeSlotReservationModel>? reservations,

    RepairmanModel? repairman,
  }) = _TimeSlotModel;

  const TimeSlotModel._();

  factory TimeSlotModel.fromJson(Map<String, dynamic> json) =>
      _$TimeSlotModelFromJson(json);

  TimeSlotEntity toEntity() => TimeSlotEntity(
        id: id,
        repairmanId: repairmanId,
        date: date,
        startTime: startTime,
        endTime: endTime,
        capacity: capacity,
        status: status,
        reservedCount: reservedCount,
        remainingCapacity: remainingCapacity,
        isFull: isFull,
        jalaliDate: jalaliDate,
        feedbackNotifiedAt: feedbackNotifiedAt,
        createdAt: createdAt,
        updatedAt: updatedAt,
        reservations: reservations?.map((e) => e.toEntity()).toList(),
        repairman: repairman?.toEntity(),
      );

  factory TimeSlotModel.fromEntity(TimeSlotEntity entity) => TimeSlotModel(
        id: entity.id,
        repairmanId: entity.repairmanId,
        date: entity.date,
        startTime: entity.startTime,
        endTime: entity.endTime,
        capacity: entity.capacity,
        status: entity.status,
        reservedCount: entity.reservedCount,
        remainingCapacity: entity.remainingCapacity,
        isFull: entity.isFull,
        jalaliDate: entity.jalaliDate,
        feedbackNotifiedAt: entity.feedbackNotifiedAt,
        createdAt: entity.createdAt,
        updatedAt: entity.updatedAt,
        reservations: entity.reservations?.map((e) => TimeSlotReservationModel.fromEntity(e)).toList(),
        repairman: entity.repairman != null ? RepairmanModel.fromEntity(entity.repairman!) : null,
      );
}

@freezed
sealed class TimeSlotReservationModel with _$TimeSlotReservationModel {
  const factory TimeSlotReservationModel({
    @JsonKey(fromJson: _anyToString) @Default('') String id,
    @JsonKey(name: 'user_id', fromJson: _anyToString) @Default('') String userId,
    @JsonKey(name: 'time_slot_id', fromJson: _anyToString) @Default('') String timeSlotId,
    String? description,
    @JsonKey(fromJson: _anyToString) @Default('') String status,
    @JsonKey(name: 'created_at', fromJson: _anyToString) @Default('') String createdAt,
    @JsonKey(name: 'updated_at', fromJson: _anyToString) @Default('') String updatedAt,
    TimeSlotReservationUserModel? user,
  }) = _TimeSlotReservationModel;

  const TimeSlotReservationModel._();

  factory TimeSlotReservationModel.fromJson(Map<String, dynamic> json) =>
      _$TimeSlotReservationModelFromJson(json);

  TimeSlotReservationEntity toEntity() => TimeSlotReservationEntity(
        id: id,
        userId: userId,
        timeSlotId: timeSlotId,
        description: description,
        status: status,
        createdAt: createdAt,
        updatedAt: updatedAt,
        user: user?.toEntity(),
      );

  factory TimeSlotReservationModel.fromEntity(TimeSlotReservationEntity entity) =>
      TimeSlotReservationModel(
        id: entity.id,
        userId: entity.userId,
        timeSlotId: entity.timeSlotId,
        description: entity.description,
        status: entity.status,
        createdAt: entity.createdAt,
        updatedAt: entity.updatedAt,
        user: entity.user != null ? TimeSlotReservationUserModel.fromEntity(entity.user!) : null,
      );
}

@freezed
sealed class TimeSlotReservationUserModel with _$TimeSlotReservationUserModel {
  const factory TimeSlotReservationUserModel({
    @JsonKey(fromJson: _anyToString) @Default('') String id,
    @JsonKey(name: 'first_name', fromJson: _anyToString) @Default('') String firstName,
    @JsonKey(name: 'last_name', fromJson: _anyToString) @Default('') String lastName,
    @JsonKey(fromJson: _anyToString) @Default('') String mobile,
    @JsonKey(name: 'profile_image_id') String? profileImageId,
  }) = _TimeSlotReservationUserModel;

  const TimeSlotReservationUserModel._();

  factory TimeSlotReservationUserModel.fromJson(Map<String, dynamic> json) =>
      _$TimeSlotReservationUserModelFromJson(json);

  TimeSlotReservationUserEntity toEntity() => TimeSlotReservationUserEntity(
        id: id,
        firstName: firstName,
        lastName: lastName,
        mobile: mobile,
        profileImageId: profileImageId,
      );

  factory TimeSlotReservationUserModel.fromEntity(TimeSlotReservationUserEntity entity) =>
      TimeSlotReservationUserModel(
        id: entity.id,
        firstName: entity.firstName,
        lastName: entity.lastName,
        mobile: entity.mobile,
        profileImageId: entity.profileImageId,
      );
}
