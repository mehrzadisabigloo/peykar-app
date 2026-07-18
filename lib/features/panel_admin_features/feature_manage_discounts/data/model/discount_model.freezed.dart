// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discount_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DiscountModel _$DiscountModelFromJson(Map<String, dynamic> json) {
  return _DiscountModel.fromJson(json);
}

/// @nodoc
mixin _$DiscountModel {
  @JsonKey(fromJson: _anyToString)
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_code', fromJson: _anyToString)
  String? get discountCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_code_expires_at', fromJson: _anyToString)
  String? get discountCodeExpiresAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_code_use_number', fromJson: _anyToInt)
  int? get discountCodeUseNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_type', fromJson: _anyToString)
  String? get discountType => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_percentage', fromJson: _anyToInt)
  int? get discountPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_amount', fromJson: _anyToInt)
  int? get discountAmount => throw _privateConstructorUsedError;
  List<String>? get userId => throw _privateConstructorUsedError;
  List<String>? get role => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_id', fromJson: _anyToString)
  String? get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'repairman_id', fromJson: _anyToString)
  String? get repairmanId => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _anyToString)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: _anyToString)
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: _anyToString)
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this DiscountModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DiscountModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DiscountModelCopyWith<DiscountModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscountModelCopyWith<$Res> {
  factory $DiscountModelCopyWith(
    DiscountModel value,
    $Res Function(DiscountModel) then,
  ) = _$DiscountModelCopyWithImpl<$Res, DiscountModel>;
  @useResult
  $Res call({
    @JsonKey(fromJson: _anyToString) String? id,
    @JsonKey(name: 'discount_code', fromJson: _anyToString)
    String? discountCode,
    @JsonKey(name: 'discount_code_expires_at', fromJson: _anyToString)
    String? discountCodeExpiresAt,
    @JsonKey(name: 'discount_code_use_number', fromJson: _anyToInt)
    int? discountCodeUseNumber,
    @JsonKey(name: 'discount_type', fromJson: _anyToString)
    String? discountType,
    @JsonKey(name: 'discount_percentage', fromJson: _anyToInt)
    int? discountPercentage,
    @JsonKey(name: 'discount_amount', fromJson: _anyToInt) int? discountAmount,
    List<String>? userId,
    List<String>? role,
    @JsonKey(name: 'product_id', fromJson: _anyToString) String? productId,
    @JsonKey(name: 'repairman_id', fromJson: _anyToString) String? repairmanId,
    @JsonKey(fromJson: _anyToString) String? status,
    @JsonKey(name: 'created_at', fromJson: _anyToString) String? createdAt,
    @JsonKey(name: 'updated_at', fromJson: _anyToString) String? updatedAt,
  });
}

/// @nodoc
class _$DiscountModelCopyWithImpl<$Res, $Val extends DiscountModel>
    implements $DiscountModelCopyWith<$Res> {
  _$DiscountModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DiscountModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? discountCode = freezed,
    Object? discountCodeExpiresAt = freezed,
    Object? discountCodeUseNumber = freezed,
    Object? discountType = freezed,
    Object? discountPercentage = freezed,
    Object? discountAmount = freezed,
    Object? userId = freezed,
    Object? role = freezed,
    Object? productId = freezed,
    Object? repairmanId = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            discountCode: freezed == discountCode
                ? _value.discountCode
                : discountCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            discountCodeExpiresAt: freezed == discountCodeExpiresAt
                ? _value.discountCodeExpiresAt
                : discountCodeExpiresAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            discountCodeUseNumber: freezed == discountCodeUseNumber
                ? _value.discountCodeUseNumber
                : discountCodeUseNumber // ignore: cast_nullable_to_non_nullable
                      as int?,
            discountType: freezed == discountType
                ? _value.discountType
                : discountType // ignore: cast_nullable_to_non_nullable
                      as String?,
            discountPercentage: freezed == discountPercentage
                ? _value.discountPercentage
                : discountPercentage // ignore: cast_nullable_to_non_nullable
                      as int?,
            discountAmount: freezed == discountAmount
                ? _value.discountAmount
                : discountAmount // ignore: cast_nullable_to_non_nullable
                      as int?,
            userId: freezed == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            role: freezed == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            productId: freezed == productId
                ? _value.productId
                : productId // ignore: cast_nullable_to_non_nullable
                      as String?,
            repairmanId: freezed == repairmanId
                ? _value.repairmanId
                : repairmanId // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DiscountModelImplCopyWith<$Res>
    implements $DiscountModelCopyWith<$Res> {
  factory _$$DiscountModelImplCopyWith(
    _$DiscountModelImpl value,
    $Res Function(_$DiscountModelImpl) then,
  ) = __$$DiscountModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: _anyToString) String? id,
    @JsonKey(name: 'discount_code', fromJson: _anyToString)
    String? discountCode,
    @JsonKey(name: 'discount_code_expires_at', fromJson: _anyToString)
    String? discountCodeExpiresAt,
    @JsonKey(name: 'discount_code_use_number', fromJson: _anyToInt)
    int? discountCodeUseNumber,
    @JsonKey(name: 'discount_type', fromJson: _anyToString)
    String? discountType,
    @JsonKey(name: 'discount_percentage', fromJson: _anyToInt)
    int? discountPercentage,
    @JsonKey(name: 'discount_amount', fromJson: _anyToInt) int? discountAmount,
    List<String>? userId,
    List<String>? role,
    @JsonKey(name: 'product_id', fromJson: _anyToString) String? productId,
    @JsonKey(name: 'repairman_id', fromJson: _anyToString) String? repairmanId,
    @JsonKey(fromJson: _anyToString) String? status,
    @JsonKey(name: 'created_at', fromJson: _anyToString) String? createdAt,
    @JsonKey(name: 'updated_at', fromJson: _anyToString) String? updatedAt,
  });
}

/// @nodoc
class __$$DiscountModelImplCopyWithImpl<$Res>
    extends _$DiscountModelCopyWithImpl<$Res, _$DiscountModelImpl>
    implements _$$DiscountModelImplCopyWith<$Res> {
  __$$DiscountModelImplCopyWithImpl(
    _$DiscountModelImpl _value,
    $Res Function(_$DiscountModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DiscountModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? discountCode = freezed,
    Object? discountCodeExpiresAt = freezed,
    Object? discountCodeUseNumber = freezed,
    Object? discountType = freezed,
    Object? discountPercentage = freezed,
    Object? discountAmount = freezed,
    Object? userId = freezed,
    Object? role = freezed,
    Object? productId = freezed,
    Object? repairmanId = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$DiscountModelImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        discountCode: freezed == discountCode
            ? _value.discountCode
            : discountCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        discountCodeExpiresAt: freezed == discountCodeExpiresAt
            ? _value.discountCodeExpiresAt
            : discountCodeExpiresAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        discountCodeUseNumber: freezed == discountCodeUseNumber
            ? _value.discountCodeUseNumber
            : discountCodeUseNumber // ignore: cast_nullable_to_non_nullable
                  as int?,
        discountType: freezed == discountType
            ? _value.discountType
            : discountType // ignore: cast_nullable_to_non_nullable
                  as String?,
        discountPercentage: freezed == discountPercentage
            ? _value.discountPercentage
            : discountPercentage // ignore: cast_nullable_to_non_nullable
                  as int?,
        discountAmount: freezed == discountAmount
            ? _value.discountAmount
            : discountAmount // ignore: cast_nullable_to_non_nullable
                  as int?,
        userId: freezed == userId
            ? _value._userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        role: freezed == role
            ? _value._role
            : role // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        productId: freezed == productId
            ? _value.productId
            : productId // ignore: cast_nullable_to_non_nullable
                  as String?,
        repairmanId: freezed == repairmanId
            ? _value.repairmanId
            : repairmanId // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DiscountModelImpl extends _DiscountModel {
  const _$DiscountModelImpl({
    @JsonKey(fromJson: _anyToString) this.id,
    @JsonKey(name: 'discount_code', fromJson: _anyToString) this.discountCode,
    @JsonKey(name: 'discount_code_expires_at', fromJson: _anyToString)
    this.discountCodeExpiresAt,
    @JsonKey(name: 'discount_code_use_number', fromJson: _anyToInt)
    this.discountCodeUseNumber,
    @JsonKey(name: 'discount_type', fromJson: _anyToString) this.discountType,
    @JsonKey(name: 'discount_percentage', fromJson: _anyToInt)
    this.discountPercentage,
    @JsonKey(name: 'discount_amount', fromJson: _anyToInt) this.discountAmount,
    final List<String>? userId,
    final List<String>? role,
    @JsonKey(name: 'product_id', fromJson: _anyToString) this.productId,
    @JsonKey(name: 'repairman_id', fromJson: _anyToString) this.repairmanId,
    @JsonKey(fromJson: _anyToString) this.status,
    @JsonKey(name: 'created_at', fromJson: _anyToString) this.createdAt,
    @JsonKey(name: 'updated_at', fromJson: _anyToString) this.updatedAt,
  }) : _userId = userId,
       _role = role,
       super._();

  factory _$DiscountModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiscountModelImplFromJson(json);

  @override
  @JsonKey(fromJson: _anyToString)
  final String? id;
  @override
  @JsonKey(name: 'discount_code', fromJson: _anyToString)
  final String? discountCode;
  @override
  @JsonKey(name: 'discount_code_expires_at', fromJson: _anyToString)
  final String? discountCodeExpiresAt;
  @override
  @JsonKey(name: 'discount_code_use_number', fromJson: _anyToInt)
  final int? discountCodeUseNumber;
  @override
  @JsonKey(name: 'discount_type', fromJson: _anyToString)
  final String? discountType;
  @override
  @JsonKey(name: 'discount_percentage', fromJson: _anyToInt)
  final int? discountPercentage;
  @override
  @JsonKey(name: 'discount_amount', fromJson: _anyToInt)
  final int? discountAmount;
  final List<String>? _userId;
  @override
  List<String>? get userId {
    final value = _userId;
    if (value == null) return null;
    if (_userId is EqualUnmodifiableListView) return _userId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _role;
  @override
  List<String>? get role {
    final value = _role;
    if (value == null) return null;
    if (_role is EqualUnmodifiableListView) return _role;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'product_id', fromJson: _anyToString)
  final String? productId;
  @override
  @JsonKey(name: 'repairman_id', fromJson: _anyToString)
  final String? repairmanId;
  @override
  @JsonKey(fromJson: _anyToString)
  final String? status;
  @override
  @JsonKey(name: 'created_at', fromJson: _anyToString)
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: _anyToString)
  final String? updatedAt;

  @override
  String toString() {
    return 'DiscountModel(id: $id, discountCode: $discountCode, discountCodeExpiresAt: $discountCodeExpiresAt, discountCodeUseNumber: $discountCodeUseNumber, discountType: $discountType, discountPercentage: $discountPercentage, discountAmount: $discountAmount, userId: $userId, role: $role, productId: $productId, repairmanId: $repairmanId, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiscountModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.discountCode, discountCode) ||
                other.discountCode == discountCode) &&
            (identical(other.discountCodeExpiresAt, discountCodeExpiresAt) ||
                other.discountCodeExpiresAt == discountCodeExpiresAt) &&
            (identical(other.discountCodeUseNumber, discountCodeUseNumber) ||
                other.discountCodeUseNumber == discountCodeUseNumber) &&
            (identical(other.discountType, discountType) ||
                other.discountType == discountType) &&
            (identical(other.discountPercentage, discountPercentage) ||
                other.discountPercentage == discountPercentage) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount) &&
            const DeepCollectionEquality().equals(other._userId, _userId) &&
            const DeepCollectionEquality().equals(other._role, _role) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.repairmanId, repairmanId) ||
                other.repairmanId == repairmanId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    discountCode,
    discountCodeExpiresAt,
    discountCodeUseNumber,
    discountType,
    discountPercentage,
    discountAmount,
    const DeepCollectionEquality().hash(_userId),
    const DeepCollectionEquality().hash(_role),
    productId,
    repairmanId,
    status,
    createdAt,
    updatedAt,
  );

  /// Create a copy of DiscountModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DiscountModelImplCopyWith<_$DiscountModelImpl> get copyWith =>
      __$$DiscountModelImplCopyWithImpl<_$DiscountModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DiscountModelImplToJson(this);
  }
}

abstract class _DiscountModel extends DiscountModel {
  const factory _DiscountModel({
    @JsonKey(fromJson: _anyToString) final String? id,
    @JsonKey(name: 'discount_code', fromJson: _anyToString)
    final String? discountCode,
    @JsonKey(name: 'discount_code_expires_at', fromJson: _anyToString)
    final String? discountCodeExpiresAt,
    @JsonKey(name: 'discount_code_use_number', fromJson: _anyToInt)
    final int? discountCodeUseNumber,
    @JsonKey(name: 'discount_type', fromJson: _anyToString)
    final String? discountType,
    @JsonKey(name: 'discount_percentage', fromJson: _anyToInt)
    final int? discountPercentage,
    @JsonKey(name: 'discount_amount', fromJson: _anyToInt)
    final int? discountAmount,
    final List<String>? userId,
    final List<String>? role,
    @JsonKey(name: 'product_id', fromJson: _anyToString)
    final String? productId,
    @JsonKey(name: 'repairman_id', fromJson: _anyToString)
    final String? repairmanId,
    @JsonKey(fromJson: _anyToString) final String? status,
    @JsonKey(name: 'created_at', fromJson: _anyToString)
    final String? createdAt,
    @JsonKey(name: 'updated_at', fromJson: _anyToString)
    final String? updatedAt,
  }) = _$DiscountModelImpl;
  const _DiscountModel._() : super._();

  factory _DiscountModel.fromJson(Map<String, dynamic> json) =
      _$DiscountModelImpl.fromJson;

  @override
  @JsonKey(fromJson: _anyToString)
  String? get id;
  @override
  @JsonKey(name: 'discount_code', fromJson: _anyToString)
  String? get discountCode;
  @override
  @JsonKey(name: 'discount_code_expires_at', fromJson: _anyToString)
  String? get discountCodeExpiresAt;
  @override
  @JsonKey(name: 'discount_code_use_number', fromJson: _anyToInt)
  int? get discountCodeUseNumber;
  @override
  @JsonKey(name: 'discount_type', fromJson: _anyToString)
  String? get discountType;
  @override
  @JsonKey(name: 'discount_percentage', fromJson: _anyToInt)
  int? get discountPercentage;
  @override
  @JsonKey(name: 'discount_amount', fromJson: _anyToInt)
  int? get discountAmount;
  @override
  List<String>? get userId;
  @override
  List<String>? get role;
  @override
  @JsonKey(name: 'product_id', fromJson: _anyToString)
  String? get productId;
  @override
  @JsonKey(name: 'repairman_id', fromJson: _anyToString)
  String? get repairmanId;
  @override
  @JsonKey(fromJson: _anyToString)
  String? get status;
  @override
  @JsonKey(name: 'created_at', fromJson: _anyToString)
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: _anyToString)
  String? get updatedAt;

  /// Create a copy of DiscountModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DiscountModelImplCopyWith<_$DiscountModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
