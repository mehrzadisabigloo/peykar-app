// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'occupation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OccupationModelImpl _$$OccupationModelImplFromJson(
  Map<String, dynamic> json,
) => _$OccupationModelImpl(
  id: _anyToString(json['id']),
  title: _anyToString(json['title']),
  status: _anyToString(json['status']),
  sortOrder: _anyToInt(json['sort_order']),
  createdAt: _anyToString(json['created_at']),
  updatedAt: _anyToString(json['updated_at']),
);

Map<String, dynamic> _$$OccupationModelImplToJson(
  _$OccupationModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'status': instance.status,
  'sort_order': instance.sortOrder,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};
