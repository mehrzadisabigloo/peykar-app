// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discount_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DiscountModel {

@JsonKey(fromJson: _anyToString) String? get id;@JsonKey(name: 'discount_code', fromJson: _anyToString) String? get discountCode;@JsonKey(name: 'discount_code_expires_at', fromJson: _anyToString) String? get discountCodeExpiresAt;@JsonKey(name: 'discount_code_use_number', fromJson: _anyToInt) int? get discountCodeUseNumber;@JsonKey(name: 'discount_type', fromJson: _anyToString) String? get discountType;@JsonKey(name: 'discount_percentage', fromJson: _anyToInt) int? get discountPercentage;@JsonKey(name: 'discount_amount', fromJson: _anyToInt) int? get discountAmount; List<String>? get userId; List<String>? get role;@JsonKey(name: 'product_id', fromJson: _anyToString) String? get productId;@JsonKey(name: 'repairman_id', fromJson: _anyToString) String? get repairmanId;@JsonKey(fromJson: _anyToString) String? get status;@JsonKey(name: 'created_at', fromJson: _anyToString) String? get createdAt;@JsonKey(name: 'updated_at', fromJson: _anyToString) String? get updatedAt;
/// Create a copy of DiscountModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiscountModelCopyWith<DiscountModel> get copyWith => _$DiscountModelCopyWithImpl<DiscountModel>(this as DiscountModel, _$identity);

  /// Serializes this DiscountModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DiscountModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiscountModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.discountCode, _this.discountCode) || other.discountCode == _this.discountCode)&&(identical(other.discountCodeExpiresAt, _this.discountCodeExpiresAt) || other.discountCodeExpiresAt == _this.discountCodeExpiresAt)&&(identical(other.discountCodeUseNumber, _this.discountCodeUseNumber) || other.discountCodeUseNumber == _this.discountCodeUseNumber)&&(identical(other.discountType, _this.discountType) || other.discountType == _this.discountType)&&(identical(other.discountPercentage, _this.discountPercentage) || other.discountPercentage == _this.discountPercentage)&&(identical(other.discountAmount, _this.discountAmount) || other.discountAmount == _this.discountAmount)&&const DeepCollectionEquality().equals(other.userId, _this.userId)&&const DeepCollectionEquality().equals(other.role, _this.role)&&(identical(other.productId, _this.productId) || other.productId == _this.productId)&&(identical(other.repairmanId, _this.repairmanId) || other.repairmanId == _this.repairmanId)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DiscountModel;
  return Object.hash(runtimeType,_this.id,_this.discountCode,_this.discountCodeExpiresAt,_this.discountCodeUseNumber,_this.discountType,_this.discountPercentage,_this.discountAmount,const DeepCollectionEquality().hash(_this.userId),const DeepCollectionEquality().hash(_this.role),_this.productId,_this.repairmanId,_this.status,_this.createdAt,_this.updatedAt);
}

@override
String toString() {
  final _this = this as DiscountModel;
  return 'DiscountModel(id: ${_this.id}, discountCode: ${_this.discountCode}, discountCodeExpiresAt: ${_this.discountCodeExpiresAt}, discountCodeUseNumber: ${_this.discountCodeUseNumber}, discountType: ${_this.discountType}, discountPercentage: ${_this.discountPercentage}, discountAmount: ${_this.discountAmount}, userId: ${_this.userId}, role: ${_this.role}, productId: ${_this.productId}, repairmanId: ${_this.repairmanId}, status: ${_this.status}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $DiscountModelCopyWith<$Res>  {
  factory $DiscountModelCopyWith(DiscountModel value, $Res Function(DiscountModel) _then) = _$DiscountModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _anyToString) String? id,@JsonKey(name: 'discount_code', fromJson: _anyToString) String? discountCode,@JsonKey(name: 'discount_code_expires_at', fromJson: _anyToString) String? discountCodeExpiresAt,@JsonKey(name: 'discount_code_use_number', fromJson: _anyToInt) int? discountCodeUseNumber,@JsonKey(name: 'discount_type', fromJson: _anyToString) String? discountType,@JsonKey(name: 'discount_percentage', fromJson: _anyToInt) int? discountPercentage,@JsonKey(name: 'discount_amount', fromJson: _anyToInt) int? discountAmount, List<String>? userId, List<String>? role,@JsonKey(name: 'product_id', fromJson: _anyToString) String? productId,@JsonKey(name: 'repairman_id', fromJson: _anyToString) String? repairmanId,@JsonKey(fromJson: _anyToString) String? status,@JsonKey(name: 'created_at', fromJson: _anyToString) String? createdAt,@JsonKey(name: 'updated_at', fromJson: _anyToString) String? updatedAt
});




}
/// @nodoc
class _$DiscountModelCopyWithImpl<$Res>
    implements $DiscountModelCopyWith<$Res> {
  _$DiscountModelCopyWithImpl(this._self, this._then);

  final DiscountModel _self;
  final $Res Function(DiscountModel) _then;

/// Create a copy of DiscountModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? discountCode = freezed,Object? discountCodeExpiresAt = freezed,Object? discountCodeUseNumber = freezed,Object? discountType = freezed,Object? discountPercentage = freezed,Object? discountAmount = freezed,Object? userId = freezed,Object? role = freezed,Object? productId = freezed,Object? repairmanId = freezed,Object? status = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(DiscountModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,discountCode: freezed == discountCode ? _self.discountCode : discountCode // ignore: cast_nullable_to_non_nullable
as String?,discountCodeExpiresAt: freezed == discountCodeExpiresAt ? _self.discountCodeExpiresAt : discountCodeExpiresAt // ignore: cast_nullable_to_non_nullable
as String?,discountCodeUseNumber: freezed == discountCodeUseNumber ? _self.discountCodeUseNumber : discountCodeUseNumber // ignore: cast_nullable_to_non_nullable
as int?,discountType: freezed == discountType ? _self.discountType : discountType // ignore: cast_nullable_to_non_nullable
as String?,discountPercentage: freezed == discountPercentage ? _self.discountPercentage : discountPercentage // ignore: cast_nullable_to_non_nullable
as int?,discountAmount: freezed == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as int?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as List<String>?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as List<String>?,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String?,repairmanId: freezed == repairmanId ? _self.repairmanId : repairmanId // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DiscountModel].
extension DiscountModelPatterns on DiscountModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DiscountModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DiscountModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DiscountModel value)  $default,){
final _that = this;
switch (_that) {
case _DiscountModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DiscountModel value)?  $default,){
final _that = this;
switch (_that) {
case _DiscountModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _anyToString)  String? id, @JsonKey(name: 'discount_code', fromJson: _anyToString)  String? discountCode, @JsonKey(name: 'discount_code_expires_at', fromJson: _anyToString)  String? discountCodeExpiresAt, @JsonKey(name: 'discount_code_use_number', fromJson: _anyToInt)  int? discountCodeUseNumber, @JsonKey(name: 'discount_type', fromJson: _anyToString)  String? discountType, @JsonKey(name: 'discount_percentage', fromJson: _anyToInt)  int? discountPercentage, @JsonKey(name: 'discount_amount', fromJson: _anyToInt)  int? discountAmount,  List<String>? userId,  List<String>? role, @JsonKey(name: 'product_id', fromJson: _anyToString)  String? productId, @JsonKey(name: 'repairman_id', fromJson: _anyToString)  String? repairmanId, @JsonKey(fromJson: _anyToString)  String? status, @JsonKey(name: 'created_at', fromJson: _anyToString)  String? createdAt, @JsonKey(name: 'updated_at', fromJson: _anyToString)  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DiscountModel() when $default != null:
return $default(_that.id,_that.discountCode,_that.discountCodeExpiresAt,_that.discountCodeUseNumber,_that.discountType,_that.discountPercentage,_that.discountAmount,_that.userId,_that.role,_that.productId,_that.repairmanId,_that.status,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _anyToString)  String? id, @JsonKey(name: 'discount_code', fromJson: _anyToString)  String? discountCode, @JsonKey(name: 'discount_code_expires_at', fromJson: _anyToString)  String? discountCodeExpiresAt, @JsonKey(name: 'discount_code_use_number', fromJson: _anyToInt)  int? discountCodeUseNumber, @JsonKey(name: 'discount_type', fromJson: _anyToString)  String? discountType, @JsonKey(name: 'discount_percentage', fromJson: _anyToInt)  int? discountPercentage, @JsonKey(name: 'discount_amount', fromJson: _anyToInt)  int? discountAmount,  List<String>? userId,  List<String>? role, @JsonKey(name: 'product_id', fromJson: _anyToString)  String? productId, @JsonKey(name: 'repairman_id', fromJson: _anyToString)  String? repairmanId, @JsonKey(fromJson: _anyToString)  String? status, @JsonKey(name: 'created_at', fromJson: _anyToString)  String? createdAt, @JsonKey(name: 'updated_at', fromJson: _anyToString)  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _DiscountModel():
return $default(_that.id,_that.discountCode,_that.discountCodeExpiresAt,_that.discountCodeUseNumber,_that.discountType,_that.discountPercentage,_that.discountAmount,_that.userId,_that.role,_that.productId,_that.repairmanId,_that.status,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _anyToString)  String? id, @JsonKey(name: 'discount_code', fromJson: _anyToString)  String? discountCode, @JsonKey(name: 'discount_code_expires_at', fromJson: _anyToString)  String? discountCodeExpiresAt, @JsonKey(name: 'discount_code_use_number', fromJson: _anyToInt)  int? discountCodeUseNumber, @JsonKey(name: 'discount_type', fromJson: _anyToString)  String? discountType, @JsonKey(name: 'discount_percentage', fromJson: _anyToInt)  int? discountPercentage, @JsonKey(name: 'discount_amount', fromJson: _anyToInt)  int? discountAmount,  List<String>? userId,  List<String>? role, @JsonKey(name: 'product_id', fromJson: _anyToString)  String? productId, @JsonKey(name: 'repairman_id', fromJson: _anyToString)  String? repairmanId, @JsonKey(fromJson: _anyToString)  String? status, @JsonKey(name: 'created_at', fromJson: _anyToString)  String? createdAt, @JsonKey(name: 'updated_at', fromJson: _anyToString)  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _DiscountModel() when $default != null:
return $default(_that.id,_that.discountCode,_that.discountCodeExpiresAt,_that.discountCodeUseNumber,_that.discountType,_that.discountPercentage,_that.discountAmount,_that.userId,_that.role,_that.productId,_that.repairmanId,_that.status,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DiscountModel extends DiscountModel {
  const _DiscountModel({@JsonKey(fromJson: _anyToString) this.id, @JsonKey(name: 'discount_code', fromJson: _anyToString) this.discountCode, @JsonKey(name: 'discount_code_expires_at', fromJson: _anyToString) this.discountCodeExpiresAt, @JsonKey(name: 'discount_code_use_number', fromJson: _anyToInt) this.discountCodeUseNumber, @JsonKey(name: 'discount_type', fromJson: _anyToString) this.discountType, @JsonKey(name: 'discount_percentage', fromJson: _anyToInt) this.discountPercentage, @JsonKey(name: 'discount_amount', fromJson: _anyToInt) this.discountAmount,  List<String>? userId,  List<String>? role, @JsonKey(name: 'product_id', fromJson: _anyToString) this.productId, @JsonKey(name: 'repairman_id', fromJson: _anyToString) this.repairmanId, @JsonKey(fromJson: _anyToString) this.status, @JsonKey(name: 'created_at', fromJson: _anyToString) this.createdAt, @JsonKey(name: 'updated_at', fromJson: _anyToString) this.updatedAt}): _userId = userId,_role = role,super._();
  factory _DiscountModel.fromJson(Map<String, dynamic> json) => _$DiscountModelFromJson(json);

@override@JsonKey(fromJson: _anyToString) final  String? id;
@override@JsonKey(name: 'discount_code', fromJson: _anyToString) final  String? discountCode;
@override@JsonKey(name: 'discount_code_expires_at', fromJson: _anyToString) final  String? discountCodeExpiresAt;
@override@JsonKey(name: 'discount_code_use_number', fromJson: _anyToInt) final  int? discountCodeUseNumber;
@override@JsonKey(name: 'discount_type', fromJson: _anyToString) final  String? discountType;
@override@JsonKey(name: 'discount_percentage', fromJson: _anyToInt) final  int? discountPercentage;
@override@JsonKey(name: 'discount_amount', fromJson: _anyToInt) final  int? discountAmount;
 final  List<String>? _userId;
@override List<String>? get userId {
  final value = _userId;
  if (value == null) return null;
  if (_userId is EqualUnmodifiableListView) return _userId;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _role;
@override List<String>? get role {
  final value = _role;
  if (value == null) return null;
  if (_role is EqualUnmodifiableListView) return _role;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'product_id', fromJson: _anyToString) final  String? productId;
@override@JsonKey(name: 'repairman_id', fromJson: _anyToString) final  String? repairmanId;
@override@JsonKey(fromJson: _anyToString) final  String? status;
@override@JsonKey(name: 'created_at', fromJson: _anyToString) final  String? createdAt;
@override@JsonKey(name: 'updated_at', fromJson: _anyToString) final  String? updatedAt;

/// Create a copy of DiscountModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DiscountModelCopyWith<_DiscountModel> get copyWith => __$DiscountModelCopyWithImpl<_DiscountModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DiscountModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DiscountModel&&(identical(other.id, id) || other.id == id)&&(identical(other.discountCode, discountCode) || other.discountCode == discountCode)&&(identical(other.discountCodeExpiresAt, discountCodeExpiresAt) || other.discountCodeExpiresAt == discountCodeExpiresAt)&&(identical(other.discountCodeUseNumber, discountCodeUseNumber) || other.discountCodeUseNumber == discountCodeUseNumber)&&(identical(other.discountType, discountType) || other.discountType == discountType)&&(identical(other.discountPercentage, discountPercentage) || other.discountPercentage == discountPercentage)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&const DeepCollectionEquality().equals(other.userId, _userId)&&const DeepCollectionEquality().equals(other.role, _role)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.repairmanId, repairmanId) || other.repairmanId == repairmanId)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,discountCode,discountCodeExpiresAt,discountCodeUseNumber,discountType,discountPercentage,discountAmount,const DeepCollectionEquality().hash(_userId),const DeepCollectionEquality().hash(_role),productId,repairmanId,status,createdAt,updatedAt);
}

@override
String toString() {
    return 'DiscountModel(id: $id, discountCode: $discountCode, discountCodeExpiresAt: $discountCodeExpiresAt, discountCodeUseNumber: $discountCodeUseNumber, discountType: $discountType, discountPercentage: $discountPercentage, discountAmount: $discountAmount, userId: $userId, role: $role, productId: $productId, repairmanId: $repairmanId, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$DiscountModelCopyWith<$Res> implements $DiscountModelCopyWith<$Res> {
  factory _$DiscountModelCopyWith(_DiscountModel value, $Res Function(_DiscountModel) _then) = __$DiscountModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _anyToString) String? id,@JsonKey(name: 'discount_code', fromJson: _anyToString) String? discountCode,@JsonKey(name: 'discount_code_expires_at', fromJson: _anyToString) String? discountCodeExpiresAt,@JsonKey(name: 'discount_code_use_number', fromJson: _anyToInt) int? discountCodeUseNumber,@JsonKey(name: 'discount_type', fromJson: _anyToString) String? discountType,@JsonKey(name: 'discount_percentage', fromJson: _anyToInt) int? discountPercentage,@JsonKey(name: 'discount_amount', fromJson: _anyToInt) int? discountAmount, List<String>? userId, List<String>? role,@JsonKey(name: 'product_id', fromJson: _anyToString) String? productId,@JsonKey(name: 'repairman_id', fromJson: _anyToString) String? repairmanId,@JsonKey(fromJson: _anyToString) String? status,@JsonKey(name: 'created_at', fromJson: _anyToString) String? createdAt,@JsonKey(name: 'updated_at', fromJson: _anyToString) String? updatedAt
});




}
/// @nodoc
class __$DiscountModelCopyWithImpl<$Res>
    implements _$DiscountModelCopyWith<$Res> {
  __$DiscountModelCopyWithImpl(this._self, this._then);

  final _DiscountModel _self;
  final $Res Function(_DiscountModel) _then;

/// Create a copy of DiscountModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? discountCode = freezed,Object? discountCodeExpiresAt = freezed,Object? discountCodeUseNumber = freezed,Object? discountType = freezed,Object? discountPercentage = freezed,Object? discountAmount = freezed,Object? userId = freezed,Object? role = freezed,Object? productId = freezed,Object? repairmanId = freezed,Object? status = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_DiscountModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,discountCode: freezed == discountCode ? _self.discountCode : discountCode // ignore: cast_nullable_to_non_nullable
as String?,discountCodeExpiresAt: freezed == discountCodeExpiresAt ? _self.discountCodeExpiresAt : discountCodeExpiresAt // ignore: cast_nullable_to_non_nullable
as String?,discountCodeUseNumber: freezed == discountCodeUseNumber ? _self.discountCodeUseNumber : discountCodeUseNumber // ignore: cast_nullable_to_non_nullable
as int?,discountType: freezed == discountType ? _self.discountType : discountType // ignore: cast_nullable_to_non_nullable
as String?,discountPercentage: freezed == discountPercentage ? _self.discountPercentage : discountPercentage // ignore: cast_nullable_to_non_nullable
as int?,discountAmount: freezed == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as int?,userId: freezed == userId ? _self._userId : userId // ignore: cast_nullable_to_non_nullable
as List<String>?,role: freezed == role ? _self._role : role // ignore: cast_nullable_to_non_nullable
as List<String>?,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String?,repairmanId: freezed == repairmanId ? _self.repairmanId : repairmanId // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
