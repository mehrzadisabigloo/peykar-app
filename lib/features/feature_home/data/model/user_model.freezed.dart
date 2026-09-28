// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserModel {

@JsonKey(fromJson: _anyToString) String? get id;@JsonKey(name: 'first_name', fromJson: _anyToString) String? get firstName;@JsonKey(name: 'last_name', fromJson: _anyToString) String? get lastName;@JsonKey(fromJson: _anyToString) String? get mobile;@JsonKey(fromJson: _roleFromJson) String? get role;@JsonKey(fromJson: _anyToString) String? get status;@JsonKey(fromJson: _anyToString) String? get brand;@JsonKey(fromJson: _anyToString) String? get ostan;@JsonKey(fromJson: _anyToString) String? get shahrestan;@JsonKey(fromJson: _anyToString) String? get address;@JsonKey(name: 'profile_image_id', fromJson: _anyToString) String? get profileImageId;@JsonKey(name: 'rating_average', fromJson: _toDouble) double? get ratingAverage;@JsonKey(name: 'ratings_count', fromJson: _toInt) int? get ratingsCount;
/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserModelCopyWith<UserModel> get copyWith => _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as UserModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.firstName, _this.firstName) || other.firstName == _this.firstName)&&(identical(other.lastName, _this.lastName) || other.lastName == _this.lastName)&&(identical(other.mobile, _this.mobile) || other.mobile == _this.mobile)&&(identical(other.role, _this.role) || other.role == _this.role)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.brand, _this.brand) || other.brand == _this.brand)&&(identical(other.ostan, _this.ostan) || other.ostan == _this.ostan)&&(identical(other.shahrestan, _this.shahrestan) || other.shahrestan == _this.shahrestan)&&(identical(other.address, _this.address) || other.address == _this.address)&&(identical(other.profileImageId, _this.profileImageId) || other.profileImageId == _this.profileImageId)&&(identical(other.ratingAverage, _this.ratingAverage) || other.ratingAverage == _this.ratingAverage)&&(identical(other.ratingsCount, _this.ratingsCount) || other.ratingsCount == _this.ratingsCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as UserModel;
  return Object.hash(runtimeType,_this.id,_this.firstName,_this.lastName,_this.mobile,_this.role,_this.status,_this.brand,_this.ostan,_this.shahrestan,_this.address,_this.profileImageId,_this.ratingAverage,_this.ratingsCount);
}

@override
String toString() {
  final _this = this as UserModel;
  return 'UserModel(id: ${_this.id}, firstName: ${_this.firstName}, lastName: ${_this.lastName}, mobile: ${_this.mobile}, role: ${_this.role}, status: ${_this.status}, brand: ${_this.brand}, ostan: ${_this.ostan}, shahrestan: ${_this.shahrestan}, address: ${_this.address}, profileImageId: ${_this.profileImageId}, ratingAverage: ${_this.ratingAverage}, ratingsCount: ${_this.ratingsCount})';
}


}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res>  {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) = _$UserModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _anyToString) String? id,@JsonKey(name: 'first_name', fromJson: _anyToString) String? firstName,@JsonKey(name: 'last_name', fromJson: _anyToString) String? lastName,@JsonKey(fromJson: _anyToString) String? mobile,@JsonKey(fromJson: _roleFromJson) String? role,@JsonKey(fromJson: _anyToString) String? status,@JsonKey(fromJson: _anyToString) String? brand,@JsonKey(fromJson: _anyToString) String? ostan,@JsonKey(fromJson: _anyToString) String? shahrestan,@JsonKey(fromJson: _anyToString) String? address,@JsonKey(name: 'profile_image_id', fromJson: _anyToString) String? profileImageId,@JsonKey(name: 'rating_average', fromJson: _toDouble) double? ratingAverage,@JsonKey(name: 'ratings_count', fromJson: _toInt) int? ratingsCount
});




}
/// @nodoc
class _$UserModelCopyWithImpl<$Res>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._self, this._then);

  final UserModel _self;
  final $Res Function(UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? mobile = freezed,Object? role = freezed,Object? status = freezed,Object? brand = freezed,Object? ostan = freezed,Object? shahrestan = freezed,Object? address = freezed,Object? profileImageId = freezed,Object? ratingAverage = freezed,Object? ratingsCount = freezed,}) {
  return _then(UserModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,mobile: freezed == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,ostan: freezed == ostan ? _self.ostan : ostan // ignore: cast_nullable_to_non_nullable
as String?,shahrestan: freezed == shahrestan ? _self.shahrestan : shahrestan // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,profileImageId: freezed == profileImageId ? _self.profileImageId : profileImageId // ignore: cast_nullable_to_non_nullable
as String?,ratingAverage: freezed == ratingAverage ? _self.ratingAverage : ratingAverage // ignore: cast_nullable_to_non_nullable
as double?,ratingsCount: freezed == ratingsCount ? _self.ratingsCount : ratingsCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserModel].
extension UserModelPatterns on UserModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserModel value)  $default,){
final _that = this;
switch (_that) {
case _UserModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _anyToString)  String? id, @JsonKey(name: 'first_name', fromJson: _anyToString)  String? firstName, @JsonKey(name: 'last_name', fromJson: _anyToString)  String? lastName, @JsonKey(fromJson: _anyToString)  String? mobile, @JsonKey(fromJson: _roleFromJson)  String? role, @JsonKey(fromJson: _anyToString)  String? status, @JsonKey(fromJson: _anyToString)  String? brand, @JsonKey(fromJson: _anyToString)  String? ostan, @JsonKey(fromJson: _anyToString)  String? shahrestan, @JsonKey(fromJson: _anyToString)  String? address, @JsonKey(name: 'profile_image_id', fromJson: _anyToString)  String? profileImageId, @JsonKey(name: 'rating_average', fromJson: _toDouble)  double? ratingAverage, @JsonKey(name: 'ratings_count', fromJson: _toInt)  int? ratingsCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.mobile,_that.role,_that.status,_that.brand,_that.ostan,_that.shahrestan,_that.address,_that.profileImageId,_that.ratingAverage,_that.ratingsCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _anyToString)  String? id, @JsonKey(name: 'first_name', fromJson: _anyToString)  String? firstName, @JsonKey(name: 'last_name', fromJson: _anyToString)  String? lastName, @JsonKey(fromJson: _anyToString)  String? mobile, @JsonKey(fromJson: _roleFromJson)  String? role, @JsonKey(fromJson: _anyToString)  String? status, @JsonKey(fromJson: _anyToString)  String? brand, @JsonKey(fromJson: _anyToString)  String? ostan, @JsonKey(fromJson: _anyToString)  String? shahrestan, @JsonKey(fromJson: _anyToString)  String? address, @JsonKey(name: 'profile_image_id', fromJson: _anyToString)  String? profileImageId, @JsonKey(name: 'rating_average', fromJson: _toDouble)  double? ratingAverage, @JsonKey(name: 'ratings_count', fromJson: _toInt)  int? ratingsCount)  $default,) {final _that = this;
switch (_that) {
case _UserModel():
return $default(_that.id,_that.firstName,_that.lastName,_that.mobile,_that.role,_that.status,_that.brand,_that.ostan,_that.shahrestan,_that.address,_that.profileImageId,_that.ratingAverage,_that.ratingsCount);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _anyToString)  String? id, @JsonKey(name: 'first_name', fromJson: _anyToString)  String? firstName, @JsonKey(name: 'last_name', fromJson: _anyToString)  String? lastName, @JsonKey(fromJson: _anyToString)  String? mobile, @JsonKey(fromJson: _roleFromJson)  String? role, @JsonKey(fromJson: _anyToString)  String? status, @JsonKey(fromJson: _anyToString)  String? brand, @JsonKey(fromJson: _anyToString)  String? ostan, @JsonKey(fromJson: _anyToString)  String? shahrestan, @JsonKey(fromJson: _anyToString)  String? address, @JsonKey(name: 'profile_image_id', fromJson: _anyToString)  String? profileImageId, @JsonKey(name: 'rating_average', fromJson: _toDouble)  double? ratingAverage, @JsonKey(name: 'ratings_count', fromJson: _toInt)  int? ratingsCount)?  $default,) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.mobile,_that.role,_that.status,_that.brand,_that.ostan,_that.shahrestan,_that.address,_that.profileImageId,_that.ratingAverage,_that.ratingsCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserModel extends UserModel {
  const _UserModel({@JsonKey(fromJson: _anyToString) this.id, @JsonKey(name: 'first_name', fromJson: _anyToString) this.firstName, @JsonKey(name: 'last_name', fromJson: _anyToString) this.lastName, @JsonKey(fromJson: _anyToString) this.mobile, @JsonKey(fromJson: _roleFromJson) this.role, @JsonKey(fromJson: _anyToString) this.status, @JsonKey(fromJson: _anyToString) this.brand, @JsonKey(fromJson: _anyToString) this.ostan, @JsonKey(fromJson: _anyToString) this.shahrestan, @JsonKey(fromJson: _anyToString) this.address, @JsonKey(name: 'profile_image_id', fromJson: _anyToString) this.profileImageId, @JsonKey(name: 'rating_average', fromJson: _toDouble) this.ratingAverage, @JsonKey(name: 'ratings_count', fromJson: _toInt) this.ratingsCount}): super._();
  factory _UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

@override@JsonKey(fromJson: _anyToString) final  String? id;
@override@JsonKey(name: 'first_name', fromJson: _anyToString) final  String? firstName;
@override@JsonKey(name: 'last_name', fromJson: _anyToString) final  String? lastName;
@override@JsonKey(fromJson: _anyToString) final  String? mobile;
@override@JsonKey(fromJson: _roleFromJson) final  String? role;
@override@JsonKey(fromJson: _anyToString) final  String? status;
@override@JsonKey(fromJson: _anyToString) final  String? brand;
@override@JsonKey(fromJson: _anyToString) final  String? ostan;
@override@JsonKey(fromJson: _anyToString) final  String? shahrestan;
@override@JsonKey(fromJson: _anyToString) final  String? address;
@override@JsonKey(name: 'profile_image_id', fromJson: _anyToString) final  String? profileImageId;
@override@JsonKey(name: 'rating_average', fromJson: _toDouble) final  double? ratingAverage;
@override@JsonKey(name: 'ratings_count', fromJson: _toInt) final  int? ratingsCount;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserModelCopyWith<_UserModel> get copyWith => __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.mobile, mobile) || other.mobile == mobile)&&(identical(other.role, role) || other.role == role)&&(identical(other.status, status) || other.status == status)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.ostan, ostan) || other.ostan == ostan)&&(identical(other.shahrestan, shahrestan) || other.shahrestan == shahrestan)&&(identical(other.address, address) || other.address == address)&&(identical(other.profileImageId, profileImageId) || other.profileImageId == profileImageId)&&(identical(other.ratingAverage, ratingAverage) || other.ratingAverage == ratingAverage)&&(identical(other.ratingsCount, ratingsCount) || other.ratingsCount == ratingsCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,firstName,lastName,mobile,role,status,brand,ostan,shahrestan,address,profileImageId,ratingAverage,ratingsCount);
}

@override
String toString() {
    return 'UserModel(id: $id, firstName: $firstName, lastName: $lastName, mobile: $mobile, role: $role, status: $status, brand: $brand, ostan: $ostan, shahrestan: $shahrestan, address: $address, profileImageId: $profileImageId, ratingAverage: $ratingAverage, ratingsCount: $ratingsCount)';
}


}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(_UserModel value, $Res Function(_UserModel) _then) = __$UserModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _anyToString) String? id,@JsonKey(name: 'first_name', fromJson: _anyToString) String? firstName,@JsonKey(name: 'last_name', fromJson: _anyToString) String? lastName,@JsonKey(fromJson: _anyToString) String? mobile,@JsonKey(fromJson: _roleFromJson) String? role,@JsonKey(fromJson: _anyToString) String? status,@JsonKey(fromJson: _anyToString) String? brand,@JsonKey(fromJson: _anyToString) String? ostan,@JsonKey(fromJson: _anyToString) String? shahrestan,@JsonKey(fromJson: _anyToString) String? address,@JsonKey(name: 'profile_image_id', fromJson: _anyToString) String? profileImageId,@JsonKey(name: 'rating_average', fromJson: _toDouble) double? ratingAverage,@JsonKey(name: 'ratings_count', fromJson: _toInt) int? ratingsCount
});




}
/// @nodoc
class __$UserModelCopyWithImpl<$Res>
    implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(this._self, this._then);

  final _UserModel _self;
  final $Res Function(_UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? mobile = freezed,Object? role = freezed,Object? status = freezed,Object? brand = freezed,Object? ostan = freezed,Object? shahrestan = freezed,Object? address = freezed,Object? profileImageId = freezed,Object? ratingAverage = freezed,Object? ratingsCount = freezed,}) {
  return _then(_UserModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,mobile: freezed == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,ostan: freezed == ostan ? _self.ostan : ostan // ignore: cast_nullable_to_non_nullable
as String?,shahrestan: freezed == shahrestan ? _self.shahrestan : shahrestan // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,profileImageId: freezed == profileImageId ? _self.profileImageId : profileImageId // ignore: cast_nullable_to_non_nullable
as String?,ratingAverage: freezed == ratingAverage ? _self.ratingAverage : ratingAverage // ignore: cast_nullable_to_non_nullable
as double?,ratingsCount: freezed == ratingsCount ? _self.ratingsCount : ratingsCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
