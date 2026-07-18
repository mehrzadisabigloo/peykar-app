// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repairman_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RepairmanModel _$RepairmanModelFromJson(Map<String, dynamic> json) {
  return _RepairmanModel.fromJson(json);
}

/// @nodoc
mixin _$RepairmanModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String? get lastName => throw _privateConstructorUsedError;
  String? get mobile => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'role', fromJson: _toList)
  List<String>? get role => throw _privateConstructorUsedError;
  String? get birthday => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_image_id')
  String? get profileImageId => throw _privateConstructorUsedError;
  String? get ostan => throw _privateConstructorUsedError;
  String? get shahrestan => throw _privateConstructorUsedError;
  String? get brand => throw _privateConstructorUsedError;
  @JsonKey(name: 'identity_images', fromJson: _toList)
  List<String>? get identityImages => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_license_image', fromJson: _toList)
  List<String>? get businessLicenseImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_numbers', fromJson: _toList)
  List<String>? get phoneNumbers => throw _privateConstructorUsedError;
  LocationModel? get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'shop_images', fromJson: _toList)
  List<String>? get shopImages => throw _privateConstructorUsedError;
  @JsonKey(name: 'subscription_code')
  String? get subscriptionCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'referral_code')
  String? get referralCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'occupation_id')
  String? get occupationId => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'referral_count', fromJson: _anyToInt)
  int? get referralCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'has_product', fromJson: _anyToBool)
  bool? get hasProduct => throw _privateConstructorUsedError;
  @JsonKey(name: 'has_service', fromJson: _anyToBool)
  bool? get hasService => throw _privateConstructorUsedError;

  /// Serializes this RepairmanModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RepairmanModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RepairmanModelCopyWith<RepairmanModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepairmanModelCopyWith<$Res> {
  factory $RepairmanModelCopyWith(
    RepairmanModel value,
    $Res Function(RepairmanModel) then,
  ) = _$RepairmanModelCopyWithImpl<$Res, RepairmanModel>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    String? mobile,
    String? email,
    @JsonKey(name: 'role', fromJson: _toList) List<String>? role,
    String? birthday,
    @JsonKey(name: 'profile_image_id') String? profileImageId,
    String? ostan,
    String? shahrestan,
    String? brand,
    @JsonKey(name: 'identity_images', fromJson: _toList)
    List<String>? identityImages,
    @JsonKey(name: 'business_license_image', fromJson: _toList)
    List<String>? businessLicenseImage,
    @JsonKey(name: 'phone_numbers', fromJson: _toList)
    List<String>? phoneNumbers,
    LocationModel? location,
    @JsonKey(name: 'shop_images', fromJson: _toList) List<String>? shopImages,
    @JsonKey(name: 'subscription_code') String? subscriptionCode,
    @JsonKey(name: 'referral_code') String? referralCode,
    @JsonKey(name: 'occupation_id') String? occupationId,
    String? status,
    @JsonKey(name: 'referral_count', fromJson: _anyToInt) int? referralCount,
    @JsonKey(name: 'has_product', fromJson: _anyToBool) bool? hasProduct,
    @JsonKey(name: 'has_service', fromJson: _anyToBool) bool? hasService,
  });

  $LocationModelCopyWith<$Res>? get location;
}

/// @nodoc
class _$RepairmanModelCopyWithImpl<$Res, $Val extends RepairmanModel>
    implements $RepairmanModelCopyWith<$Res> {
  _$RepairmanModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RepairmanModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? mobile = freezed,
    Object? email = freezed,
    Object? role = freezed,
    Object? birthday = freezed,
    Object? profileImageId = freezed,
    Object? ostan = freezed,
    Object? shahrestan = freezed,
    Object? brand = freezed,
    Object? identityImages = freezed,
    Object? businessLicenseImage = freezed,
    Object? phoneNumbers = freezed,
    Object? location = freezed,
    Object? shopImages = freezed,
    Object? subscriptionCode = freezed,
    Object? referralCode = freezed,
    Object? occupationId = freezed,
    Object? status = freezed,
    Object? referralCount = freezed,
    Object? hasProduct = freezed,
    Object? hasService = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            firstName: freezed == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                      as String?,
            lastName: freezed == lastName
                ? _value.lastName
                : lastName // ignore: cast_nullable_to_non_nullable
                      as String?,
            mobile: freezed == mobile
                ? _value.mobile
                : mobile // ignore: cast_nullable_to_non_nullable
                      as String?,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            role: freezed == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            birthday: freezed == birthday
                ? _value.birthday
                : birthday // ignore: cast_nullable_to_non_nullable
                      as String?,
            profileImageId: freezed == profileImageId
                ? _value.profileImageId
                : profileImageId // ignore: cast_nullable_to_non_nullable
                      as String?,
            ostan: freezed == ostan
                ? _value.ostan
                : ostan // ignore: cast_nullable_to_non_nullable
                      as String?,
            shahrestan: freezed == shahrestan
                ? _value.shahrestan
                : shahrestan // ignore: cast_nullable_to_non_nullable
                      as String?,
            brand: freezed == brand
                ? _value.brand
                : brand // ignore: cast_nullable_to_non_nullable
                      as String?,
            identityImages: freezed == identityImages
                ? _value.identityImages
                : identityImages // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            businessLicenseImage: freezed == businessLicenseImage
                ? _value.businessLicenseImage
                : businessLicenseImage // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            phoneNumbers: freezed == phoneNumbers
                ? _value.phoneNumbers
                : phoneNumbers // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            location: freezed == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as LocationModel?,
            shopImages: freezed == shopImages
                ? _value.shopImages
                : shopImages // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            subscriptionCode: freezed == subscriptionCode
                ? _value.subscriptionCode
                : subscriptionCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            referralCode: freezed == referralCode
                ? _value.referralCode
                : referralCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            occupationId: freezed == occupationId
                ? _value.occupationId
                : occupationId // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            referralCount: freezed == referralCount
                ? _value.referralCount
                : referralCount // ignore: cast_nullable_to_non_nullable
                      as int?,
            hasProduct: freezed == hasProduct
                ? _value.hasProduct
                : hasProduct // ignore: cast_nullable_to_non_nullable
                      as bool?,
            hasService: freezed == hasService
                ? _value.hasService
                : hasService // ignore: cast_nullable_to_non_nullable
                      as bool?,
          )
          as $Val,
    );
  }

  /// Create a copy of RepairmanModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationModelCopyWith<$Res>? get location {
    if (_value.location == null) {
      return null;
    }

    return $LocationModelCopyWith<$Res>(_value.location!, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RepairmanModelImplCopyWith<$Res>
    implements $RepairmanModelCopyWith<$Res> {
  factory _$$RepairmanModelImplCopyWith(
    _$RepairmanModelImpl value,
    $Res Function(_$RepairmanModelImpl) then,
  ) = __$$RepairmanModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    String? mobile,
    String? email,
    @JsonKey(name: 'role', fromJson: _toList) List<String>? role,
    String? birthday,
    @JsonKey(name: 'profile_image_id') String? profileImageId,
    String? ostan,
    String? shahrestan,
    String? brand,
    @JsonKey(name: 'identity_images', fromJson: _toList)
    List<String>? identityImages,
    @JsonKey(name: 'business_license_image', fromJson: _toList)
    List<String>? businessLicenseImage,
    @JsonKey(name: 'phone_numbers', fromJson: _toList)
    List<String>? phoneNumbers,
    LocationModel? location,
    @JsonKey(name: 'shop_images', fromJson: _toList) List<String>? shopImages,
    @JsonKey(name: 'subscription_code') String? subscriptionCode,
    @JsonKey(name: 'referral_code') String? referralCode,
    @JsonKey(name: 'occupation_id') String? occupationId,
    String? status,
    @JsonKey(name: 'referral_count', fromJson: _anyToInt) int? referralCount,
    @JsonKey(name: 'has_product', fromJson: _anyToBool) bool? hasProduct,
    @JsonKey(name: 'has_service', fromJson: _anyToBool) bool? hasService,
  });

  @override
  $LocationModelCopyWith<$Res>? get location;
}

/// @nodoc
class __$$RepairmanModelImplCopyWithImpl<$Res>
    extends _$RepairmanModelCopyWithImpl<$Res, _$RepairmanModelImpl>
    implements _$$RepairmanModelImplCopyWith<$Res> {
  __$$RepairmanModelImplCopyWithImpl(
    _$RepairmanModelImpl _value,
    $Res Function(_$RepairmanModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RepairmanModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? mobile = freezed,
    Object? email = freezed,
    Object? role = freezed,
    Object? birthday = freezed,
    Object? profileImageId = freezed,
    Object? ostan = freezed,
    Object? shahrestan = freezed,
    Object? brand = freezed,
    Object? identityImages = freezed,
    Object? businessLicenseImage = freezed,
    Object? phoneNumbers = freezed,
    Object? location = freezed,
    Object? shopImages = freezed,
    Object? subscriptionCode = freezed,
    Object? referralCode = freezed,
    Object? occupationId = freezed,
    Object? status = freezed,
    Object? referralCount = freezed,
    Object? hasProduct = freezed,
    Object? hasService = freezed,
  }) {
    return _then(
      _$RepairmanModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        firstName: freezed == firstName
            ? _value.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastName: freezed == lastName
            ? _value.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String?,
        mobile: freezed == mobile
            ? _value.mobile
            : mobile // ignore: cast_nullable_to_non_nullable
                  as String?,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        role: freezed == role
            ? _value._role
            : role // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        birthday: freezed == birthday
            ? _value.birthday
            : birthday // ignore: cast_nullable_to_non_nullable
                  as String?,
        profileImageId: freezed == profileImageId
            ? _value.profileImageId
            : profileImageId // ignore: cast_nullable_to_non_nullable
                  as String?,
        ostan: freezed == ostan
            ? _value.ostan
            : ostan // ignore: cast_nullable_to_non_nullable
                  as String?,
        shahrestan: freezed == shahrestan
            ? _value.shahrestan
            : shahrestan // ignore: cast_nullable_to_non_nullable
                  as String?,
        brand: freezed == brand
            ? _value.brand
            : brand // ignore: cast_nullable_to_non_nullable
                  as String?,
        identityImages: freezed == identityImages
            ? _value._identityImages
            : identityImages // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        businessLicenseImage: freezed == businessLicenseImage
            ? _value._businessLicenseImage
            : businessLicenseImage // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        phoneNumbers: freezed == phoneNumbers
            ? _value._phoneNumbers
            : phoneNumbers // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        location: freezed == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as LocationModel?,
        shopImages: freezed == shopImages
            ? _value._shopImages
            : shopImages // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        subscriptionCode: freezed == subscriptionCode
            ? _value.subscriptionCode
            : subscriptionCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        referralCode: freezed == referralCode
            ? _value.referralCode
            : referralCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        occupationId: freezed == occupationId
            ? _value.occupationId
            : occupationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        referralCount: freezed == referralCount
            ? _value.referralCount
            : referralCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        hasProduct: freezed == hasProduct
            ? _value.hasProduct
            : hasProduct // ignore: cast_nullable_to_non_nullable
                  as bool?,
        hasService: freezed == hasService
            ? _value.hasService
            : hasService // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RepairmanModelImpl extends _RepairmanModel {
  const _$RepairmanModelImpl({
    this.id = '',
    @JsonKey(name: 'first_name') this.firstName,
    @JsonKey(name: 'last_name') this.lastName,
    this.mobile,
    this.email,
    @JsonKey(name: 'role', fromJson: _toList) final List<String>? role,
    this.birthday,
    @JsonKey(name: 'profile_image_id') this.profileImageId,
    this.ostan,
    this.shahrestan,
    this.brand,
    @JsonKey(name: 'identity_images', fromJson: _toList)
    final List<String>? identityImages,
    @JsonKey(name: 'business_license_image', fromJson: _toList)
    final List<String>? businessLicenseImage,
    @JsonKey(name: 'phone_numbers', fromJson: _toList)
    final List<String>? phoneNumbers,
    this.location,
    @JsonKey(name: 'shop_images', fromJson: _toList)
    final List<String>? shopImages,
    @JsonKey(name: 'subscription_code') this.subscriptionCode,
    @JsonKey(name: 'referral_code') this.referralCode,
    @JsonKey(name: 'occupation_id') this.occupationId,
    this.status,
    @JsonKey(name: 'referral_count', fromJson: _anyToInt) this.referralCount,
    @JsonKey(name: 'has_product', fromJson: _anyToBool) this.hasProduct,
    @JsonKey(name: 'has_service', fromJson: _anyToBool) this.hasService,
  }) : _role = role,
       _identityImages = identityImages,
       _businessLicenseImage = businessLicenseImage,
       _phoneNumbers = phoneNumbers,
       _shopImages = shopImages,
       super._();

  factory _$RepairmanModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RepairmanModelImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey(name: 'first_name')
  final String? firstName;
  @override
  @JsonKey(name: 'last_name')
  final String? lastName;
  @override
  final String? mobile;
  @override
  final String? email;
  final List<String>? _role;
  @override
  @JsonKey(name: 'role', fromJson: _toList)
  List<String>? get role {
    final value = _role;
    if (value == null) return null;
    if (_role is EqualUnmodifiableListView) return _role;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? birthday;
  @override
  @JsonKey(name: 'profile_image_id')
  final String? profileImageId;
  @override
  final String? ostan;
  @override
  final String? shahrestan;
  @override
  final String? brand;
  final List<String>? _identityImages;
  @override
  @JsonKey(name: 'identity_images', fromJson: _toList)
  List<String>? get identityImages {
    final value = _identityImages;
    if (value == null) return null;
    if (_identityImages is EqualUnmodifiableListView) return _identityImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _businessLicenseImage;
  @override
  @JsonKey(name: 'business_license_image', fromJson: _toList)
  List<String>? get businessLicenseImage {
    final value = _businessLicenseImage;
    if (value == null) return null;
    if (_businessLicenseImage is EqualUnmodifiableListView)
      return _businessLicenseImage;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _phoneNumbers;
  @override
  @JsonKey(name: 'phone_numbers', fromJson: _toList)
  List<String>? get phoneNumbers {
    final value = _phoneNumbers;
    if (value == null) return null;
    if (_phoneNumbers is EqualUnmodifiableListView) return _phoneNumbers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final LocationModel? location;
  final List<String>? _shopImages;
  @override
  @JsonKey(name: 'shop_images', fromJson: _toList)
  List<String>? get shopImages {
    final value = _shopImages;
    if (value == null) return null;
    if (_shopImages is EqualUnmodifiableListView) return _shopImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'subscription_code')
  final String? subscriptionCode;
  @override
  @JsonKey(name: 'referral_code')
  final String? referralCode;
  @override
  @JsonKey(name: 'occupation_id')
  final String? occupationId;
  @override
  final String? status;
  @override
  @JsonKey(name: 'referral_count', fromJson: _anyToInt)
  final int? referralCount;
  @override
  @JsonKey(name: 'has_product', fromJson: _anyToBool)
  final bool? hasProduct;
  @override
  @JsonKey(name: 'has_service', fromJson: _anyToBool)
  final bool? hasService;

  @override
  String toString() {
    return 'RepairmanModel(id: $id, firstName: $firstName, lastName: $lastName, mobile: $mobile, email: $email, role: $role, birthday: $birthday, profileImageId: $profileImageId, ostan: $ostan, shahrestan: $shahrestan, brand: $brand, identityImages: $identityImages, businessLicenseImage: $businessLicenseImage, phoneNumbers: $phoneNumbers, location: $location, shopImages: $shopImages, subscriptionCode: $subscriptionCode, referralCode: $referralCode, occupationId: $occupationId, status: $status, referralCount: $referralCount, hasProduct: $hasProduct, hasService: $hasService)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepairmanModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.email, email) || other.email == email) &&
            const DeepCollectionEquality().equals(other._role, _role) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            (identical(other.profileImageId, profileImageId) ||
                other.profileImageId == profileImageId) &&
            (identical(other.ostan, ostan) || other.ostan == ostan) &&
            (identical(other.shahrestan, shahrestan) ||
                other.shahrestan == shahrestan) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            const DeepCollectionEquality().equals(
              other._identityImages,
              _identityImages,
            ) &&
            const DeepCollectionEquality().equals(
              other._businessLicenseImage,
              _businessLicenseImage,
            ) &&
            const DeepCollectionEquality().equals(
              other._phoneNumbers,
              _phoneNumbers,
            ) &&
            (identical(other.location, location) ||
                other.location == location) &&
            const DeepCollectionEquality().equals(
              other._shopImages,
              _shopImages,
            ) &&
            (identical(other.subscriptionCode, subscriptionCode) ||
                other.subscriptionCode == subscriptionCode) &&
            (identical(other.referralCode, referralCode) ||
                other.referralCode == referralCode) &&
            (identical(other.occupationId, occupationId) ||
                other.occupationId == occupationId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.referralCount, referralCount) ||
                other.referralCount == referralCount) &&
            (identical(other.hasProduct, hasProduct) ||
                other.hasProduct == hasProduct) &&
            (identical(other.hasService, hasService) ||
                other.hasService == hasService));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    firstName,
    lastName,
    mobile,
    email,
    const DeepCollectionEquality().hash(_role),
    birthday,
    profileImageId,
    ostan,
    shahrestan,
    brand,
    const DeepCollectionEquality().hash(_identityImages),
    const DeepCollectionEquality().hash(_businessLicenseImage),
    const DeepCollectionEquality().hash(_phoneNumbers),
    location,
    const DeepCollectionEquality().hash(_shopImages),
    subscriptionCode,
    referralCode,
    occupationId,
    status,
    referralCount,
    hasProduct,
    hasService,
  ]);

  /// Create a copy of RepairmanModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RepairmanModelImplCopyWith<_$RepairmanModelImpl> get copyWith =>
      __$$RepairmanModelImplCopyWithImpl<_$RepairmanModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RepairmanModelImplToJson(this);
  }
}

abstract class _RepairmanModel extends RepairmanModel {
  const factory _RepairmanModel({
    final String id,
    @JsonKey(name: 'first_name') final String? firstName,
    @JsonKey(name: 'last_name') final String? lastName,
    final String? mobile,
    final String? email,
    @JsonKey(name: 'role', fromJson: _toList) final List<String>? role,
    final String? birthday,
    @JsonKey(name: 'profile_image_id') final String? profileImageId,
    final String? ostan,
    final String? shahrestan,
    final String? brand,
    @JsonKey(name: 'identity_images', fromJson: _toList)
    final List<String>? identityImages,
    @JsonKey(name: 'business_license_image', fromJson: _toList)
    final List<String>? businessLicenseImage,
    @JsonKey(name: 'phone_numbers', fromJson: _toList)
    final List<String>? phoneNumbers,
    final LocationModel? location,
    @JsonKey(name: 'shop_images', fromJson: _toList)
    final List<String>? shopImages,
    @JsonKey(name: 'subscription_code') final String? subscriptionCode,
    @JsonKey(name: 'referral_code') final String? referralCode,
    @JsonKey(name: 'occupation_id') final String? occupationId,
    final String? status,
    @JsonKey(name: 'referral_count', fromJson: _anyToInt)
    final int? referralCount,
    @JsonKey(name: 'has_product', fromJson: _anyToBool) final bool? hasProduct,
    @JsonKey(name: 'has_service', fromJson: _anyToBool) final bool? hasService,
  }) = _$RepairmanModelImpl;
  const _RepairmanModel._() : super._();

  factory _RepairmanModel.fromJson(Map<String, dynamic> json) =
      _$RepairmanModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'first_name')
  String? get firstName;
  @override
  @JsonKey(name: 'last_name')
  String? get lastName;
  @override
  String? get mobile;
  @override
  String? get email;
  @override
  @JsonKey(name: 'role', fromJson: _toList)
  List<String>? get role;
  @override
  String? get birthday;
  @override
  @JsonKey(name: 'profile_image_id')
  String? get profileImageId;
  @override
  String? get ostan;
  @override
  String? get shahrestan;
  @override
  String? get brand;
  @override
  @JsonKey(name: 'identity_images', fromJson: _toList)
  List<String>? get identityImages;
  @override
  @JsonKey(name: 'business_license_image', fromJson: _toList)
  List<String>? get businessLicenseImage;
  @override
  @JsonKey(name: 'phone_numbers', fromJson: _toList)
  List<String>? get phoneNumbers;
  @override
  LocationModel? get location;
  @override
  @JsonKey(name: 'shop_images', fromJson: _toList)
  List<String>? get shopImages;
  @override
  @JsonKey(name: 'subscription_code')
  String? get subscriptionCode;
  @override
  @JsonKey(name: 'referral_code')
  String? get referralCode;
  @override
  @JsonKey(name: 'occupation_id')
  String? get occupationId;
  @override
  String? get status;
  @override
  @JsonKey(name: 'referral_count', fromJson: _anyToInt)
  int? get referralCount;
  @override
  @JsonKey(name: 'has_product', fromJson: _anyToBool)
  bool? get hasProduct;
  @override
  @JsonKey(name: 'has_service', fromJson: _anyToBool)
  bool? get hasService;

  /// Create a copy of RepairmanModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RepairmanModelImplCopyWith<_$RepairmanModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) {
  return _LocationModel.fromJson(json);
}

/// @nodoc
mixin _$LocationModel {
  @JsonKey(fromJson: _anyToDouble)
  double get lat => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _anyToDouble)
  double get lng => throw _privateConstructorUsedError;

  /// Serializes this LocationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LocationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocationModelCopyWith<LocationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationModelCopyWith<$Res> {
  factory $LocationModelCopyWith(
    LocationModel value,
    $Res Function(LocationModel) then,
  ) = _$LocationModelCopyWithImpl<$Res, LocationModel>;
  @useResult
  $Res call({
    @JsonKey(fromJson: _anyToDouble) double lat,
    @JsonKey(fromJson: _anyToDouble) double lng,
  });
}

/// @nodoc
class _$LocationModelCopyWithImpl<$Res, $Val extends LocationModel>
    implements $LocationModelCopyWith<$Res> {
  _$LocationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? lat = null, Object? lng = null}) {
    return _then(
      _value.copyWith(
            lat: null == lat
                ? _value.lat
                : lat // ignore: cast_nullable_to_non_nullable
                      as double,
            lng: null == lng
                ? _value.lng
                : lng // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LocationModelImplCopyWith<$Res>
    implements $LocationModelCopyWith<$Res> {
  factory _$$LocationModelImplCopyWith(
    _$LocationModelImpl value,
    $Res Function(_$LocationModelImpl) then,
  ) = __$$LocationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: _anyToDouble) double lat,
    @JsonKey(fromJson: _anyToDouble) double lng,
  });
}

/// @nodoc
class __$$LocationModelImplCopyWithImpl<$Res>
    extends _$LocationModelCopyWithImpl<$Res, _$LocationModelImpl>
    implements _$$LocationModelImplCopyWith<$Res> {
  __$$LocationModelImplCopyWithImpl(
    _$LocationModelImpl _value,
    $Res Function(_$LocationModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LocationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? lat = null, Object? lng = null}) {
    return _then(
      _$LocationModelImpl(
        lat: null == lat
            ? _value.lat
            : lat // ignore: cast_nullable_to_non_nullable
                  as double,
        lng: null == lng
            ? _value.lng
            : lng // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationModelImpl extends _LocationModel {
  const _$LocationModelImpl({
    @JsonKey(fromJson: _anyToDouble) this.lat = 0.0,
    @JsonKey(fromJson: _anyToDouble) this.lng = 0.0,
  }) : super._();

  factory _$LocationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationModelImplFromJson(json);

  @override
  @JsonKey(fromJson: _anyToDouble)
  final double lat;
  @override
  @JsonKey(fromJson: _anyToDouble)
  final double lng;

  @override
  String toString() {
    return 'LocationModel(lat: $lat, lng: $lng)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationModelImpl &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, lat, lng);

  /// Create a copy of LocationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationModelImplCopyWith<_$LocationModelImpl> get copyWith =>
      __$$LocationModelImplCopyWithImpl<_$LocationModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationModelImplToJson(this);
  }
}

abstract class _LocationModel extends LocationModel {
  const factory _LocationModel({
    @JsonKey(fromJson: _anyToDouble) final double lat,
    @JsonKey(fromJson: _anyToDouble) final double lng,
  }) = _$LocationModelImpl;
  const _LocationModel._() : super._();

  factory _LocationModel.fromJson(Map<String, dynamic> json) =
      _$LocationModelImpl.fromJson;

  @override
  @JsonKey(fromJson: _anyToDouble)
  double get lat;
  @override
  @JsonKey(fromJson: _anyToDouble)
  double get lng;

  /// Create a copy of LocationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationModelImplCopyWith<_$LocationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
