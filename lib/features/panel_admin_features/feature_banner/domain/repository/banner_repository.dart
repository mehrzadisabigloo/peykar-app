import '../../../../../../core/resources/data_state.dart';
import '../entity/banner_entity.dart';
import '../entity/banner_list_entity.dart';

abstract class BannerRepository {
  Future<DataState<BannerListEntity>> fetchBanners(BannerFilterParams params);
  Future<DataState<BannerListEntity>> fetchActiveBanners(BannerFilterParams params);
  Future<DataState<BannerEntity>> addBanner(Map<String, dynamic> params);
  Future<DataState<BannerEntity>> editBanner(String id, Map<String, dynamic> params);
  Future<DataState<String>> deleteBanner(String id);
  Future<DataState<BannerEntity>> changeStatus(String id);
}
