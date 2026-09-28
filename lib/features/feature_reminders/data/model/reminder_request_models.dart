class AddReminderRequest {
  final String reminderTypeId;
  final List<String>? reminderSubItems;
  final List<KilometerLog>? kilometerLogs;
  final List<TimeLog>? timeLogs;
  final String? description;

  AddReminderRequest({
    required this.reminderTypeId,
    this.reminderSubItems,
    this.kilometerLogs,
    this.timeLogs,
    this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'reminder_type_id': reminderTypeId,
      if (reminderSubItems != null) 'reminder_sub_items': reminderSubItems,
      if (kilometerLogs != null) 'kilometer_logs': kilometerLogs!.map((e) => e.toJson()).toList(),
      if (timeLogs != null) 'time_logs': timeLogs!.map((e) => e.toJson()).toList(),
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
  final int? page;
  final String? title;
  final String? serviceProviderId;
  final bool? timeReminder;
  final String? dateFrom;
  final String? dateTo;

  ListUserRemindersRequest({
    this.isPaginate,
    this.countItem,
    this.page,
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
      if (page != null) 'page': page,
      if (title != null) 'title': title,
      if (serviceProviderId != null) 'service_provider_id': serviceProviderId,
      if (timeReminder != null) 'time_reminder': timeReminder,
      if (dateFrom != null) 'date_from': dateFrom,
      if (dateTo != null) 'date_to': dateTo,
    };
  }

  ListUserRemindersRequest copyWith({
    bool? isPaginate,
    int? countItem,
    int? page,
    String? title,
    String? serviceProviderId,
    bool? timeReminder,
    String? dateFrom,
    String? dateTo,
  }) {
    return ListUserRemindersRequest(
      isPaginate: isPaginate ?? this.isPaginate,
      countItem: countItem ?? this.countItem,
      page: page ?? this.page,
      title: title ?? this.title,
      serviceProviderId: serviceProviderId ?? this.serviceProviderId,
      timeReminder: timeReminder ?? this.timeReminder,
      dateFrom: dateFrom ?? this.dateFrom,
      dateTo: dateTo ?? this.dateTo,
    );
  }
}
