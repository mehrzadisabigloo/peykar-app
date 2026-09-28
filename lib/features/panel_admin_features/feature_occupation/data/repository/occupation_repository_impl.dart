import 'package:dio/dio.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../domain/entity/occupation_entity.dart';
import '../../domain/entity/occupation_list_entity.dart';
import '../../domain/repository/occupation_repository.dart';
import '../data_source/remote/occupation_api_provider.dart';
import '../model/occupation_model.dart';

class OccupationRepositoryImpl extends OccupationRepository {
  final OccupationApiProvider _apiProvider;

  OccupationRepositoryImpl(this._apiProvider);

  @override
  Future<DataState<OccupationListEntity>> fetchOccupations(OccupationFilterParams params) async {
    try {
      final Response response = await _apiProvider.fetchOccupations(params);
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

          final occupations = data
              .whereType<Map<String, dynamic>>()
              .map((json) => OccupationModel.fromJson(json).toEntity())
              .toList();

          return DataSuccess(OccupationListEntity(
            occupations: occupations,
            currentPage: currentPage,
            lastPage: lastPage,
            total: total,
          ));
        } else {
          return DataFailed(response.data['message'] ?? "خطایی در دریافت لیست مشاغل رخ داد");
        }
      } else {
        return DataFailed("خطای سرور: ${response.statusCode}");
      }
    } catch (e) {
      return DataFailed('پاسخی دریافت نشد');
    }
  }

  @override
  Future<DataState<OccupationListEntity>> fetchActiveOccupations(OccupationFilterParams params) async {
    try {
      final Response response = await _apiProvider.fetchActiveOccupations(params);
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

          final occupations = data
              .whereType<Map<String, dynamic>>()
              .map((json) => OccupationModel.fromJson(json).toEntity())
              .toList();

          return DataSuccess(OccupationListEntity(
            occupations: occupations,
            currentPage: currentPage,
            lastPage: lastPage,
            total: total,
          ));
        } else {
          return DataFailed(response.data['message'] ?? "خطایی در دریافت لیست مشاغل فعال رخ داد");
        }
      } else {
        return DataFailed("خطای سرور: ${response.statusCode}");
      }
    } catch (e) {
      print(e);
      return DataFailed('پاسخی دریافت نشد');
    }
  }

  @override
  Future<DataState<OccupationEntity>> changeOccupationStatus(String id) async {
    try {
      final Response response = await _apiProvider.changeOccupationStatus(id);
      if (response.statusCode == 200) {
        if (response.data['success'] == true) {
          final occupation = OccupationModel.fromJson(response.data['data']).toEntity();
          return DataSuccess(occupation);
        } else {
          return DataFailed(response.data['message'] ?? "خطا در تغییر وضعیت شغل");
        }
      } else {
        return DataFailed("خطای سرور: ${response.statusCode}");
      }
    } catch (e) {
      return DataFailed('پاسخی دریافت نشد');
    }
  }

  @override
  Future<DataState<OccupationEntity>> moveOccupationUp(String id) async {
    try {
      final Response response = await _apiProvider.moveOccupationUp(id);
      if (response.statusCode == 200) {
        if (response.data['success'] == true) {
          final occupation = OccupationModel.fromJson(response.data['data']).toEntity();
          return DataSuccess(occupation);
        } else {
          return DataFailed(response.data['message'] ?? "خطا در بالا بردن اولویت شغل");
        }
      } else {
        return DataFailed("خطای سرور: ${response.statusCode}");
      }
    } catch (e) {
      return DataFailed('پاسخی دریافت نشد');
    }
  }

  @override
  Future<DataState<OccupationEntity>> moveOccupationDown(String id) async {
    try {
      final Response response = await _apiProvider.moveOccupationDown(id);
      if (response.statusCode == 200) {
        if (response.data['success'] == true) {
          final occupation = OccupationModel.fromJson(response.data['data']).toEntity();
          return DataSuccess(occupation);
        } else {
          return DataFailed(response.data['message'] ?? "خطا در پایین آوردن اولویت شغل");
        }
      } else {
        return DataFailed("خطای سرور: ${response.statusCode}");
      }
    } catch (e) {
      return DataFailed('پاسخی دریافت نشد');
    }
  }
}
