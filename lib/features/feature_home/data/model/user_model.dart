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

double? _toDouble(dynamic json) {
  if (json == null) return null;
  if (json is num) return json.toDouble();
  return double.tryParse(json.toString());
}

int? _toInt(dynamic json) {
  if (json == null) return null;
  if (json is num) return json.toInt();
  return int.tryParse(json.toString());
}

@freezed
sealed class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(fromJson: _anyToString) String? id,
    @JsonKey(name: 'first_name', fromJson: _anyToString) String? firstName,
    @JsonKey(name: 'last_name', fromJson: _anyToString) String? lastName,
    @JsonKey(fromJson: _anyToString) String? mobile,
    @JsonKey(fromJson: _roleFromJson) String? role,
    @JsonKey(fromJson: _anyToString) String? status,
    @JsonKey(fromJson: _anyToString) String? brand,
    @JsonKey(fromJson: _anyToString) String? ostan,
    @JsonKey(fromJson: _anyToString) String? shahrestan,
    @JsonKey(fromJson: _anyToString) String? address,
    @JsonKey(name: 'profile_image_id', fromJson: _anyToString) String? profileImageId,
    @JsonKey(name: 'rating_average', fromJson: _toDouble) double? ratingAverage,
    @JsonKey(name: 'ratings_count', fromJson: _toInt) int? ratingsCount,
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
        ostan: ostan,
        shahrestan: shahrestan,
        address: address,
        profileImageId: profileImageId,
        ratingAverage: ratingAverage,
        ratingsCount: ratingsCount,
      );
}
