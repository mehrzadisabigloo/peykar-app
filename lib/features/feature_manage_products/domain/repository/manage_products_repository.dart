import '../../../../core/resources/data_state.dart';
import '../entity/manage_products_entity.dart';

abstract class ManageProductsRepository {
  Future<DataState<List<ManageProductsEntity>>> fetchManageProductsData({
    String? title,
    double? priceFrom,
    double? priceTo,
  });

  Future<DataState<dynamic>> addProduct({
    required String title,
    required String description,
    required List<String> images,
    required List<String> keywords,
    required double price,
    required int stock,
    required int maxPurchaseQuantity,
  });

  Future<DataState<ManageProductsEntity>> fetchProductById(String productId);

  Future<DataState<dynamic>> addToCart({
    required String productId,
    required int quantity,
    String cartType = 'current',
    String? discountCodeId,
  });
}
