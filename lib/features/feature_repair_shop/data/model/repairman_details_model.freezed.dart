// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repairman_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RepairmanDetailsModel {

 String get id;@JsonKey(name: 'first_name') String? get firstName;@JsonKey(name: 'last_name') String? get lastName; String? get mobile; String? get email;@JsonKey(fromJson: _toList) List<String>? get role; String? get birthday;@JsonKey(name: 'profile_image_id') String? get profileImageId; String? get ostan; String? get shahrestan; String? get brand;@JsonKey(name: 'identity_images', fromJson: _toList) List<String>? get identityImages;@JsonKey(name: 'business_license_image', fromJson: _toList) List<String>? get businessLicenseImage;@JsonKey(name: 'phone_numbers', fromJson: _toList) List<String>? get phoneNumbers; Map<String, dynamic>? get location;@JsonKey(name: 'shop_images', fromJson: _toList) List<String>? get shopImages;@JsonKey(name: 'subscription_code') String? get subscriptionCode;@JsonKey(name: 'referral_code') String? get referralCode;@JsonKey(name: 'occupation_id') String? get occupationId; String? get status; String? get address;@JsonKey(name: 'referral_count', fromJson: _anyToInt) int? get referralCount;@JsonKey(name: 'has_product', fromJson: _anyToBool) bool? get hasProduct;@JsonKey(name: 'has_service', fromJson: _anyToBool) bool? get hasService;@JsonKey(name: 'distance_km', fromJson: _anyToDouble) double? get distanceKm;@JsonKey(name: 'rating_average', fromJson: _anyToDouble) double? get ratingAverage;@JsonKey(name: 'ratings_count', fromJson: _anyToInt) int? get ratingsCount;
/// Create a copy of RepairmanDetailsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RepairmanDetailsModelCopyWith<RepairmanDetailsModel> get copyWith => _$RepairmanDetailsModelCopyWithImpl<RepairmanDetailsModel>(this as RepairmanDetailsModel, _$identity);

  /// Serializes this RepairmanDetailsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RepairmanDetailsModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RepairmanDetailsModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.firstName, _this.firstName) || other.firstName == _this.firstName)&&(identical(other.lastName, _this.lastName) || other.lastName == _this.lastName)&&(identical(other.mobile, _this.mobile) || other.mobile == _this.mobile)&&(identical(other.email, _this.email) || other.email == _this.email)&&const DeepCollectionEquality().equals(other.role, _this.role)&&(identical(other.birthday, _this.birthday) || other.birthday == _this.birthday)&&(identical(other.profileImageId, _this.profileImageId) || other.profileImageId == _this.profileImageId)&&(identical(other.ostan, _this.ostan) || other.ostan == _this.ostan)&&(identical(other.shahrestan, _this.shahrestan) || other.shahrestan == _this.shahrestan)&&(identical(other.brand, _this.brand) || other.brand == _this.brand)&&const DeepCollectionEquality().equals(other.identityImages, _this.identityImages)&&const DeepCollectionEquality().equals(other.businessLicenseImage, _this.businessLicenseImage)&&const DeepCollectionEquality().equals(other.phoneNumbers, _this.phoneNumbers)&&const DeepCollectionEquality().equals(other.location, _this.location)&&const DeepCollectionEquality().equals(other.shopImages, _this.shopImages)&&(identical(other.subscriptionCode, _this.subscriptionCode) || other.subscriptionCode == _this.subscriptionCode)&&(identical(other.referralCode, _this.referralCode) || other.referralCode == _this.referralCode)&&(identical(other.occupationId, _this.occupationId) || other.occupationId == _this.occupationId)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.address, _this.address) || other.address == _this.address)&&(identical(other.referralCount, _this.referralCount) || other.referralCount == _this.referralCount)&&(identical(other.hasProduct, _this.hasProduct) || other.hasProduct == _this.hasProduct)&&(identical(other.hasService, _this.hasService) || other.hasService == _this.hasService)&&(identical(other.distanceKm, _this.distanceKm) || other.distanceKm == _this.distanceKm)&&(identical(other.ratingAverage, _this.ratingAverage) || other.ratingAverage == _this.ratingAverage)&&(identical(other.ratingsCount, _this.ratingsCount) || other.ratingsCount == _this.ratingsCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RepairmanDetailsModel;
  return Object.hashAll([runtimeType,_this.id,_this.firstName,_this.lastName,_this.mobile,_this.email,const DeepCollectionEquality().hash(_this.role),_this.birthday,_this.profileImageId,_this.ostan,_this.shahrestan,_this.brand,const DeepCollectionEquality().hash(_this.identityImages),const DeepCollectionEquality().hash(_this.businessLicenseImage),const DeepCollectionEquality().hash(_this.phoneNumbers),const DeepCollectionEquality().hash(_this.location),const DeepCollectionEquality().hash(_this.shopImages),_this.subscriptionCode,_this.referralCode,_this.occupationId,_this.status,_this.address,_this.referralCount,_this.hasProduct,_this.hasService,_this.distanceKm,_this.ratingAverage,_this.ratingsCount]);
}

@override
String toString() {
  final _this = this as RepairmanDetailsModel;
  return 'RepairmanDetailsModel(id: ${_this.id}, firstName: ${_this.firstName}, lastName: ${_this.lastName}, mobile: ${_this.mobile}, email: ${_this.email}, role: ${_this.role}, birthday: ${_this.birthday}, profileImageId: ${_this.profileImageId}, ostan: ${_this.ostan}, shahrestan: ${_this.shahrestan}, brand: ${_this.brand}, identityImages: ${_this.identityImages}, businessLicenseImage: ${_this.businessLicenseImage}, phoneNumbers: ${_this.phoneNumbers}, location: ${_this.location}, shopImages: ${_this.shopImages}, subscriptionCode: ${_this.subscriptionCode}, referralCode: ${_this.referralCode}, occupationId: ${_this.occupationId}, status: ${_this.status}, address: ${_this.address}, referralCount: ${_this.referralCount}, hasProduct: ${_this.hasProduct}, hasService: ${_this.hasService}, distanceKm: ${_this.distanceKm}, ratingAverage: ${_this.ratingAverage}, ratingsCount: ${_this.ratingsCount})';
}


}

/// @nodoc
abstract mixin class $RepairmanDetailsModelCopyWith<$Res>  {
  factory $RepairmanDetailsModelCopyWith(RepairmanDetailsModel value, $Res Function(RepairmanDetailsModel) _then) = _$RepairmanDetailsModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'first_name') String? firstName,@JsonKey(name: 'last_name') String? lastName, String? mobile, String? email,@JsonKey(fromJson: _toList) List<String>? role, String? birthday,@JsonKey(name: 'profile_image_id') String? profileImageId, String? ostan, String? shahrestan, String? brand,@JsonKey(name: 'identity_images', fromJson: _toList) List<String>? identityImages,@JsonKey(name: 'business_license_image', fromJson: _toList) List<String>? businessLicenseImage,@JsonKey(name: 'phone_numbers', fromJson: _toList) List<String>? phoneNumbers, Map<String, dynamic>? location,@JsonKey(name: 'shop_images', fromJson: _toList) List<String>? shopImages,@JsonKey(name: 'subscription_code') String? subscriptionCode,@JsonKey(name: 'referral_code') String? referralCode,@JsonKey(name: 'occupation_id') String? occupationId, String? status, String? address,@JsonKey(name: 'referral_count', fromJson: _anyToInt) int? referralCount,@JsonKey(name: 'has_product', fromJson: _anyToBool) bool? hasProduct,@JsonKey(name: 'has_service', fromJson: _anyToBool) bool? hasService,@JsonKey(name: 'distance_km', fromJson: _anyToDouble) double? distanceKm,@JsonKey(name: 'rating_average', fromJson: _anyToDouble) double? ratingAverage,@JsonKey(name: 'ratings_count', fromJson: _anyToInt) int? ratingsCount
});




}
/// @nodoc
class _$RepairmanDetailsModelCopyWithImpl<$Res>
    implements $RepairmanDetailsModelCopyWith<$Res> {
  _$RepairmanDetailsModelCopyWithImpl(this._self, this._then);

  final RepairmanDetailsModel _self;
  final $Res Function(RepairmanDetailsModel) _then;

/// Create a copy of RepairmanDetailsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? firstName = freezed,Object? lastName = freezed,Object? mobile = freezed,Object? email = freezed,Object? role = freezed,Object? birthday = freezed,Object? profileImageId = freezed,Object? ostan = freezed,Object? shahrestan = freezed,Object? brand = freezed,Object? identityImages = freezed,Object? businessLicenseImage = freezed,Object? phoneNumbers = freezed,Object? location = freezed,Object? shopImages = freezed,Object? subscriptionCode = freezed,Object? referralCode = freezed,Object? occupationId = freezed,Object? status = freezed,Object? address = freezed,Object? referralCount = freezed,Object? hasProduct = freezed,Object? hasService = freezed,Object? distanceKm = freezed,Object? ratingAverage = freezed,Object? ratingsCount = freezed,}) {
  return _then(RepairmanDetailsModel(
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
as String?,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,identityImages: freezed == identityImages ? _self.identityImages : identityImages // ignore: cast_nullable_to_non_nullable
as List<String>?,businessLicenseImage: freezed == businessLicenseImage ? _self.businessLicenseImage : businessLicenseImage // ignore: cast_nullable_to_non_nullable
as List<String>?,phoneNumbers: freezed == phoneNumbers ? _self.phoneNumbers : phoneNumbers // ignore: cast_nullable_to_non_nullable
as List<String>?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,shopImages: freezed == shopImages ? _self.shopImages : shopImages // ignore: cast_nullable_to_non_nullable
as List<String>?,subscriptionCode: freezed == subscriptionCode ? _self.subscriptionCode : subscriptionCode // ignore: cast_nullable_to_non_nullable
as String?,referralCode: freezed == referralCode ? _self.referralCode : referralCode // ignore: cast_nullable_to_non_nullable
as String?,occupationId: freezed == occupationId ? _self.occupationId : occupationId // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,referralCount: freezed == referralCount ? _self.referralCount : referralCount // ignore: cast_nullable_to_non_nullable
as int?,hasProduct: freezed == hasProduct ? _self.hasProduct : hasProduct // ignore: cast_nullable_to_non_nullable
as bool?,hasService: freezed == hasService ? _self.hasService : hasService // ignore: cast_nullable_to_non_nullable
as bool?,distanceKm: freezed == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as double?,ratingAverage: freezed == ratingAverage ? _self.ratingAverage : ratingAverage // ignore: cast_nullable_to_non_nullable
as double?,ratingsCount: freezed == ratingsCount ? _self.ratingsCount : ratingsCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [RepairmanDetailsModel].
extension RepairmanDetailsModelPatterns on RepairmanDetailsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RepairmanDetailsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RepairmanDetailsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RepairmanDetailsModel value)  $default,){
final _that = this;
switch (_that) {
case _RepairmanDetailsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RepairmanDetailsModel value)?  $default,){
final _that = this;
switch (_that) {
case _RepairmanDetailsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'first_name')  String? firstName, @JsonKey(name: 'last_name')  String? lastName,  String? mobile,  String? email, @JsonKey(fromJson: _toList)  List<String>? role,  String? birthday, @JsonKey(name: 'profile_image_id')  String? profileImageId,  String? ostan,  String? shahrestan,  String? brand, @JsonKey(name: 'identity_images', fromJson: _toList)  List<String>? identityImages, @JsonKey(name: 'business_license_image', fromJson: _toList)  List<String>? businessLicenseImage, @JsonKey(name: 'phone_numbers', fromJson: _toList)  List<String>? phoneNumbers,  Map<String, dynamic>? location, @JsonKey(name: 'shop_images', fromJson: _toList)  List<String>? shopImages, @JsonKey(name: 'subscription_code')  String? subscriptionCode, @JsonKey(name: 'referral_code')  String? referralCode, @JsonKey(name: 'occupation_id')  String? occupationId,  String? status,  String? address, @JsonKey(name: 'referral_count', fromJson: _anyToInt)  int? referralCount, @JsonKey(name: 'has_product', fromJson: _anyToBool)  bool? hasProduct, @JsonKey(name: 'has_service', fromJson: _anyToBool)  bool? hasService, @JsonKey(name: 'distance_km', fromJson: _anyToDouble)  double? distanceKm, @JsonKey(name: 'rating_average', fromJson: _anyToDouble)  double? ratingAverage, @JsonKey(name: 'ratings_count', fromJson: _anyToInt)  int? ratingsCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RepairmanDetailsModel() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.mobile,_that.email,_that.role,_that.birthday,_that.profileImageId,_that.ostan,_that.shahrestan,_that.brand,_that.identityImages,_that.businessLicenseImage,_that.phoneNumbers,_that.location,_that.shopImages,_that.subscriptionCode,_that.referralCode,_that.occupationId,_that.status,_that.address,_that.referralCount,_that.hasProduct,_that.hasService,_that.distanceKm,_that.ratingAverage,_that.ratingsCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'first_name')  String? firstName, @JsonKey(name: 'last_name')  String? lastName,  String? mobile,  String? email, @JsonKey(fromJson: _toList)  List<String>? role,  String? birthday, @JsonKey(name: 'profile_image_id')  String? profileImageId,  String? ostan,  String? shahrestan,  String? brand, @JsonKey(name: 'identity_images', fromJson: _toList)  List<String>? identityImages, @JsonKey(name: 'business_license_image', fromJson: _toList)  List<String>? businessLicenseImage, @JsonKey(name: 'phone_numbers', fromJson: _toList)  List<String>? phoneNumbers,  Map<String, dynamic>? location, @JsonKey(name: 'shop_images', fromJson: _toList)  List<String>? shopImages, @JsonKey(name: 'subscription_code')  String? subscriptionCode, @JsonKey(name: 'referral_code')  String? referralCode, @JsonKey(name: 'occupation_id')  String? occupationId,  String? status,  String? address, @JsonKey(name: 'referral_count', fromJson: _anyToInt)  int? referralCount, @JsonKey(name: 'has_product', fromJson: _anyToBool)  bool? hasProduct, @JsonKey(name: 'has_service', fromJson: _anyToBool)  bool? hasService, @JsonKey(name: 'distance_km', fromJson: _anyToDouble)  double? distanceKm, @JsonKey(name: 'rating_average', fromJson: _anyToDouble)  double? ratingAverage, @JsonKey(name: 'ratings_count', fromJson: _anyToInt)  int? ratingsCount)  $default,) {final _that = this;
switch (_that) {
case _RepairmanDetailsModel():
return $default(_that.id,_that.firstName,_that.lastName,_that.mobile,_that.email,_that.role,_that.birthday,_that.profileImageId,_that.ostan,_that.shahrestan,_that.brand,_that.identityImages,_that.businessLicenseImage,_that.phoneNumbers,_that.location,_that.shopImages,_that.subscriptionCode,_that.referralCode,_that.occupationId,_that.status,_that.address,_that.referralCount,_that.hasProduct,_that.hasService,_that.distanceKm,_that.ratingAverage,_that.ratingsCount);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'first_name')  String? firstName, @JsonKey(name: 'last_name')  String? lastName,  String? mobile,  String? email, @JsonKey(fromJson: _toList)  List<String>? role,  String? birthday, @JsonKey(name: 'profile_image_id')  String? profileImageId,  String? ostan,  String? shahrestan,  String? brand, @JsonKey(name: 'identity_images', fromJson: _toList)  List<String>? identityImages, @JsonKey(name: 'business_license_image', fromJson: _toList)  List<String>? businessLicenseImage, @JsonKey(name: 'phone_numbers', fromJson: _toList)  List<String>? phoneNumbers,  Map<String, dynamic>? location, @JsonKey(name: 'shop_images', fromJson: _toList)  List<String>? shopImages, @JsonKey(name: 'subscription_code')  String? subscriptionCode, @JsonKey(name: 'referral_code')  String? referralCode, @JsonKey(name: 'occupation_id')  String? occupationId,  String? status,  String? address, @JsonKey(name: 'referral_count', fromJson: _anyToInt)  int? referralCount, @JsonKey(name: 'has_product', fromJson: _anyToBool)  bool? hasProduct, @JsonKey(name: 'has_service', fromJson: _anyToBool)  bool? hasService, @JsonKey(name: 'distance_km', fromJson: _anyToDouble)  double? distanceKm, @JsonKey(name: 'rating_average', fromJson: _anyToDouble)  double? ratingAverage, @JsonKey(name: 'ratings_count', fromJson: _anyToInt)  int? ratingsCount)?  $default,) {final _that = this;
switch (_that) {
case _RepairmanDetailsModel() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.mobile,_that.email,_that.role,_that.birthday,_that.profileImageId,_that.ostan,_that.shahrestan,_that.brand,_that.identityImages,_that.businessLicenseImage,_that.phoneNumbers,_that.location,_that.shopImages,_that.subscriptionCode,_that.referralCode,_that.occupationId,_that.status,_that.address,_that.referralCount,_that.hasProduct,_that.hasService,_that.distanceKm,_that.ratingAverage,_that.ratingsCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RepairmanDetailsModel extends RepairmanDetailsModel {
  const _RepairmanDetailsModel({this.id = '', @JsonKey(name: 'first_name') this.firstName, @JsonKey(name: 'last_name') this.lastName, this.mobile, this.email, @JsonKey(fromJson: _toList)  List<String>? role, this.birthday, @JsonKey(name: 'profile_image_id') this.profileImageId, this.ostan, this.shahrestan, this.brand, @JsonKey(name: 'identity_images', fromJson: _toList)  List<String>? identityImages, @JsonKey(name: 'business_license_image', fromJson: _toList)  List<String>? businessLicenseImage, @JsonKey(name: 'phone_numbers', fromJson: _toList)  List<String>? phoneNumbers,  Map<String, dynamic>? location, @JsonKey(name: 'shop_images', fromJson: _toList)  List<String>? shopImages, @JsonKey(name: 'subscription_code') this.subscriptionCode, @JsonKey(name: 'referral_code') this.referralCode, @JsonKey(name: 'occupation_id') this.occupationId, this.status, this.address, @JsonKey(name: 'referral_count', fromJson: _anyToInt) this.referralCount, @JsonKey(name: 'has_product', fromJson: _anyToBool) this.hasProduct, @JsonKey(name: 'has_service', fromJson: _anyToBool) this.hasService, @JsonKey(name: 'distance_km', fromJson: _anyToDouble) this.distanceKm, @JsonKey(name: 'rating_average', fromJson: _anyToDouble) this.ratingAverage, @JsonKey(name: 'ratings_count', fromJson: _anyToInt) this.ratingsCount}): _role = role,_identityImages = identityImages,_businessLicenseImage = businessLicenseImage,_phoneNumbers = phoneNumbers,_location = location,_shopImages = shopImages,super._();
  factory _RepairmanDetailsModel.fromJson(Map<String, dynamic> json) => _$RepairmanDetailsModelFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey(name: 'first_name') final  String? firstName;
@override@JsonKey(name: 'last_name') final  String? lastName;
@override final  String? mobile;
@override final  String? email;
 final  List<String>? _role;
@override@JsonKey(fromJson: _toList) List<String>? get role {
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

 final  Map<String, dynamic>? _location;
@override Map<String, dynamic>? get location {
  final value = _location;
  if (value == null) return null;
  if (_location is EqualUnmodifiableMapView) return _location;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

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
@override final  String? address;
@override@JsonKey(name: 'referral_count', fromJson: _anyToInt) final  int? referralCount;
@override@JsonKey(name: 'has_product', fromJson: _anyToBool) final  bool? hasProduct;
@override@JsonKey(name: 'has_service', fromJson: _anyToBool) final  bool? hasService;
@override@JsonKey(name: 'distance_km', fromJson: _anyToDouble) final  double? distanceKm;
@override@JsonKey(name: 'rating_average', fromJson: _anyToDouble) final  double? ratingAverage;
@override@JsonKey(name: 'ratings_count', fromJson: _anyToInt) final  int? ratingsCount;

/// Create a copy of RepairmanDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RepairmanDetailsModelCopyWith<_RepairmanDetailsModel> get copyWith => __$RepairmanDetailsModelCopyWithImpl<_RepairmanDetailsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RepairmanDetailsModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RepairmanDetailsModel&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.mobile, mobile) || other.mobile == mobile)&&(identical(other.email, email) || other.email == email)&&const DeepCollectionEquality().equals(other.role, _role)&&(identical(other.birthday, birthday) || other.birthday == birthday)&&(identical(other.profileImageId, profileImageId) || other.profileImageId == profileImageId)&&(identical(other.ostan, ostan) || other.ostan == ostan)&&(identical(other.shahrestan, shahrestan) || other.shahrestan == shahrestan)&&(identical(other.brand, brand) || other.brand == brand)&&const DeepCollectionEquality().equals(other.identityImages, _identityImages)&&const DeepCollectionEquality().equals(other.businessLicenseImage, _businessLicenseImage)&&const DeepCollectionEquality().equals(other.phoneNumbers, _phoneNumbers)&&const DeepCollectionEquality().equals(other.location, _location)&&const DeepCollectionEquality().equals(other.shopImages, _shopImages)&&(identical(other.subscriptionCode, subscriptionCode) || other.subscriptionCode == subscriptionCode)&&(identical(other.referralCode, referralCode) || other.referralCode == referralCode)&&(identical(other.occupationId, occupationId) || other.occupationId == occupationId)&&(identical(other.status, status) || other.status == status)&&(identical(other.address, address) || other.address == address)&&(identical(other.referralCount, referralCount) || other.referralCount == referralCount)&&(identical(other.hasProduct, hasProduct) || other.hasProduct == hasProduct)&&(identical(other.hasService, hasService) || other.hasService == hasService)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&(identical(other.ratingAverage, ratingAverage) || other.ratingAverage == ratingAverage)&&(identical(other.ratingsCount, ratingsCount) || other.ratingsCount == ratingsCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hashAll([runtimeType,id,firstName,lastName,mobile,email,const DeepCollectionEquality().hash(_role),birthday,profileImageId,ostan,shahrestan,brand,const DeepCollectionEquality().hash(_identityImages),const DeepCollectionEquality().hash(_businessLicenseImage),const DeepCollectionEquality().hash(_phoneNumbers),const DeepCollectionEquality().hash(_location),const DeepCollectionEquality().hash(_shopImages),subscriptionCode,referralCode,occupationId,status,address,referralCount,hasProduct,hasService,distanceKm,ratingAverage,ratingsCount]);
}

@override
String toString() {
    return 'RepairmanDetailsModel(id: $id, firstName: $firstName, lastName: $lastName, mobile: $mobile, email: $email, role: $role, birthday: $birthday, profileImageId: $profileImageId, ostan: $ostan, shahrestan: $shahrestan, brand: $brand, identityImages: $identityImages, businessLicenseImage: $businessLicenseImage, phoneNumbers: $phoneNumbers, location: $location, shopImages: $shopImages, subscriptionCode: $subscriptionCode, referralCode: $referralCode, occupationId: $occupationId, status: $status, address: $address, referralCount: $referralCount, hasProduct: $hasProduct, hasService: $hasService, distanceKm: $distanceKm, ratingAverage: $ratingAverage, ratingsCount: $ratingsCount)';
}


}

/// @nodoc
abstract mixin class _$RepairmanDetailsModelCopyWith<$Res> implements $RepairmanDetailsModelCopyWith<$Res> {
  factory _$RepairmanDetailsModelCopyWith(_RepairmanDetailsModel value, $Res Function(_RepairmanDetailsModel) _then) = __$RepairmanDetailsModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'first_name') String? firstName,@JsonKey(name: 'last_name') String? lastName, String? mobile, String? email,@JsonKey(fromJson: _toList) List<String>? role, String? birthday,@JsonKey(name: 'profile_image_id') String? profileImageId, String? ostan, String? shahrestan, String? brand,@JsonKey(name: 'identity_images', fromJson: _toList) List<String>? identityImages,@JsonKey(name: 'business_license_image', fromJson: _toList) List<String>? businessLicenseImage,@JsonKey(name: 'phone_numbers', fromJson: _toList) List<String>? phoneNumbers, Map<String, dynamic>? location,@JsonKey(name: 'shop_images', fromJson: _toList) List<String>? shopImages,@JsonKey(name: 'subscription_code') String? subscriptionCode,@JsonKey(name: 'referral_code') String? referralCode,@JsonKey(name: 'occupation_id') String? occupationId, String? status, String? address,@JsonKey(name: 'referral_count', fromJson: _anyToInt) int? referralCount,@JsonKey(name: 'has_product', fromJson: _anyToBool) bool? hasProduct,@JsonKey(name: 'has_service', fromJson: _anyToBool) bool? hasService,@JsonKey(name: 'distance_km', fromJson: _anyToDouble) double? distanceKm,@JsonKey(name: 'rating_average', fromJson: _anyToDouble) double? ratingAverage,@JsonKey(name: 'ratings_count', fromJson: _anyToInt) int? ratingsCount
});




}
/// @nodoc
class __$RepairmanDetailsModelCopyWithImpl<$Res>
    implements _$RepairmanDetailsModelCopyWith<$Res> {
  __$RepairmanDetailsModelCopyWithImpl(this._self, this._then);

  final _RepairmanDetailsModel _self;
  final $Res Function(_RepairmanDetailsModel) _then;

/// Create a copy of RepairmanDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? firstName = freezed,Object? lastName = freezed,Object? mobile = freezed,Object? email = freezed,Object? role = freezed,Object? birthday = freezed,Object? profileImageId = freezed,Object? ostan = freezed,Object? shahrestan = freezed,Object? brand = freezed,Object? identityImages = freezed,Object? businessLicenseImage = freezed,Object? phoneNumbers = freezed,Object? location = freezed,Object? shopImages = freezed,Object? subscriptionCode = freezed,Object? referralCode = freezed,Object? occupationId = freezed,Object? status = freezed,Object? address = freezed,Object? referralCount = freezed,Object? hasProduct = freezed,Object? hasService = freezed,Object? distanceKm = freezed,Object? ratingAverage = freezed,Object? ratingsCount = freezed,}) {
  return _then(_RepairmanDetailsModel(
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
as String?,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,identityImages: freezed == identityImages ? _self._identityImages : identityImages // ignore: cast_nullable_to_non_nullable
as List<String>?,businessLicenseImage: freezed == businessLicenseImage ? _self._businessLicenseImage : businessLicenseImage // ignore: cast_nullable_to_non_nullable
as List<String>?,phoneNumbers: freezed == phoneNumbers ? _self._phoneNumbers : phoneNumbers // ignore: cast_nullable_to_non_nullable
as List<String>?,location: freezed == location ? _self._location : location // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,shopImages: freezed == shopImages ? _self._shopImages : shopImages // ignore: cast_nullable_to_non_nullable
as List<String>?,subscriptionCode: freezed == subscriptionCode ? _self.subscriptionCode : subscriptionCode // ignore: cast_nullable_to_non_nullable
as String?,referralCode: freezed == referralCode ? _self.referralCode : referralCode // ignore: cast_nullable_to_non_nullable
as String?,occupationId: freezed == occupationId ? _self.occupationId : occupationId // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,referralCount: freezed == referralCount ? _self.referralCount : referralCount // ignore: cast_nullable_to_non_nullable
as int?,hasProduct: freezed == hasProduct ? _self.hasProduct : hasProduct // ignore: cast_nullable_to_non_nullable
as bool?,hasService: freezed == hasService ? _self.hasService : hasService // ignore: cast_nullable_to_non_nullable
as bool?,distanceKm: freezed == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as double?,ratingAverage: freezed == ratingAverage ? _self.ratingAverage : ratingAverage // ignore: cast_nullable_to_non_nullable
as double?,ratingsCount: freezed == ratingsCount ? _self.ratingsCount : ratingsCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
