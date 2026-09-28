// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddressModel {

@JsonKey(fromJson: _anyToString) String? get id;@JsonKey(name: 'user_id', fromJson: _anyToString) String? get userId;@JsonKey(name: 'ostan_id', fromJson: _anyToInt) int? get ostanId;@JsonKey(name: 'shahrestan_id', fromJson: _anyToInt) int? get shahrestanId;@JsonKey(name: 'full_address', fromJson: _anyToString) String? get fullAddress;@JsonKey(fromJson: _anyToString) String? get pelak;@JsonKey(fromJson: _anyToString) String? get vahed;@JsonKey(name: 'postal_code', fromJson: _anyToString) String? get postalCode;@JsonKey(fromJson: _anyToDouble) double? get latitude;@JsonKey(fromJson: _anyToDouble) double? get longitude;@JsonKey(name: 'created_at', fromJson: _anyToString) String? get createdAt;@JsonKey(name: 'updated_at', fromJson: _anyToString) String? get updatedAt; OstanModel? get ostan; ShahrestanModel? get shahrestan;
/// Create a copy of AddressModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddressModelCopyWith<AddressModel> get copyWith => _$AddressModelCopyWithImpl<AddressModel>(this as AddressModel, _$identity);

  /// Serializes this AddressModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AddressModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddressModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.ostanId, _this.ostanId) || other.ostanId == _this.ostanId)&&(identical(other.shahrestanId, _this.shahrestanId) || other.shahrestanId == _this.shahrestanId)&&(identical(other.fullAddress, _this.fullAddress) || other.fullAddress == _this.fullAddress)&&(identical(other.pelak, _this.pelak) || other.pelak == _this.pelak)&&(identical(other.vahed, _this.vahed) || other.vahed == _this.vahed)&&(identical(other.postalCode, _this.postalCode) || other.postalCode == _this.postalCode)&&(identical(other.latitude, _this.latitude) || other.latitude == _this.latitude)&&(identical(other.longitude, _this.longitude) || other.longitude == _this.longitude)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.ostan, _this.ostan) || other.ostan == _this.ostan)&&(identical(other.shahrestan, _this.shahrestan) || other.shahrestan == _this.shahrestan));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AddressModel;
  return Object.hash(runtimeType,_this.id,_this.userId,_this.ostanId,_this.shahrestanId,_this.fullAddress,_this.pelak,_this.vahed,_this.postalCode,_this.latitude,_this.longitude,_this.createdAt,_this.updatedAt,_this.ostan,_this.shahrestan);
}

@override
String toString() {
  final _this = this as AddressModel;
  return 'AddressModel(id: ${_this.id}, userId: ${_this.userId}, ostanId: ${_this.ostanId}, shahrestanId: ${_this.shahrestanId}, fullAddress: ${_this.fullAddress}, pelak: ${_this.pelak}, vahed: ${_this.vahed}, postalCode: ${_this.postalCode}, latitude: ${_this.latitude}, longitude: ${_this.longitude}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt}, ostan: ${_this.ostan}, shahrestan: ${_this.shahrestan})';
}


}

/// @nodoc
abstract mixin class $AddressModelCopyWith<$Res>  {
  factory $AddressModelCopyWith(AddressModel value, $Res Function(AddressModel) _then) = _$AddressModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _anyToString) String? id,@JsonKey(name: 'user_id', fromJson: _anyToString) String? userId,@JsonKey(name: 'ostan_id', fromJson: _anyToInt) int? ostanId,@JsonKey(name: 'shahrestan_id', fromJson: _anyToInt) int? shahrestanId,@JsonKey(name: 'full_address', fromJson: _anyToString) String? fullAddress,@JsonKey(fromJson: _anyToString) String? pelak,@JsonKey(fromJson: _anyToString) String? vahed,@JsonKey(name: 'postal_code', fromJson: _anyToString) String? postalCode,@JsonKey(fromJson: _anyToDouble) double? latitude,@JsonKey(fromJson: _anyToDouble) double? longitude,@JsonKey(name: 'created_at', fromJson: _anyToString) String? createdAt,@JsonKey(name: 'updated_at', fromJson: _anyToString) String? updatedAt, OstanModel? ostan, ShahrestanModel? shahrestan
});


$OstanModelCopyWith<$Res>? get ostan;$ShahrestanModelCopyWith<$Res>? get shahrestan;

}
/// @nodoc
class _$AddressModelCopyWithImpl<$Res>
    implements $AddressModelCopyWith<$Res> {
  _$AddressModelCopyWithImpl(this._self, this._then);

  final AddressModel _self;
  final $Res Function(AddressModel) _then;

/// Create a copy of AddressModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? userId = freezed,Object? ostanId = freezed,Object? shahrestanId = freezed,Object? fullAddress = freezed,Object? pelak = freezed,Object? vahed = freezed,Object? postalCode = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? ostan = freezed,Object? shahrestan = freezed,}) {
  return _then(AddressModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,ostanId: freezed == ostanId ? _self.ostanId : ostanId // ignore: cast_nullable_to_non_nullable
as int?,shahrestanId: freezed == shahrestanId ? _self.shahrestanId : shahrestanId // ignore: cast_nullable_to_non_nullable
as int?,fullAddress: freezed == fullAddress ? _self.fullAddress : fullAddress // ignore: cast_nullable_to_non_nullable
as String?,pelak: freezed == pelak ? _self.pelak : pelak // ignore: cast_nullable_to_non_nullable
as String?,vahed: freezed == vahed ? _self.vahed : vahed // ignore: cast_nullable_to_non_nullable
as String?,postalCode: freezed == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,ostan: freezed == ostan ? _self.ostan : ostan // ignore: cast_nullable_to_non_nullable
as OstanModel?,shahrestan: freezed == shahrestan ? _self.shahrestan : shahrestan // ignore: cast_nullable_to_non_nullable
as ShahrestanModel?,
  ));
}
/// Create a copy of AddressModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OstanModelCopyWith<$Res>? get ostan {
    if (_self.ostan == null) {
    return null;
  }

  return $OstanModelCopyWith<$Res>(_self.ostan!, (value) {
    return _then(_self.copyWith(ostan: value));
  });
}/// Create a copy of AddressModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShahrestanModelCopyWith<$Res>? get shahrestan {
    if (_self.shahrestan == null) {
    return null;
  }

  return $ShahrestanModelCopyWith<$Res>(_self.shahrestan!, (value) {
    return _then(_self.copyWith(shahrestan: value));
  });
}
}


/// Adds pattern-matching-related methods to [AddressModel].
extension AddressModelPatterns on AddressModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddressModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddressModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddressModel value)  $default,){
final _that = this;
switch (_that) {
case _AddressModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddressModel value)?  $default,){
final _that = this;
switch (_that) {
case _AddressModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _anyToString)  String? id, @JsonKey(name: 'user_id', fromJson: _anyToString)  String? userId, @JsonKey(name: 'ostan_id', fromJson: _anyToInt)  int? ostanId, @JsonKey(name: 'shahrestan_id', fromJson: _anyToInt)  int? shahrestanId, @JsonKey(name: 'full_address', fromJson: _anyToString)  String? fullAddress, @JsonKey(fromJson: _anyToString)  String? pelak, @JsonKey(fromJson: _anyToString)  String? vahed, @JsonKey(name: 'postal_code', fromJson: _anyToString)  String? postalCode, @JsonKey(fromJson: _anyToDouble)  double? latitude, @JsonKey(fromJson: _anyToDouble)  double? longitude, @JsonKey(name: 'created_at', fromJson: _anyToString)  String? createdAt, @JsonKey(name: 'updated_at', fromJson: _anyToString)  String? updatedAt,  OstanModel? ostan,  ShahrestanModel? shahrestan)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddressModel() when $default != null:
return $default(_that.id,_that.userId,_that.ostanId,_that.shahrestanId,_that.fullAddress,_that.pelak,_that.vahed,_that.postalCode,_that.latitude,_that.longitude,_that.createdAt,_that.updatedAt,_that.ostan,_that.shahrestan);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _anyToString)  String? id, @JsonKey(name: 'user_id', fromJson: _anyToString)  String? userId, @JsonKey(name: 'ostan_id', fromJson: _anyToInt)  int? ostanId, @JsonKey(name: 'shahrestan_id', fromJson: _anyToInt)  int? shahrestanId, @JsonKey(name: 'full_address', fromJson: _anyToString)  String? fullAddress, @JsonKey(fromJson: _anyToString)  String? pelak, @JsonKey(fromJson: _anyToString)  String? vahed, @JsonKey(name: 'postal_code', fromJson: _anyToString)  String? postalCode, @JsonKey(fromJson: _anyToDouble)  double? latitude, @JsonKey(fromJson: _anyToDouble)  double? longitude, @JsonKey(name: 'created_at', fromJson: _anyToString)  String? createdAt, @JsonKey(name: 'updated_at', fromJson: _anyToString)  String? updatedAt,  OstanModel? ostan,  ShahrestanModel? shahrestan)  $default,) {final _that = this;
switch (_that) {
case _AddressModel():
return $default(_that.id,_that.userId,_that.ostanId,_that.shahrestanId,_that.fullAddress,_that.pelak,_that.vahed,_that.postalCode,_that.latitude,_that.longitude,_that.createdAt,_that.updatedAt,_that.ostan,_that.shahrestan);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _anyToString)  String? id, @JsonKey(name: 'user_id', fromJson: _anyToString)  String? userId, @JsonKey(name: 'ostan_id', fromJson: _anyToInt)  int? ostanId, @JsonKey(name: 'shahrestan_id', fromJson: _anyToInt)  int? shahrestanId, @JsonKey(name: 'full_address', fromJson: _anyToString)  String? fullAddress, @JsonKey(fromJson: _anyToString)  String? pelak, @JsonKey(fromJson: _anyToString)  String? vahed, @JsonKey(name: 'postal_code', fromJson: _anyToString)  String? postalCode, @JsonKey(fromJson: _anyToDouble)  double? latitude, @JsonKey(fromJson: _anyToDouble)  double? longitude, @JsonKey(name: 'created_at', fromJson: _anyToString)  String? createdAt, @JsonKey(name: 'updated_at', fromJson: _anyToString)  String? updatedAt,  OstanModel? ostan,  ShahrestanModel? shahrestan)?  $default,) {final _that = this;
switch (_that) {
case _AddressModel() when $default != null:
return $default(_that.id,_that.userId,_that.ostanId,_that.shahrestanId,_that.fullAddress,_that.pelak,_that.vahed,_that.postalCode,_that.latitude,_that.longitude,_that.createdAt,_that.updatedAt,_that.ostan,_that.shahrestan);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AddressModel extends AddressModel {
  const _AddressModel({@JsonKey(fromJson: _anyToString) this.id, @JsonKey(name: 'user_id', fromJson: _anyToString) this.userId, @JsonKey(name: 'ostan_id', fromJson: _anyToInt) this.ostanId, @JsonKey(name: 'shahrestan_id', fromJson: _anyToInt) this.shahrestanId, @JsonKey(name: 'full_address', fromJson: _anyToString) this.fullAddress, @JsonKey(fromJson: _anyToString) this.pelak, @JsonKey(fromJson: _anyToString) this.vahed, @JsonKey(name: 'postal_code', fromJson: _anyToString) this.postalCode, @JsonKey(fromJson: _anyToDouble) this.latitude, @JsonKey(fromJson: _anyToDouble) this.longitude, @JsonKey(name: 'created_at', fromJson: _anyToString) this.createdAt, @JsonKey(name: 'updated_at', fromJson: _anyToString) this.updatedAt, this.ostan, this.shahrestan}): super._();
  factory _AddressModel.fromJson(Map<String, dynamic> json) => _$AddressModelFromJson(json);

@override@JsonKey(fromJson: _anyToString) final  String? id;
@override@JsonKey(name: 'user_id', fromJson: _anyToString) final  String? userId;
@override@JsonKey(name: 'ostan_id', fromJson: _anyToInt) final  int? ostanId;
@override@JsonKey(name: 'shahrestan_id', fromJson: _anyToInt) final  int? shahrestanId;
@override@JsonKey(name: 'full_address', fromJson: _anyToString) final  String? fullAddress;
@override@JsonKey(fromJson: _anyToString) final  String? pelak;
@override@JsonKey(fromJson: _anyToString) final  String? vahed;
@override@JsonKey(name: 'postal_code', fromJson: _anyToString) final  String? postalCode;
@override@JsonKey(fromJson: _anyToDouble) final  double? latitude;
@override@JsonKey(fromJson: _anyToDouble) final  double? longitude;
@override@JsonKey(name: 'created_at', fromJson: _anyToString) final  String? createdAt;
@override@JsonKey(name: 'updated_at', fromJson: _anyToString) final  String? updatedAt;
@override final  OstanModel? ostan;
@override final  ShahrestanModel? shahrestan;

/// Create a copy of AddressModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddressModelCopyWith<_AddressModel> get copyWith => __$AddressModelCopyWithImpl<_AddressModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddressModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddressModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.ostanId, ostanId) || other.ostanId == ostanId)&&(identical(other.shahrestanId, shahrestanId) || other.shahrestanId == shahrestanId)&&(identical(other.fullAddress, fullAddress) || other.fullAddress == fullAddress)&&(identical(other.pelak, pelak) || other.pelak == pelak)&&(identical(other.vahed, vahed) || other.vahed == vahed)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.ostan, ostan) || other.ostan == ostan)&&(identical(other.shahrestan, shahrestan) || other.shahrestan == shahrestan));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,userId,ostanId,shahrestanId,fullAddress,pelak,vahed,postalCode,latitude,longitude,createdAt,updatedAt,ostan,shahrestan);
}

@override
String toString() {
    return 'AddressModel(id: $id, userId: $userId, ostanId: $ostanId, shahrestanId: $shahrestanId, fullAddress: $fullAddress, pelak: $pelak, vahed: $vahed, postalCode: $postalCode, latitude: $latitude, longitude: $longitude, createdAt: $createdAt, updatedAt: $updatedAt, ostan: $ostan, shahrestan: $shahrestan)';
}


}

/// @nodoc
abstract mixin class _$AddressModelCopyWith<$Res> implements $AddressModelCopyWith<$Res> {
  factory _$AddressModelCopyWith(_AddressModel value, $Res Function(_AddressModel) _then) = __$AddressModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _anyToString) String? id,@JsonKey(name: 'user_id', fromJson: _anyToString) String? userId,@JsonKey(name: 'ostan_id', fromJson: _anyToInt) int? ostanId,@JsonKey(name: 'shahrestan_id', fromJson: _anyToInt) int? shahrestanId,@JsonKey(name: 'full_address', fromJson: _anyToString) String? fullAddress,@JsonKey(fromJson: _anyToString) String? pelak,@JsonKey(fromJson: _anyToString) String? vahed,@JsonKey(name: 'postal_code', fromJson: _anyToString) String? postalCode,@JsonKey(fromJson: _anyToDouble) double? latitude,@JsonKey(fromJson: _anyToDouble) double? longitude,@JsonKey(name: 'created_at', fromJson: _anyToString) String? createdAt,@JsonKey(name: 'updated_at', fromJson: _anyToString) String? updatedAt, OstanModel? ostan, ShahrestanModel? shahrestan
});


@override $OstanModelCopyWith<$Res>? get ostan;@override $ShahrestanModelCopyWith<$Res>? get shahrestan;

}
/// @nodoc
class __$AddressModelCopyWithImpl<$Res>
    implements _$AddressModelCopyWith<$Res> {
  __$AddressModelCopyWithImpl(this._self, this._then);

  final _AddressModel _self;
  final $Res Function(_AddressModel) _then;

/// Create a copy of AddressModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? userId = freezed,Object? ostanId = freezed,Object? shahrestanId = freezed,Object? fullAddress = freezed,Object? pelak = freezed,Object? vahed = freezed,Object? postalCode = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? ostan = freezed,Object? shahrestan = freezed,}) {
  return _then(_AddressModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,ostanId: freezed == ostanId ? _self.ostanId : ostanId // ignore: cast_nullable_to_non_nullable
as int?,shahrestanId: freezed == shahrestanId ? _self.shahrestanId : shahrestanId // ignore: cast_nullable_to_non_nullable
as int?,fullAddress: freezed == fullAddress ? _self.fullAddress : fullAddress // ignore: cast_nullable_to_non_nullable
as String?,pelak: freezed == pelak ? _self.pelak : pelak // ignore: cast_nullable_to_non_nullable
as String?,vahed: freezed == vahed ? _self.vahed : vahed // ignore: cast_nullable_to_non_nullable
as String?,postalCode: freezed == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,ostan: freezed == ostan ? _self.ostan : ostan // ignore: cast_nullable_to_non_nullable
as OstanModel?,shahrestan: freezed == shahrestan ? _self.shahrestan : shahrestan // ignore: cast_nullable_to_non_nullable
as ShahrestanModel?,
  ));
}

/// Create a copy of AddressModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OstanModelCopyWith<$Res>? get ostan {
    if (_self.ostan == null) {
    return null;
  }

  return $OstanModelCopyWith<$Res>(_self.ostan!, (value) {
    return _then(_self.copyWith(ostan: value));
  });
}/// Create a copy of AddressModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShahrestanModelCopyWith<$Res>? get shahrestan {
    if (_self.shahrestan == null) {
    return null;
  }

  return $ShahrestanModelCopyWith<$Res>(_self.shahrestan!, (value) {
    return _then(_self.copyWith(shahrestan: value));
  });
}
}

// dart format on
