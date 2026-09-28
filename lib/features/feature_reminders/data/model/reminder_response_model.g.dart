// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReminderModel _$ReminderModelFromJson(Map<String, dynamic> json) =>
    _ReminderModel(
      id: json['id'] == null ? '' : _anyToString(json['id']),
      userId: _anyToString(json['user_id']),
      title: json['title'] == null ? '' : _anyToString(json['title']),
      description: json['description'] == null
          ? ''
          : _anyToString(json['description']),
      remainingText: json['remaining_text'] == null
          ? ''
          : _anyToString(json['remaining_text']),
      progress: json['progress'] == null ? 0.0 : _anyToDouble(json['progress']),
      isTimeReminder: json['time_reminder'] == null
          ? false
          : _anyToBool(json['time_reminder']),
      imageUrl: json['image_url'] as String?,
      progressColor: json['color'] == null
          ? const Color(0xFF3F51B5)
          : _parseColor(json['color']),
      kilometerLogs: (json['kilometer_logs'] as List<dynamic>?)
          ?.map((e) => KilometerLogModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      timeLogs: (json['time_logs'] as List<dynamic>?)
          ?.map((e) => TimeLogModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      kilometerLogsJalali: (json['kilometer_logs_jalali'] as List<dynamic>?)
          ?.map((e) => KilometerLogModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      timeLogsJalali: (json['time_logs_jalali'] as List<dynamic>?)
          ?.map((e) => TimeLogModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentKm: _anyToInt(json['current_km']),
      nextKm: _anyToInt(json['next_km']),
      serviceProviderId: _anyToString(json['service_provider_id']),
      reminderTypeId: _anyToString(json['reminder_type_id']),
      reminderSubItems: (json['reminder_sub_items'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      createdAt: _anyToString(json['created_at']),
      updatedAt: _anyToString(json['updated_at']),
      createdAtJalali: _anyToString(json['created_at_jalali']),
      updatedAtJalali: _anyToString(json['updated_at_jalali']),
      reminderType: json['reminder_type'] == null
          ? null
          : ReminderTypeModel.fromJson(
              json['reminder_type'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$ReminderModelToJson(_ReminderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'title': instance.title,
      'description': instance.description,
      'remaining_text': instance.remainingText,
      'progress': instance.progress,
      'time_reminder': instance.isTimeReminder,
      'image_url': instance.imageUrl,
      'color': _colorToJson(instance.progressColor),
      'kilometer_logs': instance.kilometerLogs,
      'time_logs': instance.timeLogs,
      'kilometer_logs_jalali': instance.kilometerLogsJalali,
      'time_logs_jalali': instance.timeLogsJalali,
      'current_km': instance.currentKm,
      'next_km': instance.nextKm,
      'service_provider_id': instance.serviceProviderId,
      'reminder_type_id': instance.reminderTypeId,
      'reminder_sub_items': instance.reminderSubItems,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'created_at_jalali': instance.createdAtJalali,
      'updated_at_jalali': instance.updatedAtJalali,
      'reminder_type': instance.reminderType,
    };

_KilometerLogModel _$KilometerLogModelFromJson(Map<String, dynamic> json) =>
    _KilometerLogModel(
      date: json['date'] == null ? '' : _anyToString(json['date']),
      items:
          (json['items'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
      doneKm: json['done_km'] == null ? 0 : _anyToInt(json['done_km']),
      nextKm: json['next_km'] == null ? 0 : _anyToInt(json['next_km']),
    );

Map<String, dynamic> _$KilometerLogModelToJson(_KilometerLogModel instance) =>
    <String, dynamic>{
      'date': instance.date,
      'items': instance.items,
      'done_km': instance.doneKm,
      'next_km': instance.nextKm,
    };

_TimeLogModel _$TimeLogModelFromJson(
  Map<String, dynamic> json,
) => _TimeLogModel(
  items:
      (json['items'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  doneDate: json['done_date'] == null ? '' : _anyToString(json['done_date']),
  nextDate: json['next_date'] == null ? '' : _anyToString(json['next_date']),
);

Map<String, dynamic> _$TimeLogModelToJson(_TimeLogModel instance) =>
    <String, dynamic>{
      'items': instance.items,
      'done_date': instance.doneDate,
      'next_date': instance.nextDate,
    };

_ReminderListModel _$ReminderListModelFromJson(Map<String, dynamic> json) =>
    _ReminderListModel(
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => ReminderModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      currentPage: (json['current_page'] as num?)?.toInt() ?? 1,
      lastPage: (json['last_page'] as num?)?.toInt() ?? 1,
      total: json['total'] == null ? 0 : _anyToInt(json['total']),
    );

Map<String, dynamic> _$ReminderListModelToJson(_ReminderListModel instance) =>
    <String, dynamic>{
      'items': instance.items,
      'current_page': instance.currentPage,
      'last_page': instance.lastPage,
      'total': instance.total,
    };
