import '../../../../core/resources/data_state.dart';
import '../../domain/entity/shop_entity.dart';
import '../../domain/repository/shop_repository.dart';
import '../data_source/remote/shop_api_provider.dart';

class ShopRepositoryImpl extends ShopRepository {
  final ShopApiProvider _apiProvider;
  ShopRepositoryImpl(this._apiProvider);

  @override
  Future<DataState<ShopEntity>> fetchShopData() async {
    try {
      // Mock data based on design
      final products = [
        ShopProduct(
          id: '1',
          title: 'روغن موتور ایرانول SM 5W-40',
          imageUrl: 'assets/images/oil1.png',
          price: 880000,
          isAvailable: true,
          category: 'روغن موتور',
        ),
        ShopProduct(
          id: '2',
          title: 'فیلتر روغن مان',
          imageUrl: 'assets/images/filter1.png',
          price: 240000,
          isAvailable: true,
          category: 'فیلتر',
        ),
        ShopProduct(
          id: '3',
          title: 'شمع NGK',
          imageUrl: 'assets/images/sparkplug1.png',
          price: 320000,
          isAvailable: true,
          category: 'قطعات یدکی',
        ),
      ];

      return DataSuccess(ShopEntity(products: products));
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
