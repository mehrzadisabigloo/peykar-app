class ManageReminderTypeEntity {
  final String id;
  final String title;
  final String status;
  final int? sortOrder;
  final String? reminderTypeId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<ManageReminderTypeEntity>? subCategories;

  ManageReminderTypeEntity({
    required this.id,
    required this.title,
    required this.status,
    this.sortOrder,
    this.reminderTypeId,
    this.createdAt,
    this.updatedAt,
    this.subCategories,
  });

  bool get isActive => status.toLowerCase() == 'active';

  ManageReminderTypeEntity copyWith({
    String? id,
    String? title,
    String? status,
    int? sortOrder,
    String? reminderTypeId,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<ManageReminderTypeEntity>? subCategories,
  }) {
    return ManageReminderTypeEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      status: status ?? this.status,
      sortOrder: sortOrder ?? this.sortOrder,
      reminderTypeId: reminderTypeId ?? this.reminderTypeId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      subCategories: subCategories ?? this.subCategories,
    );
  }
}
