// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entity/manage_reminder_types_entity.dart';

part 'manage_reminder_types_model.freezed.dart';
part 'manage_reminder_types_model.g.dart';

String _anyToString(dynamic value) => value?.toString() ?? '';
bool _anyToBool(dynamic value) {
  if (value is bool) return value;
  if (value == null) return false;
  final str = value.toString().toLowerCase();
  return str == 'true' || str == 'active' || value == 1;
}
int? _anyToInt(dynamic value) => int.tryParse(value?.toString() ?? '');

@freezed
sealed class ManageReminderTypeModel with _$ManageReminderTypeModel {
  const factory ManageReminderTypeModel({
    @JsonKey(fromJson: _anyToString) String? id,
    @JsonKey(name: 'reminder_type_id', fromJson: _anyToString) String? reminderTypeId,
    @JsonKey(fromJson: _anyToString) String? title,
    @JsonKey(fromJson: _anyToString) String? status,
    @JsonKey(name: 'sort_order', fromJson: _anyToInt) int? sortOrder,
    @JsonKey(name: 'created_at', fromJson: _anyToString) String? createdAt,
    @JsonKey(name: 'updated_at', fromJson: _anyToString) String? updatedAt,
    @JsonKey(name: 'active_sub_items') List<ManageReminderTypeModel>? subCategories,
  }) = _ManageReminderTypeModel;

  const ManageReminderTypeModel._();

  factory ManageReminderTypeModel.fromJson(Map<String, dynamic> json) =>
      _$ManageReminderTypeModelFromJson(json);

  ManageReminderTypeEntity toEntity() => ManageReminderTypeEntity(
    id: id ?? '',
    reminderTypeId: reminderTypeId,
    title: title ?? '',
    status: status ?? 'Deactive',
    sortOrder: sortOrder,
    createdAt: DateTime.tryParse(createdAt ?? ''),
    updatedAt: DateTime.tryParse(updatedAt ?? ''),
    subCategories: subCategories?.map((e) => e.toEntity()).toList(),
  );

  factory ManageReminderTypeModel.fromEntity(ManageReminderTypeEntity entity) => ManageReminderTypeModel(
    id: entity.id,
    reminderTypeId: entity.reminderTypeId,
    title: entity.title,
    status: entity.status,
    sortOrder: entity.sortOrder,
    createdAt: entity.createdAt?.toIso8601String(),
    updatedAt: entity.updatedAt?.toIso8601String(),
    subCategories: entity.subCategories?.map((e) => ManageReminderTypeModel.fromEntity(e)).toList(),
  );
}
