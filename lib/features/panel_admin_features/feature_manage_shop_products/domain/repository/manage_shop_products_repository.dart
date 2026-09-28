import '../../../../../core/resources/data_state.dart';
import '../../../../feature_manage_products/domain/entity/manage_products_entity.dart';
import '../entity/admin_product_entity.dart';
import '../entity/admin_product_filter_params.dart';
import '../entity/admin_product_list_entity.dart';

abstract class ManageShopProductsRepository {
  Future<DataState<AdminProductListEntity>> listAdminProducts(AdminProductFilterParams params);
  Future<DataState<AdminProductListEntity>> listActiveAdminProducts(AdminProductFilterParams params);
  Future<DataState<AdminProductEntity>> getAdminProduct(String productId);
  Future<DataState<bool>> addAdminProduct(AdminProductEntity product);
  Future<DataState<bool>> editAdminProduct(String productId, AdminProductEntity product);
  Future<DataState<bool>> deleteAdminProduct(String productId);
  Future<DataState<bool>> changeAdminProductStatus(String productId);
  Future<DataState<List<CategoryEntity>>> fetchCategories();
}
