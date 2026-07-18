import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/profile_entity.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

String _roleFromJson(dynamic json) {
  if (json is List) {
    return json.isNotEmpty ? json.first.toString() : '';
  }
  return json?.toString() ?? '';
}

String? _anyToString(dynamic json) => json?.toString();

@freezed
class ProfileModel with _$ProfileModel {
  const factory ProfileModel({
    @Default('') String id,
    @JsonKey(name: 'first_name') @Default('') String firstName,
    @JsonKey(name: 'last_name') @Default('') String lastName,
    @Default('') String mobile,
    String? email,
    @JsonKey(fromJson: _roleFromJson) @Default('') String role,
    String? birthday,
    @JsonKey(name: 'profile_image_id') String? profileImageId,
    @JsonKey(name: 'subscription_code', fromJson: _anyToString)
    String? subscriptionCode,
    String? status,
  }) = _ProfileModel;

  const ProfileModel._();

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  ProfileEntity toEntity() => ProfileEntity(
        id: id,
        firstName: firstName,
        lastName: lastName,
        mobile: mobile,
        email: email,
        role: role,
        birthday: birthday,
        profileImageId: profileImageId,
        subscriptionCode: subscriptionCode,
        status: status,
      );

  factory ProfileModel.fromEntity(ProfileEntity entity) => ProfileModel(
        id: entity.id,
        firstName: entity.firstName,
        lastName: entity.lastName,
        mobile: entity.mobile,
        email: entity.email,
        role: entity.role,
        birthday: entity.birthday,
        profileImageId: entity.profileImageId,
        subscriptionCode: entity.subscriptionCode,
        status: entity.status,
      );
}
