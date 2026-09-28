import 'package:dio/dio.dart';
import '../../../../../core/resources/data_state.dart';
import '../../domain/entity/manage_reminder_types_entity.dart';
import '../../domain/repository/manage_reminder_types_repository.dart';
import '../data_source/remote/manage_reminder_types_api_provider.dart';
import '../model/manage_reminder_types_model.dart';

class ManageReminderTypesRepositoryImpl extends ManageReminderTypesRepository {
  final ManageReminderTypesApiProvider _apiProvider;
  ManageReminderTypesRepositoryImpl(this._apiProvider);

  @override
  Future<DataState<List<ManageReminderTypeEntity>>> listReminderTypes({
    String? title,
    bool isPaginate = false,
    int countItem = 10,
    int page = 1,
  }) async {
    try {
      final Response response = await _apiProvider.listReminderTypes(
        title: title,
        isPaginate: isPaginate,
        countItem: countItem,
        page: page,
      );

      if (response.statusCode == 200) {
        return _parseListResponse(response.data);
      } else {
        return DataFailed(response.data is Map ? (response.data['message'] ?? "Error") : "Error");
      }
    } catch (e) {
      return const DataFailed('خطا در برقراری ارتباط با سرور');
    }
  }

  @override
  Future<DataState<List<ManageReminderTypeEntity>>> listActiveReminderTypes({
    String? title,
    bool isPaginate = false,
    int countItem = 10,
    int page = 1,
  }) async {
    try {
      final Response response = await _apiProvider.listActiveReminderTypes(
        title: title,
        isPaginate: isPaginate,
        countItem: countItem,
        page: page,
      );

      if (response.statusCode == 200) {
        return _parseListResponse(response.data);
      } else {
        return DataFailed(response.data is Map ? (response.data['message'] ?? "Error") : "Error");
      }
    } catch (e) {
      return const DataFailed('خطا در برقراری ارتباط با سرور');
    }
  }

  @override
  Future<DataState<ManageReminderTypeEntity>> getReminderType(String id) async {
    try {
      final Response response = await _apiProvider.getReminderType(id);

      if (response.statusCode == 200) {
        final dynamic rootData = response.data;
        Map<String, dynamic>? typeData;

        if (rootData is Map<String, dynamic>) {
          typeData = rootData['data'] is Map<String, dynamic> ? rootData['data'] : rootData;
        }

        if (typeData != null) {
          final ManageReminderTypeModel model = ManageReminderTypeModel.fromJson(typeData);
          return DataSuccess(model.toEntity());
        } else {
          return const DataFailed("نوع یادآور یافت نشد");
        }
      } else {
        return DataFailed(response.data is Map ? (response.data['message'] ?? "Error") : "Error");
      }
    } catch (e) {
      return const DataFailed('خطا در برقراری ارتباط با سرور');
    }
  }

  @override
  Future<DataState<dynamic>> addReminderType({required String title}) async {
    try {
      final Response response = await _apiProvider.addReminderType(title);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return DataSuccess(response.data);
      } else {
        return DataFailed(response.data is Map ? (response.data['message'] ?? "Error") : "Error");
      }
    } catch (e) {
      return const DataFailed('خطا در برقراری ارتباط با سرور');
    }
  }

  @override
  Future<DataState<dynamic>> editReminderType({required String id, required String title}) async {
    try {
      final Response response = await _apiProvider.editReminderType(id, title);
      if (response.statusCode == 200) {
        return DataSuccess(response.data);
      } else {
        return DataFailed(response.data is Map ? (response.data['message'] ?? "Error") : "Error");
      }
    } catch (e) {
      return const DataFailed('خطا در برقراری ارتباط با سرور');
    }
  }

  @override
  Future<DataState<dynamic>> deleteReminderType(String id) async {
    try {
      final Response response = await _apiProvider.deleteReminderType(id);
      if (response.statusCode == 200) {
        return DataSuccess(response.data);
      } else {
        return DataFailed(response.data is Map ? (response.data['message'] ?? "Error") : "Error");
      }
    } catch (e) {
      return const DataFailed('خطا در برقراری ارتباط با سرور');
    }
  }

  @override
  Future<DataState<dynamic>> changeStatus(String id) async {
    try {
      final Response response = await _apiProvider.changeStatus(id);
      if (response.statusCode == 200) {
        return DataSuccess(response.data);
      } else {
        return DataFailed(response.data is Map ? (response.data['message'] ?? "Error") : "Error");
      }
    } catch (e) {
      return const DataFailed('خطا در برقراری ارتباط با سرور');
    }
  }

  DataState<List<ManageReminderTypeEntity>> _parseListResponse(dynamic rootData) {
    List<dynamic> rawList = [];

    if (rootData is Map<String, dynamic>) {
      final data = rootData['data'];
      if (data is List) {
        rawList = data;
      } else if (data is Map && data['data'] is List) {
        rawList = data['data'];
      } else {
        rawList = [];
      }
    } else if (rootData is List) {
      rawList = rootData;
    }

    final List<ManageReminderTypeEntity> types = rawList
        .whereType<Map<String, dynamic>>()
        .map((json) => ManageReminderTypeModel.fromJson(json).toEntity())
        .toList();

    return DataSuccess(types);
  }
}
