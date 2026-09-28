// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RatingModel _$RatingModelFromJson(Map<String, dynamic> json) => _RatingModel(
  id: json['id'] as String,
  userId: json['user_id'] as String,
  repairmanId: json['repairman_id'] as String,
  description: json['description'] as String?,
  score: (json['score'] as num).toInt(),
  status: json['status'] as String,
  createdAt: json['created_at'] as String,
  updatedAt: json['updated_at'] as String,
  createdAtJalali: json['created_at_jalali'] as String?,
  user: ReservationUserModel.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RatingModelToJson(_RatingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'repairman_id': instance.repairmanId,
      'description': instance.description,
      'score': instance.score,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'created_at_jalali': instance.createdAtJalali,
      'user': instance.user,
    };

_RatingListModel _$RatingListModelFromJson(Map<String, dynamic> json) =>
    _RatingListModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => RatingModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentPage: (json['current_page'] as num).toInt(),
      lastPage: (json['last_page'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$RatingListModelToJson(_RatingListModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'current_page': instance.currentPage,
      'last_page': instance.lastPage,
      'total': instance.total,
    };
