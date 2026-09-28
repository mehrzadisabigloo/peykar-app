// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) =>
    _ProfileModel(
      id: json['id'] as String? ?? '',
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
      mobile: json['mobile'] as String? ?? '',
      email: json['email'] as String?,
      role: json['role'] == null ? '' : _roleFromJson(json['role']),
      birthday: json['birthday'] as String?,
      profileImageId: json['profile_image_id'] as String?,
      subscriptionCode: _anyToString(json['subscription_code']),
      status: json['status'] as String?,
      productsCount: json['products_count'] == null
          ? 0
          : _anyToInt(json['products_count']),
      servicesCount: json['services_count'] == null
          ? 0
          : _anyToInt(json['services_count']),
      ordersCount: json['orders_count'] == null
          ? 0
          : _anyToInt(json['orders_count']),
      brand: json['brand'] as String?,
      address: json['address'] as String?,
      hasProduct: json['has_product'] as bool? ?? false,
      hasService: json['has_service'] as bool? ?? false,
      location: json['location'] == null
          ? null
          : ReservationLocationModel.fromJson(
              json['location'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$ProfileModelToJson(_ProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'mobile': instance.mobile,
      'email': instance.email,
      'role': instance.role,
      'birthday': instance.birthday,
      'profile_image_id': instance.profileImageId,
      'subscription_code': instance.subscriptionCode,
      'status': instance.status,
      'products_count': instance.productsCount,
      'services_count': instance.servicesCount,
      'orders_count': instance.ordersCount,
      'brand': instance.brand,
      'address': instance.address,
      'has_product': instance.hasProduct,
      'has_service': instance.hasService,
      'location': instance.location,
    };
