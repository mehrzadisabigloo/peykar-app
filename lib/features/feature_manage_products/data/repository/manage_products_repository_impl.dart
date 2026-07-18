import 'package:dio/dio.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/entity/manage_products_entity.dart';
import '../../domain/repository/manage_products_repository.dart';
import '../data_source/remote/manage_products_api_provider.dart';
import '../model/manage_products_model.dart';

class ManageProductsRepositoryImpl extends ManageProductsRepository {
  final ManageProductsApiProvider _apiProvider;
  ManageProductsRepositoryImpl(this._apiProvider);

  @override
  Future<DataState<List<ManageProductsEntity>>> fetchManageProductsData({
    String? title,
    double? priceFrom,
    double? priceTo,
  }) async {
    try {
      final Response response = await _apiProvider.getManageProductsData(
        title: title,
        priceFrom: priceFrom,
        priceTo: priceTo,
      );

      if (response.statusCode == 200) {
        final dynamic rootData = response.data;
        List<dynamic> rawList = [];

        if (rootData is Map<String, dynamic>) {
          final data = rootData['data'];
          if (data is List) {
            rawList = data;
          } else if (data is Map && data['data'] is List) {
            rawList = data['data'];
          }
        } else if (rootData is List) {
          rawList = rootData;
        }

        final List<ManageProductsEntity> products = rawList
            .whereType<Map<String, dynamic>>()
            .map((json) => ManageProductsModel.fromJson(json).toEntity())
            .toList();

        return DataSuccess(products);
      } else {
        return DataFailed(response.data is Map ? (response.data['message'] ?? "خطایی رخ داد") : "خطایی رخ داد");
      }
    } catch (e) {
      return const DataFailed('پاسخی دریافت نشد');
    }
  }

  @override
  Future<DataState<dynamic>> addProduct({
    required String title,
    required String description,
    required List<String> images,
    required List<String> keywords,
    required double price,
    required int stock,
    required int maxPurchaseQuantity,
  }) async {
    try {
      final Response response = await _apiProvider.addProduct(
        title: title,
        description: description,
        images: images,
        keywords: keywords,
        price: price,
        stock: stock,
        maxPurchaseQuantity: maxPurchaseQuantity,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return DataSuccess(response.data);
      } else {
        return DataFailed(response.data is Map ? (response.data['message'] ?? "خطایی رخ داد") : "خطایی رخ داد");
      }
    } catch (e) {
      return const DataFailed('پاسخی دریافت نشد');
    }
  }

  @override
  Future<DataState<ManageProductsEntity>> fetchProductById(String productId) async {
    try {
      final Response response = await _apiProvider.getProductById(productId);

      if (response.statusCode == 200) {
        final dynamic rootData = response.data;
        Map<String, dynamic>? productData;

        if (rootData is Map<String, dynamic>) {
          productData = rootData['data'] is Map<String, dynamic> ? rootData['data'] : rootData;
        }

        if (productData != null) {
          final ManageProductsModel model = ManageProductsModel.fromJson(productData);
          return DataSuccess(model.toEntity());
        } else {
          return const DataFailed("محصول یافت نشد");
        }
      } else {
        return DataFailed(response.data is Map ? (response.data['message'] ?? "خطایی رخ داد") : "خطایی رخ داد");
      }
    } catch (e) {
      return const DataFailed('پاسخی دریافت نشد');
    }
  }

  @override
  Future<DataState<dynamic>> addToCart({
    required String productId,
    required int quantity,
    String cartType = 'current',
    String? discountCodeId,
  }) async {
    try {
      final Response response = await _apiProvider.addToCart(
        productId: productId,
        quantity: quantity,
        cartType: cartType,
        discountCodeId: discountCodeId,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return DataSuccess(response.data);
      } else {
        return DataFailed(response.data is Map ? (response.data['message'] ?? "خطا در افزودن به سبد خرید") : "خطا در افزودن به سبد خرید");
      }
    } catch (e) {
      return const DataFailed('پاسخی دریافت نشد');
    }
  }
}
