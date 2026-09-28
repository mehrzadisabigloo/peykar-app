class ReminderTypeEntity {
  final String id;
  final String title;
  final List<ReminderSubItemEntity> subItems;

  ReminderTypeEntity({
    required this.id,
    required this.title,
    required this.subItems,
  });
}

class ReminderSubItemEntity {
  final String id;
  final String title;

  ReminderSubItemEntity({
    required this.id,
    required this.title,
  });
}
