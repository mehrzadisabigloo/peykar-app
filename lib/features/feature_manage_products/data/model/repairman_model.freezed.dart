// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repairman_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RepairmanModel {

 String get id;@JsonKey(name: 'first_name') String? get firstName;@JsonKey(name: 'last_name') String? get lastName; String? get mobile; String? get email;@JsonKey(name: 'role', fromJson: _toList) List<String>? get role; String? get birthday;@JsonKey(name: 'profile_image_id') String? get profileImageId; String? get ostan; String? get shahrestan; String? get address; String? get brand;@JsonKey(name: 'identity_images', fromJson: _toList) List<String>? get identityImages;@JsonKey(name: 'business_license_image', fromJson: _toList) List<String>? get businessLicenseImage;@JsonKey(name: 'phone_numbers', fromJson: _toList) List<String>? get phoneNumbers; LocationModel? get location;@JsonKey(name: 'shop_images', fromJson: _toList) List<String>? get shopImages;@JsonKey(name: 'subscription_code') String? get subscriptionCode;@JsonKey(name: 'referral_code') String? get referralCode;@JsonKey(name: 'occupation_id') String? get occupationId; String? get status;@JsonKey(name: 'referral_count', fromJson: _anyToInt) int? get referralCount;@JsonKey(name: 'has_product', fromJson: _anyToBool) bool? get hasProduct;@JsonKey(name: 'has_service', fromJson: _anyToBool) bool? get hasService;
/// Create a copy of RepairmanModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RepairmanModelCopyWith<RepairmanModel> get copyWith => _$RepairmanModelCopyWithImpl<RepairmanModel>(this as RepairmanModel, _$identity);

  /// Serializes this RepairmanModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RepairmanModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RepairmanModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.firstName, _this.firstName) || other.firstName == _this.firstName)&&(identical(other.lastName, _this.lastName) || other.lastName == _this.lastName)&&(identical(other.mobile, _this.mobile) || other.mobile == _this.mobile)&&(identical(other.email, _this.email) || other.email == _this.email)&&const DeepCollectionEquality().equals(other.role, _this.role)&&(identical(other.birthday, _this.birthday) || other.birthday == _this.birthday)&&(identical(other.profileImageId, _this.profileImageId) || other.profileImageId == _this.profileImageId)&&(identical(other.ostan, _this.ostan) || other.ostan == _this.ostan)&&(identical(other.shahrestan, _this.shahrestan) || other.shahrestan == _this.shahrestan)&&(identical(other.address, _this.address) || other.address == _this.address)&&(identical(other.brand, _this.brand) || other.brand == _this.brand)&&const DeepCollectionEquality().equals(other.identityImages, _this.identityImages)&&const DeepCollectionEquality().equals(other.businessLicenseImage, _this.businessLicenseImage)&&const DeepCollectionEquality().equals(other.phoneNumbers, _this.phoneNumbers)&&(identical(other.location, _this.location) || other.location == _this.location)&&const DeepCollectionEquality().equals(other.shopImages, _this.shopImages)&&(identical(other.subscriptionCode, _this.subscriptionCode) || other.subscriptionCode == _this.subscriptionCode)&&(identical(other.referralCode, _this.referralCode) || other.referralCode == _this.referralCode)&&(identical(other.occupationId, _this.occupationId) || other.occupationId == _this.occupationId)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.referralCount, _this.referralCount) || other.referralCount == _this.referralCount)&&(identical(other.hasProduct, _this.hasProduct) || other.hasProduct == _this.hasProduct)&&(identical(other.hasService, _this.hasService) || other.hasService == _this.hasService));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RepairmanModel;
  return Object.hashAll([runtimeType,_this.id,_this.firstName,_this.lastName,_this.mobile,_this.email,const DeepCollectionEquality().hash(_this.role),_this.birthday,_this.profileImageId,_this.ostan,_this.shahrestan,_this.address,_this.brand,const DeepCollectionEquality().hash(_this.identityImages),const DeepCollectionEquality().hash(_this.businessLicenseImage),const DeepCollectionEquality().hash(_this.phoneNumbers),_this.location,const DeepCollectionEquality().hash(_this.shopImages),_this.subscriptionCode,_this.referralCode,_this.occupationId,_this.status,_this.referralCount,_this.hasProduct,_this.hasService]);
}

@override
String toString() {
  final _this = this as RepairmanModel;
  return 'RepairmanModel(id: ${_this.id}, firstName: ${_this.firstName}, lastName: ${_this.lastName}, mobile: ${_this.mobile}, email: ${_this.email}, role: ${_this.role}, birthday: ${_this.birthday}, profileImageId: ${_this.profileImageId}, ostan: ${_this.ostan}, shahrestan: ${_this.shahrestan}, address: ${_this.address}, brand: ${_this.brand}, identityImages: ${_this.identityImages}, businessLicenseImage: ${_this.businessLicenseImage}, phoneNumbers: ${_this.phoneNumbers}, location: ${_this.location}, shopImages: ${_this.shopImages}, subscriptionCode: ${_this.subscriptionCode}, referralCode: ${_this.referralCode}, occupationId: ${_this.occupationId}, status: ${_this.status}, referralCount: ${_this.referralCount}, hasProduct: ${_this.hasProduct}, hasService: ${_this.hasService})';
}


}

/// @nodoc
abstract mixin class $RepairmanModelCopyWith<$Res>  {
  factory $RepairmanModelCopyWith(RepairmanModel value, $Res Function(RepairmanModel) _then) = _$RepairmanModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'first_name') String? firstName,@JsonKey(name: 'last_name') String? lastName, String? mobile, String? email,@JsonKey(name: 'role', fromJson: _toList) List<String>? role, String? birthday,@JsonKey(name: 'profile_image_id') String? profileImageId, String? ostan, String? shahrestan, String? address, String? brand,@JsonKey(name: 'identity_images', fromJson: _toList) List<String>? identityImages,@JsonKey(name: 'business_license_image', fromJson: _toList) List<String>? businessLicenseImage,@JsonKey(name: 'phone_numbers', fromJson: _toList) List<String>? phoneNumbers, LocationModel? location,@JsonKey(name: 'shop_images', fromJson: _toList) List<String>? shopImages,@JsonKey(name: 'subscription_code') String? subscriptionCode,@JsonKey(name: 'referral_code') String? referralCode,@JsonKey(name: 'occupation_id') String? occupationId, String? status,@JsonKey(name: 'referral_count', fromJson: _anyToInt) int? referralCount,@JsonKey(name: 'has_product', fromJson: _anyToBool) bool? hasProduct,@JsonKey(name: 'has_service', fromJson: _anyToBool) bool? hasService
});


$LocationModelCopyWith<$Res>? get location;

}
/// @nodoc
class _$RepairmanModelCopyWithImpl<$Res>
    implements $RepairmanModelCopyWith<$Res> {
  _$RepairmanModelCopyWithImpl(this._self, this._then);

  final RepairmanModel _self;
  final $Res Function(RepairmanModel) _then;

/// Create a copy of RepairmanModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? firstName = freezed,Object? lastName = freezed,Object? mobile = freezed,Object? email = freezed,Object? role = freezed,Object? birthday = freezed,Object? profileImageId = freezed,Object? ostan = freezed,Object? shahrestan = freezed,Object? address = freezed,Object? brand = freezed,Object? identityImages = freezed,Object? businessLicenseImage = freezed,Object? phoneNumbers = freezed,Object? location = freezed,Object? shopImages = freezed,Object? subscriptionCode = freezed,Object? referralCode = freezed,Object? occupationId = freezed,Object? status = freezed,Object? referralCount = freezed,Object? hasProduct = freezed,Object? hasService = freezed,}) {
  return _then(RepairmanModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,mobile: freezed == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as List<String>?,birthday: freezed == birthday ? _self.birthday : birthday // ignore: cast_nullable_to_non_nullable
as String?,profileImageId: freezed == profileImageId ? _self.profileImageId : profileImageId // ignore: cast_nullable_to_non_nullable
as String?,ostan: freezed == ostan ? _self.ostan : ostan // ignore: cast_nullable_to_non_nullable
as String?,shahrestan: freezed == shahrestan ? _self.shahrestan : shahrestan // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,identityImages: freezed == identityImages ? _self.identityImages : identityImages // ignore: cast_nullable_to_non_nullable
as List<String>?,businessLicenseImage: freezed == businessLicenseImage ? _self.businessLicenseImage : businessLicenseImage // ignore: cast_nullable_to_non_nullable
as List<String>?,phoneNumbers: freezed == phoneNumbers ? _self.phoneNumbers : phoneNumbers // ignore: cast_nullable_to_non_nullable
as List<String>?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as LocationModel?,shopImages: freezed == shopImages ? _self.shopImages : shopImages // ignore: cast_nullable_to_non_nullable
as List<String>?,subscriptionCode: freezed == subscriptionCode ? _self.subscriptionCode : subscriptionCode // ignore: cast_nullable_to_non_nullable
as String?,referralCode: freezed == referralCode ? _self.referralCode : referralCode // ignore: cast_nullable_to_non_nullable
as String?,occupationId: freezed == occupationId ? _self.occupationId : occupationId // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,referralCount: freezed == referralCount ? _self.referralCount : referralCount // ignore: cast_nullable_to_non_nullable
as int?,hasProduct: freezed == hasProduct ? _self.hasProduct : hasProduct // ignore: cast_nullable_to_non_nullable
as bool?,hasService: freezed == hasService ? _self.hasService : hasService // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}
/// Create a copy of RepairmanModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationModelCopyWith<$Res>? get location {
    if (_self.location == null) {
    return null;
  }

  return $LocationModelCopyWith<$Res>(_self.location!, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}


/// Adds pattern-matching-related methods to [RepairmanModel].
extension RepairmanModelPatterns on RepairmanModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RepairmanModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RepairmanModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RepairmanModel value)  $default,){
final _that = this;
switch (_that) {
case _RepairmanModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RepairmanModel value)?  $default,){
final _that = this;
switch (_that) {
case _RepairmanModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'first_name')  String? firstName, @JsonKey(name: 'last_name')  String? lastName,  String? mobile,  String? email, @JsonKey(name: 'role', fromJson: _toList)  List<String>? role,  String? birthday, @JsonKey(name: 'profile_image_id')  String? profileImageId,  String? ostan,  String? shahrestan,  String? address,  String? brand, @JsonKey(name: 'identity_images', fromJson: _toList)  List<String>? identityImages, @JsonKey(name: 'business_license_image', fromJson: _toList)  List<String>? businessLicenseImage, @JsonKey(name: 'phone_numbers', fromJson: _toList)  List<String>? phoneNumbers,  LocationModel? location, @JsonKey(name: 'shop_images', fromJson: _toList)  List<String>? shopImages, @JsonKey(name: 'subscription_code')  String? subscriptionCode, @JsonKey(name: 'referral_code')  String? referralCode, @JsonKey(name: 'occupation_id')  String? occupationId,  String? status, @JsonKey(name: 'referral_count', fromJson: _anyToInt)  int? referralCount, @JsonKey(name: 'has_product', fromJson: _anyToBool)  bool? hasProduct, @JsonKey(name: 'has_service', fromJson: _anyToBool)  bool? hasService)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RepairmanModel() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.mobile,_that.email,_that.role,_that.birthday,_that.profileImageId,_that.ostan,_that.shahrestan,_that.address,_that.brand,_that.identityImages,_that.businessLicenseImage,_that.phoneNumbers,_that.location,_that.shopImages,_that.subscriptionCode,_that.referralCode,_that.occupationId,_that.status,_that.referralCount,_that.hasProduct,_that.hasService);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'first_name')  String? firstName, @JsonKey(name: 'last_name')  String? lastName,  String? mobile,  String? email, @JsonKey(name: 'role', fromJson: _toList)  List<String>? role,  String? birthday, @JsonKey(name: 'profile_image_id')  String? profileImageId,  String? ostan,  String? shahrestan,  String? address,  String? brand, @JsonKey(name: 'identity_images', fromJson: _toList)  List<String>? identityImages, @JsonKey(name: 'business_license_image', fromJson: _toList)  List<String>? businessLicenseImage, @JsonKey(name: 'phone_numbers', fromJson: _toList)  List<String>? phoneNumbers,  LocationModel? location, @JsonKey(name: 'shop_images', fromJson: _toList)  List<String>? shopImages, @JsonKey(name: 'subscription_code')  String? subscriptionCode, @JsonKey(name: 'referral_code')  String? referralCode, @JsonKey(name: 'occupation_id')  String? occupationId,  String? status, @JsonKey(name: 'referral_count', fromJson: _anyToInt)  int? referralCount, @JsonKey(name: 'has_product', fromJson: _anyToBool)  bool? hasProduct, @JsonKey(name: 'has_service', fromJson: _anyToBool)  bool? hasService)  $default,) {final _that = this;
switch (_that) {
case _RepairmanModel():
return $default(_that.id,_that.firstName,_that.lastName,_that.mobile,_that.email,_that.role,_that.birthday,_that.profileImageId,_that.ostan,_that.shahrestan,_that.address,_that.brand,_that.identityImages,_that.businessLicenseImage,_that.phoneNumbers,_that.location,_that.shopImages,_that.subscriptionCode,_that.referralCode,_that.occupationId,_that.status,_that.referralCount,_that.hasProduct,_that.hasService);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'first_name')  String? firstName, @JsonKey(name: 'last_name')  String? lastName,  String? mobile,  String? email, @JsonKey(name: 'role', fromJson: _toList)  List<String>? role,  String? birthday, @JsonKey(name: 'profile_image_id')  String? profileImageId,  String? ostan,  String? shahrestan,  String? address,  String? brand, @JsonKey(name: 'identity_images', fromJson: _toList)  List<String>? identityImages, @JsonKey(name: 'business_license_image', fromJson: _toList)  List<String>? businessLicenseImage, @JsonKey(name: 'phone_numbers', fromJson: _toList)  List<String>? phoneNumbers,  LocationModel? location, @JsonKey(name: 'shop_images', fromJson: _toList)  List<String>? shopImages, @JsonKey(name: 'subscription_code')  String? subscriptionCode, @JsonKey(name: 'referral_code')  String? referralCode, @JsonKey(name: 'occupation_id')  String? occupationId,  String? status, @JsonKey(name: 'referral_count', fromJson: _anyToInt)  int? referralCount, @JsonKey(name: 'has_product', fromJson: _anyToBool)  bool? hasProduct, @JsonKey(name: 'has_service', fromJson: _anyToBool)  bool? hasService)?  $default,) {final _that = this;
switch (_that) {
case _RepairmanModel() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.mobile,_that.email,_that.role,_that.birthday,_that.profileImageId,_that.ostan,_that.shahrestan,_that.address,_that.brand,_that.identityImages,_that.businessLicenseImage,_that.phoneNumbers,_that.location,_that.shopImages,_that.subscriptionCode,_that.referralCode,_that.occupationId,_that.status,_that.referralCount,_that.hasProduct,_that.hasService);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RepairmanModel extends RepairmanModel {
  const _RepairmanModel({this.id = '', @JsonKey(name: 'first_name') this.firstName, @JsonKey(name: 'last_name') this.lastName, this.mobile, this.email, @JsonKey(name: 'role', fromJson: _toList)  List<String>? role, this.birthday, @JsonKey(name: 'profile_image_id') this.profileImageId, this.ostan, this.shahrestan, this.address, this.brand, @JsonKey(name: 'identity_images', fromJson: _toList)  List<String>? identityImages, @JsonKey(name: 'business_license_image', fromJson: _toList)  List<String>? businessLicenseImage, @JsonKey(name: 'phone_numbers', fromJson: _toList)  List<String>? phoneNumbers, this.location, @JsonKey(name: 'shop_images', fromJson: _toList)  List<String>? shopImages, @JsonKey(name: 'subscription_code') this.subscriptionCode, @JsonKey(name: 'referral_code') this.referralCode, @JsonKey(name: 'occupation_id') this.occupationId, this.status, @JsonKey(name: 'referral_count', fromJson: _anyToInt) this.referralCount, @JsonKey(name: 'has_product', fromJson: _anyToBool) this.hasProduct, @JsonKey(name: 'has_service', fromJson: _anyToBool) this.hasService}): _role = role,_identityImages = identityImages,_businessLicenseImage = businessLicenseImage,_phoneNumbers = phoneNumbers,_shopImages = shopImages,super._();
  factory _RepairmanModel.fromJson(Map<String, dynamic> json) => _$RepairmanModelFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey(name: 'first_name') final  String? firstName;
@override@JsonKey(name: 'last_name') final  String? lastName;
@override final  String? mobile;
@override final  String? email;
 final  List<String>? _role;
@override@JsonKey(name: 'role', fromJson: _toList) List<String>? get role {
  final value = _role;
  if (value == null) return null;
  if (_role is EqualUnmodifiableListView) return _role;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? birthday;
@override@JsonKey(name: 'profile_image_id') final  String? profileImageId;
@override final  String? ostan;
@override final  String? shahrestan;
@override final  String? address;
@override final  String? brand;
 final  List<String>? _identityImages;
@override@JsonKey(name: 'identity_images', fromJson: _toList) List<String>? get identityImages {
  final value = _identityImages;
  if (value == null) return null;
  if (_identityImages is EqualUnmodifiableListView) return _identityImages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _businessLicenseImage;
@override@JsonKey(name: 'business_license_image', fromJson: _toList) List<String>? get businessLicenseImage {
  final value = _businessLicenseImage;
  if (value == null) return null;
  if (_businessLicenseImage is EqualUnmodifiableListView) return _businessLicenseImage;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _phoneNumbers;
@override@JsonKey(name: 'phone_numbers', fromJson: _toList) List<String>? get phoneNumbers {
  final value = _phoneNumbers;
  if (value == null) return null;
  if (_phoneNumbers is EqualUnmodifiableListView) return _phoneNumbers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  LocationModel? location;
 final  List<String>? _shopImages;
@override@JsonKey(name: 'shop_images', fromJson: _toList) List<String>? get shopImages {
  final value = _shopImages;
  if (value == null) return null;
  if (_shopImages is EqualUnmodifiableListView) return _shopImages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'subscription_code') final  String? subscriptionCode;
@override@JsonKey(name: 'referral_code') final  String? referralCode;
@override@JsonKey(name: 'occupation_id') final  String? occupationId;
@override final  String? status;
@override@JsonKey(name: 'referral_count', fromJson: _anyToInt) final  int? referralCount;
@override@JsonKey(name: 'has_product', fromJson: _anyToBool) final  bool? hasProduct;
@override@JsonKey(name: 'has_service', fromJson: _anyToBool) final  bool? hasService;

/// Create a copy of RepairmanModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RepairmanModelCopyWith<_RepairmanModel> get copyWith => __$RepairmanModelCopyWithImpl<_RepairmanModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RepairmanModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RepairmanModel&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.mobile, mobile) || other.mobile == mobile)&&(identical(other.email, email) || other.email == email)&&const DeepCollectionEquality().equals(other.role, _role)&&(identical(other.birthday, birthday) || other.birthday == birthday)&&(identical(other.profileImageId, profileImageId) || other.profileImageId == profileImageId)&&(identical(other.ostan, ostan) || other.ostan == ostan)&&(identical(other.shahrestan, shahrestan) || other.shahrestan == shahrestan)&&(identical(other.address, address) || other.address == address)&&(identical(other.brand, brand) || other.brand == brand)&&const DeepCollectionEquality().equals(other.identityImages, _identityImages)&&const DeepCollectionEquality().equals(other.businessLicenseImage, _businessLicenseImage)&&const DeepCollectionEquality().equals(other.phoneNumbers, _phoneNumbers)&&(identical(other.location, location) || other.location == location)&&const DeepCollectionEquality().equals(other.shopImages, _shopImages)&&(identical(other.subscriptionCode, subscriptionCode) || other.subscriptionCode == subscriptionCode)&&(identical(other.referralCode, referralCode) || other.referralCode == referralCode)&&(identical(other.occupationId, occupationId) || other.occupationId == occupationId)&&(identical(other.status, status) || other.status == status)&&(identical(other.referralCount, referralCount) || other.referralCount == referralCount)&&(identical(other.hasProduct, hasProduct) || other.hasProduct == hasProduct)&&(identical(other.hasService, hasService) || other.hasService == hasService));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hashAll([runtimeType,id,firstName,lastName,mobile,email,const DeepCollectionEquality().hash(_role),birthday,profileImageId,ostan,shahrestan,address,brand,const DeepCollectionEquality().hash(_identityImages),const DeepCollectionEquality().hash(_businessLicenseImage),const DeepCollectionEquality().hash(_phoneNumbers),location,const DeepCollectionEquality().hash(_shopImages),subscriptionCode,referralCode,occupationId,status,referralCount,hasProduct,hasService]);
}

@override
String toString() {
    return 'RepairmanModel(id: $id, firstName: $firstName, lastName: $lastName, mobile: $mobile, email: $email, role: $role, birthday: $birthday, profileImageId: $profileImageId, ostan: $ostan, shahrestan: $shahrestan, address: $address, brand: $brand, identityImages: $identityImages, businessLicenseImage: $businessLicenseImage, phoneNumbers: $phoneNumbers, location: $location, shopImages: $shopImages, subscriptionCode: $subscriptionCode, referralCode: $referralCode, occupationId: $occupationId, status: $status, referralCount: $referralCount, hasProduct: $hasProduct, hasService: $hasService)';
}


}

/// @nodoc
abstract mixin class _$RepairmanModelCopyWith<$Res> implements $RepairmanModelCopyWith<$Res> {
  factory _$RepairmanModelCopyWith(_RepairmanModel value, $Res Function(_RepairmanModel) _then) = __$RepairmanModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'first_name') String? firstName,@JsonKey(name: 'last_name') String? lastName, String? mobile, String? email,@JsonKey(name: 'role', fromJson: _toList) List<String>? role, String? birthday,@JsonKey(name: 'profile_image_id') String? profileImageId, String? ostan, String? shahrestan, String? address, String? brand,@JsonKey(name: 'identity_images', fromJson: _toList) List<String>? identityImages,@JsonKey(name: 'business_license_image', fromJson: _toList) List<String>? businessLicenseImage,@JsonKey(name: 'phone_numbers', fromJson: _toList) List<String>? phoneNumbers, LocationModel? location,@JsonKey(name: 'shop_images', fromJson: _toList) List<String>? shopImages,@JsonKey(name: 'subscription_code') String? subscriptionCode,@JsonKey(name: 'referral_code') String? referralCode,@JsonKey(name: 'occupation_id') String? occupationId, String? status,@JsonKey(name: 'referral_count', fromJson: _anyToInt) int? referralCount,@JsonKey(name: 'has_product', fromJson: _anyToBool) bool? hasProduct,@JsonKey(name: 'has_service', fromJson: _anyToBool) bool? hasService
});


@override $LocationModelCopyWith<$Res>? get location;

}
/// @nodoc
class __$RepairmanModelCopyWithImpl<$Res>
    implements _$RepairmanModelCopyWith<$Res> {
  __$RepairmanModelCopyWithImpl(this._self, this._then);

  final _RepairmanModel _self;
  final $Res Function(_RepairmanModel) _then;

/// Create a copy of RepairmanModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? firstName = freezed,Object? lastName = freezed,Object? mobile = freezed,Object? email = freezed,Object? role = freezed,Object? birthday = freezed,Object? profileImageId = freezed,Object? ostan = freezed,Object? shahrestan = freezed,Object? address = freezed,Object? brand = freezed,Object? identityImages = freezed,Object? businessLicenseImage = freezed,Object? phoneNumbers = freezed,Object? location = freezed,Object? shopImages = freezed,Object? subscriptionCode = freezed,Object? referralCode = freezed,Object? occupationId = freezed,Object? status = freezed,Object? referralCount = freezed,Object? hasProduct = freezed,Object? hasService = freezed,}) {
  return _then(_RepairmanModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,mobile: freezed == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self._role : role // ignore: cast_nullable_to_non_nullable
as List<String>?,birthday: freezed == birthday ? _self.birthday : birthday // ignore: cast_nullable_to_non_nullable
as String?,profileImageId: freezed == profileImageId ? _self.profileImageId : profileImageId // ignore: cast_nullable_to_non_nullable
as String?,ostan: freezed == ostan ? _self.ostan : ostan // ignore: cast_nullable_to_non_nullable
as String?,shahrestan: freezed == shahrestan ? _self.shahrestan : shahrestan // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,identityImages: freezed == identityImages ? _self._identityImages : identityImages // ignore: cast_nullable_to_non_nullable
as List<String>?,businessLicenseImage: freezed == businessLicenseImage ? _self._businessLicenseImage : businessLicenseImage // ignore: cast_nullable_to_non_nullable
as List<String>?,phoneNumbers: freezed == phoneNumbers ? _self._phoneNumbers : phoneNumbers // ignore: cast_nullable_to_non_nullable
as List<String>?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as LocationModel?,shopImages: freezed == shopImages ? _self._shopImages : shopImages // ignore: cast_nullable_to_non_nullable
as List<String>?,subscriptionCode: freezed == subscriptionCode ? _self.subscriptionCode : subscriptionCode // ignore: cast_nullable_to_non_nullable
as String?,referralCode: freezed == referralCode ? _self.referralCode : referralCode // ignore: cast_nullable_to_non_nullable
as String?,occupationId: freezed == occupationId ? _self.occupationId : occupationId // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,referralCount: freezed == referralCount ? _self.referralCount : referralCount // ignore: cast_nullable_to_non_nullable
as int?,hasProduct: freezed == hasProduct ? _self.hasProduct : hasProduct // ignore: cast_nullable_to_non_nullable
as bool?,hasService: freezed == hasService ? _self.hasService : hasService // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

/// Create a copy of RepairmanModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationModelCopyWith<$Res>? get location {
    if (_self.location == null) {
    return null;
  }

  return $LocationModelCopyWith<$Res>(_self.location!, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}


/// @nodoc
mixin _$LocationModel {

@JsonKey(fromJson: _anyToDouble) double get lat;@JsonKey(fromJson: _anyToDouble) double get lng;
/// Create a copy of LocationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationModelCopyWith<LocationModel> get copyWith => _$LocationModelCopyWithImpl<LocationModel>(this as LocationModel, _$identity);

  /// Serializes this LocationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as LocationModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationModel&&(identical(other.lat, _this.lat) || other.lat == _this.lat)&&(identical(other.lng, _this.lng) || other.lng == _this.lng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as LocationModel;
  return Object.hash(runtimeType,_this.lat,_this.lng);
}

@override
String toString() {
  final _this = this as LocationModel;
  return 'LocationModel(lat: ${_this.lat}, lng: ${_this.lng})';
}


}

/// @nodoc
abstract mixin class $LocationModelCopyWith<$Res>  {
  factory $LocationModelCopyWith(LocationModel value, $Res Function(LocationModel) _then) = _$LocationModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _anyToDouble) double lat,@JsonKey(fromJson: _anyToDouble) double lng
});




}
/// @nodoc
class _$LocationModelCopyWithImpl<$Res>
    implements $LocationModelCopyWith<$Res> {
  _$LocationModelCopyWithImpl(this._self, this._then);

  final LocationModel _self;
  final $Res Function(LocationModel) _then;

/// Create a copy of LocationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lat = null,Object? lng = null,}) {
  return _then(LocationModel(
lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [LocationModel].
extension LocationModelPatterns on LocationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocationModel value)  $default,){
final _that = this;
switch (_that) {
case _LocationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocationModel value)?  $default,){
final _that = this;
switch (_that) {
case _LocationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _anyToDouble)  double lat, @JsonKey(fromJson: _anyToDouble)  double lng)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocationModel() when $default != null:
return $default(_that.lat,_that.lng);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _anyToDouble)  double lat, @JsonKey(fromJson: _anyToDouble)  double lng)  $default,) {final _that = this;
switch (_that) {
case _LocationModel():
return $default(_that.lat,_that.lng);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _anyToDouble)  double lat, @JsonKey(fromJson: _anyToDouble)  double lng)?  $default,) {final _that = this;
switch (_that) {
case _LocationModel() when $default != null:
return $default(_that.lat,_that.lng);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LocationModel extends LocationModel {
  const _LocationModel({@JsonKey(fromJson: _anyToDouble) this.lat = 0.0, @JsonKey(fromJson: _anyToDouble) this.lng = 0.0}): super._();
  factory _LocationModel.fromJson(Map<String, dynamic> json) => _$LocationModelFromJson(json);

@override@JsonKey(fromJson: _anyToDouble) final  double lat;
@override@JsonKey(fromJson: _anyToDouble) final  double lng;

/// Create a copy of LocationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocationModelCopyWith<_LocationModel> get copyWith => __$LocationModelCopyWithImpl<_LocationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocationModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocationModel&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,lat,lng);
}

@override
String toString() {
    return 'LocationModel(lat: $lat, lng: $lng)';
}


}

/// @nodoc
abstract mixin class _$LocationModelCopyWith<$Res> implements $LocationModelCopyWith<$Res> {
  factory _$LocationModelCopyWith(_LocationModel value, $Res Function(_LocationModel) _then) = __$LocationModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _anyToDouble) double lat,@JsonKey(fromJson: _anyToDouble) double lng
});




}
/// @nodoc
class __$LocationModelCopyWithImpl<$Res>
    implements _$LocationModelCopyWith<$Res> {
  __$LocationModelCopyWithImpl(this._self, this._then);

  final _LocationModel _self;
  final $Res Function(_LocationModel) _then;

/// Create a copy of LocationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lat = null,Object? lng = null,}) {
  return _then(_LocationModel(
lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
