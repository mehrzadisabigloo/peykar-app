// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manage_services_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ManageServicesModelImpl _$$ManageServicesModelImplFromJson(
  Map<String, dynamic> json,
) => _$ManageServicesModelImpl(
  id: json['id'] == null ? '' : _anyToString(json['id']),
  repairmanId: _anyToString(json['repairman_id']),
  title: json['title'] == null ? '' : _anyToString(json['title']),
  description: json['description'] == null
      ? ''
      : _anyToString(json['description']),
  images: json['images'] == null ? const [] : _imagesFromJson(json['images']),
  keywords: json['keywords'] == null
      ? const []
      : _keywordsFromJson(json['keywords']),
  priceMin: json['price_min'] == null ? 0.0 : _anyToDouble(json['price_min']),
  priceMax: json['price_max'] == null ? 0.0 : _anyToDouble(json['price_max']),
  status: json['status'] == null ? '' : _anyToString(json['status']),
  repairman: json['repairman'] == null
      ? null
      : RepairmanModel.fromJson(json['repairman'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$ManageServicesModelImplToJson(
  _$ManageServicesModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'repairman_id': instance.repairmanId,
  'title': instance.title,
  'description': instance.description,
  'images': instance.images,
  'keywords': instance.keywords,
  'price_min': instance.priceMin,
  'price_max': instance.priceMax,
  'status': instance.status,
  'repairman': instance.repairman,
};
