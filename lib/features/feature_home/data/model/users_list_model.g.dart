// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UsersListModelImpl _$$UsersListModelImplFromJson(Map<String, dynamic> json) =>
    _$UsersListModelImpl(
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

Map<String, dynamic> _$$UsersListModelImplToJson(
  _$UsersListModelImpl instance,
) => <String, dynamic>{
  'users': instance.users,
  'current_page': instance.currentPage,
  'last_page': instance.lastPage,
  'total': instance.total,
};
