import '../../../feature_manage_products/domain/entity/manage_products_entity.dart';

class OrderItemEntity {
  final String id;
  final int quantity;
  final double originalPrice;
  final double finalPrice;
  final ManageProductsEntity? product;

  OrderItemEntity({
    required this.id,
    required this.quantity,
    required this.originalPrice,
    required this.finalPrice,
    this.product,
  });
}
