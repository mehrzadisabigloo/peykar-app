// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  @JsonKey(fromJson: _anyToString)
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name', fromJson: _anyToString)
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name', fromJson: _anyToString)
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _anyToString)
  String? get mobile => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _roleFromJson)
  String? get role => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _anyToString)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _anyToString)
  String? get brand => throw _privateConstructorUsedError;

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call({
    @JsonKey(fromJson: _anyToString) String? id,
    @JsonKey(name: 'first_name', fromJson: _anyToString) String? firstName,
    @JsonKey(name: 'last_name', fromJson: _anyToString) String? lastName,
    @JsonKey(fromJson: _anyToString) String? mobile,
    @JsonKey(fromJson: _roleFromJson) String? role,
    @JsonKey(fromJson: _anyToString) String? status,
    @JsonKey(fromJson: _anyToString) String? brand,
  });
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? mobile = freezed,
    Object? role = freezed,
    Object? status = freezed,
    Object? brand = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            firstName: freezed == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                      as String?,
            lastName: freezed == lastName
                ? _value.lastName
                : lastName // ignore: cast_nullable_to_non_nullable
                      as String?,
            mobile: freezed == mobile
                ? _value.mobile
                : mobile // ignore: cast_nullable_to_non_nullable
                      as String?,
            role: freezed == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            brand: freezed == brand
                ? _value.brand
                : brand // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
    _$UserModelImpl value,
    $Res Function(_$UserModelImpl) then,
  ) = __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: _anyToString) String? id,
    @JsonKey(name: 'first_name', fromJson: _anyToString) String? firstName,
    @JsonKey(name: 'last_name', fromJson: _anyToString) String? lastName,
    @JsonKey(fromJson: _anyToString) String? mobile,
    @JsonKey(fromJson: _roleFromJson) String? role,
    @JsonKey(fromJson: _anyToString) String? status,
    @JsonKey(fromJson: _anyToString) String? brand,
  });
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
    _$UserModelImpl _value,
    $Res Function(_$UserModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? mobile = freezed,
    Object? role = freezed,
    Object? status = freezed,
    Object? brand = freezed,
  }) {
    return _then(
      _$UserModelImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        firstName: freezed == firstName
            ? _value.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastName: freezed == lastName
            ? _value.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String?,
        mobile: freezed == mobile
            ? _value.mobile
            : mobile // ignore: cast_nullable_to_non_nullable
                  as String?,
        role: freezed == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        brand: freezed == brand
            ? _value.brand
            : brand // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl extends _UserModel {
  const _$UserModelImpl({
    @JsonKey(fromJson: _anyToString) this.id,
    @JsonKey(name: 'first_name', fromJson: _anyToString) this.firstName,
    @JsonKey(name: 'last_name', fromJson: _anyToString) this.lastName,
    @JsonKey(fromJson: _anyToString) this.mobile,
    @JsonKey(fromJson: _roleFromJson) this.role,
    @JsonKey(fromJson: _anyToString) this.status,
    @JsonKey(fromJson: _anyToString) this.brand,
  }) : super._();

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  @JsonKey(fromJson: _anyToString)
  final String? id;
  @override
  @JsonKey(name: 'first_name', fromJson: _anyToString)
  final String? firstName;
  @override
  @JsonKey(name: 'last_name', fromJson: _anyToString)
  final String? lastName;
  @override
  @JsonKey(fromJson: _anyToString)
  final String? mobile;
  @override
  @JsonKey(fromJson: _roleFromJson)
  final String? role;
  @override
  @JsonKey(fromJson: _anyToString)
  final String? status;
  @override
  @JsonKey(fromJson: _anyToString)
  final String? brand;

  @override
  String toString() {
    return 'UserModel(id: $id, firstName: $firstName, lastName: $lastName, mobile: $mobile, role: $role, status: $status, brand: $brand)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.brand, brand) || other.brand == brand));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    firstName,
    lastName,
    mobile,
    role,
    status,
    brand,
  );

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(this);
  }
}

abstract class _UserModel extends UserModel {
  const factory _UserModel({
    @JsonKey(fromJson: _anyToString) final String? id,
    @JsonKey(name: 'first_name', fromJson: _anyToString)
    final String? firstName,
    @JsonKey(name: 'last_name', fromJson: _anyToString) final String? lastName,
    @JsonKey(fromJson: _anyToString) final String? mobile,
    @JsonKey(fromJson: _roleFromJson) final String? role,
    @JsonKey(fromJson: _anyToString) final String? status,
    @JsonKey(fromJson: _anyToString) final String? brand,
  }) = _$UserModelImpl;
  const _UserModel._() : super._();

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  @JsonKey(fromJson: _anyToString)
  String? get id;
  @override
  @JsonKey(name: 'first_name', fromJson: _anyToString)
  String? get firstName;
  @override
  @JsonKey(name: 'last_name', fromJson: _anyToString)
  String? get lastName;
  @override
  @JsonKey(fromJson: _anyToString)
  String? get mobile;
  @override
  @JsonKey(fromJson: _roleFromJson)
  String? get role;
  @override
  @JsonKey(fromJson: _anyToString)
  String? get status;
  @override
  @JsonKey(fromJson: _anyToString)
  String? get brand;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
