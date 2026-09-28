import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/utils/jalali_date.dart';
import '../../domain/entity/reminders_entity.dart';
import '../../domain/entity/reminders_list_entity.dart';
import 'reminder_type_model.dart';

part 'reminder_response_model.freezed.dart';
part 'reminder_response_model.g.dart';

String _anyToString(dynamic value) => value?.toString() ?? '';
double _anyToDouble(dynamic value) => double.tryParse(value?.toString() ?? '0.0') ?? 0.0;
int _anyToInt(dynamic value) => (value is num) ? value.toInt() : (int.tryParse(value?.toString() ?? '0') ?? 0);
bool _anyToBool(dynamic value) => value is bool ? value : (value?.toString().toLowerCase() == 'true' || value == 1);

Color _parseColor(dynamic color) {
  if (color == null) return const Color(0xFF3F51B5);
  if (color is String) {
    if (color.startsWith('#')) {
      return Color(int.parse(color.substring(1, 7), radix: 16) + 0xFF000000);
    }
    switch (color.toLowerCase()) {
      case 'green': return Colors.green;
      case 'orange': return Colors.orange;
      case 'red': return Colors.red;
      case 'blue': return const Color(0xFF3F51B5);
    }
  }
  return const Color(0xFF3F51B5);
}

// Helper for Color serialization
String _colorToJson(Color color) => '#${color.value.toRadixString(16).substring(2)}';

DateTime? _parseFlexibleDate(String dateStr) {
  try {
    if (dateStr.contains('/')) {
      final parts = dateStr.split('/');
      if (parts.length == 3) {
        final year = int.parse(parts[0]);
        final month = int.parse(parts[1]);
        final day = int.parse(parts[2]);
        return Jalali(year, month, day).toDateTime();
      }
    }
    return DateTime.tryParse(dateStr);
  } catch (_) {}
  return null;
}

@freezed
sealed class ReminderModel with _$ReminderModel {
  const factory ReminderModel({
    @JsonKey(fromJson: _anyToString) @Default('') String id,
    @JsonKey(name: 'user_id', fromJson: _anyToString) String? userId,
    @JsonKey(fromJson: _anyToString) @Default('') String title,
    @JsonKey(fromJson: _anyToString) @Default('') String description,
    @JsonKey(name: 'remaining_text', fromJson: _anyToString) @Default('') String remainingText,
    @JsonKey(fromJson: _anyToDouble) @Default(0.0) double progress,
    @JsonKey(name: 'time_reminder', fromJson: _anyToBool) @Default(false) bool isTimeReminder,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'color', fromJson: _parseColor, toJson: _colorToJson) @Default(Color(0xFF3F51B5)) Color progressColor,
    @JsonKey(name: 'kilometer_logs') List<KilometerLogModel>? kilometerLogs,
    @JsonKey(name: 'time_logs') List<TimeLogModel>? timeLogs,
    @JsonKey(name: 'kilometer_logs_jalali') List<KilometerLogModel>? kilometerLogsJalali,
    @JsonKey(name: 'time_logs_jalali') List<TimeLogModel>? timeLogsJalali,
    @JsonKey(name: 'current_km', fromJson: _anyToInt) int? currentKm,
    @JsonKey(name: 'next_km', fromJson: _anyToInt) int? nextKm,
    @JsonKey(name: 'service_provider_id', fromJson: _anyToString) String? serviceProviderId,
    @JsonKey(name: 'reminder_type_id', fromJson: _anyToString) String? reminderTypeId,
    @JsonKey(name: 'reminder_sub_items') List<String>? reminderSubItems,
    @JsonKey(name: 'created_at', fromJson: _anyToString) String? createdAt,
    @JsonKey(name: 'updated_at', fromJson: _anyToString) String? updatedAt,
    @JsonKey(name: 'created_at_jalali', fromJson: _anyToString) String? createdAtJalali,
    @JsonKey(name: 'updated_at_jalali', fromJson: _anyToString) String? updatedAtJalali,
    @JsonKey(name: 'reminder_type') ReminderTypeModel? reminderType,
  }) = _ReminderModel;

  const ReminderModel._();

  factory ReminderModel.fromJson(Map<String, dynamic> json) =>
      _$ReminderModelFromJson(json);

  RemindersEntity toEntity() {
    // Detect type based on both the flag AND the presence of logs
    // Some API responses have time_reminder: false even for time-based reminders
    bool effectivelyTimeReminder = isTimeReminder;
    
    final hasTimeLogs = (timeLogs != null && timeLogs!.isNotEmpty) || (timeLogsJalali != null && timeLogsJalali!.isNotEmpty);
    final hasKMLogs = (kilometerLogs != null && kilometerLogs!.isNotEmpty) || (kilometerLogsJalali != null && kilometerLogsJalali!.isNotEmpty);
    
    if (hasTimeLogs && !hasKMLogs) {
      effectivelyTimeReminder = true;
    } else if (hasKMLogs && !hasTimeLogs) {
      effectivelyTimeReminder = false;
    }

    String finalRemainingText = remainingText;
    double finalProgress = progress;
    Color finalProgressColor = progressColor;

    if (finalProgress == 0.0) {
      if (effectivelyTimeReminder && hasTimeLogs) {
        final relevantTimeLogs = timeLogsJalali ?? timeLogs;
        final now = DateTime.now();
        final doneDate = _parseFlexibleDate(relevantTimeLogs!.first.doneDate);
        final nextDate = _parseFlexibleDate(relevantTimeLogs.first.nextDate);

        if (doneDate != null && nextDate != null) {
          final totalDuration = nextDate.difference(doneDate).inSeconds;
          final elapsedDuration = now.difference(doneDate).inSeconds;
          if (totalDuration > 0) {
            // progress is elapsed/total (vice versa of remaining/total)
            finalProgress = (elapsedDuration / totalDuration).clamp(0.0, 1.0);
          }
          
          final remainingDays = nextDate.difference(now).inDays;
          if (remainingDays > 0) {
            finalRemainingText = "$remainingDays روز مانده";
          } else if (remainingDays == 0) {
            finalRemainingText = "امروز";
          } else {
            finalRemainingText = "${remainingDays.abs()} روز گذشته";
          }
        }
      } else if (!effectivelyTimeReminder && hasKMLogs) {
        final relevantKMLogs = kilometerLogsJalali ?? kilometerLogs;
        final kmNext = nextKm ?? relevantKMLogs!.first.nextKm;
        final kmDone = relevantKMLogs!.first.doneKm;
        final kmCurrent = currentKm ?? 0;

        if (kmNext > kmDone && kmCurrent >= kmDone) {
          final totalKm = kmNext - kmDone;
          final elapsedKm = kmCurrent - kmDone;
          // progress is elapsed/total (vice versa of remaining/total)
          finalProgress = (elapsedKm / totalKm).clamp(0.0, 1.0);
        } else if (kmCurrent < kmDone && kmCurrent > 0) {
           finalProgress = 0.0;
        }

        if (kmNext > 0) {
          final remainingKm = kmNext - kmCurrent;
          if (remainingKm > 0) {
            finalRemainingText = "$remainingKm کیلومتر مانده";
          } else if (remainingKm == 0) {
            finalRemainingText = "همین حالا";
          } else {
            finalRemainingText = "${remainingKm.abs()} کیلومتر گذشته";
          }
        }
      }
    }

    // Default text if calculation failed
    if (finalRemainingText.isEmpty) {
      finalRemainingText = effectivelyTimeReminder ? "نامشخص" : "کیلومتر نامشخص";
    }

    // Default base color based on type if it's the default API color
    if (finalProgressColor.value == const Color(0xFF3F51B5).value) {
      finalProgressColor = effectivelyTimeReminder ? Colors.blue : Colors.orange;
    }

    if (finalProgress > 0.9) {
      finalProgressColor = Colors.red;
    } else if (finalProgress > 0.7) {
      finalProgressColor = Colors.orange;
    }

    return RemindersEntity(
      id: id,
      userId: userId,
      title: title,
      reminderTypeTitle: reminderType?.title,
      description: description,
      remainingText: finalRemainingText,
      progress: finalProgress,
      type: effectivelyTimeReminder ? ReminderType.time : ReminderType.kilometer,
      imageUrl: imageUrl,
      progressColor: finalProgressColor,
      kilometerLogs: kilometerLogs?.map((e) => e.toEntity()).toList(),
      timeLogs: timeLogs?.map((e) => e.toEntity()).toList(),
      kilometerLogsJalali: kilometerLogsJalali?.map((e) => e.toEntity()).toList(),
      timeLogsJalali: timeLogsJalali?.map((e) => e.toEntity()).toList(),
      serviceProviderId: serviceProviderId,
      reminderTypeId: reminderTypeId,
      selectedSubItemIds: reminderSubItems,
      createdAt: createdAtJalali ?? createdAt,
      updatedAt: updatedAtJalali ?? updatedAt,
    );
  }
}

@freezed
sealed class KilometerLogModel with _$KilometerLogModel {
  const factory KilometerLogModel({
    @JsonKey(fromJson: _anyToString) @Default('') String date,
    @Default([]) List<String> items,
    @JsonKey(name: 'done_km', fromJson: _anyToInt) @Default(0) int doneKm,
    @JsonKey(name: 'next_km', fromJson: _anyToInt) @Default(0) int nextKm,
  }) = _KilometerLogModel;

  const KilometerLogModel._();

  factory KilometerLogModel.fromJson(Map<String, dynamic> json) =>
      _$KilometerLogModelFromJson(json);

  KilometerLog toEntity() => KilometerLog(
        date: date,
        items: items,
        doneKm: doneKm,
        nextKm: nextKm,
      );
}

@freezed
sealed class TimeLogModel with _$TimeLogModel {
  const factory TimeLogModel({
    @Default([]) List<String> items,
    @JsonKey(name: 'done_date', fromJson: _anyToString) @Default('') String doneDate,
    @JsonKey(name: 'next_date', fromJson: _anyToString) @Default('') String nextDate,
  }) = _TimeLogModel;

  const TimeLogModel._();

  factory TimeLogModel.fromJson(Map<String, dynamic> json) =>
      _$TimeLogModelFromJson(json);

  TimeLog toEntity() => TimeLog(
        items: items,
        doneDate: doneDate,
        nextDate: nextDate,
      );
}

@freezed
sealed class ReminderListModel with _$ReminderListModel {
  const factory ReminderListModel({
    @Default([]) List<ReminderModel> items,
    @JsonKey(name: 'current_page') @Default(1) int currentPage,
    @JsonKey(name: 'last_page') @Default(1) int lastPage,
    @JsonKey(fromJson: _anyToInt) @Default(0) int total,
  }) = _ReminderListModel;

  const ReminderListModel._();

  factory ReminderListModel.fromJson(Map<String, dynamic> json) =>
      _$ReminderListModelFromJson(json);

  factory ReminderListModel.fromApiResponse(dynamic json) {
    int? currentKm;
    if (json is Map<String, dynamic>) {
      // Try multiple locations for current_km
      currentKm = json['current_km'] ?? 
                 (json['data'] is Map ? json['data']['current_km'] : null) ??
                 (json['meta'] is Map ? json['meta']['current_km'] : null);
    }

    if (json is List) {
      return ReminderListModel(
        items: json.map((e) {
          final map = Map<String, dynamic>.from(e);
          if (currentKm != null) map['current_km'] = currentKm;
          return ReminderModel.fromJson(map);
        }).toList(),
        total: json.length,
      );
    }

    if (json is Map<String, dynamic>) {
      final rootData = json['data'];
      List<dynamic> rawList = [];
      int currentPage = 1;
      int lastPage = 1;
      int total = 0;

      if (rootData is List) {
        rawList = rootData;
        total = rootData.length;
      } else if (rootData is Map<String, dynamic>) {
        rawList = rootData['data'] ?? [];
        currentPage = _anyToInt(rootData['current_page']);
        lastPage = _anyToInt(rootData['last_page']);
        total = _anyToInt(rootData['total']);
      }

      return ReminderListModel(
        items: rawList.map((e) {
          final map = Map<String, dynamic>.from(e);
          if (currentKm != null) map['current_km'] = currentKm;
          return ReminderModel.fromJson(map);
        }).toList(),
        currentPage: currentPage,
        lastPage: lastPage,
        total: total,
      );
    }
    return const ReminderListModel();
  }

  RemindersListEntity toEntity() => RemindersListEntity(
        reminders: items.map((e) => e.toEntity()).toList(),
        currentPage: currentPage,
        lastPage: lastPage,
        total: total,
      );
}
