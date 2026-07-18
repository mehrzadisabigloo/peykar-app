import '../../../../features/feature_manage_products/domain/entity/manage_products_entity.dart';
import '../../../../features/feature_manage_services/domain/entity/manage_services_entity.dart';

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
  final List<ManageProductsEntity> products;
  final List<ManageServicesEntity> activeServices;
  final String? productsError;
  final String? servicesError;

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
    this.products = const [],
    this.activeServices = const [],
    this.productsError,
    this.servicesError,
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
