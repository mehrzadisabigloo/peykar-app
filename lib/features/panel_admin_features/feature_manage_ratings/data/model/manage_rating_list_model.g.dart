// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manage_rating_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ManageRatingListModel _$ManageRatingListModelFromJson(
  Map<String, dynamic> json,
) => _ManageRatingListModel(
  currentPage: (json['current_page'] as num).toInt(),
  data: (json['data'] as List<dynamic>)
      .map((e) => ManageRatingModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  lastPage: (json['last_page'] as num).toInt(),
  total: (json['total'] as num).toInt(),
);

Map<String, dynamic> _$ManageRatingListModelToJson(
  _ManageRatingListModel instance,
) => <String, dynamic>{
  'current_page': instance.currentPage,
  'data': instance.data,
  'last_page': instance.lastPage,
  'total': instance.total,
};
