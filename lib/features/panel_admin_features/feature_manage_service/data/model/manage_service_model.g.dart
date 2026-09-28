// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manage_service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ManageServiceModel _$ManageServiceModelFromJson(Map<String, dynamic> json) =>
    _ManageServiceModel(
      id: _anyToString(json['id']),
      title: _anyToString(json['title']),
      description: _anyToString(json['description']),
      images: _imagesFromJson(json['images']),
      keywords: _keywordsFromJson(json['keywords']),
      priceMin: (_priceMinFromJson(json, 'priceMin') as num?)?.toDouble(),
      priceMax: (_priceMaxFromJson(json, 'priceMax') as num?)?.toDouble(),
      status: _anyToString(json['status']),
      createdAt: _anyToString(json['created_at']),
      updatedAt: _anyToString(json['updated_at']),
      occupation: json['occupation'] == null
          ? null
          : OccupationModel.fromJson(
              json['occupation'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$ManageServiceModelToJson(_ManageServiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'images': instance.images,
      'keywords': instance.keywords,
      'priceMin': instance.priceMin,
      'priceMax': instance.priceMax,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'occupation': instance.occupation,
    };
