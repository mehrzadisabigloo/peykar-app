import 'package:dio/dio.dart';
import '../../../../core/resources/data_state.dart';
import '../../../feature_manage_products/data/model/manage_products_model.dart';
import '../../../feature_manage_services/data/model/manage_services_model.dart';
import '../../domain/entity/repair_shop_entity.dart';
import '../../domain/repository/repair_shop_repository.dart';
import '../data_source/remote/repair_shop_api_provider.dart';
import '../model/repairman_details_model.dart';

class RepairShopRepositoryImpl extends RepairShopRepository {
  final RepairShopApiProvider _apiProvider;
  RepairShopRepositoryImpl(this._apiProvider);

  @override
  Future<DataState<RepairShopEntity>> fetchRepairShopData(String repairmanId) async {
    try {
      // Fetch everything in parallel
      final results = await Future.wait([
        _apiProvider.getRepairShopData(repairmanId),
        _apiProvider.getActiveProducts(repairmanId: repairmanId),
        _apiProvider.getActiveServices(repairmanId: repairmanId),
      ]);

      final dynamic detailsResponse = results[0];
      final dynamic productsResponse = results[1];
      final dynamic servicesResponse = results[2];

      if (detailsResponse is Response && detailsResponse.statusCode == 200) {
        final detailsData = detailsResponse.data;
        if (detailsData is Map && detailsData['success'] == true) {
          final model = RepairmanDetailsModel.fromJson(detailsData['data']);
          final entity = model.toEntity();

          // Parse products
          List<ManageProductsModel> products = [];
          String? productsError;
          if (productsResponse is Response && productsResponse.statusCode == 200) {
            final pBody = productsResponse.data;
            if (pBody is Map && pBody['success'] == true) {
              final pData = pBody['data'];
              final pItems = (pData is Map) ? pData['data'] : pData;
              if (pItems is List) {
                products = pItems
                    .whereType<Map<String, dynamic>>()
                    .map((e) => ManageProductsModel.fromJson(e))
                    .where((p) => p.repairmanId == repairmanId)
                    .toList();
              }
            } else {
              productsError = pBody is Map ? pBody['message'] : "خطا در دریافت محصولات";
            }
          } else {
            productsError = productsResponse is Response && productsResponse.data is Map 
                ? productsResponse.data['message'] 
                : "خطا در دریافت محصولات";
          }

          // Parse services
          List<ManageServicesModel> services = [];
          String? servicesError;
          if (servicesResponse is Response && servicesResponse.statusCode == 200) {
            final sBody = servicesResponse.data;
            if (sBody is Map && sBody['success'] == true) {
              final sData = sBody['data'];
              final sItems = (sData is Map) ? sData['data'] : sData;
              if (sItems is List) {
                services = sItems
                    .whereType<Map<String, dynamic>>()
                    .map((e) => ManageServicesModel.fromJson(e))
                    .where((s) => s.repairmanId == repairmanId)
                    .toList();
              }
            } else {
              servicesError = sBody is Map ? sBody['message'] : "خطا در دریافت سرویس‌ها";
            }
          } else {
            servicesError = servicesResponse is Response && servicesResponse.data is Map 
                ? servicesResponse.data['message'] 
                : "خطا در دریافت سرویس‌ها";
          }

          return DataSuccess(RepairShopEntity(
            id: entity.id,
            name: entity.name,
            imageUrl: entity.imageUrl,
            rating: entity.rating,
            reviewsCount: entity.reviewsCount,
            distance: entity.distance,
            services: entity.services,
            mobile: entity.mobile,
            address: entity.address,
            products: products.map((e) => e.toEntity()).toList(),
            activeServices: services.map((e) => e.toEntity()).toList(),
            productsError: productsError,
            servicesError: servicesError,
          ));
        } else {
          return DataFailed(detailsData is Map ? (detailsData['message'] ?? "خطایی رخ داد") : "خطایی رخ داد");
        }
      } else {
        return DataFailed(detailsResponse is Response && detailsResponse.data is Map 
            ? (detailsResponse.data['message'] ?? "خطا در دریافت اطلاعات") 
            : "خطا در دریافت اطلاعات");
      }
    } catch (e) {
      print(e);
      return const DataFailed('پاسخی دریافت نشد');
    }
  }
}
