import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entity/appointments_entity.dart';

part 'reservation_model.freezed.dart';
part 'reservation_model.g.dart';

@freezed
sealed class ReservationModel with _$ReservationModel {
  const factory ReservationModel({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'time_slot_id') required String timeSlotId,
    String? description,
    required String status,
    @JsonKey(name: 'feedback_notified_at') String? feedbackNotifiedAt,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    ReservationUserModel? user,
    @JsonKey(name: 'time_slot') required ReservationTimeSlotModel timeSlot,
  }) = _ReservationModel;

  factory ReservationModel.fromJson(Map<String, dynamic> json) => _$ReservationModelFromJson(json);
}

extension ReservationModelX on ReservationModel {
  AppointmentsEntity toEntity() {
    final repairman = timeSlot.repairman;
    return AppointmentsEntity(
      id: id,
      time: '${timeSlot.startTime.substring(0, 5)} - ${timeSlot.endTime.substring(0, 5)}',
      date: timeSlot.date.split('T').first,
      jalaliDate: timeSlot.jalaliDate,
      serviceName: description ?? 'بدون توضیحات',
      subTitle: '${user?.firstName ?? ''} ${user?.lastName ?? ''}',
      description: description,
      status: _mapStatus(status),
      repairmanId: timeSlot.repairmanId,
      repairmanName: repairman != null ? '${repairman.firstName} ${repairman.lastName}' : null,
      repairmanAddress: repairman?.address ?? 'آدرس ثبت نشده است',
      repairmanImageId: repairman?.profileImageId,
      repairmanMobile: repairman?.mobile,
      userMobile: user?.mobile,
      userName: '${user?.firstName ?? ''} ${user?.lastName ?? ''}',
      userImageId: user?.profileImageId,
      userAddress: user?.address ?? 'آدرس ثبت نشده است',
      repairmanLat: repairman?.location?.lat,
      repairmanLng: repairman?.location?.lng,
      userLat: user?.location?.lat,
      userLng: user?.location?.lng,
    );
  }

  AppointmentStatus _mapStatus(String status) {
    switch (status.toLowerCase()) {
      case 'confirmed':
        return AppointmentStatus.confirmed;
      case 'pending':
        return AppointmentStatus.pending;
      case 'cancelled':
        return AppointmentStatus.canceled;
      case 'completed':
        return AppointmentStatus.completed;
      default:
        return AppointmentStatus.pending;
    }
  }
}

String _anyToString(dynamic json) => json?.toString() ?? '';

List<String>? _roleFromJson(dynamic json) {
  if (json == null) return null;
  if (json is List) return json.map((e) => e.toString()).toList();
  if (json is String) return [json];
  return null;
}

List<String>? _toList(dynamic json) {
  if (json == null) return null;
  if (json is List) return json.map((e) => e.toString()).toList();
  if (json is String) return [json];
  return null;
}

@freezed
sealed class ReservationUserModel with _$ReservationUserModel {
  const factory ReservationUserModel({
    required String id,
    @JsonKey(name: 'first_name', fromJson: _anyToString) required String firstName,
    @JsonKey(name: 'last_name', fromJson: _anyToString) required String lastName,
    @JsonKey(fromJson: _anyToString) required String mobile,
    String? email,
    @JsonKey(fromJson: _roleFromJson) List<String>? role,
    String? birthday,
    @JsonKey(name: 'subscription_code', fromJson: _anyToString) String? subscriptionCode,
    required String status,
    String? ostan,
    String? shahrestan,
    String? address,
    String? brand,
    @JsonKey(name: 'identity_images', fromJson: _toList) List<String>? identityImages,
    @JsonKey(name: 'business_license_image', fromJson: _toList) List<String>? businessLicenseImage,
    @JsonKey(name: 'phone_numbers', fromJson: _toList) List<String>? phoneNumbers,
    ReservationLocationModel? location,
    @JsonKey(name: 'shop_images', fromJson: _toList) List<String>? shopImages,
    @JsonKey(name: 'referral_code') String? referralCode,
    @JsonKey(name: 'occupation_id') String? occupationId,
    @JsonKey(name: 'referral_count') int? referralCount,
    @JsonKey(name: 'has_product') bool? hasProduct,
    @JsonKey(name: 'has_service') bool? hasService,
    @JsonKey(name: 'profile_image_id') String? profileImageId,
  }) = _ReservationUserModel;

  factory ReservationUserModel.fromJson(Map<String, dynamic> json) => _$ReservationUserModelFromJson(json);
}

@freezed
sealed class ReservationLocationModel with _$ReservationLocationModel {
  const factory ReservationLocationModel({
    double? lat,
    double? lng,
  }) = _ReservationLocationModel;

  factory ReservationLocationModel.fromJson(Map<String, dynamic> json) => _$ReservationLocationModelFromJson(json);
}

@freezed
sealed class ReservationTimeSlotModel with _$ReservationTimeSlotModel {
  const factory ReservationTimeSlotModel({
    required String id,
    @JsonKey(name: 'repairman_id') required String repairmanId,
    required String date,
    @JsonKey(name: 'start_time') required String startTime,
    @JsonKey(name: 'end_time') required String endTime,
    required int capacity,
    required String status,
    @JsonKey(name: 'reserved_count') int? reservedCount,
    @JsonKey(name: 'remaining_capacity') int? remainingCapacity,
    @JsonKey(name: 'is_full') bool? isFull,
    @JsonKey(name: 'jalali_date') String? jalaliDate,
    ReservationUserModel? repairman,
  }) = _ReservationTimeSlotModel;

  factory ReservationTimeSlotModel.fromJson(Map<String, dynamic> json) => _$ReservationTimeSlotModelFromJson(json);
}

@freezed
sealed class PendingFeedbackModel with _$PendingFeedbackModel {
  const factory PendingFeedbackModel({
    @JsonKey(name: 'repairman_id') String? repairmanId,
    @JsonKey(name: 'reservation_date') String? reservationDate,
    ReservationModel? reservation,
  }) = _PendingFeedbackModel;

  factory PendingFeedbackModel.fromJson(Map<String, dynamic> json) => _$PendingFeedbackModelFromJson(json);
}
