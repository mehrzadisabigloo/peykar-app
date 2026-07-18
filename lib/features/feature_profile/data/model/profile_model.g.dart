// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileModelImpl _$$ProfileModelImplFromJson(Map<String, dynamic> json) =>
    _$ProfileModelImpl(
      id: json['id'] as String? ?? '',
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
      mobile: json['mobile'] as String? ?? '',
      email: json['email'] as String?,
      role: json['role'] == null ? '' : _roleFromJson(json['role']),
      birthday: json['birthday'] as String?,
      profileImageId: json['profile_image_id'] as String?,
      subscriptionCode: _anyToString(json['subscription_code']),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$ProfileModelImplToJson(_$ProfileModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'mobile': instance.mobile,
      'email': instance.email,
      'role': instance.role,
      'birthday': instance.birthday,
      'profile_image_id': instance.profileImageId,
      'subscription_code': instance.subscriptionCode,
      'status': instance.status,
    };
