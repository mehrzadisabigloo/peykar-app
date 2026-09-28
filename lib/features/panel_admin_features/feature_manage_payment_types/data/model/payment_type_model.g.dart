// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentTypeModel _$PaymentTypeModelFromJson(Map<String, dynamic> json) =>
    _PaymentTypeModel(
      id: _anyToInt(json['id']),
      title: _anyToString(json['title']),
      label: _anyToString(json['label']),
      type: _anyToString(json['type']),
      status: _anyToString(json['status']),
      createdAt: _anyToString(json['created_at']),
      updatedAt: _anyToString(json['updated_at']),
    );

Map<String, dynamic> _$PaymentTypeModelToJson(_PaymentTypeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'label': instance.label,
      'type': instance.type,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
