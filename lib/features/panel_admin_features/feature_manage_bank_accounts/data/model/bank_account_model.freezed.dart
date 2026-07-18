// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_account_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BankAccountModel _$BankAccountModelFromJson(Map<String, dynamic> json) {
  return _BankAccountModel.fromJson(json);
}

/// @nodoc
mixin _$BankAccountModel {
  @JsonKey(fromJson: _anyToString)
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'bank_id', fromJson: _anyToInt)
  int? get bankId => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name', fromJson: _anyToString)
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'card_number', fromJson: _anyToString)
  String? get cardNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_number', fromJson: _anyToString)
  String? get accountNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'sheba_number', fromJson: _anyToString)
  String? get shebaNumber => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _anyToString)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: _anyToString)
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: _anyToString)
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this BankAccountModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BankAccountModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BankAccountModelCopyWith<BankAccountModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankAccountModelCopyWith<$Res> {
  factory $BankAccountModelCopyWith(
    BankAccountModel value,
    $Res Function(BankAccountModel) then,
  ) = _$BankAccountModelCopyWithImpl<$Res, BankAccountModel>;
  @useResult
  $Res call({
    @JsonKey(fromJson: _anyToString) String id,
    @JsonKey(name: 'bank_id', fromJson: _anyToInt) int? bankId,
    @JsonKey(name: 'full_name', fromJson: _anyToString) String? fullName,
    @JsonKey(name: 'card_number', fromJson: _anyToString) String? cardNumber,
    @JsonKey(name: 'account_number', fromJson: _anyToString)
    String? accountNumber,
    @JsonKey(name: 'sheba_number', fromJson: _anyToString) String? shebaNumber,
    @JsonKey(fromJson: _anyToString) String? status,
    @JsonKey(name: 'created_at', fromJson: _anyToString) String? createdAt,
    @JsonKey(name: 'updated_at', fromJson: _anyToString) String? updatedAt,
  });
}

/// @nodoc
class _$BankAccountModelCopyWithImpl<$Res, $Val extends BankAccountModel>
    implements $BankAccountModelCopyWith<$Res> {
  _$BankAccountModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BankAccountModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bankId = freezed,
    Object? fullName = freezed,
    Object? cardNumber = freezed,
    Object? accountNumber = freezed,
    Object? shebaNumber = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            bankId: freezed == bankId
                ? _value.bankId
                : bankId // ignore: cast_nullable_to_non_nullable
                      as int?,
            fullName: freezed == fullName
                ? _value.fullName
                : fullName // ignore: cast_nullable_to_non_nullable
                      as String?,
            cardNumber: freezed == cardNumber
                ? _value.cardNumber
                : cardNumber // ignore: cast_nullable_to_non_nullable
                      as String?,
            accountNumber: freezed == accountNumber
                ? _value.accountNumber
                : accountNumber // ignore: cast_nullable_to_non_nullable
                      as String?,
            shebaNumber: freezed == shebaNumber
                ? _value.shebaNumber
                : shebaNumber // ignore: cast_nullable_to_non_nullable
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
abstract class _$$BankAccountModelImplCopyWith<$Res>
    implements $BankAccountModelCopyWith<$Res> {
  factory _$$BankAccountModelImplCopyWith(
    _$BankAccountModelImpl value,
    $Res Function(_$BankAccountModelImpl) then,
  ) = __$$BankAccountModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: _anyToString) String id,
    @JsonKey(name: 'bank_id', fromJson: _anyToInt) int? bankId,
    @JsonKey(name: 'full_name', fromJson: _anyToString) String? fullName,
    @JsonKey(name: 'card_number', fromJson: _anyToString) String? cardNumber,
    @JsonKey(name: 'account_number', fromJson: _anyToString)
    String? accountNumber,
    @JsonKey(name: 'sheba_number', fromJson: _anyToString) String? shebaNumber,
    @JsonKey(fromJson: _anyToString) String? status,
    @JsonKey(name: 'created_at', fromJson: _anyToString) String? createdAt,
    @JsonKey(name: 'updated_at', fromJson: _anyToString) String? updatedAt,
  });
}

/// @nodoc
class __$$BankAccountModelImplCopyWithImpl<$Res>
    extends _$BankAccountModelCopyWithImpl<$Res, _$BankAccountModelImpl>
    implements _$$BankAccountModelImplCopyWith<$Res> {
  __$$BankAccountModelImplCopyWithImpl(
    _$BankAccountModelImpl _value,
    $Res Function(_$BankAccountModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BankAccountModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bankId = freezed,
    Object? fullName = freezed,
    Object? cardNumber = freezed,
    Object? accountNumber = freezed,
    Object? shebaNumber = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$BankAccountModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        bankId: freezed == bankId
            ? _value.bankId
            : bankId // ignore: cast_nullable_to_non_nullable
                  as int?,
        fullName: freezed == fullName
            ? _value.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
                  as String?,
        cardNumber: freezed == cardNumber
            ? _value.cardNumber
            : cardNumber // ignore: cast_nullable_to_non_nullable
                  as String?,
        accountNumber: freezed == accountNumber
            ? _value.accountNumber
            : accountNumber // ignore: cast_nullable_to_non_nullable
                  as String?,
        shebaNumber: freezed == shebaNumber
            ? _value.shebaNumber
            : shebaNumber // ignore: cast_nullable_to_non_nullable
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
class _$BankAccountModelImpl extends _BankAccountModel {
  const _$BankAccountModelImpl({
    @JsonKey(fromJson: _anyToString) this.id = '',
    @JsonKey(name: 'bank_id', fromJson: _anyToInt) this.bankId,
    @JsonKey(name: 'full_name', fromJson: _anyToString) this.fullName,
    @JsonKey(name: 'card_number', fromJson: _anyToString) this.cardNumber,
    @JsonKey(name: 'account_number', fromJson: _anyToString) this.accountNumber,
    @JsonKey(name: 'sheba_number', fromJson: _anyToString) this.shebaNumber,
    @JsonKey(fromJson: _anyToString) this.status,
    @JsonKey(name: 'created_at', fromJson: _anyToString) this.createdAt,
    @JsonKey(name: 'updated_at', fromJson: _anyToString) this.updatedAt,
  }) : super._();

  factory _$BankAccountModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BankAccountModelImplFromJson(json);

  @override
  @JsonKey(fromJson: _anyToString)
  final String id;
  @override
  @JsonKey(name: 'bank_id', fromJson: _anyToInt)
  final int? bankId;
  @override
  @JsonKey(name: 'full_name', fromJson: _anyToString)
  final String? fullName;
  @override
  @JsonKey(name: 'card_number', fromJson: _anyToString)
  final String? cardNumber;
  @override
  @JsonKey(name: 'account_number', fromJson: _anyToString)
  final String? accountNumber;
  @override
  @JsonKey(name: 'sheba_number', fromJson: _anyToString)
  final String? shebaNumber;
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
    return 'BankAccountModel(id: $id, bankId: $bankId, fullName: $fullName, cardNumber: $cardNumber, accountNumber: $accountNumber, shebaNumber: $shebaNumber, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BankAccountModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bankId, bankId) || other.bankId == bankId) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.cardNumber, cardNumber) ||
                other.cardNumber == cardNumber) &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber) &&
            (identical(other.shebaNumber, shebaNumber) ||
                other.shebaNumber == shebaNumber) &&
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
    bankId,
    fullName,
    cardNumber,
    accountNumber,
    shebaNumber,
    status,
    createdAt,
    updatedAt,
  );

  /// Create a copy of BankAccountModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BankAccountModelImplCopyWith<_$BankAccountModelImpl> get copyWith =>
      __$$BankAccountModelImplCopyWithImpl<_$BankAccountModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BankAccountModelImplToJson(this);
  }
}

abstract class _BankAccountModel extends BankAccountModel {
  const factory _BankAccountModel({
    @JsonKey(fromJson: _anyToString) final String id,
    @JsonKey(name: 'bank_id', fromJson: _anyToInt) final int? bankId,
    @JsonKey(name: 'full_name', fromJson: _anyToString) final String? fullName,
    @JsonKey(name: 'card_number', fromJson: _anyToString)
    final String? cardNumber,
    @JsonKey(name: 'account_number', fromJson: _anyToString)
    final String? accountNumber,
    @JsonKey(name: 'sheba_number', fromJson: _anyToString)
    final String? shebaNumber,
    @JsonKey(fromJson: _anyToString) final String? status,
    @JsonKey(name: 'created_at', fromJson: _anyToString)
    final String? createdAt,
    @JsonKey(name: 'updated_at', fromJson: _anyToString)
    final String? updatedAt,
  }) = _$BankAccountModelImpl;
  const _BankAccountModel._() : super._();

  factory _BankAccountModel.fromJson(Map<String, dynamic> json) =
      _$BankAccountModelImpl.fromJson;

  @override
  @JsonKey(fromJson: _anyToString)
  String get id;
  @override
  @JsonKey(name: 'bank_id', fromJson: _anyToInt)
  int? get bankId;
  @override
  @JsonKey(name: 'full_name', fromJson: _anyToString)
  String? get fullName;
  @override
  @JsonKey(name: 'card_number', fromJson: _anyToString)
  String? get cardNumber;
  @override
  @JsonKey(name: 'account_number', fromJson: _anyToString)
  String? get accountNumber;
  @override
  @JsonKey(name: 'sheba_number', fromJson: _anyToString)
  String? get shebaNumber;
  @override
  @JsonKey(fromJson: _anyToString)
  String? get status;
  @override
  @JsonKey(name: 'created_at', fromJson: _anyToString)
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: _anyToString)
  String? get updatedAt;

  /// Create a copy of BankAccountModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BankAccountModelImplCopyWith<_$BankAccountModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
