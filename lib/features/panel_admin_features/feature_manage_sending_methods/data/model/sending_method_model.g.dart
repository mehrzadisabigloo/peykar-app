// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sending_method_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SendingMethodModel _$SendingMethodModelFromJson(Map<String, dynamic> json) =>
    _SendingMethodModel(
      id: _anyToString(json['id']),
      title: _anyToString(json['title']),
      price: _anyToInt(json['price']),
      status: _anyToString(json['status']),
      createdAt: _anyToString(json['created_at']),
      updatedAt: _anyToString(json['updated_at']),
      locationsCount: _anyToInt(json['locations_count']),
      locations: (json['locations'] as List<dynamic>?)
          ?.map(
            (e) =>
                SendingMethodLocationModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$SendingMethodModelToJson(_SendingMethodModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'locations_count': instance.locationsCount,
      'locations': instance.locations,
    };

_SendingMethodLocationModel _$SendingMethodLocationModelFromJson(
  Map<String, dynamic> json,
) => _SendingMethodLocationModel(
  id: _anyToString(json['id']),
  sendingMethodId: _anyToString(json['sending_method_id']),
  ostanId: _anyToInt(json['ostan_id']),
  shahrestanId: _anyToInt(json['shahrestan_id']),
  price: _anyToInt(json['price']),
  status: _anyToString(json['status']),
  createdAt: _anyToString(json['created_at']),
  updatedAt: _anyToString(json['updated_at']),
);

Map<String, dynamic> _$SendingMethodLocationModelToJson(
  _SendingMethodLocationModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'sending_method_id': instance.sendingMethodId,
  'ostan_id': instance.ostanId,
  'shahrestan_id': instance.shahrestanId,
  'price': instance.price,
  'status': instance.status,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};
