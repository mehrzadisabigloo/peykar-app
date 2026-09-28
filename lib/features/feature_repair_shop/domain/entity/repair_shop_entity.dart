import '../../../../features/feature_manage_products/domain/entity/manage_products_entity.dart';
import '../../../../features/feature_manage_services/domain/entity/manage_services_entity.dart';
import '../../../feature_appointments/domain/entity/appointments_entity.dart';

class RepairShopEntity {
  final String id;
  final String name;
  final String imageUrl;
  final double rating;
  final int reviewsCount;
  final double distance;
  final List<RepairServiceEntity> services;
  final String? mobile;
  final String? address;
  final double? lat;
  final double? lng;
  final List<ManageProductsEntity> products;
  final List<ManageServicesEntity> activeServices;
  final List<AppointmentsEntity> userReservations;
  final String? productsError;
  final String? servicesError;
  final String? reservationsError;

  // New fields from API
  final String? email;
  final String? ostan;
  final String? shahrestan;
  final String? brand;
  final String? phoneNumbers;
  final List<String>? shopImages;
  final String? status;
  final double? distanceKm;
  final String? profileImageId;

  RepairShopEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.reviewsCount,
    required this.distance,
    required this.services,
    this.mobile,
    this.address,
    this.lat,
    this.lng,
    this.products = const [],
    this.activeServices = const [],
    this.userReservations = const [],
    this.productsError,
    this.servicesError,
    this.reservationsError,
    this.email,
    this.ostan,
    this.shahrestan,
    this.brand,
    this.phoneNumbers,
    this.shopImages,
    this.status,
    this.distanceKm,
    this.profileImageId,
  });
}

class RepairServiceEntity {
  final String id;
  final String title;
  final String imageUrl;
  final String priceRange;
  final String estimatedTime;

  RepairServiceEntity({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.priceRange,
    required this.estimatedTime,
  });
}
