// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReminderTypeModel _$ReminderTypeModelFromJson(Map<String, dynamic> json) =>
    _ReminderTypeModel(
      id: json['id'] == null ? '' : _anyToString(json['id']),
      title: json['title'] == null ? '' : _anyToString(json['title']),
      status: json['status'] == null ? '' : _anyToString(json['status']),
      sortOrder: json['sort_order'] == null ? 0 : _anyToInt(json['sort_order']),
      activeSubItems:
          (json['active_sub_items'] as List<dynamic>?)
              ?.map(
                (e) => ReminderSubItemModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ReminderTypeModelToJson(_ReminderTypeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'status': instance.status,
      'sort_order': instance.sortOrder,
      'active_sub_items': instance.activeSubItems,
    };

_ReminderSubItemModel _$ReminderSubItemModelFromJson(
  Map<String, dynamic> json,
) => _ReminderSubItemModel(
  id: json['id'] == null ? '' : _anyToString(json['id']),
  reminderTypeId: json['reminder_type_id'] == null
      ? ''
      : _anyToString(json['reminder_type_id']),
  title: json['title'] == null ? '' : _anyToString(json['title']),
  status: json['status'] == null ? '' : _anyToString(json['status']),
  sortOrder: json['sort_order'] == null ? 0 : _anyToInt(json['sort_order']),
);

Map<String, dynamic> _$ReminderSubItemModelToJson(
  _ReminderSubItemModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'reminder_type_id': instance.reminderTypeId,
  'title': instance.title,
  'status': instance.status,
  'sort_order': instance.sortOrder,
};

_ReminderTypeListModel _$ReminderTypeListModelFromJson(
  Map<String, dynamic> json,
) => _ReminderTypeListModel(
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => ReminderTypeModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  currentPage: (json['current_page'] as num?)?.toInt() ?? 1,
  lastPage: (json['last_page'] as num?)?.toInt() ?? 1,
  total: json['total'] == null ? 0 : _anyToInt(json['total']),
);

Map<String, dynamic> _$ReminderTypeListModelToJson(
  _ReminderTypeListModel instance,
) => <String, dynamic>{
  'data': instance.data,
  'current_page': instance.currentPage,
  'last_page': instance.lastPage,
  'total': instance.total,
};
