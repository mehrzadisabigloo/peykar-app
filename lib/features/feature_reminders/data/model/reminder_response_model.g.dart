// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReminderModelImpl _$$ReminderModelImplFromJson(Map<String, dynamic> json) =>
    _$ReminderModelImpl(
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
      currentKm: _anyToInt(json['current_km']),
      nextKm: _anyToInt(json['next_km']),
      serviceProviderId: _anyToString(json['service_provider_id']),
      createdAt: _anyToString(json['created_at']),
      updatedAt: _anyToString(json['updated_at']),
    );

Map<String, dynamic> _$$ReminderModelImplToJson(_$ReminderModelImpl instance) =>
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
      'current_km': instance.currentKm,
      'next_km': instance.nextKm,
      'service_provider_id': instance.serviceProviderId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

_$KilometerLogModelImpl _$$KilometerLogModelImplFromJson(
  Map<String, dynamic> json,
) => _$KilometerLogModelImpl(
  date: json['date'] == null ? '' : _anyToString(json['date']),
  items:
      (json['items'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  doneKm: json['done_km'] == null ? 0 : _anyToInt(json['done_km']),
  nextKm: json['next_km'] == null ? 0 : _anyToInt(json['next_km']),
);

Map<String, dynamic> _$$KilometerLogModelImplToJson(
  _$KilometerLogModelImpl instance,
) => <String, dynamic>{
  'date': instance.date,
  'items': instance.items,
  'done_km': instance.doneKm,
  'next_km': instance.nextKm,
};

_$TimeLogModelImpl _$$TimeLogModelImplFromJson(
  Map<String, dynamic> json,
) => _$TimeLogModelImpl(
  items:
      (json['items'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  doneDate: json['done_date'] == null ? '' : _anyToString(json['done_date']),
  nextDate: json['next_date'] == null ? '' : _anyToString(json['next_date']),
);

Map<String, dynamic> _$$TimeLogModelImplToJson(_$TimeLogModelImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
      'done_date': instance.doneDate,
      'next_date': instance.nextDate,
    };

_$ReminderListModelImpl _$$ReminderListModelImplFromJson(
  Map<String, dynamic> json,
) => _$ReminderListModelImpl(
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => ReminderModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  total: _anyToInt(json['total']),
);

Map<String, dynamic> _$$ReminderListModelImplToJson(
  _$ReminderListModelImpl instance,
) => <String, dynamic>{'items': instance.items, 'total': instance.total};
