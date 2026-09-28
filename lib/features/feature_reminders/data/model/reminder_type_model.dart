import 'package:freezed_annotation/freezed_annotation.dart';

part 'reminder_type_model.freezed.dart';
part 'reminder_type_model.g.dart';

String _anyToString(dynamic value) => value?.toString() ?? '';
int _anyToInt(dynamic value) => (value is num) ? value.toInt() : (int.tryParse(value?.toString() ?? '0') ?? 0);

@freezed
sealed class ReminderTypeModel with _$ReminderTypeModel {
  const factory ReminderTypeModel({
    @JsonKey(fromJson: _anyToString) @Default('') String id,
    @JsonKey(fromJson: _anyToString) @Default('') String title,
    @JsonKey(fromJson: _anyToString) @Default('') String status,
    @JsonKey(name: 'sort_order', fromJson: _anyToInt) @Default(0) int sortOrder,
    @JsonKey(name: 'active_sub_items') @Default([]) List<ReminderSubItemModel> activeSubItems,
  }) = _ReminderTypeModel;

  factory ReminderTypeModel.fromJson(Map<String, dynamic> json) =>
      _$ReminderTypeModelFromJson(json);
}

@freezed
sealed class ReminderSubItemModel with _$ReminderSubItemModel {
  const factory ReminderSubItemModel({
    @JsonKey(fromJson: _anyToString) @Default('') String id,
    @JsonKey(name: 'reminder_type_id', fromJson: _anyToString) @Default('') String reminderTypeId,
    @JsonKey(fromJson: _anyToString) @Default('') String title,
    @JsonKey(fromJson: _anyToString) @Default('') String status,
    @JsonKey(name: 'sort_order', fromJson: _anyToInt) @Default(0) int sortOrder,
  }) = _ReminderSubItemModel;

  factory ReminderSubItemModel.fromJson(Map<String, dynamic> json) =>
      _$ReminderSubItemModelFromJson(json);
}

@freezed
sealed class ReminderTypeListModel with _$ReminderTypeListModel {
  const factory ReminderTypeListModel({
    @Default([]) List<ReminderTypeModel> data,
    @JsonKey(name: 'current_page') @Default(1) int currentPage,
    @JsonKey(name: 'last_page') @Default(1) int lastPage,
    @JsonKey(fromJson: _anyToInt) @Default(0) int total,
  }) = _ReminderTypeListModel;

  factory ReminderTypeListModel.fromJson(Map<String, dynamic> json) =>
      _$ReminderTypeListModelFromJson(json);
}
