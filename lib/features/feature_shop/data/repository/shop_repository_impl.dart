import 'package:dio/dio.dart';
import '../../../../core/resources/data_state.dart';
import '../../../panel_admin_features/feature_manage_shop_products/data/model/admin_product_list_model.dart';
import '../../../panel_admin_features/feature_manage_shop_products/domain/entity/admin_product_filter_params.dart';
import '../../../panel_admin_features/feature_manage_shop_products/domain/entity/admin_product_list_entity.dart';
import '../../domain/repository/shop_repository.dart';
import '../data_source/remote/shop_api_provider.dart';
import '../../../feature_manage_products/data/model/manage_products_model.dart';
import '../../../feature_manage_products/domain/entity/manage_products_entity.dart';

class ShopRepositoryImpl extends ShopRepository {
  final ShopApiProvider _apiProvider;
  ShopRepositoryImpl(this._apiProvider);

  @override
  Future<DataState<AdminProductListEntity>> fetchShopData(AdminProductFilterParams params) async {
    try {
      final Response response = await _apiProvider.getShopData(params.toJson());

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
  Future<DataState<List<CategoryEntity>>> fetchCategories() async {
    try {
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
        return DataFailed(response.data is Map
            ? (response.data['message'] ?? "خطایی رخ داد")
            : "خطایی رخ داد");
      }
    } catch (e) {
      return const DataFailed('پاسخی دریافت نشد');
    }
  }
}
