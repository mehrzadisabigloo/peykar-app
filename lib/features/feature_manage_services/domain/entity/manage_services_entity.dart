import '../../../feature_manage_products/domain/entity/repairman_entity.dart';

class ManageServicesEntity {
  final String id;
  final String? repairmanId;
  final String title;
  final String description;
  final List<String> images;
  final List<String> keywords;
  final double priceMin;
  final double priceMax;
  final String status;
  final RepairmanEntity? repairman;

  ManageServicesEntity({
    required this.id,
    this.repairmanId,
    required this.title,
    required this.description,
    required this.images,
    required this.keywords,
    required this.priceMin,
    required this.priceMax,
    required this.status,
    this.repairman,
  });

  String get name => title;
  String get imageUrl => images.isNotEmpty ? images.first : '';
}
