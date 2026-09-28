// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entity/manage_reminder_sub_item_entity.dart';

part 'manage_reminder_sub_item_model.freezed.dart';
part 'manage_reminder_sub_item_model.g.dart';

String _anyToString(dynamic value) => value?.toString() ?? '';
bool _anyToBool(dynamic value) {
  if (value is bool) return value;
  if (value == null) return false;
  final str = value.toString().toLowerCase();
  return str == 'true' || str == 'active' || value == 1;
}

@freezed
sealed class ManageReminderSubItemModel with _$ManageReminderSubItemModel {
  const factory ManageReminderSubItemModel({
    @JsonKey(fromJson: _anyToString) String? id,
    @JsonKey(fromJson: _anyToString) String? title,
    @JsonKey(fromJson: _anyToString) String? status,
    @JsonKey(name: 'reminder_type_id', fromJson: _anyToString) String? reminderTypeId,
    @JsonKey(name: 'created_at', fromJson: _anyToString) String? createdAt,
    @JsonKey(name: 'updated_at', fromJson: _anyToString) String? updatedAt,
  }) = _ManageReminderSubItemModel;

  const ManageReminderSubItemModel._();

  factory ManageReminderSubItemModel.fromJson(Map<String, dynamic> json) =>
      _$ManageReminderSubItemModelFromJson(json);

  ManageReminderSubItemEntity toEntity() => ManageReminderSubItemEntity(
    id: id ?? '',
    title: title ?? '',
    status: status ?? 'Deactive',
    reminderTypeId: reminderTypeId,
    createdAt: DateTime.tryParse(createdAt ?? ''),
    updatedAt: DateTime.tryParse(updatedAt ?? ''),
  );

  factory ManageReminderSubItemModel.fromEntity(ManageReminderSubItemEntity entity) => ManageReminderSubItemModel(
    id: entity.id,
    title: entity.title,
    status: entity.status,
    reminderTypeId: entity.reminderTypeId,
    createdAt: entity.createdAt?.toIso8601String(),
    updatedAt: entity.updatedAt?.toIso8601String(),
  );
}
