class ManageReminderSubItemEntity {
  final String id;
  final String title;
  final String status;
  final String? reminderTypeId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ManageReminderSubItemEntity({
    required this.id,
    required this.title,
    required this.status,
    this.reminderTypeId,
    this.createdAt,
    this.updatedAt,
  });

  bool get isActive => status.toLowerCase() == 'active';

  ManageReminderSubItemEntity copyWith({
    String? id,
    String? title,
    String? status,
    String? reminderTypeId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ManageReminderSubItemEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      status: status ?? this.status,
      reminderTypeId: reminderTypeId ?? this.reminderTypeId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
