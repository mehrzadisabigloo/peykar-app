// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manage_reminder_types_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ManageReminderTypeModel _$ManageReminderTypeModelFromJson(
  Map<String, dynamic> json,
) => _ManageReminderTypeModel(
  id: _anyToString(json['id']),
  reminderTypeId: _anyToString(json['reminder_type_id']),
  title: _anyToString(json['title']),
  status: _anyToString(json['status']),
  sortOrder: _anyToInt(json['sort_order']),
  createdAt: _anyToString(json['created_at']),
  updatedAt: _anyToString(json['updated_at']),
  subCategories: (json['active_sub_items'] as List<dynamic>?)
      ?.map((e) => ManageReminderTypeModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ManageReminderTypeModelToJson(
  _ManageReminderTypeModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'reminder_type_id': instance.reminderTypeId,
  'title': instance.title,
  'status': instance.status,
  'sort_order': instance.sortOrder,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'active_sub_items': instance.subCategories,
};
