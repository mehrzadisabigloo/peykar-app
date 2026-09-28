// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_slot_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TimeSlotModel _$TimeSlotModelFromJson(
  Map<String, dynamic> json,
) => _TimeSlotModel(
  id: json['id'] == null ? '' : _anyToString(json['id']),
  repairmanId: json['repairman_id'] == null
      ? ''
      : _anyToString(json['repairman_id']),
  date: json['date'] == null ? '' : _anyToString(json['date']),
  startTime: json['start_time'] == null ? '' : _anyToString(json['start_time']),
  endTime: json['end_time'] == null ? '' : _anyToString(json['end_time']),
  capacity: json['capacity'] == null ? 0 : _anyToInt(json['capacity']),
  status: json['status'] == null ? '' : _anyToString(json['status']),
  reservedCount: json['reserved_count'] == null
      ? 0
      : _anyToInt(json['reserved_count']),
  remainingCapacity: json['remaining_capacity'] == null
      ? 0
      : _anyToInt(json['remaining_capacity']),
  isFull: json['is_full'] == null ? false : _anyToBool(json['is_full']),
  jalaliDate: json['jalali_date'] == null
      ? ''
      : _anyToString(json['jalali_date']),
  feedbackNotifiedAt: _anyToString(json['feedback_notified_at']),
  createdAt: json['created_at'] == null ? '' : _anyToString(json['created_at']),
  updatedAt: json['updated_at'] == null ? '' : _anyToString(json['updated_at']),
  reservations: (json['reservations'] as List<dynamic>?)
      ?.map((e) => TimeSlotReservationModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  repairman: json['repairman'] == null
      ? null
      : RepairmanModel.fromJson(json['repairman'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TimeSlotModelToJson(_TimeSlotModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'repairman_id': instance.repairmanId,
      'date': instance.date,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'capacity': instance.capacity,
      'status': instance.status,
      'reserved_count': instance.reservedCount,
      'remaining_capacity': instance.remainingCapacity,
      'is_full': instance.isFull,
      'jalali_date': instance.jalaliDate,
      'feedback_notified_at': instance.feedbackNotifiedAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'reservations': instance.reservations,
      'repairman': instance.repairman,
    };

_TimeSlotReservationModel _$TimeSlotReservationModelFromJson(
  Map<String, dynamic> json,
) => _TimeSlotReservationModel(
  id: json['id'] == null ? '' : _anyToString(json['id']),
  userId: json['user_id'] == null ? '' : _anyToString(json['user_id']),
  timeSlotId: json['time_slot_id'] == null
      ? ''
      : _anyToString(json['time_slot_id']),
  description: json['description'] as String?,
  status: json['status'] == null ? '' : _anyToString(json['status']),
  createdAt: json['created_at'] == null ? '' : _anyToString(json['created_at']),
  updatedAt: json['updated_at'] == null ? '' : _anyToString(json['updated_at']),
  user: json['user'] == null
      ? null
      : TimeSlotReservationUserModel.fromJson(
          json['user'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$TimeSlotReservationModelToJson(
  _TimeSlotReservationModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'time_slot_id': instance.timeSlotId,
  'description': instance.description,
  'status': instance.status,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'user': instance.user,
};

_TimeSlotReservationUserModel _$TimeSlotReservationUserModelFromJson(
  Map<String, dynamic> json,
) => _TimeSlotReservationUserModel(
  id: json['id'] == null ? '' : _anyToString(json['id']),
  firstName: json['first_name'] == null ? '' : _anyToString(json['first_name']),
  lastName: json['last_name'] == null ? '' : _anyToString(json['last_name']),
  mobile: json['mobile'] == null ? '' : _anyToString(json['mobile']),
  profileImageId: json['profile_image_id'] as String?,
);

Map<String, dynamic> _$TimeSlotReservationUserModelToJson(
  _TimeSlotReservationUserModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'mobile': instance.mobile,
  'profile_image_id': instance.profileImageId,
};
