// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manage_reminder_sub_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ManageReminderSubItemModel _$ManageReminderSubItemModelFromJson(
  Map<String, dynamic> json,
) => _ManageReminderSubItemModel(
  id: _anyToString(json['id']),
  title: _anyToString(json['title']),
  status: _anyToString(json['status']),
  reminderTypeId: _anyToString(json['reminder_type_id']),
  createdAt: _anyToString(json['created_at']),
  updatedAt: _anyToString(json['updated_at']),
);

Map<String, dynamic> _$ManageReminderSubItemModelToJson(
  _ManageReminderSubItemModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'status': instance.status,
  'reminder_type_id': instance.reminderTypeId,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};
