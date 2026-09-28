// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repairman_payment_type_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RepairmanPaymentTypeModel {

@JsonKey(fromJson: _anyToInt) int? get id;@JsonKey(name: 'repairman_id', fromJson: _anyToString) String? get repairmanId;@JsonKey(name: 'admin_id', fromJson: _anyToString) String? get adminId;@JsonKey(name: 'payment_type_id', fromJson: _anyToInt) int? get paymentTypeId;@JsonKey(name: 'payment_type') PaymentTypeModel? get paymentType;
/// Create a copy of RepairmanPaymentTypeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RepairmanPaymentTypeModelCopyWith<RepairmanPaymentTypeModel> get copyWith => _$RepairmanPaymentTypeModelCopyWithImpl<RepairmanPaymentTypeModel>(this as RepairmanPaymentTypeModel, _$identity);

  /// Serializes this RepairmanPaymentTypeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RepairmanPaymentTypeModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RepairmanPaymentTypeModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.repairmanId, _this.repairmanId) || other.repairmanId == _this.repairmanId)&&(identical(other.adminId, _this.adminId) || other.adminId == _this.adminId)&&(identical(other.paymentTypeId, _this.paymentTypeId) || other.paymentTypeId == _this.paymentTypeId)&&(identical(other.paymentType, _this.paymentType) || other.paymentType == _this.paymentType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RepairmanPaymentTypeModel;
  return Object.hash(runtimeType,_this.id,_this.repairmanId,_this.adminId,_this.paymentTypeId,_this.paymentType);
}

@override
String toString() {
  final _this = this as RepairmanPaymentTypeModel;
  return 'RepairmanPaymentTypeModel(id: ${_this.id}, repairmanId: ${_this.repairmanId}, adminId: ${_this.adminId}, paymentTypeId: ${_this.paymentTypeId}, paymentType: ${_this.paymentType})';
}


}

/// @nodoc
abstract mixin class $RepairmanPaymentTypeModelCopyWith<$Res>  {
  factory $RepairmanPaymentTypeModelCopyWith(RepairmanPaymentTypeModel value, $Res Function(RepairmanPaymentTypeModel) _then) = _$RepairmanPaymentTypeModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _anyToInt) int? id,@JsonKey(name: 'repairman_id', fromJson: _anyToString) String? repairmanId,@JsonKey(name: 'admin_id', fromJson: _anyToString) String? adminId,@JsonKey(name: 'payment_type_id', fromJson: _anyToInt) int? paymentTypeId,@JsonKey(name: 'payment_type') PaymentTypeModel? paymentType
});


$PaymentTypeModelCopyWith<$Res>? get paymentType;

}
/// @nodoc
class _$RepairmanPaymentTypeModelCopyWithImpl<$Res>
    implements $RepairmanPaymentTypeModelCopyWith<$Res> {
  _$RepairmanPaymentTypeModelCopyWithImpl(this._self, this._then);

  final RepairmanPaymentTypeModel _self;
  final $Res Function(RepairmanPaymentTypeModel) _then;

/// Create a copy of RepairmanPaymentTypeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? repairmanId = freezed,Object? adminId = freezed,Object? paymentTypeId = freezed,Object? paymentType = freezed,}) {
  return _then(RepairmanPaymentTypeModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,repairmanId: freezed == repairmanId ? _self.repairmanId : repairmanId // ignore: cast_nullable_to_non_nullable
as String?,adminId: freezed == adminId ? _self.adminId : adminId // ignore: cast_nullable_to_non_nullable
as String?,paymentTypeId: freezed == paymentTypeId ? _self.paymentTypeId : paymentTypeId // ignore: cast_nullable_to_non_nullable
as int?,paymentType: freezed == paymentType ? _self.paymentType : paymentType // ignore: cast_nullable_to_non_nullable
as PaymentTypeModel?,
  ));
}
/// Create a copy of RepairmanPaymentTypeModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentTypeModelCopyWith<$Res>? get paymentType {
    if (_self.paymentType == null) {
    return null;
  }

  return $PaymentTypeModelCopyWith<$Res>(_self.paymentType!, (value) {
    return _then(_self.copyWith(paymentType: value));
  });
}
}


/// Adds pattern-matching-related methods to [RepairmanPaymentTypeModel].
extension RepairmanPaymentTypeModelPatterns on RepairmanPaymentTypeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RepairmanPaymentTypeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RepairmanPaymentTypeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RepairmanPaymentTypeModel value)  $default,){
final _that = this;
switch (_that) {
case _RepairmanPaymentTypeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RepairmanPaymentTypeModel value)?  $default,){
final _that = this;
switch (_that) {
case _RepairmanPaymentTypeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _anyToInt)  int? id, @JsonKey(name: 'repairman_id', fromJson: _anyToString)  String? repairmanId, @JsonKey(name: 'admin_id', fromJson: _anyToString)  String? adminId, @JsonKey(name: 'payment_type_id', fromJson: _anyToInt)  int? paymentTypeId, @JsonKey(name: 'payment_type')  PaymentTypeModel? paymentType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RepairmanPaymentTypeModel() when $default != null:
return $default(_that.id,_that.repairmanId,_that.adminId,_that.paymentTypeId,_that.paymentType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _anyToInt)  int? id, @JsonKey(name: 'repairman_id', fromJson: _anyToString)  String? repairmanId, @JsonKey(name: 'admin_id', fromJson: _anyToString)  String? adminId, @JsonKey(name: 'payment_type_id', fromJson: _anyToInt)  int? paymentTypeId, @JsonKey(name: 'payment_type')  PaymentTypeModel? paymentType)  $default,) {final _that = this;
switch (_that) {
case _RepairmanPaymentTypeModel():
return $default(_that.id,_that.repairmanId,_that.adminId,_that.paymentTypeId,_that.paymentType);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _anyToInt)  int? id, @JsonKey(name: 'repairman_id', fromJson: _anyToString)  String? repairmanId, @JsonKey(name: 'admin_id', fromJson: _anyToString)  String? adminId, @JsonKey(name: 'payment_type_id', fromJson: _anyToInt)  int? paymentTypeId, @JsonKey(name: 'payment_type')  PaymentTypeModel? paymentType)?  $default,) {final _that = this;
switch (_that) {
case _RepairmanPaymentTypeModel() when $default != null:
return $default(_that.id,_that.repairmanId,_that.adminId,_that.paymentTypeId,_that.paymentType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RepairmanPaymentTypeModel implements RepairmanPaymentTypeModel {
  const _RepairmanPaymentTypeModel({@JsonKey(fromJson: _anyToInt) this.id, @JsonKey(name: 'repairman_id', fromJson: _anyToString) this.repairmanId, @JsonKey(name: 'admin_id', fromJson: _anyToString) this.adminId, @JsonKey(name: 'payment_type_id', fromJson: _anyToInt) this.paymentTypeId, @JsonKey(name: 'payment_type') this.paymentType});
  factory _RepairmanPaymentTypeModel.fromJson(Map<String, dynamic> json) => _$RepairmanPaymentTypeModelFromJson(json);

@override@JsonKey(fromJson: _anyToInt) final  int? id;
@override@JsonKey(name: 'repairman_id', fromJson: _anyToString) final  String? repairmanId;
@override@JsonKey(name: 'admin_id', fromJson: _anyToString) final  String? adminId;
@override@JsonKey(name: 'payment_type_id', fromJson: _anyToInt) final  int? paymentTypeId;
@override@JsonKey(name: 'payment_type') final  PaymentTypeModel? paymentType;

/// Create a copy of RepairmanPaymentTypeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RepairmanPaymentTypeModelCopyWith<_RepairmanPaymentTypeModel> get copyWith => __$RepairmanPaymentTypeModelCopyWithImpl<_RepairmanPaymentTypeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RepairmanPaymentTypeModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RepairmanPaymentTypeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.repairmanId, repairmanId) || other.repairmanId == repairmanId)&&(identical(other.adminId, adminId) || other.adminId == adminId)&&(identical(other.paymentTypeId, paymentTypeId) || other.paymentTypeId == paymentTypeId)&&(identical(other.paymentType, paymentType) || other.paymentType == paymentType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,repairmanId,adminId,paymentTypeId,paymentType);
}

@override
String toString() {
    return 'RepairmanPaymentTypeModel(id: $id, repairmanId: $repairmanId, adminId: $adminId, paymentTypeId: $paymentTypeId, paymentType: $paymentType)';
}


}

/// @nodoc
abstract mixin class _$RepairmanPaymentTypeModelCopyWith<$Res> implements $RepairmanPaymentTypeModelCopyWith<$Res> {
  factory _$RepairmanPaymentTypeModelCopyWith(_RepairmanPaymentTypeModel value, $Res Function(_RepairmanPaymentTypeModel) _then) = __$RepairmanPaymentTypeModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _anyToInt) int? id,@JsonKey(name: 'repairman_id', fromJson: _anyToString) String? repairmanId,@JsonKey(name: 'admin_id', fromJson: _anyToString) String? adminId,@JsonKey(name: 'payment_type_id', fromJson: _anyToInt) int? paymentTypeId,@JsonKey(name: 'payment_type') PaymentTypeModel? paymentType
});


@override $PaymentTypeModelCopyWith<$Res>? get paymentType;

}
/// @nodoc
class __$RepairmanPaymentTypeModelCopyWithImpl<$Res>
    implements _$RepairmanPaymentTypeModelCopyWith<$Res> {
  __$RepairmanPaymentTypeModelCopyWithImpl(this._self, this._then);

  final _RepairmanPaymentTypeModel _self;
  final $Res Function(_RepairmanPaymentTypeModel) _then;

/// Create a copy of RepairmanPaymentTypeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? repairmanId = freezed,Object? adminId = freezed,Object? paymentTypeId = freezed,Object? paymentType = freezed,}) {
  return _then(_RepairmanPaymentTypeModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,repairmanId: freezed == repairmanId ? _self.repairmanId : repairmanId // ignore: cast_nullable_to_non_nullable
as String?,adminId: freezed == adminId ? _self.adminId : adminId // ignore: cast_nullable_to_non_nullable
as String?,paymentTypeId: freezed == paymentTypeId ? _self.paymentTypeId : paymentTypeId // ignore: cast_nullable_to_non_nullable
as int?,paymentType: freezed == paymentType ? _self.paymentType : paymentType // ignore: cast_nullable_to_non_nullable
as PaymentTypeModel?,
  ));
}

/// Create a copy of RepairmanPaymentTypeModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentTypeModelCopyWith<$Res>? get paymentType {
    if (_self.paymentType == null) {
    return null;
  }

  return $PaymentTypeModelCopyWith<$Res>(_self.paymentType!, (value) {
    return _then(_self.copyWith(paymentType: value));
  });
}
}

// dart format on
