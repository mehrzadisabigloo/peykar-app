import '../../domain/entity/admin_product_list_entity.dart';
import 'admin_product_model.dart';

class AdminProductListModel {
  final List<AdminProductModel> products;
  final bool hasMore;
  final int total;

  AdminProductListModel({
    required this.products,
    required this.hasMore,
    required this.total,
  });

  factory AdminProductListModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> data = json['data'] ?? [];
    return AdminProductListModel(
      products: data.map((e) => AdminProductModel.fromJson(e)).toList(),
      hasMore: json['next_page_url'] != null,
      total: json['total'] ?? 0,
    );
  }

  AdminProductListEntity toEntity() {
    return AdminProductListEntity(
      products: products.map((e) => e.toEntity()).toList(),
      hasMore: hasMore,
      total: total,
    );
  }
}
