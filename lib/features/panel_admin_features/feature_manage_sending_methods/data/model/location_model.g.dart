// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OstanModel _$OstanModelFromJson(Map<String, dynamic> json) =>
    _OstanModel(id: _anyToInt(json['id']), name: _anyToString(json['name']));

Map<String, dynamic> _$OstanModelToJson(_OstanModel instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

_ShahrestanModel _$ShahrestanModelFromJson(Map<String, dynamic> json) =>
    _ShahrestanModel(
      id: _anyToInt(json['id']),
      name: _anyToString(json['name']),
      ostan: _anyToString(json['ostan']),
    );

Map<String, dynamic> _$ShahrestanModelToJson(_ShahrestanModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'ostan': instance.ostan,
    };
