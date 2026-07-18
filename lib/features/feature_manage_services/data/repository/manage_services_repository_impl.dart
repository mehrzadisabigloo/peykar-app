import 'package:dio/dio.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/entity/manage_services_entity.dart';
import '../../domain/repository/manage_services_repository.dart';
import '../data_source/remote/manage_services_api_provider.dart';
import '../model/manage_services_model.dart';

class ManageServicesRepositoryImpl extends ManageServicesRepository {
  final ManageServicesApiProvider _apiProvider;
  ManageServicesRepositoryImpl(this._apiProvider);

  @override
  Future<DataState<List<ManageServicesEntity>>> fetchManageServicesData() async {
    try {
      final Response response = await _apiProvider.getManageServicesData();

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
        } else if (rootData is List) {
          rawList = rootData;
        }

        final List<ManageServicesEntity> services = rawList
            .whereType<Map<String, dynamic>>()
            .map((json) => ManageServicesModel.fromJson(json).toEntity())
            .toList();

        return DataSuccess(services);
      } else {
        return DataFailed(response.data is Map ? (response.data['message'] ?? "Error") : "Error");
      }
    } catch (e) {
      return const DataFailed('پاسخی دریافت نشد');
    }
  }

  @override
  Future<DataState<dynamic>> addService({
    required String title,
    required String description,
    required List<String> images,
    required List<String> keywords,
    required double priceMin,
    required double priceMax,
  }) async {
    try {
      final Response response = await _apiProvider.addService(
        title: title,
        description: description,
        images: images,
        keywords: keywords,
        priceMin: priceMin,
        priceMax: priceMax,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return DataSuccess(response.data);
      } else {
        return DataFailed(response.data is Map ? (response.data['message'] ?? "Error") : "Error");
      }
    } catch (e) {
      return const DataFailed('پاسخی دریافت نشد');
    }
  }

  @override
  Future<DataState<ManageServicesEntity>> fetchServiceById(String serviceId) async {
    try {
      final Response response = await _apiProvider.getServiceById(serviceId);

      if (response.statusCode == 200) {
        final dynamic rootData = response.data;
        Map<String, dynamic>? serviceData;

        if (rootData is Map<String, dynamic>) {
          serviceData = rootData['data'] is Map<String, dynamic> ? rootData['data'] : rootData;
        }

        if (serviceData != null) {
          final ManageServicesModel model = ManageServicesModel.fromJson(serviceData);
          return DataSuccess(model.toEntity());
        } else {
          return const DataFailed("سرویس یافت نشد");
        }
      } else {
        return DataFailed(response.data is Map ? (response.data['message'] ?? "Error") : "Error");
      }
    } catch (e) {
      return const DataFailed('پاسخی دریافت نشد');
    }
  }
}
