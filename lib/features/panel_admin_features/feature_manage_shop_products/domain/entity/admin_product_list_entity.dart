import 'admin_product_entity.dart';

class AdminProductListEntity {
  final List<AdminProductEntity> products;
  final bool hasMore;
  final int total;

  AdminProductListEntity({
    required this.products,
    required this.hasMore,
    required this.total,
  });
}
