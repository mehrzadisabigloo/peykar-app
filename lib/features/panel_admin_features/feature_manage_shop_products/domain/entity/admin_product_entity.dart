import '../../../../../core/resources/consts.dart';
import '../../../../feature_manage_products/domain/entity/manage_products_entity.dart';

class AdminProductEntity {
  final String? id;
  final String title;
  final String description;
  final List<String> images;
  final List<String> keywords;
  final double price;
  final int stock;
  final int minPurchaseQuantity;
  final int maxPurchaseQuantity;
  final String? status;
  final String? createdAt;
  final double? finalPrice;
  final bool? hasDiscount;
  final double? discountAmount;
  final double? discountPercentage;
  final String? categoryId;
  final CategoryEntity? category;

  AdminProductEntity({
    this.id,
    required this.title,
    required this.description,
    required this.images,
    required this.keywords,
    required this.price,
    required this.stock,
    required this.minPurchaseQuantity,
    required this.maxPurchaseQuantity,
    this.status,
    this.createdAt,
    this.finalPrice,
    this.hasDiscount,
    this.discountAmount,
    this.discountPercentage,
    this.categoryId,
    this.category,
  });

  String get imageUrl => images.isNotEmpty ? "${Consts.baseFileUrl}${images.first}" : '';
}
