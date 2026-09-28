import 'package:dio/dio.dart';
import '../../../../../core/resources/data_state.dart';
import '../../domain/entity/manage_service_entity.dart';
import '../../domain/repository/manage_service_repository.dart';
import '../data_source/remote/manage_service_api_provider.dart';
import '../model/manage_service_model.dart';

class ManageServiceRepositoryImpl extends ManageServiceRepository {
  final ManageServiceApiProvider _apiProvider;
  ManageServiceRepositoryImpl(this._apiProvider);

  @override
  Future<DataState<List<ManageServiceEntity>>> listServices({
    bool isPaginate = true,
    int countItem = 10,
    String? title,
    String? repairmanId,
  }) async {
    try {
      final Response response = await _apiProvider.listServices(
        isPaginate: isPaginate,
        countItem: countItem,
        title: title,
        repairmanId: repairmanId,
      );

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

        final List<ManageServiceEntity> services = rawList
            .whereType<Map<String, dynamic>>()
            .map((json) => ManageServiceModel.fromJson(json).toEntity())
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
  Future<DataState<dynamic>> addServiceByAdmin({
    required String repairmanId,
    required String title,
    required String description,
    required List<String> images,
    required List<String> keywords,
    required double priceMin,
    required double priceMax,
  }) async {
    try {
      final Response response = await _apiProvider.addServiceByAdmin(
        repairmanId: repairmanId,
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
  Future<DataState<dynamic>> editService({
    required String serviceId,
    required String title,
    required String description,
    required List<String> images,
    required List<String> keywords,
    required double priceMin,
    required double priceMax,
  }) async {
    try {
      final Response response = await _apiProvider.editService(
        serviceId: serviceId,
        title: title,
        description: description,
        images: images,
        keywords: keywords,
        priceMin: priceMin,
        priceMax: priceMax,
      );

      if (response.statusCode == 200) {
        return DataSuccess(response.data);
      } else {
        return DataFailed(response.data is Map ? (response.data['message'] ?? "Error") : "Error");
      }
    } catch (e) {
      return const DataFailed('پاسخی دریافت نشد');
    }
  }

  @override
  Future<DataState<dynamic>> changeStatus({
    required String serviceId,
    required String status,
  }) async {
    try {
      final Response response = await _apiProvider.changeStatus(
        serviceId: serviceId,
        status: status,
      );

      if (response.statusCode == 200) {
        return DataSuccess(response.data);
      } else {
        return DataFailed(response.data is Map ? (response.data['message'] ?? "Error") : "Error");
      }
    } catch (e) {
      return const DataFailed('پاسخی دریافت نشد');
    }
  }

  @override
  Future<DataState<dynamic>> deleteService(String serviceId) async {
    try {
      final Response response = await _apiProvider.deleteService(serviceId);

      if (response.statusCode == 200) {
        return DataSuccess(response.data);
      } else {
        return DataFailed(response.data is Map ? (response.data['message'] ?? "Error") : "Error");
      }
    } catch (e) {
      return const DataFailed('پاسخی دریافت نشد');
    }
  }

  @override
  Future<DataState<ManageServiceEntity>> getServiceById(String serviceId) async {
    try {
      final Response response = await _apiProvider.getServiceById(serviceId);

      if (response.statusCode == 200) {
        final dynamic rootData = response.data;
        Map<String, dynamic>? serviceData;

        if (rootData is Map<String, dynamic>) {
          serviceData = rootData['data'] is Map<String, dynamic> ? rootData['data'] : rootData;
        }

        if (serviceData != null) {
          final ManageServiceModel model = ManageServiceModel.fromJson(serviceData);
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
