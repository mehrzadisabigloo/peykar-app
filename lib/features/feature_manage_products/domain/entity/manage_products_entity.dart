import 'repairman_entity.dart';

class CategoryEntity {
  final String id;
  final String title;
  final String? slug;
  final String? description;
  final String? cover;
  final String? parentId;
  final bool isLeaf;
  final bool isFeatured;
  final int sortOrder;
  final List<CategoryEntity> parents;
  final List<CategoryEntity> children;

  CategoryEntity({
    required this.id,
    required this.title,
    this.slug,
    this.description,
    this.cover,
    this.parentId,
    this.isLeaf = false,
    this.isFeatured = false,
    this.sortOrder = 0,
    this.parents = const [],
    this.children = const [],
  });

  String get name => title;
}

class ManageProductsEntity {
  final String id;
  final String repairmanId;
  final String title;
  final String description;
  final List<String> images;
  final List<String> keywords;
  final double price;
  final int stock;
  final int minPurchaseQuantity;
  final int maxPurchaseQuantity;
  final String status;
  final double finalPrice;
  final bool hasDiscount;
  final double discountAmount;
  final int discountPercentage;
  final RepairmanEntity? repairman;
  final RepairmanEntity? admin;
  final String? ownerType;
  final String? categoryId;
  final CategoryEntity? category;

  ManageProductsEntity({
    required this.id,
    required this.repairmanId,
    required this.title,
    required this.description,
    required this.images,
    required this.keywords,
    required this.price,
    required this.stock,
    this.minPurchaseQuantity = 0,
    required this.maxPurchaseQuantity,
    required this.status,
    this.finalPrice = 0.0,
    this.hasDiscount = false,
    this.discountAmount = 0.0,
    this.discountPercentage = 0,
    this.repairman,
    this.admin,
    this.ownerType,
    this.categoryId,
    this.category,
  });

  // For backward compatibility if used elsewhere
  String get name => title;
  String get imageUrl => images.isNotEmpty ? images.first : '';
}
