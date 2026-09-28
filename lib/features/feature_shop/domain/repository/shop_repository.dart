import '../../../../core/resources/data_state.dart';
import '../../../panel_admin_features/feature_manage_shop_products/domain/entity/admin_product_filter_params.dart';
import '../../../panel_admin_features/feature_manage_shop_products/domain/entity/admin_product_list_entity.dart';
import '../../../feature_manage_products/domain/entity/manage_products_entity.dart';

abstract class ShopRepository {
  Future<DataState<AdminProductListEntity>> fetchShopData(AdminProductFilterParams params);

  Future<DataState<List<CategoryEntity>>> fetchCategories();
}
