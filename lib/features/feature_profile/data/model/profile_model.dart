import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/profile_entity.dart';
import '../../../feature_appointments/data/model/reservation_model.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

String _roleFromJson(dynamic json) {
  if (json is List) {
    return json.isNotEmpty ? json.first.toString() : '';
  }
  return json?.toString() ?? '';
}

String? _anyToString(dynamic json) => json?.toString();

int _anyToInt(dynamic json) {
  if (json is int) return json;
  if (json is String) return int.tryParse(json) ?? 0;
  return 0;
}

@freezed
sealed class ProfileModel with _$ProfileModel {
  const ProfileModel._();

  const factory ProfileModel({
    @Default('') String id,

    @JsonKey(name: 'first_name')
    @Default('')
    String firstName,

    @JsonKey(name: 'last_name')
    @Default('')
    String lastName,

    @Default('') String mobile,

    String? email,

    @JsonKey(fromJson: _roleFromJson)
    @Default('')
    String role,

    String? birthday,

    @JsonKey(name: 'profile_image_id')
    String? profileImageId,

    @JsonKey(name: 'subscription_code', fromJson: _anyToString)
    String? subscriptionCode,

    String? status,

    @JsonKey(name: 'products_count', fromJson: _anyToInt)
    @Default(0)
    int productsCount,

    @JsonKey(name: 'services_count', fromJson: _anyToInt)
    @Default(0)
    int servicesCount,

    @JsonKey(name: 'orders_count', fromJson: _anyToInt)
    @Default(0)
    int ordersCount,

    String? brand,
    String? address,

    @JsonKey(name: 'has_product')
    @Default(false)
    bool hasProduct,

    @JsonKey(name: 'has_service')
    @Default(false)
    bool hasService,

    ReservationLocationModel? location,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  ProfileEntity toEntity() => ProfileEntity(
    id: id,
    firstName: firstName,
    lastName: lastName,
    mobile: mobile,
    email: email,
    role: role,
    birthday: birthday,
    profileImageId: profileImageId,
    subscriptionCode: subscriptionCode,
    status: status,
    productsCount: productsCount,
    servicesCount: servicesCount,
    ordersCount: ordersCount,
    brand: brand,
    address: address,
    hasProduct: hasProduct,
    hasService: hasService,
    lat: location?.lat,
    lng: location?.lng,
  );

  factory ProfileModel.fromEntity(ProfileEntity entity) => ProfileModel(
    id: entity.id,
    firstName: entity.firstName,
    lastName: entity.lastName,
    mobile: entity.mobile,
    email: entity.email,
    role: entity.role,
    birthday: entity.birthday,
    profileImageId: entity.profileImageId,
    subscriptionCode: entity.subscriptionCode,
    status: entity.status,
    productsCount: entity.productsCount,
    servicesCount: entity.servicesCount,
    ordersCount: entity.ordersCount,
    brand: entity.brand,
    address: entity.address,
    hasProduct: entity.hasProduct,
    hasService: entity.hasService,
    location: entity.lat != null || entity.lng != null 
        ? ReservationLocationModel(lat: entity.lat, lng: entity.lng)
        : null,
  );
}
