// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reservation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReservationModel {

 String get id;@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'time_slot_id') String get timeSlotId; String? get description; String get status;@JsonKey(name: 'feedback_notified_at') String? get feedbackNotifiedAt;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt; ReservationUserModel? get user;@JsonKey(name: 'time_slot') ReservationTimeSlotModel get timeSlot;
/// Create a copy of ReservationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReservationModelCopyWith<ReservationModel> get copyWith => _$ReservationModelCopyWithImpl<ReservationModel>(this as ReservationModel, _$identity);

  /// Serializes this ReservationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ReservationModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReservationModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.timeSlotId, _this.timeSlotId) || other.timeSlotId == _this.timeSlotId)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.feedbackNotifiedAt, _this.feedbackNotifiedAt) || other.feedbackNotifiedAt == _this.feedbackNotifiedAt)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.user, _this.user) || other.user == _this.user)&&(identical(other.timeSlot, _this.timeSlot) || other.timeSlot == _this.timeSlot));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ReservationModel;
  return Object.hash(runtimeType,_this.id,_this.userId,_this.timeSlotId,_this.description,_this.status,_this.feedbackNotifiedAt,_this.createdAt,_this.updatedAt,_this.user,_this.timeSlot);
}

@override
String toString() {
  final _this = this as ReservationModel;
  return 'ReservationModel(id: ${_this.id}, userId: ${_this.userId}, timeSlotId: ${_this.timeSlotId}, description: ${_this.description}, status: ${_this.status}, feedbackNotifiedAt: ${_this.feedbackNotifiedAt}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt}, user: ${_this.user}, timeSlot: ${_this.timeSlot})';
}


}

/// @nodoc
abstract mixin class $ReservationModelCopyWith<$Res>  {
  factory $ReservationModelCopyWith(ReservationModel value, $Res Function(ReservationModel) _then) = _$ReservationModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'time_slot_id') String timeSlotId, String? description, String status,@JsonKey(name: 'feedback_notified_at') String? feedbackNotifiedAt,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt, ReservationUserModel? user,@JsonKey(name: 'time_slot') ReservationTimeSlotModel timeSlot
});


$ReservationUserModelCopyWith<$Res>? get user;$ReservationTimeSlotModelCopyWith<$Res> get timeSlot;

}
/// @nodoc
class _$ReservationModelCopyWithImpl<$Res>
    implements $ReservationModelCopyWith<$Res> {
  _$ReservationModelCopyWithImpl(this._self, this._then);

  final ReservationModel _self;
  final $Res Function(ReservationModel) _then;

/// Create a copy of ReservationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? timeSlotId = null,Object? description = freezed,Object? status = null,Object? feedbackNotifiedAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? user = freezed,Object? timeSlot = null,}) {
  return _then(ReservationModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,timeSlotId: null == timeSlotId ? _self.timeSlotId : timeSlotId // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,feedbackNotifiedAt: freezed == feedbackNotifiedAt ? _self.feedbackNotifiedAt : feedbackNotifiedAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as ReservationUserModel?,timeSlot: null == timeSlot ? _self.timeSlot : timeSlot // ignore: cast_nullable_to_non_nullable
as ReservationTimeSlotModel,
  ));
}
/// Create a copy of ReservationModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReservationUserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $ReservationUserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of ReservationModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReservationTimeSlotModelCopyWith<$Res> get timeSlot {
  
  return $ReservationTimeSlotModelCopyWith<$Res>(_self.timeSlot, (value) {
    return _then(_self.copyWith(timeSlot: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReservationModel].
extension ReservationModelPatterns on ReservationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReservationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReservationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReservationModel value)  $default,){
final _that = this;
switch (_that) {
case _ReservationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReservationModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReservationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'time_slot_id')  String timeSlotId,  String? description,  String status, @JsonKey(name: 'feedback_notified_at')  String? feedbackNotifiedAt, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt,  ReservationUserModel? user, @JsonKey(name: 'time_slot')  ReservationTimeSlotModel timeSlot)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReservationModel() when $default != null:
return $default(_that.id,_that.userId,_that.timeSlotId,_that.description,_that.status,_that.feedbackNotifiedAt,_that.createdAt,_that.updatedAt,_that.user,_that.timeSlot);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'time_slot_id')  String timeSlotId,  String? description,  String status, @JsonKey(name: 'feedback_notified_at')  String? feedbackNotifiedAt, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt,  ReservationUserModel? user, @JsonKey(name: 'time_slot')  ReservationTimeSlotModel timeSlot)  $default,) {final _that = this;
switch (_that) {
case _ReservationModel():
return $default(_that.id,_that.userId,_that.timeSlotId,_that.description,_that.status,_that.feedbackNotifiedAt,_that.createdAt,_that.updatedAt,_that.user,_that.timeSlot);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'time_slot_id')  String timeSlotId,  String? description,  String status, @JsonKey(name: 'feedback_notified_at')  String? feedbackNotifiedAt, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt,  ReservationUserModel? user, @JsonKey(name: 'time_slot')  ReservationTimeSlotModel timeSlot)?  $default,) {final _that = this;
switch (_that) {
case _ReservationModel() when $default != null:
return $default(_that.id,_that.userId,_that.timeSlotId,_that.description,_that.status,_that.feedbackNotifiedAt,_that.createdAt,_that.updatedAt,_that.user,_that.timeSlot);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReservationModel implements ReservationModel {
  const _ReservationModel({required this.id, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'time_slot_id') required this.timeSlotId, this.description, required this.status, @JsonKey(name: 'feedback_notified_at') this.feedbackNotifiedAt, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, this.user, @JsonKey(name: 'time_slot') required this.timeSlot});
  factory _ReservationModel.fromJson(Map<String, dynamic> json) => _$ReservationModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'time_slot_id') final  String timeSlotId;
@override final  String? description;
@override final  String status;
@override@JsonKey(name: 'feedback_notified_at') final  String? feedbackNotifiedAt;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;
@override final  ReservationUserModel? user;
@override@JsonKey(name: 'time_slot') final  ReservationTimeSlotModel timeSlot;

/// Create a copy of ReservationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReservationModelCopyWith<_ReservationModel> get copyWith => __$ReservationModelCopyWithImpl<_ReservationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReservationModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReservationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.timeSlotId, timeSlotId) || other.timeSlotId == timeSlotId)&&(identical(other.description, description) || other.description == description)&&(identical(other.status, status) || other.status == status)&&(identical(other.feedbackNotifiedAt, feedbackNotifiedAt) || other.feedbackNotifiedAt == feedbackNotifiedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.user, user) || other.user == user)&&(identical(other.timeSlot, timeSlot) || other.timeSlot == timeSlot));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,userId,timeSlotId,description,status,feedbackNotifiedAt,createdAt,updatedAt,user,timeSlot);
}

@override
String toString() {
    return 'ReservationModel(id: $id, userId: $userId, timeSlotId: $timeSlotId, description: $description, status: $status, feedbackNotifiedAt: $feedbackNotifiedAt, createdAt: $createdAt, updatedAt: $updatedAt, user: $user, timeSlot: $timeSlot)';
}


}

/// @nodoc
abstract mixin class _$ReservationModelCopyWith<$Res> implements $ReservationModelCopyWith<$Res> {
  factory _$ReservationModelCopyWith(_ReservationModel value, $Res Function(_ReservationModel) _then) = __$ReservationModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'time_slot_id') String timeSlotId, String? description, String status,@JsonKey(name: 'feedback_notified_at') String? feedbackNotifiedAt,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt, ReservationUserModel? user,@JsonKey(name: 'time_slot') ReservationTimeSlotModel timeSlot
});


@override $ReservationUserModelCopyWith<$Res>? get user;@override $ReservationTimeSlotModelCopyWith<$Res> get timeSlot;

}
/// @nodoc
class __$ReservationModelCopyWithImpl<$Res>
    implements _$ReservationModelCopyWith<$Res> {
  __$ReservationModelCopyWithImpl(this._self, this._then);

  final _ReservationModel _self;
  final $Res Function(_ReservationModel) _then;

/// Create a copy of ReservationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? timeSlotId = null,Object? description = freezed,Object? status = null,Object? feedbackNotifiedAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? user = freezed,Object? timeSlot = null,}) {
  return _then(_ReservationModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,timeSlotId: null == timeSlotId ? _self.timeSlotId : timeSlotId // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,feedbackNotifiedAt: freezed == feedbackNotifiedAt ? _self.feedbackNotifiedAt : feedbackNotifiedAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as ReservationUserModel?,timeSlot: null == timeSlot ? _self.timeSlot : timeSlot // ignore: cast_nullable_to_non_nullable
as ReservationTimeSlotModel,
  ));
}

/// Create a copy of ReservationModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReservationUserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $ReservationUserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of ReservationModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReservationTimeSlotModelCopyWith<$Res> get timeSlot {
  
  return $ReservationTimeSlotModelCopyWith<$Res>(_self.timeSlot, (value) {
    return _then(_self.copyWith(timeSlot: value));
  });
}
}


/// @nodoc
mixin _$ReservationUserModel {

 String get id;@JsonKey(name: 'first_name', fromJson: _anyToString) String get firstName;@JsonKey(name: 'last_name', fromJson: _anyToString) String get lastName;@JsonKey(fromJson: _anyToString) String get mobile; String? get email;@JsonKey(fromJson: _roleFromJson) List<String>? get role; String? get birthday;@JsonKey(name: 'subscription_code', fromJson: _anyToString) String? get subscriptionCode; String get status; String? get ostan; String? get shahrestan; String? get address; String? get brand;@JsonKey(name: 'identity_images', fromJson: _toList) List<String>? get identityImages;@JsonKey(name: 'business_license_image', fromJson: _toList) List<String>? get businessLicenseImage;@JsonKey(name: 'phone_numbers', fromJson: _toList) List<String>? get phoneNumbers; ReservationLocationModel? get location;@JsonKey(name: 'shop_images', fromJson: _toList) List<String>? get shopImages;@JsonKey(name: 'referral_code') String? get referralCode;@JsonKey(name: 'occupation_id') String? get occupationId;@JsonKey(name: 'referral_count') int? get referralCount;@JsonKey(name: 'has_product') bool? get hasProduct;@JsonKey(name: 'has_service') bool? get hasService;@JsonKey(name: 'profile_image_id') String? get profileImageId;
/// Create a copy of ReservationUserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReservationUserModelCopyWith<ReservationUserModel> get copyWith => _$ReservationUserModelCopyWithImpl<ReservationUserModel>(this as ReservationUserModel, _$identity);

  /// Serializes this ReservationUserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ReservationUserModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReservationUserModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.firstName, _this.firstName) || other.firstName == _this.firstName)&&(identical(other.lastName, _this.lastName) || other.lastName == _this.lastName)&&(identical(other.mobile, _this.mobile) || other.mobile == _this.mobile)&&(identical(other.email, _this.email) || other.email == _this.email)&&const DeepCollectionEquality().equals(other.role, _this.role)&&(identical(other.birthday, _this.birthday) || other.birthday == _this.birthday)&&(identical(other.subscriptionCode, _this.subscriptionCode) || other.subscriptionCode == _this.subscriptionCode)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.ostan, _this.ostan) || other.ostan == _this.ostan)&&(identical(other.shahrestan, _this.shahrestan) || other.shahrestan == _this.shahrestan)&&(identical(other.address, _this.address) || other.address == _this.address)&&(identical(other.brand, _this.brand) || other.brand == _this.brand)&&const DeepCollectionEquality().equals(other.identityImages, _this.identityImages)&&const DeepCollectionEquality().equals(other.businessLicenseImage, _this.businessLicenseImage)&&const DeepCollectionEquality().equals(other.phoneNumbers, _this.phoneNumbers)&&(identical(other.location, _this.location) || other.location == _this.location)&&const DeepCollectionEquality().equals(other.shopImages, _this.shopImages)&&(identical(other.referralCode, _this.referralCode) || other.referralCode == _this.referralCode)&&(identical(other.occupationId, _this.occupationId) || other.occupationId == _this.occupationId)&&(identical(other.referralCount, _this.referralCount) || other.referralCount == _this.referralCount)&&(identical(other.hasProduct, _this.hasProduct) || other.hasProduct == _this.hasProduct)&&(identical(other.hasService, _this.hasService) || other.hasService == _this.hasService)&&(identical(other.profileImageId, _this.profileImageId) || other.profileImageId == _this.profileImageId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ReservationUserModel;
  return Object.hashAll([runtimeType,_this.id,_this.firstName,_this.lastName,_this.mobile,_this.email,const DeepCollectionEquality().hash(_this.role),_this.birthday,_this.subscriptionCode,_this.status,_this.ostan,_this.shahrestan,_this.address,_this.brand,const DeepCollectionEquality().hash(_this.identityImages),const DeepCollectionEquality().hash(_this.businessLicenseImage),const DeepCollectionEquality().hash(_this.phoneNumbers),_this.location,const DeepCollectionEquality().hash(_this.shopImages),_this.referralCode,_this.occupationId,_this.referralCount,_this.hasProduct,_this.hasService,_this.profileImageId]);
}

@override
String toString() {
  final _this = this as ReservationUserModel;
  return 'ReservationUserModel(id: ${_this.id}, firstName: ${_this.firstName}, lastName: ${_this.lastName}, mobile: ${_this.mobile}, email: ${_this.email}, role: ${_this.role}, birthday: ${_this.birthday}, subscriptionCode: ${_this.subscriptionCode}, status: ${_this.status}, ostan: ${_this.ostan}, shahrestan: ${_this.shahrestan}, address: ${_this.address}, brand: ${_this.brand}, identityImages: ${_this.identityImages}, businessLicenseImage: ${_this.businessLicenseImage}, phoneNumbers: ${_this.phoneNumbers}, location: ${_this.location}, shopImages: ${_this.shopImages}, referralCode: ${_this.referralCode}, occupationId: ${_this.occupationId}, referralCount: ${_this.referralCount}, hasProduct: ${_this.hasProduct}, hasService: ${_this.hasService}, profileImageId: ${_this.profileImageId})';
}


}

/// @nodoc
abstract mixin class $ReservationUserModelCopyWith<$Res>  {
  factory $ReservationUserModelCopyWith(ReservationUserModel value, $Res Function(ReservationUserModel) _then) = _$ReservationUserModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'first_name', fromJson: _anyToString) String firstName,@JsonKey(name: 'last_name', fromJson: _anyToString) String lastName,@JsonKey(fromJson: _anyToString) String mobile, String? email,@JsonKey(fromJson: _roleFromJson) List<String>? role, String? birthday,@JsonKey(name: 'subscription_code', fromJson: _anyToString) String? subscriptionCode, String status, String? ostan, String? shahrestan, String? address, String? brand,@JsonKey(name: 'identity_images', fromJson: _toList) List<String>? identityImages,@JsonKey(name: 'business_license_image', fromJson: _toList) List<String>? businessLicenseImage,@JsonKey(name: 'phone_numbers', fromJson: _toList) List<String>? phoneNumbers, ReservationLocationModel? location,@JsonKey(name: 'shop_images', fromJson: _toList) List<String>? shopImages,@JsonKey(name: 'referral_code') String? referralCode,@JsonKey(name: 'occupation_id') String? occupationId,@JsonKey(name: 'referral_count') int? referralCount,@JsonKey(name: 'has_product') bool? hasProduct,@JsonKey(name: 'has_service') bool? hasService,@JsonKey(name: 'profile_image_id') String? profileImageId
});


$ReservationLocationModelCopyWith<$Res>? get location;

}
/// @nodoc
class _$ReservationUserModelCopyWithImpl<$Res>
    implements $ReservationUserModelCopyWith<$Res> {
  _$ReservationUserModelCopyWithImpl(this._self, this._then);

  final ReservationUserModel _self;
  final $Res Function(ReservationUserModel) _then;

/// Create a copy of ReservationUserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? firstName = null,Object? lastName = null,Object? mobile = null,Object? email = freezed,Object? role = freezed,Object? birthday = freezed,Object? subscriptionCode = freezed,Object? status = null,Object? ostan = freezed,Object? shahrestan = freezed,Object? address = freezed,Object? brand = freezed,Object? identityImages = freezed,Object? businessLicenseImage = freezed,Object? phoneNumbers = freezed,Object? location = freezed,Object? shopImages = freezed,Object? referralCode = freezed,Object? occupationId = freezed,Object? referralCount = freezed,Object? hasProduct = freezed,Object? hasService = freezed,Object? profileImageId = freezed,}) {
  return _then(ReservationUserModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,mobile: null == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as List<String>?,birthday: freezed == birthday ? _self.birthday : birthday // ignore: cast_nullable_to_non_nullable
as String?,subscriptionCode: freezed == subscriptionCode ? _self.subscriptionCode : subscriptionCode // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,ostan: freezed == ostan ? _self.ostan : ostan // ignore: cast_nullable_to_non_nullable
as String?,shahrestan: freezed == shahrestan ? _self.shahrestan : shahrestan // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,identityImages: freezed == identityImages ? _self.identityImages : identityImages // ignore: cast_nullable_to_non_nullable
as List<String>?,businessLicenseImage: freezed == businessLicenseImage ? _self.businessLicenseImage : businessLicenseImage // ignore: cast_nullable_to_non_nullable
as List<String>?,phoneNumbers: freezed == phoneNumbers ? _self.phoneNumbers : phoneNumbers // ignore: cast_nullable_to_non_nullable
as List<String>?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as ReservationLocationModel?,shopImages: freezed == shopImages ? _self.shopImages : shopImages // ignore: cast_nullable_to_non_nullable
as List<String>?,referralCode: freezed == referralCode ? _self.referralCode : referralCode // ignore: cast_nullable_to_non_nullable
as String?,occupationId: freezed == occupationId ? _self.occupationId : occupationId // ignore: cast_nullable_to_non_nullable
as String?,referralCount: freezed == referralCount ? _self.referralCount : referralCount // ignore: cast_nullable_to_non_nullable
as int?,hasProduct: freezed == hasProduct ? _self.hasProduct : hasProduct // ignore: cast_nullable_to_non_nullable
as bool?,hasService: freezed == hasService ? _self.hasService : hasService // ignore: cast_nullable_to_non_nullable
as bool?,profileImageId: freezed == profileImageId ? _self.profileImageId : profileImageId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ReservationUserModel
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


/// Adds pattern-matching-related methods to [ReservationUserModel].
extension ReservationUserModelPatterns on ReservationUserModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReservationUserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReservationUserModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReservationUserModel value)  $default,){
final _that = this;
switch (_that) {
case _ReservationUserModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReservationUserModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReservationUserModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'first_name', fromJson: _anyToString)  String firstName, @JsonKey(name: 'last_name', fromJson: _anyToString)  String lastName, @JsonKey(fromJson: _anyToString)  String mobile,  String? email, @JsonKey(fromJson: _roleFromJson)  List<String>? role,  String? birthday, @JsonKey(name: 'subscription_code', fromJson: _anyToString)  String? subscriptionCode,  String status,  String? ostan,  String? shahrestan,  String? address,  String? brand, @JsonKey(name: 'identity_images', fromJson: _toList)  List<String>? identityImages, @JsonKey(name: 'business_license_image', fromJson: _toList)  List<String>? businessLicenseImage, @JsonKey(name: 'phone_numbers', fromJson: _toList)  List<String>? phoneNumbers,  ReservationLocationModel? location, @JsonKey(name: 'shop_images', fromJson: _toList)  List<String>? shopImages, @JsonKey(name: 'referral_code')  String? referralCode, @JsonKey(name: 'occupation_id')  String? occupationId, @JsonKey(name: 'referral_count')  int? referralCount, @JsonKey(name: 'has_product')  bool? hasProduct, @JsonKey(name: 'has_service')  bool? hasService, @JsonKey(name: 'profile_image_id')  String? profileImageId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReservationUserModel() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.mobile,_that.email,_that.role,_that.birthday,_that.subscriptionCode,_that.status,_that.ostan,_that.shahrestan,_that.address,_that.brand,_that.identityImages,_that.businessLicenseImage,_that.phoneNumbers,_that.location,_that.shopImages,_that.referralCode,_that.occupationId,_that.referralCount,_that.hasProduct,_that.hasService,_that.profileImageId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'first_name', fromJson: _anyToString)  String firstName, @JsonKey(name: 'last_name', fromJson: _anyToString)  String lastName, @JsonKey(fromJson: _anyToString)  String mobile,  String? email, @JsonKey(fromJson: _roleFromJson)  List<String>? role,  String? birthday, @JsonKey(name: 'subscription_code', fromJson: _anyToString)  String? subscriptionCode,  String status,  String? ostan,  String? shahrestan,  String? address,  String? brand, @JsonKey(name: 'identity_images', fromJson: _toList)  List<String>? identityImages, @JsonKey(name: 'business_license_image', fromJson: _toList)  List<String>? businessLicenseImage, @JsonKey(name: 'phone_numbers', fromJson: _toList)  List<String>? phoneNumbers,  ReservationLocationModel? location, @JsonKey(name: 'shop_images', fromJson: _toList)  List<String>? shopImages, @JsonKey(name: 'referral_code')  String? referralCode, @JsonKey(name: 'occupation_id')  String? occupationId, @JsonKey(name: 'referral_count')  int? referralCount, @JsonKey(name: 'has_product')  bool? hasProduct, @JsonKey(name: 'has_service')  bool? hasService, @JsonKey(name: 'profile_image_id')  String? profileImageId)  $default,) {final _that = this;
switch (_that) {
case _ReservationUserModel():
return $default(_that.id,_that.firstName,_that.lastName,_that.mobile,_that.email,_that.role,_that.birthday,_that.subscriptionCode,_that.status,_that.ostan,_that.shahrestan,_that.address,_that.brand,_that.identityImages,_that.businessLicenseImage,_that.phoneNumbers,_that.location,_that.shopImages,_that.referralCode,_that.occupationId,_that.referralCount,_that.hasProduct,_that.hasService,_that.profileImageId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'first_name', fromJson: _anyToString)  String firstName, @JsonKey(name: 'last_name', fromJson: _anyToString)  String lastName, @JsonKey(fromJson: _anyToString)  String mobile,  String? email, @JsonKey(fromJson: _roleFromJson)  List<String>? role,  String? birthday, @JsonKey(name: 'subscription_code', fromJson: _anyToString)  String? subscriptionCode,  String status,  String? ostan,  String? shahrestan,  String? address,  String? brand, @JsonKey(name: 'identity_images', fromJson: _toList)  List<String>? identityImages, @JsonKey(name: 'business_license_image', fromJson: _toList)  List<String>? businessLicenseImage, @JsonKey(name: 'phone_numbers', fromJson: _toList)  List<String>? phoneNumbers,  ReservationLocationModel? location, @JsonKey(name: 'shop_images', fromJson: _toList)  List<String>? shopImages, @JsonKey(name: 'referral_code')  String? referralCode, @JsonKey(name: 'occupation_id')  String? occupationId, @JsonKey(name: 'referral_count')  int? referralCount, @JsonKey(name: 'has_product')  bool? hasProduct, @JsonKey(name: 'has_service')  bool? hasService, @JsonKey(name: 'profile_image_id')  String? profileImageId)?  $default,) {final _that = this;
switch (_that) {
case _ReservationUserModel() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.mobile,_that.email,_that.role,_that.birthday,_that.subscriptionCode,_that.status,_that.ostan,_that.shahrestan,_that.address,_that.brand,_that.identityImages,_that.businessLicenseImage,_that.phoneNumbers,_that.location,_that.shopImages,_that.referralCode,_that.occupationId,_that.referralCount,_that.hasProduct,_that.hasService,_that.profileImageId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReservationUserModel implements ReservationUserModel {
  const _ReservationUserModel({required this.id, @JsonKey(name: 'first_name', fromJson: _anyToString) required this.firstName, @JsonKey(name: 'last_name', fromJson: _anyToString) required this.lastName, @JsonKey(fromJson: _anyToString) required this.mobile, this.email, @JsonKey(fromJson: _roleFromJson)  List<String>? role, this.birthday, @JsonKey(name: 'subscription_code', fromJson: _anyToString) this.subscriptionCode, required this.status, this.ostan, this.shahrestan, this.address, this.brand, @JsonKey(name: 'identity_images', fromJson: _toList)  List<String>? identityImages, @JsonKey(name: 'business_license_image', fromJson: _toList)  List<String>? businessLicenseImage, @JsonKey(name: 'phone_numbers', fromJson: _toList)  List<String>? phoneNumbers, this.location, @JsonKey(name: 'shop_images', fromJson: _toList)  List<String>? shopImages, @JsonKey(name: 'referral_code') this.referralCode, @JsonKey(name: 'occupation_id') this.occupationId, @JsonKey(name: 'referral_count') this.referralCount, @JsonKey(name: 'has_product') this.hasProduct, @JsonKey(name: 'has_service') this.hasService, @JsonKey(name: 'profile_image_id') this.profileImageId}): _role = role,_identityImages = identityImages,_businessLicenseImage = businessLicenseImage,_phoneNumbers = phoneNumbers,_shopImages = shopImages;
  factory _ReservationUserModel.fromJson(Map<String, dynamic> json) => _$ReservationUserModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'first_name', fromJson: _anyToString) final  String firstName;
@override@JsonKey(name: 'last_name', fromJson: _anyToString) final  String lastName;
@override@JsonKey(fromJson: _anyToString) final  String mobile;
@override final  String? email;
 final  List<String>? _role;
@override@JsonKey(fromJson: _roleFromJson) List<String>? get role {
  final value = _role;
  if (value == null) return null;
  if (_role is EqualUnmodifiableListView) return _role;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? birthday;
@override@JsonKey(name: 'subscription_code', fromJson: _anyToString) final  String? subscriptionCode;
@override final  String status;
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

@override final  ReservationLocationModel? location;
 final  List<String>? _shopImages;
@override@JsonKey(name: 'shop_images', fromJson: _toList) List<String>? get shopImages {
  final value = _shopImages;
  if (value == null) return null;
  if (_shopImages is EqualUnmodifiableListView) return _shopImages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'referral_code') final  String? referralCode;
@override@JsonKey(name: 'occupation_id') final  String? occupationId;
@override@JsonKey(name: 'referral_count') final  int? referralCount;
@override@JsonKey(name: 'has_product') final  bool? hasProduct;
@override@JsonKey(name: 'has_service') final  bool? hasService;
@override@JsonKey(name: 'profile_image_id') final  String? profileImageId;

/// Create a copy of ReservationUserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReservationUserModelCopyWith<_ReservationUserModel> get copyWith => __$ReservationUserModelCopyWithImpl<_ReservationUserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReservationUserModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReservationUserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.mobile, mobile) || other.mobile == mobile)&&(identical(other.email, email) || other.email == email)&&const DeepCollectionEquality().equals(other.role, _role)&&(identical(other.birthday, birthday) || other.birthday == birthday)&&(identical(other.subscriptionCode, subscriptionCode) || other.subscriptionCode == subscriptionCode)&&(identical(other.status, status) || other.status == status)&&(identical(other.ostan, ostan) || other.ostan == ostan)&&(identical(other.shahrestan, shahrestan) || other.shahrestan == shahrestan)&&(identical(other.address, address) || other.address == address)&&(identical(other.brand, brand) || other.brand == brand)&&const DeepCollectionEquality().equals(other.identityImages, _identityImages)&&const DeepCollectionEquality().equals(other.businessLicenseImage, _businessLicenseImage)&&const DeepCollectionEquality().equals(other.phoneNumbers, _phoneNumbers)&&(identical(other.location, location) || other.location == location)&&const DeepCollectionEquality().equals(other.shopImages, _shopImages)&&(identical(other.referralCode, referralCode) || other.referralCode == referralCode)&&(identical(other.occupationId, occupationId) || other.occupationId == occupationId)&&(identical(other.referralCount, referralCount) || other.referralCount == referralCount)&&(identical(other.hasProduct, hasProduct) || other.hasProduct == hasProduct)&&(identical(other.hasService, hasService) || other.hasService == hasService)&&(identical(other.profileImageId, profileImageId) || other.profileImageId == profileImageId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hashAll([runtimeType,id,firstName,lastName,mobile,email,const DeepCollectionEquality().hash(_role),birthday,subscriptionCode,status,ostan,shahrestan,address,brand,const DeepCollectionEquality().hash(_identityImages),const DeepCollectionEquality().hash(_businessLicenseImage),const DeepCollectionEquality().hash(_phoneNumbers),location,const DeepCollectionEquality().hash(_shopImages),referralCode,occupationId,referralCount,hasProduct,hasService,profileImageId]);
}

@override
String toString() {
    return 'ReservationUserModel(id: $id, firstName: $firstName, lastName: $lastName, mobile: $mobile, email: $email, role: $role, birthday: $birthday, subscriptionCode: $subscriptionCode, status: $status, ostan: $ostan, shahrestan: $shahrestan, address: $address, brand: $brand, identityImages: $identityImages, businessLicenseImage: $businessLicenseImage, phoneNumbers: $phoneNumbers, location: $location, shopImages: $shopImages, referralCode: $referralCode, occupationId: $occupationId, referralCount: $referralCount, hasProduct: $hasProduct, hasService: $hasService, profileImageId: $profileImageId)';
}


}

/// @nodoc
abstract mixin class _$ReservationUserModelCopyWith<$Res> implements $ReservationUserModelCopyWith<$Res> {
  factory _$ReservationUserModelCopyWith(_ReservationUserModel value, $Res Function(_ReservationUserModel) _then) = __$ReservationUserModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'first_name', fromJson: _anyToString) String firstName,@JsonKey(name: 'last_name', fromJson: _anyToString) String lastName,@JsonKey(fromJson: _anyToString) String mobile, String? email,@JsonKey(fromJson: _roleFromJson) List<String>? role, String? birthday,@JsonKey(name: 'subscription_code', fromJson: _anyToString) String? subscriptionCode, String status, String? ostan, String? shahrestan, String? address, String? brand,@JsonKey(name: 'identity_images', fromJson: _toList) List<String>? identityImages,@JsonKey(name: 'business_license_image', fromJson: _toList) List<String>? businessLicenseImage,@JsonKey(name: 'phone_numbers', fromJson: _toList) List<String>? phoneNumbers, ReservationLocationModel? location,@JsonKey(name: 'shop_images', fromJson: _toList) List<String>? shopImages,@JsonKey(name: 'referral_code') String? referralCode,@JsonKey(name: 'occupation_id') String? occupationId,@JsonKey(name: 'referral_count') int? referralCount,@JsonKey(name: 'has_product') bool? hasProduct,@JsonKey(name: 'has_service') bool? hasService,@JsonKey(name: 'profile_image_id') String? profileImageId
});


@override $ReservationLocationModelCopyWith<$Res>? get location;

}
/// @nodoc
class __$ReservationUserModelCopyWithImpl<$Res>
    implements _$ReservationUserModelCopyWith<$Res> {
  __$ReservationUserModelCopyWithImpl(this._self, this._then);

  final _ReservationUserModel _self;
  final $Res Function(_ReservationUserModel) _then;

/// Create a copy of ReservationUserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? firstName = null,Object? lastName = null,Object? mobile = null,Object? email = freezed,Object? role = freezed,Object? birthday = freezed,Object? subscriptionCode = freezed,Object? status = null,Object? ostan = freezed,Object? shahrestan = freezed,Object? address = freezed,Object? brand = freezed,Object? identityImages = freezed,Object? businessLicenseImage = freezed,Object? phoneNumbers = freezed,Object? location = freezed,Object? shopImages = freezed,Object? referralCode = freezed,Object? occupationId = freezed,Object? referralCount = freezed,Object? hasProduct = freezed,Object? hasService = freezed,Object? profileImageId = freezed,}) {
  return _then(_ReservationUserModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,mobile: null == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self._role : role // ignore: cast_nullable_to_non_nullable
as List<String>?,birthday: freezed == birthday ? _self.birthday : birthday // ignore: cast_nullable_to_non_nullable
as String?,subscriptionCode: freezed == subscriptionCode ? _self.subscriptionCode : subscriptionCode // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,ostan: freezed == ostan ? _self.ostan : ostan // ignore: cast_nullable_to_non_nullable
as String?,shahrestan: freezed == shahrestan ? _self.shahrestan : shahrestan // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,identityImages: freezed == identityImages ? _self._identityImages : identityImages // ignore: cast_nullable_to_non_nullable
as List<String>?,businessLicenseImage: freezed == businessLicenseImage ? _self._businessLicenseImage : businessLicenseImage // ignore: cast_nullable_to_non_nullable
as List<String>?,phoneNumbers: freezed == phoneNumbers ? _self._phoneNumbers : phoneNumbers // ignore: cast_nullable_to_non_nullable
as List<String>?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as ReservationLocationModel?,shopImages: freezed == shopImages ? _self._shopImages : shopImages // ignore: cast_nullable_to_non_nullable
as List<String>?,referralCode: freezed == referralCode ? _self.referralCode : referralCode // ignore: cast_nullable_to_non_nullable
as String?,occupationId: freezed == occupationId ? _self.occupationId : occupationId // ignore: cast_nullable_to_non_nullable
as String?,referralCount: freezed == referralCount ? _self.referralCount : referralCount // ignore: cast_nullable_to_non_nullable
as int?,hasProduct: freezed == hasProduct ? _self.hasProduct : hasProduct // ignore: cast_nullable_to_non_nullable
as bool?,hasService: freezed == hasService ? _self.hasService : hasService // ignore: cast_nullable_to_non_nullable
as bool?,profileImageId: freezed == profileImageId ? _self.profileImageId : profileImageId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ReservationUserModel
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


/// @nodoc
mixin _$ReservationLocationModel {

 double? get lat; double? get lng;
/// Create a copy of ReservationLocationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReservationLocationModelCopyWith<ReservationLocationModel> get copyWith => _$ReservationLocationModelCopyWithImpl<ReservationLocationModel>(this as ReservationLocationModel, _$identity);

  /// Serializes this ReservationLocationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ReservationLocationModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReservationLocationModel&&(identical(other.lat, _this.lat) || other.lat == _this.lat)&&(identical(other.lng, _this.lng) || other.lng == _this.lng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ReservationLocationModel;
  return Object.hash(runtimeType,_this.lat,_this.lng);
}

@override
String toString() {
  final _this = this as ReservationLocationModel;
  return 'ReservationLocationModel(lat: ${_this.lat}, lng: ${_this.lng})';
}


}

/// @nodoc
abstract mixin class $ReservationLocationModelCopyWith<$Res>  {
  factory $ReservationLocationModelCopyWith(ReservationLocationModel value, $Res Function(ReservationLocationModel) _then) = _$ReservationLocationModelCopyWithImpl;
@useResult
$Res call({
 double? lat, double? lng
});




}
/// @nodoc
class _$ReservationLocationModelCopyWithImpl<$Res>
    implements $ReservationLocationModelCopyWith<$Res> {
  _$ReservationLocationModelCopyWithImpl(this._self, this._then);

  final ReservationLocationModel _self;
  final $Res Function(ReservationLocationModel) _then;

/// Create a copy of ReservationLocationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lat = freezed,Object? lng = freezed,}) {
  return _then(ReservationLocationModel(
lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReservationLocationModel].
extension ReservationLocationModelPatterns on ReservationLocationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReservationLocationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReservationLocationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReservationLocationModel value)  $default,){
final _that = this;
switch (_that) {
case _ReservationLocationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReservationLocationModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReservationLocationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double? lat,  double? lng)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReservationLocationModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double? lat,  double? lng)  $default,) {final _that = this;
switch (_that) {
case _ReservationLocationModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double? lat,  double? lng)?  $default,) {final _that = this;
switch (_that) {
case _ReservationLocationModel() when $default != null:
return $default(_that.lat,_that.lng);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReservationLocationModel implements ReservationLocationModel {
  const _ReservationLocationModel({this.lat, this.lng});
  factory _ReservationLocationModel.fromJson(Map<String, dynamic> json) => _$ReservationLocationModelFromJson(json);

@override final  double? lat;
@override final  double? lng;

/// Create a copy of ReservationLocationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReservationLocationModelCopyWith<_ReservationLocationModel> get copyWith => __$ReservationLocationModelCopyWithImpl<_ReservationLocationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReservationLocationModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReservationLocationModel&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,lat,lng);
}

@override
String toString() {
    return 'ReservationLocationModel(lat: $lat, lng: $lng)';
}


}

/// @nodoc
abstract mixin class _$ReservationLocationModelCopyWith<$Res> implements $ReservationLocationModelCopyWith<$Res> {
  factory _$ReservationLocationModelCopyWith(_ReservationLocationModel value, $Res Function(_ReservationLocationModel) _then) = __$ReservationLocationModelCopyWithImpl;
@override @useResult
$Res call({
 double? lat, double? lng
});




}
/// @nodoc
class __$ReservationLocationModelCopyWithImpl<$Res>
    implements _$ReservationLocationModelCopyWith<$Res> {
  __$ReservationLocationModelCopyWithImpl(this._self, this._then);

  final _ReservationLocationModel _self;
  final $Res Function(_ReservationLocationModel) _then;

/// Create a copy of ReservationLocationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lat = freezed,Object? lng = freezed,}) {
  return _then(_ReservationLocationModel(
lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$ReservationTimeSlotModel {

 String get id;@JsonKey(name: 'repairman_id') String get repairmanId; String get date;@JsonKey(name: 'start_time') String get startTime;@JsonKey(name: 'end_time') String get endTime; int get capacity; String get status;@JsonKey(name: 'reserved_count') int? get reservedCount;@JsonKey(name: 'remaining_capacity') int? get remainingCapacity;@JsonKey(name: 'is_full') bool? get isFull;@JsonKey(name: 'jalali_date') String? get jalaliDate; ReservationUserModel? get repairman;
/// Create a copy of ReservationTimeSlotModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReservationTimeSlotModelCopyWith<ReservationTimeSlotModel> get copyWith => _$ReservationTimeSlotModelCopyWithImpl<ReservationTimeSlotModel>(this as ReservationTimeSlotModel, _$identity);

  /// Serializes this ReservationTimeSlotModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ReservationTimeSlotModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReservationTimeSlotModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.repairmanId, _this.repairmanId) || other.repairmanId == _this.repairmanId)&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.startTime, _this.startTime) || other.startTime == _this.startTime)&&(identical(other.endTime, _this.endTime) || other.endTime == _this.endTime)&&(identical(other.capacity, _this.capacity) || other.capacity == _this.capacity)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.reservedCount, _this.reservedCount) || other.reservedCount == _this.reservedCount)&&(identical(other.remainingCapacity, _this.remainingCapacity) || other.remainingCapacity == _this.remainingCapacity)&&(identical(other.isFull, _this.isFull) || other.isFull == _this.isFull)&&(identical(other.jalaliDate, _this.jalaliDate) || other.jalaliDate == _this.jalaliDate)&&(identical(other.repairman, _this.repairman) || other.repairman == _this.repairman));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ReservationTimeSlotModel;
  return Object.hash(runtimeType,_this.id,_this.repairmanId,_this.date,_this.startTime,_this.endTime,_this.capacity,_this.status,_this.reservedCount,_this.remainingCapacity,_this.isFull,_this.jalaliDate,_this.repairman);
}

@override
String toString() {
  final _this = this as ReservationTimeSlotModel;
  return 'ReservationTimeSlotModel(id: ${_this.id}, repairmanId: ${_this.repairmanId}, date: ${_this.date}, startTime: ${_this.startTime}, endTime: ${_this.endTime}, capacity: ${_this.capacity}, status: ${_this.status}, reservedCount: ${_this.reservedCount}, remainingCapacity: ${_this.remainingCapacity}, isFull: ${_this.isFull}, jalaliDate: ${_this.jalaliDate}, repairman: ${_this.repairman})';
}


}

/// @nodoc
abstract mixin class $ReservationTimeSlotModelCopyWith<$Res>  {
  factory $ReservationTimeSlotModelCopyWith(ReservationTimeSlotModel value, $Res Function(ReservationTimeSlotModel) _then) = _$ReservationTimeSlotModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'repairman_id') String repairmanId, String date,@JsonKey(name: 'start_time') String startTime,@JsonKey(name: 'end_time') String endTime, int capacity, String status,@JsonKey(name: 'reserved_count') int? reservedCount,@JsonKey(name: 'remaining_capacity') int? remainingCapacity,@JsonKey(name: 'is_full') bool? isFull,@JsonKey(name: 'jalali_date') String? jalaliDate, ReservationUserModel? repairman
});


$ReservationUserModelCopyWith<$Res>? get repairman;

}
/// @nodoc
class _$ReservationTimeSlotModelCopyWithImpl<$Res>
    implements $ReservationTimeSlotModelCopyWith<$Res> {
  _$ReservationTimeSlotModelCopyWithImpl(this._self, this._then);

  final ReservationTimeSlotModel _self;
  final $Res Function(ReservationTimeSlotModel) _then;

/// Create a copy of ReservationTimeSlotModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? repairmanId = null,Object? date = null,Object? startTime = null,Object? endTime = null,Object? capacity = null,Object? status = null,Object? reservedCount = freezed,Object? remainingCapacity = freezed,Object? isFull = freezed,Object? jalaliDate = freezed,Object? repairman = freezed,}) {
  return _then(ReservationTimeSlotModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,repairmanId: null == repairmanId ? _self.repairmanId : repairmanId // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,capacity: null == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,reservedCount: freezed == reservedCount ? _self.reservedCount : reservedCount // ignore: cast_nullable_to_non_nullable
as int?,remainingCapacity: freezed == remainingCapacity ? _self.remainingCapacity : remainingCapacity // ignore: cast_nullable_to_non_nullable
as int?,isFull: freezed == isFull ? _self.isFull : isFull // ignore: cast_nullable_to_non_nullable
as bool?,jalaliDate: freezed == jalaliDate ? _self.jalaliDate : jalaliDate // ignore: cast_nullable_to_non_nullable
as String?,repairman: freezed == repairman ? _self.repairman : repairman // ignore: cast_nullable_to_non_nullable
as ReservationUserModel?,
  ));
}
/// Create a copy of ReservationTimeSlotModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReservationUserModelCopyWith<$Res>? get repairman {
    if (_self.repairman == null) {
    return null;
  }

  return $ReservationUserModelCopyWith<$Res>(_self.repairman!, (value) {
    return _then(_self.copyWith(repairman: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReservationTimeSlotModel].
extension ReservationTimeSlotModelPatterns on ReservationTimeSlotModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReservationTimeSlotModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReservationTimeSlotModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReservationTimeSlotModel value)  $default,){
final _that = this;
switch (_that) {
case _ReservationTimeSlotModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReservationTimeSlotModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReservationTimeSlotModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'repairman_id')  String repairmanId,  String date, @JsonKey(name: 'start_time')  String startTime, @JsonKey(name: 'end_time')  String endTime,  int capacity,  String status, @JsonKey(name: 'reserved_count')  int? reservedCount, @JsonKey(name: 'remaining_capacity')  int? remainingCapacity, @JsonKey(name: 'is_full')  bool? isFull, @JsonKey(name: 'jalali_date')  String? jalaliDate,  ReservationUserModel? repairman)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReservationTimeSlotModel() when $default != null:
return $default(_that.id,_that.repairmanId,_that.date,_that.startTime,_that.endTime,_that.capacity,_that.status,_that.reservedCount,_that.remainingCapacity,_that.isFull,_that.jalaliDate,_that.repairman);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'repairman_id')  String repairmanId,  String date, @JsonKey(name: 'start_time')  String startTime, @JsonKey(name: 'end_time')  String endTime,  int capacity,  String status, @JsonKey(name: 'reserved_count')  int? reservedCount, @JsonKey(name: 'remaining_capacity')  int? remainingCapacity, @JsonKey(name: 'is_full')  bool? isFull, @JsonKey(name: 'jalali_date')  String? jalaliDate,  ReservationUserModel? repairman)  $default,) {final _that = this;
switch (_that) {
case _ReservationTimeSlotModel():
return $default(_that.id,_that.repairmanId,_that.date,_that.startTime,_that.endTime,_that.capacity,_that.status,_that.reservedCount,_that.remainingCapacity,_that.isFull,_that.jalaliDate,_that.repairman);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'repairman_id')  String repairmanId,  String date, @JsonKey(name: 'start_time')  String startTime, @JsonKey(name: 'end_time')  String endTime,  int capacity,  String status, @JsonKey(name: 'reserved_count')  int? reservedCount, @JsonKey(name: 'remaining_capacity')  int? remainingCapacity, @JsonKey(name: 'is_full')  bool? isFull, @JsonKey(name: 'jalali_date')  String? jalaliDate,  ReservationUserModel? repairman)?  $default,) {final _that = this;
switch (_that) {
case _ReservationTimeSlotModel() when $default != null:
return $default(_that.id,_that.repairmanId,_that.date,_that.startTime,_that.endTime,_that.capacity,_that.status,_that.reservedCount,_that.remainingCapacity,_that.isFull,_that.jalaliDate,_that.repairman);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReservationTimeSlotModel implements ReservationTimeSlotModel {
  const _ReservationTimeSlotModel({required this.id, @JsonKey(name: 'repairman_id') required this.repairmanId, required this.date, @JsonKey(name: 'start_time') required this.startTime, @JsonKey(name: 'end_time') required this.endTime, required this.capacity, required this.status, @JsonKey(name: 'reserved_count') this.reservedCount, @JsonKey(name: 'remaining_capacity') this.remainingCapacity, @JsonKey(name: 'is_full') this.isFull, @JsonKey(name: 'jalali_date') this.jalaliDate, this.repairman});
  factory _ReservationTimeSlotModel.fromJson(Map<String, dynamic> json) => _$ReservationTimeSlotModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'repairman_id') final  String repairmanId;
@override final  String date;
@override@JsonKey(name: 'start_time') final  String startTime;
@override@JsonKey(name: 'end_time') final  String endTime;
@override final  int capacity;
@override final  String status;
@override@JsonKey(name: 'reserved_count') final  int? reservedCount;
@override@JsonKey(name: 'remaining_capacity') final  int? remainingCapacity;
@override@JsonKey(name: 'is_full') final  bool? isFull;
@override@JsonKey(name: 'jalali_date') final  String? jalaliDate;
@override final  ReservationUserModel? repairman;

/// Create a copy of ReservationTimeSlotModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReservationTimeSlotModelCopyWith<_ReservationTimeSlotModel> get copyWith => __$ReservationTimeSlotModelCopyWithImpl<_ReservationTimeSlotModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReservationTimeSlotModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReservationTimeSlotModel&&(identical(other.id, id) || other.id == id)&&(identical(other.repairmanId, repairmanId) || other.repairmanId == repairmanId)&&(identical(other.date, date) || other.date == date)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.status, status) || other.status == status)&&(identical(other.reservedCount, reservedCount) || other.reservedCount == reservedCount)&&(identical(other.remainingCapacity, remainingCapacity) || other.remainingCapacity == remainingCapacity)&&(identical(other.isFull, isFull) || other.isFull == isFull)&&(identical(other.jalaliDate, jalaliDate) || other.jalaliDate == jalaliDate)&&(identical(other.repairman, repairman) || other.repairman == repairman));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,repairmanId,date,startTime,endTime,capacity,status,reservedCount,remainingCapacity,isFull,jalaliDate,repairman);
}

@override
String toString() {
    return 'ReservationTimeSlotModel(id: $id, repairmanId: $repairmanId, date: $date, startTime: $startTime, endTime: $endTime, capacity: $capacity, status: $status, reservedCount: $reservedCount, remainingCapacity: $remainingCapacity, isFull: $isFull, jalaliDate: $jalaliDate, repairman: $repairman)';
}


}

/// @nodoc
abstract mixin class _$ReservationTimeSlotModelCopyWith<$Res> implements $ReservationTimeSlotModelCopyWith<$Res> {
  factory _$ReservationTimeSlotModelCopyWith(_ReservationTimeSlotModel value, $Res Function(_ReservationTimeSlotModel) _then) = __$ReservationTimeSlotModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'repairman_id') String repairmanId, String date,@JsonKey(name: 'start_time') String startTime,@JsonKey(name: 'end_time') String endTime, int capacity, String status,@JsonKey(name: 'reserved_count') int? reservedCount,@JsonKey(name: 'remaining_capacity') int? remainingCapacity,@JsonKey(name: 'is_full') bool? isFull,@JsonKey(name: 'jalali_date') String? jalaliDate, ReservationUserModel? repairman
});


@override $ReservationUserModelCopyWith<$Res>? get repairman;

}
/// @nodoc
class __$ReservationTimeSlotModelCopyWithImpl<$Res>
    implements _$ReservationTimeSlotModelCopyWith<$Res> {
  __$ReservationTimeSlotModelCopyWithImpl(this._self, this._then);

  final _ReservationTimeSlotModel _self;
  final $Res Function(_ReservationTimeSlotModel) _then;

/// Create a copy of ReservationTimeSlotModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? repairmanId = null,Object? date = null,Object? startTime = null,Object? endTime = null,Object? capacity = null,Object? status = null,Object? reservedCount = freezed,Object? remainingCapacity = freezed,Object? isFull = freezed,Object? jalaliDate = freezed,Object? repairman = freezed,}) {
  return _then(_ReservationTimeSlotModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,repairmanId: null == repairmanId ? _self.repairmanId : repairmanId // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,capacity: null == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,reservedCount: freezed == reservedCount ? _self.reservedCount : reservedCount // ignore: cast_nullable_to_non_nullable
as int?,remainingCapacity: freezed == remainingCapacity ? _self.remainingCapacity : remainingCapacity // ignore: cast_nullable_to_non_nullable
as int?,isFull: freezed == isFull ? _self.isFull : isFull // ignore: cast_nullable_to_non_nullable
as bool?,jalaliDate: freezed == jalaliDate ? _self.jalaliDate : jalaliDate // ignore: cast_nullable_to_non_nullable
as String?,repairman: freezed == repairman ? _self.repairman : repairman // ignore: cast_nullable_to_non_nullable
as ReservationUserModel?,
  ));
}

/// Create a copy of ReservationTimeSlotModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReservationUserModelCopyWith<$Res>? get repairman {
    if (_self.repairman == null) {
    return null;
  }

  return $ReservationUserModelCopyWith<$Res>(_self.repairman!, (value) {
    return _then(_self.copyWith(repairman: value));
  });
}
}


/// @nodoc
mixin _$PendingFeedbackModel {

@JsonKey(name: 'repairman_id') String? get repairmanId;@JsonKey(name: 'reservation_date') String? get reservationDate; ReservationModel? get reservation;
/// Create a copy of PendingFeedbackModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PendingFeedbackModelCopyWith<PendingFeedbackModel> get copyWith => _$PendingFeedbackModelCopyWithImpl<PendingFeedbackModel>(this as PendingFeedbackModel, _$identity);

  /// Serializes this PendingFeedbackModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PendingFeedbackModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PendingFeedbackModel&&(identical(other.repairmanId, _this.repairmanId) || other.repairmanId == _this.repairmanId)&&(identical(other.reservationDate, _this.reservationDate) || other.reservationDate == _this.reservationDate)&&(identical(other.reservation, _this.reservation) || other.reservation == _this.reservation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PendingFeedbackModel;
  return Object.hash(runtimeType,_this.repairmanId,_this.reservationDate,_this.reservation);
}

@override
String toString() {
  final _this = this as PendingFeedbackModel;
  return 'PendingFeedbackModel(repairmanId: ${_this.repairmanId}, reservationDate: ${_this.reservationDate}, reservation: ${_this.reservation})';
}


}

/// @nodoc
abstract mixin class $PendingFeedbackModelCopyWith<$Res>  {
  factory $PendingFeedbackModelCopyWith(PendingFeedbackModel value, $Res Function(PendingFeedbackModel) _then) = _$PendingFeedbackModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'repairman_id') String? repairmanId,@JsonKey(name: 'reservation_date') String? reservationDate, ReservationModel? reservation
});


$ReservationModelCopyWith<$Res>? get reservation;

}
/// @nodoc
class _$PendingFeedbackModelCopyWithImpl<$Res>
    implements $PendingFeedbackModelCopyWith<$Res> {
  _$PendingFeedbackModelCopyWithImpl(this._self, this._then);

  final PendingFeedbackModel _self;
  final $Res Function(PendingFeedbackModel) _then;

/// Create a copy of PendingFeedbackModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? repairmanId = freezed,Object? reservationDate = freezed,Object? reservation = freezed,}) {
  return _then(PendingFeedbackModel(
repairmanId: freezed == repairmanId ? _self.repairmanId : repairmanId // ignore: cast_nullable_to_non_nullable
as String?,reservationDate: freezed == reservationDate ? _self.reservationDate : reservationDate // ignore: cast_nullable_to_non_nullable
as String?,reservation: freezed == reservation ? _self.reservation : reservation // ignore: cast_nullable_to_non_nullable
as ReservationModel?,
  ));
}
/// Create a copy of PendingFeedbackModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReservationModelCopyWith<$Res>? get reservation {
    if (_self.reservation == null) {
    return null;
  }

  return $ReservationModelCopyWith<$Res>(_self.reservation!, (value) {
    return _then(_self.copyWith(reservation: value));
  });
}
}


/// Adds pattern-matching-related methods to [PendingFeedbackModel].
extension PendingFeedbackModelPatterns on PendingFeedbackModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PendingFeedbackModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PendingFeedbackModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PendingFeedbackModel value)  $default,){
final _that = this;
switch (_that) {
case _PendingFeedbackModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PendingFeedbackModel value)?  $default,){
final _that = this;
switch (_that) {
case _PendingFeedbackModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'repairman_id')  String? repairmanId, @JsonKey(name: 'reservation_date')  String? reservationDate,  ReservationModel? reservation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PendingFeedbackModel() when $default != null:
return $default(_that.repairmanId,_that.reservationDate,_that.reservation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'repairman_id')  String? repairmanId, @JsonKey(name: 'reservation_date')  String? reservationDate,  ReservationModel? reservation)  $default,) {final _that = this;
switch (_that) {
case _PendingFeedbackModel():
return $default(_that.repairmanId,_that.reservationDate,_that.reservation);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'repairman_id')  String? repairmanId, @JsonKey(name: 'reservation_date')  String? reservationDate,  ReservationModel? reservation)?  $default,) {final _that = this;
switch (_that) {
case _PendingFeedbackModel() when $default != null:
return $default(_that.repairmanId,_that.reservationDate,_that.reservation);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PendingFeedbackModel implements PendingFeedbackModel {
  const _PendingFeedbackModel({@JsonKey(name: 'repairman_id') this.repairmanId, @JsonKey(name: 'reservation_date') this.reservationDate, this.reservation});
  factory _PendingFeedbackModel.fromJson(Map<String, dynamic> json) => _$PendingFeedbackModelFromJson(json);

@override@JsonKey(name: 'repairman_id') final  String? repairmanId;
@override@JsonKey(name: 'reservation_date') final  String? reservationDate;
@override final  ReservationModel? reservation;

/// Create a copy of PendingFeedbackModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PendingFeedbackModelCopyWith<_PendingFeedbackModel> get copyWith => __$PendingFeedbackModelCopyWithImpl<_PendingFeedbackModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PendingFeedbackModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PendingFeedbackModel&&(identical(other.repairmanId, repairmanId) || other.repairmanId == repairmanId)&&(identical(other.reservationDate, reservationDate) || other.reservationDate == reservationDate)&&(identical(other.reservation, reservation) || other.reservation == reservation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,repairmanId,reservationDate,reservation);
}

@override
String toString() {
    return 'PendingFeedbackModel(repairmanId: $repairmanId, reservationDate: $reservationDate, reservation: $reservation)';
}


}

/// @nodoc
abstract mixin class _$PendingFeedbackModelCopyWith<$Res> implements $PendingFeedbackModelCopyWith<$Res> {
  factory _$PendingFeedbackModelCopyWith(_PendingFeedbackModel value, $Res Function(_PendingFeedbackModel) _then) = __$PendingFeedbackModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'repairman_id') String? repairmanId,@JsonKey(name: 'reservation_date') String? reservationDate, ReservationModel? reservation
});


@override $ReservationModelCopyWith<$Res>? get reservation;

}
/// @nodoc
class __$PendingFeedbackModelCopyWithImpl<$Res>
    implements _$PendingFeedbackModelCopyWith<$Res> {
  __$PendingFeedbackModelCopyWithImpl(this._self, this._then);

  final _PendingFeedbackModel _self;
  final $Res Function(_PendingFeedbackModel) _then;

/// Create a copy of PendingFeedbackModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? repairmanId = freezed,Object? reservationDate = freezed,Object? reservation = freezed,}) {
  return _then(_PendingFeedbackModel(
repairmanId: freezed == repairmanId ? _self.repairmanId : repairmanId // ignore: cast_nullable_to_non_nullable
as String?,reservationDate: freezed == reservationDate ? _self.reservationDate : reservationDate // ignore: cast_nullable_to_non_nullable
as String?,reservation: freezed == reservation ? _self.reservation : reservation // ignore: cast_nullable_to_non_nullable
as ReservationModel?,
  ));
}

/// Create a copy of PendingFeedbackModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReservationModelCopyWith<$Res>? get reservation {
    if (_self.reservation == null) {
    return null;
  }

  return $ReservationModelCopyWith<$Res>(_self.reservation!, (value) {
    return _then(_self.copyWith(reservation: value));
  });
}
}

// dart format on
