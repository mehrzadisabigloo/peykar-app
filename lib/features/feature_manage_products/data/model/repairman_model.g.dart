// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repairman_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RepairmanModelImpl _$$RepairmanModelImplFromJson(Map<String, dynamic> json) =>
    _$RepairmanModelImpl(
      id: json['id'] as String? ?? '',
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      mobile: json['mobile'] as String?,
      email: json['email'] as String?,
      role: _toList(json['role']),
      birthday: json['birthday'] as String?,
      profileImageId: json['profile_image_id'] as String?,
      ostan: json['ostan'] as String?,
      shahrestan: json['shahrestan'] as String?,
      brand: json['brand'] as String?,
      identityImages: _toList(json['identity_images']),
      businessLicenseImage: _toList(json['business_license_image']),
      phoneNumbers: _toList(json['phone_numbers']),
      location: json['location'] == null
          ? null
          : LocationModel.fromJson(json['location'] as Map<String, dynamic>),
      shopImages: _toList(json['shop_images']),
      subscriptionCode: json['subscription_code'] as String?,
      referralCode: json['referral_code'] as String?,
      occupationId: json['occupation_id'] as String?,
      status: json['status'] as String?,
      referralCount: _anyToInt(json['referral_count']),
      hasProduct: _anyToBool(json['has_product']),
      hasService: _anyToBool(json['has_service']),
    );

Map<String, dynamic> _$$RepairmanModelImplToJson(
  _$RepairmanModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'mobile': instance.mobile,
  'email': instance.email,
  'role': instance.role,
  'birthday': instance.birthday,
  'profile_image_id': instance.profileImageId,
  'ostan': instance.ostan,
  'shahrestan': instance.shahrestan,
  'brand': instance.brand,
  'identity_images': instance.identityImages,
  'business_license_image': instance.businessLicenseImage,
  'phone_numbers': instance.phoneNumbers,
  'location': instance.location,
  'shop_images': instance.shopImages,
  'subscription_code': instance.subscriptionCode,
  'referral_code': instance.referralCode,
  'occupation_id': instance.occupationId,
  'status': instance.status,
  'referral_count': instance.referralCount,
  'has_product': instance.hasProduct,
  'has_service': instance.hasService,
};

_$LocationModelImpl _$$LocationModelImplFromJson(Map<String, dynamic> json) =>
    _$LocationModelImpl(
      lat: json['lat'] == null ? 0.0 : _anyToDouble(json['lat']),
      lng: json['lng'] == null ? 0.0 : _anyToDouble(json['lng']),
    );

Map<String, dynamic> _$$LocationModelImplToJson(_$LocationModelImpl instance) =>
    <String, dynamic>{'lat': instance.lat, 'lng': instance.lng};
