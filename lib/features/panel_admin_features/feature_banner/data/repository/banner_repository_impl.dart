import 'package:dio/dio.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../domain/entity/banner_entity.dart';
import '../../domain/entity/banner_list_entity.dart';
import '../../domain/repository/banner_repository.dart';
import '../data_source/remote/banner_api_provider.dart';
import '../model/banner_model.dart';

class BannerRepositoryImpl extends BannerRepository {
  final BannerApiProvider _apiProvider;

  BannerRepositoryImpl(this._apiProvider);

  @override
  Future<DataState<BannerListEntity>> fetchBanners(BannerFilterParams params) async {
    try {
      final Response response = await _apiProvider.fetchBanners(params);
      if (response.statusCode == 200) {
        if (response.data['success'] == true) {
          final dynamic rawData = response.data['data'];
          List<dynamic> data = [];
          int currentPage = 1;
          int lastPage = 1;
          int total = 0;

          if (rawData is Map<String, dynamic>) {
            data = rawData['data'] is List ? rawData['data'] : [];
            currentPage = rawData['current_page'] ?? 1;
            lastPage = rawData['last_page'] ?? 1;
            total = rawData['total'] ?? 0;
          } else if (rawData is List) {
            data = rawData;
            total = rawData.length;
          }

          final banners = data
              .whereType<Map<String, dynamic>>()
              .map((json) => BannerModel.fromJson(json).toEntity())
              .toList();

          return DataSuccess(BannerListEntity(
            banners: banners,
            currentPage: currentPage,
            lastPage: lastPage,
            total: total,
          ));
        } else {
          return DataFailed(response.data['message'] ?? "خطایی در دریافت لیست بنرها رخ داد");
        }
      } else {
        return DataFailed("خطای سرور: ${response.statusCode}");
      }
    } catch (e) {
      return DataFailed('پاسخی دریافت نشد');
    }
  }

  @override
  Future<DataState<BannerListEntity>> fetchActiveBanners(BannerFilterParams params) async {
    try {
      final Response response = await _apiProvider.fetchActiveBanners(params);
      if (response.statusCode == 200) {
        if (response.data['success'] == true) {
          final dynamic rawData = response.data['data'];
          List<dynamic> data = [];
          int currentPage = 1;
          int lastPage = 1;
          int total = 0;

          if (rawData is Map<String, dynamic>) {
            data = rawData['data'] is List ? rawData['data'] : [];
            currentPage = rawData['current_page'] ?? 1;
            lastPage = rawData['last_page'] ?? 1;
            total = rawData['total'] ?? 0;
          } else if (rawData is List) {
            data = rawData;
            total = rawData.length;
          }

          final banners = data
              .whereType<Map<String, dynamic>>()
              .map((json) => BannerModel.fromJson(json).toEntity())
              .toList();

          return DataSuccess(BannerListEntity(
            banners: banners,
            currentPage: currentPage,
            lastPage: lastPage,
            total: total,
          ));
        } else {
          return DataFailed(response.data['message'] ?? "خطایی در دریافت لیست بنرهای فعال رخ داد");
        }
      } else {
        return DataFailed("خطای سرور: ${response.statusCode}");
      }
    } catch (e) {
      return DataFailed('پاسخی دریافت نشد');
    }
  }

  @override
  Future<DataState<BannerEntity>> addBanner(Map<String, dynamic> params) async {
    try {
      final Response response = await _apiProvider.addBanner(params);
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data['success'] == true) {
          final banner = BannerModel.fromJson(response.data['data']).toEntity();
          return DataSuccess(banner);
        } else {
          return DataFailed(response.data['message'] ?? "خطا در افزودن بنر");
        }
      } else {
        return DataFailed("خطای سرور: ${response.statusCode}");
      }
    } catch (e) {
      return DataFailed('پاسخی دریافت نشد');
    }
  }

  @override
  Future<DataState<BannerEntity>> editBanner(String id, Map<String, dynamic> params) async {
    try {
      final Response response = await _apiProvider.editBanner(id, params);
      if (response.statusCode == 200) {
        if (response.data['success'] == true) {
          final banner = BannerModel.fromJson(response.data['data']).toEntity();
          return DataSuccess(banner);
        } else {
          return DataFailed(response.data['message'] ?? "خطا در ویرایش بنر");
        }
      } else {
        return DataFailed("خطای سرور: ${response.statusCode}");
      }
    } catch (e) {
      return DataFailed('پاسخی دریافت نشد');
    }
  }

  @override
  Future<DataState<String>> deleteBanner(String id) async {
    try {
      final Response response = await _apiProvider.deleteBanner(id);
      if (response.statusCode == 200) {
        if (response.data['success'] == true) {
          return DataSuccess(response.data['message'] ?? "بنر با موفقیت حذف شد");
        } else {
          return DataFailed(response.data['message'] ?? "خطا در حذف بنر");
        }
      } else {
        return DataFailed("خطای سرور: ${response.statusCode}");
      }
    } catch (e) {
      return DataFailed('پاسخی دریافت نشد');
    }
  }

  @override
  Future<DataState<BannerEntity>> changeStatus(String id) async {
    try {
      final Response response = await _apiProvider.changeStatus(id);
      if (response.statusCode == 200) {
        if (response.data['success'] == true) {
          final banner = BannerModel.fromJson(response.data['data']).toEntity();
          return DataSuccess(banner);
        } else {
          return DataFailed(response.data['message'] ?? "خطا در تغییر وضعیت بنر");
        }
      } else {
        return DataFailed("خطای سرور: ${response.statusCode}");
      }
    } catch (e) {
      return DataFailed('پاسخی دریافت نشد');
    }
  }
}
