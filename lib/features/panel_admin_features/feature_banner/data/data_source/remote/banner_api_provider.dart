import 'package:dio/dio.dart';
import '../../../../../../core/services/generic_api_service.dart';
import '../../../domain/entity/banner_entity.dart';

class BannerApiProvider {
  final GenericApiService _apiService = GenericApiService();

  Future<Response> fetchBanners(BannerFilterParams params) async {
    return await _apiService.post('/banners/list', params.toJson());
  }

  Future<Response> fetchActiveBanners(BannerFilterParams params) async {
    return await _apiService.post('/banners/list-active', params.toJson());
  }

  Future<Response> addBanner(Map<String, dynamic> params) async {
    return await _apiService.post('/banners/add', params);
  }

  Future<Response> editBanner(String id, Map<String, dynamic> params) async {
    return await _apiService.put('/banners/edit/$id', params);
  }

  Future<Response> deleteBanner(String id) async {
    return await _apiService.delete('/banners/delete/$id');
  }

  Future<Response> changeStatus(String id) async {
    return await _apiService.patch('/banners/change-status/$id', {});
  }
}
