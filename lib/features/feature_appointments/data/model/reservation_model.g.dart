// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReservationModel _$ReservationModelFromJson(Map<String, dynamic> json) =>
    _ReservationModel(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      timeSlotId: json['time_slot_id'] as String,
      description: json['description'] as String?,
      status: json['status'] as String,
      feedbackNotifiedAt: json['feedback_notified_at'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      user: json['user'] == null
          ? null
          : ReservationUserModel.fromJson(json['user'] as Map<String, dynamic>),
      timeSlot: ReservationTimeSlotModel.fromJson(
        json['time_slot'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$ReservationModelToJson(_ReservationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'time_slot_id': instance.timeSlotId,
      'description': instance.description,
      'status': instance.status,
      'feedback_notified_at': instance.feedbackNotifiedAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'user': instance.user,
      'time_slot': instance.timeSlot,
    };

_ReservationUserModel _$ReservationUserModelFromJson(
  Map<String, dynamic> json,
) => _ReservationUserModel(
  id: json['id'] as String,
  firstName: _anyToString(json['first_name']),
  lastName: _anyToString(json['last_name']),
  mobile: _anyToString(json['mobile']),
  email: json['email'] as String?,
  role: _roleFromJson(json['role']),
  birthday: json['birthday'] as String?,
  subscriptionCode: _anyToString(json['subscription_code']),
  status: json['status'] as String,
  ostan: json['ostan'] as String?,
  shahrestan: json['shahrestan'] as String?,
  address: json['address'] as String?,
  brand: json['brand'] as String?,
  identityImages: _toList(json['identity_images']),
  businessLicenseImage: _toList(json['business_license_image']),
  phoneNumbers: _toList(json['phone_numbers']),
  location: json['location'] == null
      ? null
      : ReservationLocationModel.fromJson(
          json['location'] as Map<String, dynamic>,
        ),
  shopImages: _toList(json['shop_images']),
  referralCode: json['referral_code'] as String?,
  occupationId: json['occupation_id'] as String?,
  referralCount: (json['referral_count'] as num?)?.toInt(),
  hasProduct: json['has_product'] as bool?,
  hasService: json['has_service'] as bool?,
  profileImageId: json['profile_image_id'] as String?,
);

Map<String, dynamic> _$ReservationUserModelToJson(
  _ReservationUserModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'mobile': instance.mobile,
  'email': instance.email,
  'role': instance.role,
  'birthday': instance.birthday,
  'subscription_code': instance.subscriptionCode,
  'status': instance.status,
  'ostan': instance.ostan,
  'shahrestan': instance.shahrestan,
  'address': instance.address,
  'brand': instance.brand,
  'identity_images': instance.identityImages,
  'business_license_image': instance.businessLicenseImage,
  'phone_numbers': instance.phoneNumbers,
  'location': instance.location,
  'shop_images': instance.shopImages,
  'referral_code': instance.referralCode,
  'occupation_id': instance.occupationId,
  'referral_count': instance.referralCount,
  'has_product': instance.hasProduct,
  'has_service': instance.hasService,
  'profile_image_id': instance.profileImageId,
};

_ReservationLocationModel _$ReservationLocationModelFromJson(
  Map<String, dynamic> json,
) => _ReservationLocationModel(
  lat: (json['lat'] as num?)?.toDouble(),
  lng: (json['lng'] as num?)?.toDouble(),
);

Map<String, dynamic> _$ReservationLocationModelToJson(
  _ReservationLocationModel instance,
) => <String, dynamic>{'lat': instance.lat, 'lng': instance.lng};

_ReservationTimeSlotModel _$ReservationTimeSlotModelFromJson(
  Map<String, dynamic> json,
) => _ReservationTimeSlotModel(
  id: json['id'] as String,
  repairmanId: json['repairman_id'] as String,
  date: json['date'] as String,
  startTime: json['start_time'] as String,
  endTime: json['end_time'] as String,
  capacity: (json['capacity'] as num).toInt(),
  status: json['status'] as String,
  reservedCount: (json['reserved_count'] as num?)?.toInt(),
  remainingCapacity: (json['remaining_capacity'] as num?)?.toInt(),
  isFull: json['is_full'] as bool?,
  jalaliDate: json['jalali_date'] as String?,
  repairman: json['repairman'] == null
      ? null
      : ReservationUserModel.fromJson(
          json['repairman'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$ReservationTimeSlotModelToJson(
  _ReservationTimeSlotModel instance,
) => <String, dynamic>{
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
  'repairman': instance.repairman,
};

_PendingFeedbackModel _$PendingFeedbackModelFromJson(
  Map<String, dynamic> json,
) => _PendingFeedbackModel(
  repairmanId: json['repairman_id'] as String?,
  reservationDate: json['reservation_date'] as String?,
  reservation: json['reservation'] == null
      ? null
      : ReservationModel.fromJson(json['reservation'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PendingFeedbackModelToJson(
  _PendingFeedbackModel instance,
) => <String, dynamic>{
  'repairman_id': instance.repairmanId,
  'reservation_date': instance.reservationDate,
  'reservation': instance.reservation,
};
