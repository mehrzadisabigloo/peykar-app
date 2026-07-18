import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entity/users_list_entity.dart';
import 'user_model.dart';

part 'users_list_model.freezed.dart';
part 'users_list_model.g.dart';

int _anyToInt(dynamic value) {
  if (value is int) return value;
  return int.tryParse(value?.toString() ?? '0') ?? 0;
}

@freezed
class UsersListModel with _$UsersListModel {
  const factory UsersListModel({
    @Default([]) List<UserModel> users,
    @JsonKey(name: 'current_page', fromJson: _anyToInt) @Default(1) int currentPage,
    @JsonKey(name: 'last_page', fromJson: _anyToInt) @Default(1) int lastPage,
    @JsonKey(fromJson: _anyToInt) @Default(0) int total,
  }) = _UsersListModel;

  const UsersListModel._();

  factory UsersListModel.fromJson(Map<String, dynamic> json) =>
      _$UsersListModelFromJson(json);

  /// Custom factory to handle the nested API structure
  factory UsersListModel.fromApiResponse(dynamic json) {
    final root = json is Map<String, dynamic> ? json : <String, dynamic>{};
    final data = root['data'];

    if (data is List) {
      return UsersListModel(
        users: data
            .whereType<Map<String, dynamic>>()
            .map((item) => UserModel.fromJson(item))
            .toList(),
        total: data.length,
      );
    }

    if (data is Map<String, dynamic>) {
      final rawList = data['data'] ?? data['items'] ?? data['users'];
      final List<UserModel> items = (rawList is List)
          ? rawList
              .whereType<Map<String, dynamic>>()
              .map((item) => UserModel.fromJson(item))
              .toList()
          : [];

      return UsersListModel.fromJson(data).copyWith(users: items);
    }

    return const UsersListModel();
  }

  UsersListEntity toEntity() => UsersListEntity(
        users: users.map((e) => e.toEntity()).toList(),
        currentPage: currentPage,
        lastPage: lastPage,
        total: total,
      );
}
