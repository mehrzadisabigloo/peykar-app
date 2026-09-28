// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_account_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BankAccountModel {

@JsonKey(fromJson: _anyToString) String get id;@JsonKey(name: 'bank_id', fromJson: _anyToInt) int? get bankId;@JsonKey(name: 'full_name', fromJson: _anyToString) String? get fullName;@JsonKey(name: 'card_number', fromJson: _anyToString) String? get cardNumber;@JsonKey(name: 'account_number', fromJson: _anyToString) String? get accountNumber;@JsonKey(name: 'sheba_number', fromJson: _anyToString) String? get shebaNumber;@JsonKey(fromJson: _anyToString) String? get status;@JsonKey(name: 'created_at', fromJson: _anyToString) String? get createdAt;@JsonKey(name: 'updated_at', fromJson: _anyToString) String? get updatedAt; BankModel? get bank;
/// Create a copy of BankAccountModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BankAccountModelCopyWith<BankAccountModel> get copyWith => _$BankAccountModelCopyWithImpl<BankAccountModel>(this as BankAccountModel, _$identity);

  /// Serializes this BankAccountModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BankAccountModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BankAccountModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.bankId, _this.bankId) || other.bankId == _this.bankId)&&(identical(other.fullName, _this.fullName) || other.fullName == _this.fullName)&&(identical(other.cardNumber, _this.cardNumber) || other.cardNumber == _this.cardNumber)&&(identical(other.accountNumber, _this.accountNumber) || other.accountNumber == _this.accountNumber)&&(identical(other.shebaNumber, _this.shebaNumber) || other.shebaNumber == _this.shebaNumber)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.bank, _this.bank) || other.bank == _this.bank));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BankAccountModel;
  return Object.hash(runtimeType,_this.id,_this.bankId,_this.fullName,_this.cardNumber,_this.accountNumber,_this.shebaNumber,_this.status,_this.createdAt,_this.updatedAt,_this.bank);
}

@override
String toString() {
  final _this = this as BankAccountModel;
  return 'BankAccountModel(id: ${_this.id}, bankId: ${_this.bankId}, fullName: ${_this.fullName}, cardNumber: ${_this.cardNumber}, accountNumber: ${_this.accountNumber}, shebaNumber: ${_this.shebaNumber}, status: ${_this.status}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt}, bank: ${_this.bank})';
}


}

/// @nodoc
abstract mixin class $BankAccountModelCopyWith<$Res>  {
  factory $BankAccountModelCopyWith(BankAccountModel value, $Res Function(BankAccountModel) _then) = _$BankAccountModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _anyToString) String id,@JsonKey(name: 'bank_id', fromJson: _anyToInt) int? bankId,@JsonKey(name: 'full_name', fromJson: _anyToString) String? fullName,@JsonKey(name: 'card_number', fromJson: _anyToString) String? cardNumber,@JsonKey(name: 'account_number', fromJson: _anyToString) String? accountNumber,@JsonKey(name: 'sheba_number', fromJson: _anyToString) String? shebaNumber,@JsonKey(fromJson: _anyToString) String? status,@JsonKey(name: 'created_at', fromJson: _anyToString) String? createdAt,@JsonKey(name: 'updated_at', fromJson: _anyToString) String? updatedAt, BankModel? bank
});


$BankModelCopyWith<$Res>? get bank;

}
/// @nodoc
class _$BankAccountModelCopyWithImpl<$Res>
    implements $BankAccountModelCopyWith<$Res> {
  _$BankAccountModelCopyWithImpl(this._self, this._then);

  final BankAccountModel _self;
  final $Res Function(BankAccountModel) _then;

/// Create a copy of BankAccountModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? bankId = freezed,Object? fullName = freezed,Object? cardNumber = freezed,Object? accountNumber = freezed,Object? shebaNumber = freezed,Object? status = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? bank = freezed,}) {
  return _then(BankAccountModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,bankId: freezed == bankId ? _self.bankId : bankId // ignore: cast_nullable_to_non_nullable
as int?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,cardNumber: freezed == cardNumber ? _self.cardNumber : cardNumber // ignore: cast_nullable_to_non_nullable
as String?,accountNumber: freezed == accountNumber ? _self.accountNumber : accountNumber // ignore: cast_nullable_to_non_nullable
as String?,shebaNumber: freezed == shebaNumber ? _self.shebaNumber : shebaNumber // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,bank: freezed == bank ? _self.bank : bank // ignore: cast_nullable_to_non_nullable
as BankModel?,
  ));
}
/// Create a copy of BankAccountModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BankModelCopyWith<$Res>? get bank {
    if (_self.bank == null) {
    return null;
  }

  return $BankModelCopyWith<$Res>(_self.bank!, (value) {
    return _then(_self.copyWith(bank: value));
  });
}
}


/// Adds pattern-matching-related methods to [BankAccountModel].
extension BankAccountModelPatterns on BankAccountModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BankAccountModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BankAccountModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BankAccountModel value)  $default,){
final _that = this;
switch (_that) {
case _BankAccountModel():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BankAccountModel value)?  $default,){
final _that = this;
switch (_that) {
case _BankAccountModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _anyToString)  String id, @JsonKey(name: 'bank_id', fromJson: _anyToInt)  int? bankId, @JsonKey(name: 'full_name', fromJson: _anyToString)  String? fullName, @JsonKey(name: 'card_number', fromJson: _anyToString)  String? cardNumber, @JsonKey(name: 'account_number', fromJson: _anyToString)  String? accountNumber, @JsonKey(name: 'sheba_number', fromJson: _anyToString)  String? shebaNumber, @JsonKey(fromJson: _anyToString)  String? status, @JsonKey(name: 'created_at', fromJson: _anyToString)  String? createdAt, @JsonKey(name: 'updated_at', fromJson: _anyToString)  String? updatedAt,  BankModel? bank)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BankAccountModel() when $default != null:
return $default(_that.id,_that.bankId,_that.fullName,_that.cardNumber,_that.accountNumber,_that.shebaNumber,_that.status,_that.createdAt,_that.updatedAt,_that.bank);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _anyToString)  String id, @JsonKey(name: 'bank_id', fromJson: _anyToInt)  int? bankId, @JsonKey(name: 'full_name', fromJson: _anyToString)  String? fullName, @JsonKey(name: 'card_number', fromJson: _anyToString)  String? cardNumber, @JsonKey(name: 'account_number', fromJson: _anyToString)  String? accountNumber, @JsonKey(name: 'sheba_number', fromJson: _anyToString)  String? shebaNumber, @JsonKey(fromJson: _anyToString)  String? status, @JsonKey(name: 'created_at', fromJson: _anyToString)  String? createdAt, @JsonKey(name: 'updated_at', fromJson: _anyToString)  String? updatedAt,  BankModel? bank)  $default,) {final _that = this;
switch (_that) {
case _BankAccountModel():
return $default(_that.id,_that.bankId,_that.fullName,_that.cardNumber,_that.accountNumber,_that.shebaNumber,_that.status,_that.createdAt,_that.updatedAt,_that.bank);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _anyToString)  String id, @JsonKey(name: 'bank_id', fromJson: _anyToInt)  int? bankId, @JsonKey(name: 'full_name', fromJson: _anyToString)  String? fullName, @JsonKey(name: 'card_number', fromJson: _anyToString)  String? cardNumber, @JsonKey(name: 'account_number', fromJson: _anyToString)  String? accountNumber, @JsonKey(name: 'sheba_number', fromJson: _anyToString)  String? shebaNumber, @JsonKey(fromJson: _anyToString)  String? status, @JsonKey(name: 'created_at', fromJson: _anyToString)  String? createdAt, @JsonKey(name: 'updated_at', fromJson: _anyToString)  String? updatedAt,  BankModel? bank)?  $default,) {final _that = this;
switch (_that) {
case _BankAccountModel() when $default != null:
return $default(_that.id,_that.bankId,_that.fullName,_that.cardNumber,_that.accountNumber,_that.shebaNumber,_that.status,_that.createdAt,_that.updatedAt,_that.bank);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BankAccountModel extends BankAccountModel {
  const _BankAccountModel({@JsonKey(fromJson: _anyToString) this.id = '', @JsonKey(name: 'bank_id', fromJson: _anyToInt) this.bankId, @JsonKey(name: 'full_name', fromJson: _anyToString) this.fullName, @JsonKey(name: 'card_number', fromJson: _anyToString) this.cardNumber, @JsonKey(name: 'account_number', fromJson: _anyToString) this.accountNumber, @JsonKey(name: 'sheba_number', fromJson: _anyToString) this.shebaNumber, @JsonKey(fromJson: _anyToString) this.status, @JsonKey(name: 'created_at', fromJson: _anyToString) this.createdAt, @JsonKey(name: 'updated_at', fromJson: _anyToString) this.updatedAt, this.bank}): super._();
  factory _BankAccountModel.fromJson(Map<String, dynamic> json) => _$BankAccountModelFromJson(json);

@override@JsonKey(fromJson: _anyToString) final  String id;
@override@JsonKey(name: 'bank_id', fromJson: _anyToInt) final  int? bankId;
@override@JsonKey(name: 'full_name', fromJson: _anyToString) final  String? fullName;
@override@JsonKey(name: 'card_number', fromJson: _anyToString) final  String? cardNumber;
@override@JsonKey(name: 'account_number', fromJson: _anyToString) final  String? accountNumber;
@override@JsonKey(name: 'sheba_number', fromJson: _anyToString) final  String? shebaNumber;
@override@JsonKey(fromJson: _anyToString) final  String? status;
@override@JsonKey(name: 'created_at', fromJson: _anyToString) final  String? createdAt;
@override@JsonKey(name: 'updated_at', fromJson: _anyToString) final  String? updatedAt;
@override final  BankModel? bank;

/// Create a copy of BankAccountModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BankAccountModelCopyWith<_BankAccountModel> get copyWith => __$BankAccountModelCopyWithImpl<_BankAccountModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BankAccountModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BankAccountModel&&(identical(other.id, id) || other.id == id)&&(identical(other.bankId, bankId) || other.bankId == bankId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.cardNumber, cardNumber) || other.cardNumber == cardNumber)&&(identical(other.accountNumber, accountNumber) || other.accountNumber == accountNumber)&&(identical(other.shebaNumber, shebaNumber) || other.shebaNumber == shebaNumber)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.bank, bank) || other.bank == bank));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,bankId,fullName,cardNumber,accountNumber,shebaNumber,status,createdAt,updatedAt,bank);
}

@override
String toString() {
    return 'BankAccountModel(id: $id, bankId: $bankId, fullName: $fullName, cardNumber: $cardNumber, accountNumber: $accountNumber, shebaNumber: $shebaNumber, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, bank: $bank)';
}


}

/// @nodoc
abstract mixin class _$BankAccountModelCopyWith<$Res> implements $BankAccountModelCopyWith<$Res> {
  factory _$BankAccountModelCopyWith(_BankAccountModel value, $Res Function(_BankAccountModel) _then) = __$BankAccountModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _anyToString) String id,@JsonKey(name: 'bank_id', fromJson: _anyToInt) int? bankId,@JsonKey(name: 'full_name', fromJson: _anyToString) String? fullName,@JsonKey(name: 'card_number', fromJson: _anyToString) String? cardNumber,@JsonKey(name: 'account_number', fromJson: _anyToString) String? accountNumber,@JsonKey(name: 'sheba_number', fromJson: _anyToString) String? shebaNumber,@JsonKey(fromJson: _anyToString) String? status,@JsonKey(name: 'created_at', fromJson: _anyToString) String? createdAt,@JsonKey(name: 'updated_at', fromJson: _anyToString) String? updatedAt, BankModel? bank
});


@override $BankModelCopyWith<$Res>? get bank;

}
/// @nodoc
class __$BankAccountModelCopyWithImpl<$Res>
    implements _$BankAccountModelCopyWith<$Res> {
  __$BankAccountModelCopyWithImpl(this._self, this._then);

  final _BankAccountModel _self;
  final $Res Function(_BankAccountModel) _then;

/// Create a copy of BankAccountModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? bankId = freezed,Object? fullName = freezed,Object? cardNumber = freezed,Object? accountNumber = freezed,Object? shebaNumber = freezed,Object? status = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? bank = freezed,}) {
  return _then(_BankAccountModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,bankId: freezed == bankId ? _self.bankId : bankId // ignore: cast_nullable_to_non_nullable
as int?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,cardNumber: freezed == cardNumber ? _self.cardNumber : cardNumber // ignore: cast_nullable_to_non_nullable
as String?,accountNumber: freezed == accountNumber ? _self.accountNumber : accountNumber // ignore: cast_nullable_to_non_nullable
as String?,shebaNumber: freezed == shebaNumber ? _self.shebaNumber : shebaNumber // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,bank: freezed == bank ? _self.bank : bank // ignore: cast_nullable_to_non_nullable
as BankModel?,
  ));
}

/// Create a copy of BankAccountModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BankModelCopyWith<$Res>? get bank {
    if (_self.bank == null) {
    return null;
  }

  return $BankModelCopyWith<$Res>(_self.bank!, (value) {
    return _then(_self.copyWith(bank: value));
  });
}
}


/// @nodoc
mixin _$BankModel {

@JsonKey(fromJson: _anyToInt) int? get id;@JsonKey(fromJson: _anyToString) String? get name;@JsonKey(fromJson: _anyToString) String? get logo;
/// Create a copy of BankModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BankModelCopyWith<BankModel> get copyWith => _$BankModelCopyWithImpl<BankModel>(this as BankModel, _$identity);

  /// Serializes this BankModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BankModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BankModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.logo, _this.logo) || other.logo == _this.logo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BankModel;
  return Object.hash(runtimeType,_this.id,_this.name,_this.logo);
}

@override
String toString() {
  final _this = this as BankModel;
  return 'BankModel(id: ${_this.id}, name: ${_this.name}, logo: ${_this.logo})';
}


}

/// @nodoc
abstract mixin class $BankModelCopyWith<$Res>  {
  factory $BankModelCopyWith(BankModel value, $Res Function(BankModel) _then) = _$BankModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _anyToInt) int? id,@JsonKey(fromJson: _anyToString) String? name,@JsonKey(fromJson: _anyToString) String? logo
});




}
/// @nodoc
class _$BankModelCopyWithImpl<$Res>
    implements $BankModelCopyWith<$Res> {
  _$BankModelCopyWithImpl(this._self, this._then);

  final BankModel _self;
  final $Res Function(BankModel) _then;

/// Create a copy of BankModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? logo = freezed,}) {
  return _then(BankModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,logo: freezed == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BankModel].
extension BankModelPatterns on BankModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BankModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BankModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BankModel value)  $default,){
final _that = this;
switch (_that) {
case _BankModel():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BankModel value)?  $default,){
final _that = this;
switch (_that) {
case _BankModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _anyToInt)  int? id, @JsonKey(fromJson: _anyToString)  String? name, @JsonKey(fromJson: _anyToString)  String? logo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BankModel() when $default != null:
return $default(_that.id,_that.name,_that.logo);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _anyToInt)  int? id, @JsonKey(fromJson: _anyToString)  String? name, @JsonKey(fromJson: _anyToString)  String? logo)  $default,) {final _that = this;
switch (_that) {
case _BankModel():
return $default(_that.id,_that.name,_that.logo);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _anyToInt)  int? id, @JsonKey(fromJson: _anyToString)  String? name, @JsonKey(fromJson: _anyToString)  String? logo)?  $default,) {final _that = this;
switch (_that) {
case _BankModel() when $default != null:
return $default(_that.id,_that.name,_that.logo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BankModel extends BankModel {
  const _BankModel({@JsonKey(fromJson: _anyToInt) this.id, @JsonKey(fromJson: _anyToString) this.name, @JsonKey(fromJson: _anyToString) this.logo}): super._();
  factory _BankModel.fromJson(Map<String, dynamic> json) => _$BankModelFromJson(json);

@override@JsonKey(fromJson: _anyToInt) final  int? id;
@override@JsonKey(fromJson: _anyToString) final  String? name;
@override@JsonKey(fromJson: _anyToString) final  String? logo;

/// Create a copy of BankModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BankModelCopyWith<_BankModel> get copyWith => __$BankModelCopyWithImpl<_BankModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BankModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BankModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.logo, logo) || other.logo == logo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,logo);
}

@override
String toString() {
    return 'BankModel(id: $id, name: $name, logo: $logo)';
}


}

/// @nodoc
abstract mixin class _$BankModelCopyWith<$Res> implements $BankModelCopyWith<$Res> {
  factory _$BankModelCopyWith(_BankModel value, $Res Function(_BankModel) _then) = __$BankModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _anyToInt) int? id,@JsonKey(fromJson: _anyToString) String? name,@JsonKey(fromJson: _anyToString) String? logo
});




}
/// @nodoc
class __$BankModelCopyWithImpl<$Res>
    implements _$BankModelCopyWith<$Res> {
  __$BankModelCopyWithImpl(this._self, this._then);

  final _BankModel _self;
  final $Res Function(_BankModel) _then;

/// Create a copy of BankModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? logo = freezed,}) {
  return _then(_BankModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,logo: freezed == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
