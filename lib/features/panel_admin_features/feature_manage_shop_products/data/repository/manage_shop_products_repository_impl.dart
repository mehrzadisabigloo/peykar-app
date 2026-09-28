import 'package:dio/dio.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../feature_manage_products/data/model/manage_products_model.dart';
import '../../../../feature_manage_products/domain/entity/manage_products_entity.dart';
import '../../domain/entity/admin_product_entity.dart';
import '../../domain/entity/admin_product_filter_params.dart';
import '../../domain/entity/admin_product_list_entity.dart';
import '../../domain/repository/manage_shop_products_repository.dart';
import '../data_source/remote/manage_shop_products_api_provider.dart';
import '../model/admin_product_model.dart';
import '../model/admin_product_list_model.dart';

class ManageShopProductsRepositoryImpl extends ManageShopProductsRepository {
  final ManageShopProductsApiProvider _apiProvider;
  ManageShopProductsRepositoryImpl(this._apiProvider);

  @override
  Future<DataState<AdminProductListEntity>> listAdminProducts(AdminProductFilterParams params) async {
    try {
      final Response response = await _apiProvider.listAdminProducts(params.toJson());
      if (response.statusCode == 200) {
        final listModel = AdminProductListModel.fromJson(response.data['data']);
        return DataSuccess(listModel.toEntity());
      } else {
        return DataFailed(response.data['message'] ?? "خطایی رخ داد");
      }
    } catch (e) {
      return const DataFailed('پاسخی دریافت نشد');
    }
  }

  @override
  Future<DataState<AdminProductListEntity>> listActiveAdminProducts(AdminProductFilterParams params) async {
    try {
      final Response response = await _apiProvider.listActiveAdminProducts(params.toJson());
      if (response.statusCode == 200) {
        final listModel = AdminProductListModel.fromJson(response.data['data']);
        return DataSuccess(listModel.toEntity());
      } else {
        return DataFailed(response.data['message'] ?? "خطایی رخ داد");
      }
    } catch (e) {
      return const DataFailed('پاسخی دریافت نشد');
    }
  }

  @override
  Future<DataState<AdminProductEntity>> getAdminProduct(String productId) async {
    try {
      final Response response = await _apiProvider.getAdminProduct(productId);
      if (response.statusCode == 200) {
        final product = AdminProductModel.fromJson(response.data['data']).toEntity();
        return DataSuccess(product);
      } else {
        return DataFailed(response.data['message'] ?? "خطایی رخ داد");
      }
    } catch (e) {
      return const DataFailed('پاسخی دریافت نشد');
    }
  }

  @override
  Future<DataState<bool>> addAdminProduct(AdminProductEntity product) async {
    try {
      final data = AdminProductModel.fromEntity(product).toJson();
      data.remove('id');
      data.remove('status');
      data.remove('created_at');
      
      final Response response = await _apiProvider.addAdminProduct(data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return const DataSuccess(true);
      } else {
        return DataFailed(response.data['message'] ?? "خطایی رخ داد");
      }
    } catch (e) {
      return const DataFailed('پاسخی دریافت نشد');
    }
  }

  @override
  Future<DataState<bool>> editAdminProduct(String productId, AdminProductEntity product) async {
    try {
      final data = AdminProductModel.fromEntity(product).toJson();
      data.remove('id');
      data.remove('status');
      data.remove('created_at');

      final Response response = await _apiProvider.editAdminProduct(productId, data);
      if (response.statusCode == 200) {
        return const DataSuccess(true);
      } else {
        return DataFailed(response.data['message'] ?? "خطایی رخ داد");
      }
    } catch (e) {
      return const DataFailed('پاسخی دریافت نشد');
    }
  }

  @override
  Future<DataState<bool>> deleteAdminProduct(String productId) async {
    try {
      final Response response = await _apiProvider.deleteAdminProduct(productId);
      if (response.statusCode == 200) {
        return const DataSuccess(true);
      } else {
        return DataFailed(response.data['message'] ?? "خطایی رخ داد");
      }
    } catch (e) {
      return const DataFailed('پاسخی دریافت نشد');
    }
  }

  @override
  Future<DataState<bool>> changeAdminProductStatus(String productId) async {
    try {
      final Response response = await _apiProvider.changeAdminProductStatus(productId);
      if (response.statusCode == 200) {
        return const DataSuccess(true);
      } else {
        return DataFailed(response.data['message'] ?? "خطایی رخ داد");
      }
    } catch (e) {
      return const DataFailed('پاسخی دریافت نشد');
    }
  }

  @override
  Future<DataState<List<CategoryEntity>>> fetchCategories() async {
    try {
      // Reusing logic from feature_manage_products/data/repository/manage_products_repository_impl.dart
      // But we need to use a provider. Let's add it to ManageShopProductsApiProvider or just use GenericApiService.
      // For simplicity and consistency within this feature, I'll add a method to ManageShopProductsApiProvider.
      final Response response = await _apiProvider.fetchCategories();
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
        }
        final categories = rawList
            .whereType<Map<String, dynamic>>()
            .map((json) => CategoryModel.fromJson(json).toEntity())
            .toList();
        return DataSuccess(categories);
      } else {
        return DataFailed(response.data['message'] ?? "خطایی رخ داد");
      }
    } catch (e) {
      return const DataFailed('پاسخی دریافت نشد');
    }
  }
}
