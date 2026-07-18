// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressModelImpl _$$AddressModelImplFromJson(Map<String, dynamic> json) =>
    _$AddressModelImpl(
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

Map<String, dynamic> _$$AddressModelImplToJson(_$AddressModelImpl instance) =>
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

_$OstanModelImpl _$$OstanModelImplFromJson(Map<String, dynamic> json) =>
    _$OstanModelImpl(
      id: _anyToInt(json['id']),
      name: _anyToString(json['name']),
    );

Map<String, dynamic> _$$OstanModelImplToJson(_$OstanModelImpl instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

_$ShahrestanModelImpl _$$ShahrestanModelImplFromJson(
  Map<String, dynamic> json,
) => _$ShahrestanModelImpl(
  id: _anyToInt(json['id']),
  name: _anyToString(json['name']),
  ostan: _anyToString(json['ostan']),
);

Map<String, dynamic> _$$ShahrestanModelImplToJson(
  _$ShahrestanModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'ostan': instance.ostan,
};
