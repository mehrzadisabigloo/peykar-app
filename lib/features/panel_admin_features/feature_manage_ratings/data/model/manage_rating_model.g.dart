// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manage_rating_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ManageRatingModel _$ManageRatingModelFromJson(Map<String, dynamic> json) =>
    _ManageRatingModel(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      repairmanId: json['repairman_id'] as String,
      description: json['description'] as String,
      score: (json['score'] as num).toInt(),
      status: json['status'] as String,
      createdAt: json['created_at'] as String,
      createdAtJalali: json['created_at_jalali'] as String?,
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ManageRatingModelToJson(_ManageRatingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'repairman_id': instance.repairmanId,
      'description': instance.description,
      'score': instance.score,
      'status': instance.status,
      'created_at': instance.createdAt,
      'created_at_jalali': instance.createdAtJalali,
      'user': instance.user,
    };
