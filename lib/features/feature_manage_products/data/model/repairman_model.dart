// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entity/repairman_entity.dart';

part 'repairman_model.freezed.dart';
part 'repairman_model.g.dart';

double _anyToDouble(dynamic value) => double.tryParse(value?.toString() ?? '0.0') ?? 0.0;
int _anyToInt(dynamic value) => (value is num) ? value.toInt() : (int.tryParse(value?.toString() ?? '0') ?? 0);
bool _anyToBool(dynamic value) => value is bool ? value : (value?.toString().toLowerCase() == 'true' || value == 1);

List<String>? _toList(dynamic value) {
  if (value == null) return null;
  if (value is List) return value.map((e) => e.toString()).toList();
  if (value is String) return [value];
  return null;
}

@freezed
class RepairmanModel with _$RepairmanModel {
  const factory RepairmanModel({
    @Default('') String id,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    String? mobile,
    String? email,
    @JsonKey(name: 'role', fromJson: _toList) List<String>? role,
    String? birthday,
    @JsonKey(name: 'profile_image_id') String? profileImageId,
    String? ostan,
    String? shahrestan,
    String? brand,
    @JsonKey(name: 'identity_images', fromJson: _toList) List<String>? identityImages,
    @JsonKey(name: 'business_license_image', fromJson: _toList) List<String>? businessLicenseImage,
    @JsonKey(name: 'phone_numbers', fromJson: _toList) List<String>? phoneNumbers,
    LocationModel? location,
    @JsonKey(name: 'shop_images', fromJson: _toList) List<String>? shopImages,
    @JsonKey(name: 'subscription_code') String? subscriptionCode,
    @JsonKey(name: 'referral_code') String? referralCode,
    @JsonKey(name: 'occupation_id') String? occupationId,
    String? status,
    @JsonKey(name: 'referral_count', fromJson: _anyToInt) int? referralCount,
    @JsonKey(name: 'has_product', fromJson: _anyToBool) bool? hasProduct,
    @JsonKey(name: 'has_service', fromJson: _anyToBool) bool? hasService,
  }) = _RepairmanModel;

  const RepairmanModel._();

  factory RepairmanModel.fromJson(Map<String, dynamic> json) =>
      _$RepairmanModelFromJson(json);

  RepairmanEntity toEntity() => RepairmanEntity(
        id: id,
        firstName: firstName,
        lastName: lastName,
        mobile: mobile,
        email: email,
        role: role,
        birthday: birthday,
        profileImageId: profileImageId,
        ostan: ostan,
        shahrestan: shahrestan,
        brand: brand,
        identityImages: identityImages,
        businessLicenseImage: businessLicenseImage,
        phoneNumbers: phoneNumbers,
        location: location?.toEntity(),
        shopImages: shopImages,
        subscriptionCode: subscriptionCode,
        referralCode: referralCode,
        occupationId: occupationId,
        status: status,
        referralCount: referralCount,
        hasProduct: hasProduct,
        hasService: hasService,
      );

  factory RepairmanModel.fromEntity(RepairmanEntity entity) => RepairmanModel(
        id: entity.id,
        firstName: entity.firstName,
        lastName: entity.lastName,
        mobile: entity.mobile,
        email: entity.email,
        role: entity.role,
        birthday: entity.birthday,
        profileImageId: entity.profileImageId,
        ostan: entity.ostan,
        shahrestan: entity.shahrestan,
        brand: entity.brand,
        identityImages: entity.identityImages,
        businessLicenseImage: entity.businessLicenseImage,
        phoneNumbers: entity.phoneNumbers,
        location: entity.location != null ? LocationModel.fromEntity(entity.location!) : null,
        shopImages: entity.shopImages,
        subscriptionCode: entity.subscriptionCode,
        referralCode: entity.referralCode,
        occupationId: entity.occupationId,
        status: entity.status,
        referralCount: entity.referralCount,
        hasProduct: entity.hasProduct,
        hasService: entity.hasService,
      );
}

@freezed
class LocationModel with _$LocationModel {
  const factory LocationModel({
    @JsonKey(fromJson: _anyToDouble) @Default(0.0) double lat,
    @JsonKey(fromJson: _anyToDouble) @Default(0.0) double lng,
  }) = _LocationModel;

  const LocationModel._();

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  LocationEntity toEntity() => LocationEntity(lat: lat, lng: lng);

  factory LocationModel.fromEntity(LocationEntity entity) => LocationModel(
        lat: entity.lat,
        lng: entity.lng,
      );
}
