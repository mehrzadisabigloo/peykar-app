class AddReminderRequest {
  final String title;
  final List<KilometerLog>? kilometerLogs;
  final List<TimeLog>? timeLogs;
  final bool? timeReminder;
  final String? serviceProviderId;
  final String? description;

  AddReminderRequest({
    required this.title,
    this.kilometerLogs,
    this.timeLogs,
    this.timeReminder,
    this.serviceProviderId,
    this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      if (kilometerLogs != null) 'kilometer_logs': kilometerLogs!.map((e) => e.toJson()).toList(),
      if (timeLogs != null) 'time_logs': timeLogs!.map((e) => e.toJson()).toList(),
      if (timeReminder != null) 'time_reminder': timeReminder,
      if (serviceProviderId != null) 'service_provider_id': serviceProviderId,
      if (description != null) 'description': description,
    };
  }
}

class KilometerLog {
  final int doneKm;
  final int nextKm;
  final String date;
  final List<String>? items;

  KilometerLog({
    required this.doneKm,
    required this.nextKm,
    required this.date,
    this.items,
  });

  Map<String, dynamic> toJson() => {
        'done_km': doneKm,
        'next_km': nextKm,
        'date': date,
        if (items != null) 'items': items,
      };
}

class TimeLog {
  final String doneDate;
  final String nextDate;
  final List<String>? items;

  TimeLog({
    required this.doneDate,
    required this.nextDate,
    this.items,
  });

  Map<String, dynamic> toJson() => {
        'done_date': doneDate,
        'next_date': nextDate,
        if (items != null) 'items': items,
      };
}

class ListUserRemindersRequest {
  final bool? isPaginate;
  final int? countItem;
  final String? title;
  final String? serviceProviderId;
  final bool? timeReminder;
  final String? dateFrom;
  final String? dateTo;

  ListUserRemindersRequest({
    this.isPaginate,
    this.countItem,
    this.title,
    this.serviceProviderId,
    this.timeReminder,
    this.dateFrom,
    this.dateTo,
  });

  Map<String, dynamic> toJson() {
    return {
      if (isPaginate != null) 'is_paginate': isPaginate,
      if (countItem != null) 'count_item': countItem,
      if (title != null) 'title': title,
      if (serviceProviderId != null) 'service_provider_id': serviceProviderId,
      if (timeReminder != null) 'time_reminder': timeReminder,
      if (dateFrom != null) 'date_from': dateFrom,
      if (dateTo != null) 'date_to': dateTo,
    };
  }
}
