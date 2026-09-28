// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BannerModel _$BannerModelFromJson(Map<String, dynamic> json) => _BannerModel(
  id: _anyToString(json['id']),
  place: _anyToString(json['place']),
  images: json['images'] as Map<String, dynamic>?,
  status: _anyToString(json['status']),
  createdAt: _anyToString(json['created_at']),
  updatedAt: _anyToString(json['updated_at']),
);

Map<String, dynamic> _$BannerModelToJson(_BannerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'place': instance.place,
      'images': instance.images,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
