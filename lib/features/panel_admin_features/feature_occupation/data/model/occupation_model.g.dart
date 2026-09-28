// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'occupation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OccupationModel _$OccupationModelFromJson(Map<String, dynamic> json) =>
    _OccupationModel(
      id: _anyToString(json['id']),
      title: _anyToString(json['title']),
      status: _anyToString(json['status']),
      sortOrder: _anyToInt(json['sort_order']),
      createdAt: _anyToString(json['created_at']),
      updatedAt: _anyToString(json['updated_at']),
      imageId: _anyToString(json['image_id']),
      color: _anyToString(json['color']),
    );

Map<String, dynamic> _$OccupationModelToJson(_OccupationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'status': instance.status,
      'sort_order': instance.sortOrder,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'image_id': instance.imageId,
      'color': instance.color,
    };
