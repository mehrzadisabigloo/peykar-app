import 'dart:ui';

enum ReminderType {
  kilometer,
  time,
}

class RemindersEntity {
  final String id;
  final String? userId;
  final String title;
  final String description;
  final String remainingText;
  final double progress; // 0.0 to 1.0
  final ReminderType type;
  final String? imageUrl;
  final Color progressColor;
  final List<KilometerLog>? kilometerLogs;
  final List<TimeLog>? timeLogs;
  final String? serviceProviderId;
  final String? createdAt;
  final String? updatedAt;

  RemindersEntity({
    required this.id,
    this.userId,
    required this.title,
    required this.description,
    required this.remainingText,
    required this.progress,
    required this.type,
    this.imageUrl,
    required this.progressColor,
    this.kilometerLogs,
    this.timeLogs,
    this.serviceProviderId,
    this.createdAt,
    this.updatedAt,
  });
}

class KilometerLog {
  final String date;
  final List<String> items;
  final int doneKm;
  final int nextKm;

  KilometerLog({
    required this.date,
    required this.items,
    required this.doneKm,
    required this.nextKm,
  });
}

class TimeLog {
  final List<String> items;
  final String doneDate;
  final String nextDate;

  TimeLog({
    required this.items,
    required this.doneDate,
    required this.nextDate,
  });
}
