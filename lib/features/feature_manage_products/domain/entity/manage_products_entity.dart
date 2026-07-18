import 'repairman_entity.dart';

class ManageProductsEntity {
  final String id;
  final String repairmanId;
  final String title;
  final String description;
  final List<String> images;
  final List<String> keywords;
  final double price;
  final int stock;
  final int maxPurchaseQuantity;
  final String status;
  final double finalPrice;
  final bool hasDiscount;
  final double discountAmount;
  final int discountPercentage;
  final RepairmanEntity? repairman;

  ManageProductsEntity({
    required this.id,
    required this.repairmanId,
    required this.title,
    required this.description,
    required this.images,
    required this.keywords,
    required this.price,
    required this.stock,
    required this.maxPurchaseQuantity,
    required this.status,
    this.finalPrice = 0.0,
    this.hasDiscount = false,
    this.discountAmount = 0.0,
    this.discountPercentage = 0,
    this.repairman,
  });

  // For backward compatibility if used elsewhere
  String get name => title;
  String get imageUrl => images.isNotEmpty ? images.first : '';
}
