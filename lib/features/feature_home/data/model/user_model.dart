import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entity/user_entity.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

String? _roleFromJson(dynamic json) {
  if (json is List && json.isNotEmpty) {
    return json.first.toString();
  }
  return json?.toString();
}

String? _anyToString(dynamic json) => json?.toString();

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(fromJson: _anyToString) String? id,
    @JsonKey(name: 'first_name', fromJson: _anyToString) String? firstName,
    @JsonKey(name: 'last_name', fromJson: _anyToString) String? lastName,
    @JsonKey(fromJson: _anyToString) String? mobile,
    @JsonKey(fromJson: _roleFromJson) String? role,
    @JsonKey(fromJson: _anyToString) String? status,
    @JsonKey(fromJson: _anyToString) String? brand,
  }) = _UserModel;

  const UserModel._();

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  UserEntity toEntity() => UserEntity(
        id: id,
        firstName: firstName,
        lastName: lastName,
        mobile: mobile,
        role: role,
        status: status?.toLowerCase(),
        brand: brand,
      );
}
