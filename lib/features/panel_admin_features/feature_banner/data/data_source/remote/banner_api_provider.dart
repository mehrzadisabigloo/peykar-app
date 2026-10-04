import '../../../../../../core/services/generic_api_service.dart';
import '../../../domain/entity/banner_entity.dart';

class BannerApiProvider {
  final GenericApiService _apiService;

  BannerApiProvider(this._apiService);

  Future<dynamic> fetchBanners(BannerFilterParams params) async {
    return await _apiService.post('/banners/list', params.toJson());
  }

  Future<dynamic> fetchActiveBanners(BannerFilterParams params) async {
    return await _apiService.post('/banners/list-active', params.toJson());
  }

  Future<dynamic> addBanner(Map<String, dynamic> params) async {
    return await _apiService.post('/banners/add', params);
  }

  Future<dynamic> editBanner(String id, Map<String, dynamic> params) async {
    return await _apiService.put('/banners/edit/$id', params);
  }

  Future<dynamic> deleteBanner(String id) async {
    return await _apiService.delete('/banners/delete/$id');
  }

  Future<dynamic> changeStatus(String id) async {
    return await _apiService.patch('/banners/change-status/$id', {});
  }
}
