// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UsersListModel _$UsersListModelFromJson(Map<String, dynamic> json) =>
    _UsersListModel(
      users:
          (json['users'] as List<dynamic>?)
              ?.map((e) => UserModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      currentPage: json['current_page'] == null
          ? 1
          : _anyToInt(json['current_page']),
      lastPage: json['last_page'] == null ? 1 : _anyToInt(json['last_page']),
      total: json['total'] == null ? 0 : _anyToInt(json['total']),
    );

Map<String, dynamic> _$UsersListModelToJson(_UsersListModel instance) =>
    <String, dynamic>{
      'users': instance.users,
      'current_page': instance.currentPage,
      'last_page': instance.lastPage,
      'total': instance.total,
    };
