// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileModel {

 String get id;@JsonKey(name: 'first_name') String get firstName;@JsonKey(name: 'last_name') String get lastName; String get mobile; String? get email;@JsonKey(fromJson: _roleFromJson) String get role; String? get birthday;@JsonKey(name: 'profile_image_id') String? get profileImageId;@JsonKey(name: 'subscription_code', fromJson: _anyToString) String? get subscriptionCode; String? get status;@JsonKey(name: 'products_count', fromJson: _anyToInt) int get productsCount;@JsonKey(name: 'services_count', fromJson: _anyToInt) int get servicesCount;@JsonKey(name: 'orders_count', fromJson: _anyToInt) int get ordersCount; String? get brand; String? get address;@JsonKey(name: 'has_product') bool get hasProduct;@JsonKey(name: 'has_service') bool get hasService; ReservationLocationModel? get location;
/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileModelCopyWith<ProfileModel> get copyWith => _$ProfileModelCopyWithImpl<ProfileModel>(this as ProfileModel, _$identity);

  /// Serializes this ProfileModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ProfileModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.firstName, _this.firstName) || other.firstName == _this.firstName)&&(identical(other.lastName, _this.lastName) || other.lastName == _this.lastName)&&(identical(other.mobile, _this.mobile) || other.mobile == _this.mobile)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.role, _this.role) || other.role == _this.role)&&(identical(other.birthday, _this.birthday) || other.birthday == _this.birthday)&&(identical(other.profileImageId, _this.profileImageId) || other.profileImageId == _this.profileImageId)&&(identical(other.subscriptionCode, _this.subscriptionCode) || other.subscriptionCode == _this.subscriptionCode)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.productsCount, _this.productsCount) || other.productsCount == _this.productsCount)&&(identical(other.servicesCount, _this.servicesCount) || other.servicesCount == _this.servicesCount)&&(identical(other.ordersCount, _this.ordersCount) || other.ordersCount == _this.ordersCount)&&(identical(other.brand, _this.brand) || other.brand == _this.brand)&&(identical(other.address, _this.address) || other.address == _this.address)&&(identical(other.hasProduct, _this.hasProduct) || other.hasProduct == _this.hasProduct)&&(identical(other.hasService, _this.hasService) || other.hasService == _this.hasService)&&(identical(other.location, _this.location) || other.location == _this.location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ProfileModel;
  return Object.hash(runtimeType,_this.id,_this.firstName,_this.lastName,_this.mobile,_this.email,_this.role,_this.birthday,_this.profileImageId,_this.subscriptionCode,_this.status,_this.productsCount,_this.servicesCount,_this.ordersCount,_this.brand,_this.address,_this.hasProduct,_this.hasService,_this.location);
}

@override
String toString() {
  final _this = this as ProfileModel;
  return 'ProfileModel(id: ${_this.id}, firstName: ${_this.firstName}, lastName: ${_this.lastName}, mobile: ${_this.mobile}, email: ${_this.email}, role: ${_this.role}, birthday: ${_this.birthday}, profileImageId: ${_this.profileImageId}, subscriptionCode: ${_this.subscriptionCode}, status: ${_this.status}, productsCount: ${_this.productsCount}, servicesCount: ${_this.servicesCount}, ordersCount: ${_this.ordersCount}, brand: ${_this.brand}, address: ${_this.address}, hasProduct: ${_this.hasProduct}, hasService: ${_this.hasService}, location: ${_this.location})';
}


}

/// @nodoc
abstract mixin class $ProfileModelCopyWith<$Res>  {
  factory $ProfileModelCopyWith(ProfileModel value, $Res Function(ProfileModel) _then) = _$ProfileModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'first_name') String firstName,@JsonKey(name: 'last_name') String lastName, String mobile, String? email,@JsonKey(fromJson: _roleFromJson) String role, String? birthday,@JsonKey(name: 'profile_image_id') String? profileImageId,@JsonKey(name: 'subscription_code', fromJson: _anyToString) String? subscriptionCode, String? status,@JsonKey(name: 'products_count', fromJson: _anyToInt) int productsCount,@JsonKey(name: 'services_count', fromJson: _anyToInt) int servicesCount,@JsonKey(name: 'orders_count', fromJson: _anyToInt) int ordersCount, String? brand, String? address,@JsonKey(name: 'has_product') bool hasProduct,@JsonKey(name: 'has_service') bool hasService, ReservationLocationModel? location
});


$ReservationLocationModelCopyWith<$Res>? get location;

}
/// @nodoc
class _$ProfileModelCopyWithImpl<$Res>
    implements $ProfileModelCopyWith<$Res> {
  _$ProfileModelCopyWithImpl(this._self, this._then);

  final ProfileModel _self;
  final $Res Function(ProfileModel) _then;

/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? firstName = null,Object? lastName = null,Object? mobile = null,Object? email = freezed,Object? role = null,Object? birthday = freezed,Object? profileImageId = freezed,Object? subscriptionCode = freezed,Object? status = freezed,Object? productsCount = null,Object? servicesCount = null,Object? ordersCount = null,Object? brand = freezed,Object? address = freezed,Object? hasProduct = null,Object? hasService = null,Object? location = freezed,}) {
  return _then(ProfileModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,mobile: null == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,birthday: freezed == birthday ? _self.birthday : birthday // ignore: cast_nullable_to_non_nullable
as String?,profileImageId: freezed == profileImageId ? _self.profileImageId : profileImageId // ignore: cast_nullable_to_non_nullable
as String?,subscriptionCode: freezed == subscriptionCode ? _self.subscriptionCode : subscriptionCode // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,productsCount: null == productsCount ? _self.productsCount : productsCount // ignore: cast_nullable_to_non_nullable
as int,servicesCount: null == servicesCount ? _self.servicesCount : servicesCount // ignore: cast_nullable_to_non_nullable
as int,ordersCount: null == ordersCount ? _self.ordersCount : ordersCount // ignore: cast_nullable_to_non_nullable
as int,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,hasProduct: null == hasProduct ? _self.hasProduct : hasProduct // ignore: cast_nullable_to_non_nullable
as bool,hasService: null == hasService ? _self.hasService : hasService // ignore: cast_nullable_to_non_nullable
as bool,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as ReservationLocationModel?,
  ));
}
/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReservationLocationModelCopyWith<$Res>? get location {
    if (_self.location == null) {
    return null;
  }

  return $ReservationLocationModelCopyWith<$Res>(_self.location!, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProfileModel].
extension ProfileModelPatterns on ProfileModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileModel value)  $default,){
final _that = this;
switch (_that) {
case _ProfileModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName,  String mobile,  String? email, @JsonKey(fromJson: _roleFromJson)  String role,  String? birthday, @JsonKey(name: 'profile_image_id')  String? profileImageId, @JsonKey(name: 'subscription_code', fromJson: _anyToString)  String? subscriptionCode,  String? status, @JsonKey(name: 'products_count', fromJson: _anyToInt)  int productsCount, @JsonKey(name: 'services_count', fromJson: _anyToInt)  int servicesCount, @JsonKey(name: 'orders_count', fromJson: _anyToInt)  int ordersCount,  String? brand,  String? address, @JsonKey(name: 'has_product')  bool hasProduct, @JsonKey(name: 'has_service')  bool hasService,  ReservationLocationModel? location)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.mobile,_that.email,_that.role,_that.birthday,_that.profileImageId,_that.subscriptionCode,_that.status,_that.productsCount,_that.servicesCount,_that.ordersCount,_that.brand,_that.address,_that.hasProduct,_that.hasService,_that.location);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName,  String mobile,  String? email, @JsonKey(fromJson: _roleFromJson)  String role,  String? birthday, @JsonKey(name: 'profile_image_id')  String? profileImageId, @JsonKey(name: 'subscription_code', fromJson: _anyToString)  String? subscriptionCode,  String? status, @JsonKey(name: 'products_count', fromJson: _anyToInt)  int productsCount, @JsonKey(name: 'services_count', fromJson: _anyToInt)  int servicesCount, @JsonKey(name: 'orders_count', fromJson: _anyToInt)  int ordersCount,  String? brand,  String? address, @JsonKey(name: 'has_product')  bool hasProduct, @JsonKey(name: 'has_service')  bool hasService,  ReservationLocationModel? location)  $default,) {final _that = this;
switch (_that) {
case _ProfileModel():
return $default(_that.id,_that.firstName,_that.lastName,_that.mobile,_that.email,_that.role,_that.birthday,_that.profileImageId,_that.subscriptionCode,_that.status,_that.productsCount,_that.servicesCount,_that.ordersCount,_that.brand,_that.address,_that.hasProduct,_that.hasService,_that.location);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName,  String mobile,  String? email, @JsonKey(fromJson: _roleFromJson)  String role,  String? birthday, @JsonKey(name: 'profile_image_id')  String? profileImageId, @JsonKey(name: 'subscription_code', fromJson: _anyToString)  String? subscriptionCode,  String? status, @JsonKey(name: 'products_count', fromJson: _anyToInt)  int productsCount, @JsonKey(name: 'services_count', fromJson: _anyToInt)  int servicesCount, @JsonKey(name: 'orders_count', fromJson: _anyToInt)  int ordersCount,  String? brand,  String? address, @JsonKey(name: 'has_product')  bool hasProduct, @JsonKey(name: 'has_service')  bool hasService,  ReservationLocationModel? location)?  $default,) {final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.mobile,_that.email,_that.role,_that.birthday,_that.profileImageId,_that.subscriptionCode,_that.status,_that.productsCount,_that.servicesCount,_that.ordersCount,_that.brand,_that.address,_that.hasProduct,_that.hasService,_that.location);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileModel extends ProfileModel {
  const _ProfileModel({this.id = '', @JsonKey(name: 'first_name') this.firstName = '', @JsonKey(name: 'last_name') this.lastName = '', this.mobile = '', this.email, @JsonKey(fromJson: _roleFromJson) this.role = '', this.birthday, @JsonKey(name: 'profile_image_id') this.profileImageId, @JsonKey(name: 'subscription_code', fromJson: _anyToString) this.subscriptionCode, this.status, @JsonKey(name: 'products_count', fromJson: _anyToInt) this.productsCount = 0, @JsonKey(name: 'services_count', fromJson: _anyToInt) this.servicesCount = 0, @JsonKey(name: 'orders_count', fromJson: _anyToInt) this.ordersCount = 0, this.brand, this.address, @JsonKey(name: 'has_product') this.hasProduct = false, @JsonKey(name: 'has_service') this.hasService = false, this.location}): super._();
  factory _ProfileModel.fromJson(Map<String, dynamic> json) => _$ProfileModelFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey(name: 'first_name') final  String firstName;
@override@JsonKey(name: 'last_name') final  String lastName;
@override@JsonKey() final  String mobile;
@override final  String? email;
@override@JsonKey(fromJson: _roleFromJson) final  String role;
@override final  String? birthday;
@override@JsonKey(name: 'profile_image_id') final  String? profileImageId;
@override@JsonKey(name: 'subscription_code', fromJson: _anyToString) final  String? subscriptionCode;
@override final  String? status;
@override@JsonKey(name: 'products_count', fromJson: _anyToInt) final  int productsCount;
@override@JsonKey(name: 'services_count', fromJson: _anyToInt) final  int servicesCount;
@override@JsonKey(name: 'orders_count', fromJson: _anyToInt) final  int ordersCount;
@override final  String? brand;
@override final  String? address;
@override@JsonKey(name: 'has_product') final  bool hasProduct;
@override@JsonKey(name: 'has_service') final  bool hasService;
@override final  ReservationLocationModel? location;

/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileModelCopyWith<_ProfileModel> get copyWith => __$ProfileModelCopyWithImpl<_ProfileModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileModel&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.mobile, mobile) || other.mobile == mobile)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.birthday, birthday) || other.birthday == birthday)&&(identical(other.profileImageId, profileImageId) || other.profileImageId == profileImageId)&&(identical(other.subscriptionCode, subscriptionCode) || other.subscriptionCode == subscriptionCode)&&(identical(other.status, status) || other.status == status)&&(identical(other.productsCount, productsCount) || other.productsCount == productsCount)&&(identical(other.servicesCount, servicesCount) || other.servicesCount == servicesCount)&&(identical(other.ordersCount, ordersCount) || other.ordersCount == ordersCount)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.address, address) || other.address == address)&&(identical(other.hasProduct, hasProduct) || other.hasProduct == hasProduct)&&(identical(other.hasService, hasService) || other.hasService == hasService)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,firstName,lastName,mobile,email,role,birthday,profileImageId,subscriptionCode,status,productsCount,servicesCount,ordersCount,brand,address,hasProduct,hasService,location);
}

@override
String toString() {
    return 'ProfileModel(id: $id, firstName: $firstName, lastName: $lastName, mobile: $mobile, email: $email, role: $role, birthday: $birthday, profileImageId: $profileImageId, subscriptionCode: $subscriptionCode, status: $status, productsCount: $productsCount, servicesCount: $servicesCount, ordersCount: $ordersCount, brand: $brand, address: $address, hasProduct: $hasProduct, hasService: $hasService, location: $location)';
}


}

/// @nodoc
abstract mixin class _$ProfileModelCopyWith<$Res> implements $ProfileModelCopyWith<$Res> {
  factory _$ProfileModelCopyWith(_ProfileModel value, $Res Function(_ProfileModel) _then) = __$ProfileModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'first_name') String firstName,@JsonKey(name: 'last_name') String lastName, String mobile, String? email,@JsonKey(fromJson: _roleFromJson) String role, String? birthday,@JsonKey(name: 'profile_image_id') String? profileImageId,@JsonKey(name: 'subscription_code', fromJson: _anyToString) String? subscriptionCode, String? status,@JsonKey(name: 'products_count', fromJson: _anyToInt) int productsCount,@JsonKey(name: 'services_count', fromJson: _anyToInt) int servicesCount,@JsonKey(name: 'orders_count', fromJson: _anyToInt) int ordersCount, String? brand, String? address,@JsonKey(name: 'has_product') bool hasProduct,@JsonKey(name: 'has_service') bool hasService, ReservationLocationModel? location
});


@override $ReservationLocationModelCopyWith<$Res>? get location;

}
/// @nodoc
class __$ProfileModelCopyWithImpl<$Res>
    implements _$ProfileModelCopyWith<$Res> {
  __$ProfileModelCopyWithImpl(this._self, this._then);

  final _ProfileModel _self;
  final $Res Function(_ProfileModel) _then;

/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? firstName = null,Object? lastName = null,Object? mobile = null,Object? email = freezed,Object? role = null,Object? birthday = freezed,Object? profileImageId = freezed,Object? subscriptionCode = freezed,Object? status = freezed,Object? productsCount = null,Object? servicesCount = null,Object? ordersCount = null,Object? brand = freezed,Object? address = freezed,Object? hasProduct = null,Object? hasService = null,Object? location = freezed,}) {
  return _then(_ProfileModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,mobile: null == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,birthday: freezed == birthday ? _self.birthday : birthday // ignore: cast_nullable_to_non_nullable
as String?,profileImageId: freezed == profileImageId ? _self.profileImageId : profileImageId // ignore: cast_nullable_to_non_nullable
as String?,subscriptionCode: freezed == subscriptionCode ? _self.subscriptionCode : subscriptionCode // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,productsCount: null == productsCount ? _self.productsCount : productsCount // ignore: cast_nullable_to_non_nullable
as int,servicesCount: null == servicesCount ? _self.servicesCount : servicesCount // ignore: cast_nullable_to_non_nullable
as int,ordersCount: null == ordersCount ? _self.ordersCount : ordersCount // ignore: cast_nullable_to_non_nullable
as int,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,hasProduct: null == hasProduct ? _self.hasProduct : hasProduct // ignore: cast_nullable_to_non_nullable
as bool,hasService: null == hasService ? _self.hasService : hasService // ignore: cast_nullable_to_non_nullable
as bool,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as ReservationLocationModel?,
  ));
}

/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReservationLocationModelCopyWith<$Res>? get location {
    if (_self.location == null) {
    return null;
  }

  return $ReservationLocationModelCopyWith<$Res>(_self.location!, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}

// dart format on
