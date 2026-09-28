// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddressModel _$AddressModelFromJson(Map<String, dynamic> json) =>
    _AddressModel(
      id: _anyToString(json['id']),
      userId: _anyToString(json['user_id']),
      ostanId: _anyToInt(json['ostan_id']),
      shahrestanId: _anyToInt(json['shahrestan_id']),
      fullAddress: _anyToString(json['full_address']),
      pelak: _anyToString(json['pelak']),
      vahed: _anyToString(json['vahed']),
      postalCode: _anyToString(json['postal_code']),
      latitude: _anyToDouble(json['latitude']),
      longitude: _anyToDouble(json['longitude']),
      createdAt: _anyToString(json['created_at']),
      updatedAt: _anyToString(json['updated_at']),
      ostan: json['ostan'] == null
          ? null
          : OstanModel.fromJson(json['ostan'] as Map<String, dynamic>),
      shahrestan: json['shahrestan'] == null
          ? null
          : ShahrestanModel.fromJson(
              json['shahrestan'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$AddressModelToJson(_AddressModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'ostan_id': instance.ostanId,
      'shahrestan_id': instance.shahrestanId,
      'full_address': instance.fullAddress,
      'pelak': instance.pelak,
      'vahed': instance.vahed,
      'postal_code': instance.postalCode,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'ostan': instance.ostan,
      'shahrestan': instance.shahrestan,
    };
