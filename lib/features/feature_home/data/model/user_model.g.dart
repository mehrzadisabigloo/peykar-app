// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: _anyToString(json['id']),
      firstName: _anyToString(json['first_name']),
      lastName: _anyToString(json['last_name']),
      mobile: _anyToString(json['mobile']),
      role: _roleFromJson(json['role']),
      status: _anyToString(json['status']),
      brand: _anyToString(json['brand']),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'mobile': instance.mobile,
      'role': instance.role,
      'status': instance.status,
      'brand': instance.brand,
    };
