// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) {
  return _AddressModel.fromJson(json);
}

/// @nodoc
mixin _$AddressModel {
  @JsonKey(fromJson: _anyToString)
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id', fromJson: _anyToString)
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ostan_id', fromJson: _anyToInt)
  int? get ostanId => throw _privateConstructorUsedError;
  @JsonKey(name: 'shahrestan_id', fromJson: _anyToInt)
  int? get shahrestanId => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_address', fromJson: _anyToString)
  String? get fullAddress => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _anyToString)
  String? get pelak => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _anyToString)
  String? get vahed => throw _privateConstructorUsedError;
  @JsonKey(name: 'postal_code', fromJson: _anyToString)
  String? get postalCode => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _anyToDouble)
  double? get latitude => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _anyToDouble)
  double? get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: _anyToString)
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: _anyToString)
  String? get updatedAt => throw _privateConstructorUsedError;
  OstanModel? get ostan => throw _privateConstructorUsedError;
  ShahrestanModel? get shahrestan => throw _privateConstructorUsedError;

  /// Serializes this AddressModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddressModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddressModelCopyWith<AddressModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressModelCopyWith<$Res> {
  factory $AddressModelCopyWith(
    AddressModel value,
    $Res Function(AddressModel) then,
  ) = _$AddressModelCopyWithImpl<$Res, AddressModel>;
  @useResult
  $Res call({
    @JsonKey(fromJson: _anyToString) String? id,
    @JsonKey(name: 'user_id', fromJson: _anyToString) String? userId,
    @JsonKey(name: 'ostan_id', fromJson: _anyToInt) int? ostanId,
    @JsonKey(name: 'shahrestan_id', fromJson: _anyToInt) int? shahrestanId,
    @JsonKey(name: 'full_address', fromJson: _anyToString) String? fullAddress,
    @JsonKey(fromJson: _anyToString) String? pelak,
    @JsonKey(fromJson: _anyToString) String? vahed,
    @JsonKey(name: 'postal_code', fromJson: _anyToString) String? postalCode,
    @JsonKey(fromJson: _anyToDouble) double? latitude,
    @JsonKey(fromJson: _anyToDouble) double? longitude,
    @JsonKey(name: 'created_at', fromJson: _anyToString) String? createdAt,
    @JsonKey(name: 'updated_at', fromJson: _anyToString) String? updatedAt,
    OstanModel? ostan,
    ShahrestanModel? shahrestan,
  });

  $OstanModelCopyWith<$Res>? get ostan;
  $ShahrestanModelCopyWith<$Res>? get shahrestan;
}

/// @nodoc
class _$AddressModelCopyWithImpl<$Res, $Val extends AddressModel>
    implements $AddressModelCopyWith<$Res> {
  _$AddressModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddressModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? ostanId = freezed,
    Object? shahrestanId = freezed,
    Object? fullAddress = freezed,
    Object? pelak = freezed,
    Object? vahed = freezed,
    Object? postalCode = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? ostan = freezed,
    Object? shahrestan = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            userId: freezed == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String?,
            ostanId: freezed == ostanId
                ? _value.ostanId
                : ostanId // ignore: cast_nullable_to_non_nullable
                      as int?,
            shahrestanId: freezed == shahrestanId
                ? _value.shahrestanId
                : shahrestanId // ignore: cast_nullable_to_non_nullable
                      as int?,
            fullAddress: freezed == fullAddress
                ? _value.fullAddress
                : fullAddress // ignore: cast_nullable_to_non_nullable
                      as String?,
            pelak: freezed == pelak
                ? _value.pelak
                : pelak // ignore: cast_nullable_to_non_nullable
                      as String?,
            vahed: freezed == vahed
                ? _value.vahed
                : vahed // ignore: cast_nullable_to_non_nullable
                      as String?,
            postalCode: freezed == postalCode
                ? _value.postalCode
                : postalCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            latitude: freezed == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as double?,
            longitude: freezed == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as double?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            ostan: freezed == ostan
                ? _value.ostan
                : ostan // ignore: cast_nullable_to_non_nullable
                      as OstanModel?,
            shahrestan: freezed == shahrestan
                ? _value.shahrestan
                : shahrestan // ignore: cast_nullable_to_non_nullable
                      as ShahrestanModel?,
          )
          as $Val,
    );
  }

  /// Create a copy of AddressModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OstanModelCopyWith<$Res>? get ostan {
    if (_value.ostan == null) {
      return null;
    }

    return $OstanModelCopyWith<$Res>(_value.ostan!, (value) {
      return _then(_value.copyWith(ostan: value) as $Val);
    });
  }

  /// Create a copy of AddressModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ShahrestanModelCopyWith<$Res>? get shahrestan {
    if (_value.shahrestan == null) {
      return null;
    }

    return $ShahrestanModelCopyWith<$Res>(_value.shahrestan!, (value) {
      return _then(_value.copyWith(shahrestan: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AddressModelImplCopyWith<$Res>
    implements $AddressModelCopyWith<$Res> {
  factory _$$AddressModelImplCopyWith(
    _$AddressModelImpl value,
    $Res Function(_$AddressModelImpl) then,
  ) = __$$AddressModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: _anyToString) String? id,
    @JsonKey(name: 'user_id', fromJson: _anyToString) String? userId,
    @JsonKey(name: 'ostan_id', fromJson: _anyToInt) int? ostanId,
    @JsonKey(name: 'shahrestan_id', fromJson: _anyToInt) int? shahrestanId,
    @JsonKey(name: 'full_address', fromJson: _anyToString) String? fullAddress,
    @JsonKey(fromJson: _anyToString) String? pelak,
    @JsonKey(fromJson: _anyToString) String? vahed,
    @JsonKey(name: 'postal_code', fromJson: _anyToString) String? postalCode,
    @JsonKey(fromJson: _anyToDouble) double? latitude,
    @JsonKey(fromJson: _anyToDouble) double? longitude,
    @JsonKey(name: 'created_at', fromJson: _anyToString) String? createdAt,
    @JsonKey(name: 'updated_at', fromJson: _anyToString) String? updatedAt,
    OstanModel? ostan,
    ShahrestanModel? shahrestan,
  });

  @override
  $OstanModelCopyWith<$Res>? get ostan;
  @override
  $ShahrestanModelCopyWith<$Res>? get shahrestan;
}

/// @nodoc
class __$$AddressModelImplCopyWithImpl<$Res>
    extends _$AddressModelCopyWithImpl<$Res, _$AddressModelImpl>
    implements _$$AddressModelImplCopyWith<$Res> {
  __$$AddressModelImplCopyWithImpl(
    _$AddressModelImpl _value,
    $Res Function(_$AddressModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AddressModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? ostanId = freezed,
    Object? shahrestanId = freezed,
    Object? fullAddress = freezed,
    Object? pelak = freezed,
    Object? vahed = freezed,
    Object? postalCode = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? ostan = freezed,
    Object? shahrestan = freezed,
  }) {
    return _then(
      _$AddressModelImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        userId: freezed == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String?,
        ostanId: freezed == ostanId
            ? _value.ostanId
            : ostanId // ignore: cast_nullable_to_non_nullable
                  as int?,
        shahrestanId: freezed == shahrestanId
            ? _value.shahrestanId
            : shahrestanId // ignore: cast_nullable_to_non_nullable
                  as int?,
        fullAddress: freezed == fullAddress
            ? _value.fullAddress
            : fullAddress // ignore: cast_nullable_to_non_nullable
                  as String?,
        pelak: freezed == pelak
            ? _value.pelak
            : pelak // ignore: cast_nullable_to_non_nullable
                  as String?,
        vahed: freezed == vahed
            ? _value.vahed
            : vahed // ignore: cast_nullable_to_non_nullable
                  as String?,
        postalCode: freezed == postalCode
            ? _value.postalCode
            : postalCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        latitude: freezed == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double?,
        longitude: freezed == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        ostan: freezed == ostan
            ? _value.ostan
            : ostan // ignore: cast_nullable_to_non_nullable
                  as OstanModel?,
        shahrestan: freezed == shahrestan
            ? _value.shahrestan
            : shahrestan // ignore: cast_nullable_to_non_nullable
                  as ShahrestanModel?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AddressModelImpl extends _AddressModel {
  const _$AddressModelImpl({
    @JsonKey(fromJson: _anyToString) this.id,
    @JsonKey(name: 'user_id', fromJson: _anyToString) this.userId,
    @JsonKey(name: 'ostan_id', fromJson: _anyToInt) this.ostanId,
    @JsonKey(name: 'shahrestan_id', fromJson: _anyToInt) this.shahrestanId,
    @JsonKey(name: 'full_address', fromJson: _anyToString) this.fullAddress,
    @JsonKey(fromJson: _anyToString) this.pelak,
    @JsonKey(fromJson: _anyToString) this.vahed,
    @JsonKey(name: 'postal_code', fromJson: _anyToString) this.postalCode,
    @JsonKey(fromJson: _anyToDouble) this.latitude,
    @JsonKey(fromJson: _anyToDouble) this.longitude,
    @JsonKey(name: 'created_at', fromJson: _anyToString) this.createdAt,
    @JsonKey(name: 'updated_at', fromJson: _anyToString) this.updatedAt,
    this.ostan,
    this.shahrestan,
  }) : super._();

  factory _$AddressModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddressModelImplFromJson(json);

  @override
  @JsonKey(fromJson: _anyToString)
  final String? id;
  @override
  @JsonKey(name: 'user_id', fromJson: _anyToString)
  final String? userId;
  @override
  @JsonKey(name: 'ostan_id', fromJson: _anyToInt)
  final int? ostanId;
  @override
  @JsonKey(name: 'shahrestan_id', fromJson: _anyToInt)
  final int? shahrestanId;
  @override
  @JsonKey(name: 'full_address', fromJson: _anyToString)
  final String? fullAddress;
  @override
  @JsonKey(fromJson: _anyToString)
  final String? pelak;
  @override
  @JsonKey(fromJson: _anyToString)
  final String? vahed;
  @override
  @JsonKey(name: 'postal_code', fromJson: _anyToString)
  final String? postalCode;
  @override
  @JsonKey(fromJson: _anyToDouble)
  final double? latitude;
  @override
  @JsonKey(fromJson: _anyToDouble)
  final double? longitude;
  @override
  @JsonKey(name: 'created_at', fromJson: _anyToString)
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: _anyToString)
  final String? updatedAt;
  @override
  final OstanModel? ostan;
  @override
  final ShahrestanModel? shahrestan;

  @override
  String toString() {
    return 'AddressModel(id: $id, userId: $userId, ostanId: $ostanId, shahrestanId: $shahrestanId, fullAddress: $fullAddress, pelak: $pelak, vahed: $vahed, postalCode: $postalCode, latitude: $latitude, longitude: $longitude, createdAt: $createdAt, updatedAt: $updatedAt, ostan: $ostan, shahrestan: $shahrestan)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.ostanId, ostanId) || other.ostanId == ostanId) &&
            (identical(other.shahrestanId, shahrestanId) ||
                other.shahrestanId == shahrestanId) &&
            (identical(other.fullAddress, fullAddress) ||
                other.fullAddress == fullAddress) &&
            (identical(other.pelak, pelak) || other.pelak == pelak) &&
            (identical(other.vahed, vahed) || other.vahed == vahed) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.ostan, ostan) || other.ostan == ostan) &&
            (identical(other.shahrestan, shahrestan) ||
                other.shahrestan == shahrestan));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    ostanId,
    shahrestanId,
    fullAddress,
    pelak,
    vahed,
    postalCode,
    latitude,
    longitude,
    createdAt,
    updatedAt,
    ostan,
    shahrestan,
  );

  /// Create a copy of AddressModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressModelImplCopyWith<_$AddressModelImpl> get copyWith =>
      __$$AddressModelImplCopyWithImpl<_$AddressModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddressModelImplToJson(this);
  }
}

abstract class _AddressModel extends AddressModel {
  const factory _AddressModel({
    @JsonKey(fromJson: _anyToString) final String? id,
    @JsonKey(name: 'user_id', fromJson: _anyToString) final String? userId,
    @JsonKey(name: 'ostan_id', fromJson: _anyToInt) final int? ostanId,
    @JsonKey(name: 'shahrestan_id', fromJson: _anyToInt)
    final int? shahrestanId,
    @JsonKey(name: 'full_address', fromJson: _anyToString)
    final String? fullAddress,
    @JsonKey(fromJson: _anyToString) final String? pelak,
    @JsonKey(fromJson: _anyToString) final String? vahed,
    @JsonKey(name: 'postal_code', fromJson: _anyToString)
    final String? postalCode,
    @JsonKey(fromJson: _anyToDouble) final double? latitude,
    @JsonKey(fromJson: _anyToDouble) final double? longitude,
    @JsonKey(name: 'created_at', fromJson: _anyToString)
    final String? createdAt,
    @JsonKey(name: 'updated_at', fromJson: _anyToString)
    final String? updatedAt,
    final OstanModel? ostan,
    final ShahrestanModel? shahrestan,
  }) = _$AddressModelImpl;
  const _AddressModel._() : super._();

  factory _AddressModel.fromJson(Map<String, dynamic> json) =
      _$AddressModelImpl.fromJson;

  @override
  @JsonKey(fromJson: _anyToString)
  String? get id;
  @override
  @JsonKey(name: 'user_id', fromJson: _anyToString)
  String? get userId;
  @override
  @JsonKey(name: 'ostan_id', fromJson: _anyToInt)
  int? get ostanId;
  @override
  @JsonKey(name: 'shahrestan_id', fromJson: _anyToInt)
  int? get shahrestanId;
  @override
  @JsonKey(name: 'full_address', fromJson: _anyToString)
  String? get fullAddress;
  @override
  @JsonKey(fromJson: _anyToString)
  String? get pelak;
  @override
  @JsonKey(fromJson: _anyToString)
  String? get vahed;
  @override
  @JsonKey(name: 'postal_code', fromJson: _anyToString)
  String? get postalCode;
  @override
  @JsonKey(fromJson: _anyToDouble)
  double? get latitude;
  @override
  @JsonKey(fromJson: _anyToDouble)
  double? get longitude;
  @override
  @JsonKey(name: 'created_at', fromJson: _anyToString)
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: _anyToString)
  String? get updatedAt;
  @override
  OstanModel? get ostan;
  @override
  ShahrestanModel? get shahrestan;

  /// Create a copy of AddressModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddressModelImplCopyWith<_$AddressModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OstanModel _$OstanModelFromJson(Map<String, dynamic> json) {
  return _OstanModel.fromJson(json);
}

/// @nodoc
mixin _$OstanModel {
  @JsonKey(fromJson: _anyToInt)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _anyToString)
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this OstanModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OstanModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OstanModelCopyWith<OstanModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OstanModelCopyWith<$Res> {
  factory $OstanModelCopyWith(
    OstanModel value,
    $Res Function(OstanModel) then,
  ) = _$OstanModelCopyWithImpl<$Res, OstanModel>;
  @useResult
  $Res call({
    @JsonKey(fromJson: _anyToInt) int? id,
    @JsonKey(fromJson: _anyToString) String? name,
  });
}

/// @nodoc
class _$OstanModelCopyWithImpl<$Res, $Val extends OstanModel>
    implements $OstanModelCopyWith<$Res> {
  _$OstanModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OstanModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = freezed, Object? name = freezed}) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OstanModelImplCopyWith<$Res>
    implements $OstanModelCopyWith<$Res> {
  factory _$$OstanModelImplCopyWith(
    _$OstanModelImpl value,
    $Res Function(_$OstanModelImpl) then,
  ) = __$$OstanModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: _anyToInt) int? id,
    @JsonKey(fromJson: _anyToString) String? name,
  });
}

/// @nodoc
class __$$OstanModelImplCopyWithImpl<$Res>
    extends _$OstanModelCopyWithImpl<$Res, _$OstanModelImpl>
    implements _$$OstanModelImplCopyWith<$Res> {
  __$$OstanModelImplCopyWithImpl(
    _$OstanModelImpl _value,
    $Res Function(_$OstanModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OstanModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = freezed, Object? name = freezed}) {
    return _then(
      _$OstanModelImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OstanModelImpl extends _OstanModel {
  const _$OstanModelImpl({
    @JsonKey(fromJson: _anyToInt) this.id,
    @JsonKey(fromJson: _anyToString) this.name,
  }) : super._();

  factory _$OstanModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OstanModelImplFromJson(json);

  @override
  @JsonKey(fromJson: _anyToInt)
  final int? id;
  @override
  @JsonKey(fromJson: _anyToString)
  final String? name;

  @override
  String toString() {
    return 'OstanModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OstanModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of OstanModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OstanModelImplCopyWith<_$OstanModelImpl> get copyWith =>
      __$$OstanModelImplCopyWithImpl<_$OstanModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OstanModelImplToJson(this);
  }
}

abstract class _OstanModel extends OstanModel {
  const factory _OstanModel({
    @JsonKey(fromJson: _anyToInt) final int? id,
    @JsonKey(fromJson: _anyToString) final String? name,
  }) = _$OstanModelImpl;
  const _OstanModel._() : super._();

  factory _OstanModel.fromJson(Map<String, dynamic> json) =
      _$OstanModelImpl.fromJson;

  @override
  @JsonKey(fromJson: _anyToInt)
  int? get id;
  @override
  @JsonKey(fromJson: _anyToString)
  String? get name;

  /// Create a copy of OstanModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OstanModelImplCopyWith<_$OstanModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ShahrestanModel _$ShahrestanModelFromJson(Map<String, dynamic> json) {
  return _ShahrestanModel.fromJson(json);
}

/// @nodoc
mixin _$ShahrestanModel {
  @JsonKey(fromJson: _anyToInt)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _anyToString)
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _anyToString)
  String? get ostan => throw _privateConstructorUsedError;

  /// Serializes this ShahrestanModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShahrestanModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShahrestanModelCopyWith<ShahrestanModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShahrestanModelCopyWith<$Res> {
  factory $ShahrestanModelCopyWith(
    ShahrestanModel value,
    $Res Function(ShahrestanModel) then,
  ) = _$ShahrestanModelCopyWithImpl<$Res, ShahrestanModel>;
  @useResult
  $Res call({
    @JsonKey(fromJson: _anyToInt) int? id,
    @JsonKey(fromJson: _anyToString) String? name,
    @JsonKey(fromJson: _anyToString) String? ostan,
  });
}

/// @nodoc
class _$ShahrestanModelCopyWithImpl<$Res, $Val extends ShahrestanModel>
    implements $ShahrestanModelCopyWith<$Res> {
  _$ShahrestanModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShahrestanModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? ostan = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            ostan: freezed == ostan
                ? _value.ostan
                : ostan // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ShahrestanModelImplCopyWith<$Res>
    implements $ShahrestanModelCopyWith<$Res> {
  factory _$$ShahrestanModelImplCopyWith(
    _$ShahrestanModelImpl value,
    $Res Function(_$ShahrestanModelImpl) then,
  ) = __$$ShahrestanModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: _anyToInt) int? id,
    @JsonKey(fromJson: _anyToString) String? name,
    @JsonKey(fromJson: _anyToString) String? ostan,
  });
}

/// @nodoc
class __$$ShahrestanModelImplCopyWithImpl<$Res>
    extends _$ShahrestanModelCopyWithImpl<$Res, _$ShahrestanModelImpl>
    implements _$$ShahrestanModelImplCopyWith<$Res> {
  __$$ShahrestanModelImplCopyWithImpl(
    _$ShahrestanModelImpl _value,
    $Res Function(_$ShahrestanModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShahrestanModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? ostan = freezed,
  }) {
    return _then(
      _$ShahrestanModelImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        ostan: freezed == ostan
            ? _value.ostan
            : ostan // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ShahrestanModelImpl extends _ShahrestanModel {
  const _$ShahrestanModelImpl({
    @JsonKey(fromJson: _anyToInt) this.id,
    @JsonKey(fromJson: _anyToString) this.name,
    @JsonKey(fromJson: _anyToString) this.ostan,
  }) : super._();

  factory _$ShahrestanModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShahrestanModelImplFromJson(json);

  @override
  @JsonKey(fromJson: _anyToInt)
  final int? id;
  @override
  @JsonKey(fromJson: _anyToString)
  final String? name;
  @override
  @JsonKey(fromJson: _anyToString)
  final String? ostan;

  @override
  String toString() {
    return 'ShahrestanModel(id: $id, name: $name, ostan: $ostan)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShahrestanModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.ostan, ostan) || other.ostan == ostan));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, ostan);

  /// Create a copy of ShahrestanModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShahrestanModelImplCopyWith<_$ShahrestanModelImpl> get copyWith =>
      __$$ShahrestanModelImplCopyWithImpl<_$ShahrestanModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ShahrestanModelImplToJson(this);
  }
}

abstract class _ShahrestanModel extends ShahrestanModel {
  const factory _ShahrestanModel({
    @JsonKey(fromJson: _anyToInt) final int? id,
    @JsonKey(fromJson: _anyToString) final String? name,
    @JsonKey(fromJson: _anyToString) final String? ostan,
  }) = _$ShahrestanModelImpl;
  const _ShahrestanModel._() : super._();

  factory _ShahrestanModel.fromJson(Map<String, dynamic> json) =
      _$ShahrestanModelImpl.fromJson;

  @override
  @JsonKey(fromJson: _anyToInt)
  int? get id;
  @override
  @JsonKey(fromJson: _anyToString)
  String? get name;
  @override
  @JsonKey(fromJson: _anyToString)
  String? get ostan;

  /// Create a copy of ShahrestanModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShahrestanModelImplCopyWith<_$ShahrestanModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
