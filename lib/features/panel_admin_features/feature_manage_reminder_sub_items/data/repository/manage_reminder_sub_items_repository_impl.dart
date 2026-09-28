import 'package:dio/dio.dart';
import '../../../../../core/resources/data_state.dart';
import '../../domain/entity/manage_reminder_sub_item_entity.dart';
import '../../domain/repository/manage_reminder_sub_items_repository.dart';
import '../data_source/remote/manage_reminder_sub_items_api_provider.dart';
import '../model/manage_reminder_sub_item_model.dart';

class ManageReminderSubItemsRepositoryImpl extends ManageReminderSubItemsRepository {
  final ManageReminderSubItemsApiProvider _apiProvider;
  ManageReminderSubItemsRepositoryImpl(this._apiProvider);

  @override
  Future<DataState<List<ManageReminderSubItemEntity>>> listSubItems({
    String? reminderTypeId,
    String? title,
    bool isPaginate = false,
    int countItem = 10,
    int page = 1,
  }) async {
    try {
      final Response response = await _apiProvider.listSubItems(
        reminderTypeId: reminderTypeId,
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
  Future<DataState<List<ManageReminderSubItemEntity>>> listActiveSubItems({
    String? reminderTypeId,
    String? title,
    bool isPaginate = false,
    int countItem = 10,
    int page = 1,
  }) async {
    try {
      final Response response = await _apiProvider.listActiveSubItems(
        reminderTypeId: reminderTypeId,
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
  Future<DataState<ManageReminderSubItemEntity>> getSubItem(String id) async {
    try {
      final Response response = await _apiProvider.getSubItem(id);

      if (response.statusCode == 200) {
        final dynamic rootData = response.data;
        Map<String, dynamic>? itemData;

        if (rootData is Map<String, dynamic>) {
          itemData = rootData['data'] is Map<String, dynamic> ? rootData['data'] : rootData;
        }

        if (itemData != null) {
          final ManageReminderSubItemModel model = ManageReminderSubItemModel.fromJson(itemData);
          return DataSuccess(model.toEntity());
        } else {
          return const DataFailed("زیرمجموعه یافت نشد");
        }
      } else {
        return DataFailed(response.data is Map ? (response.data['message'] ?? "Error") : "Error");
      }
    } catch (e) {
      return const DataFailed('خطا در برقراری ارتباط با سرور');
    }
  }

  @override
  Future<DataState<dynamic>> addSubItem({required String reminderTypeId, required String title}) async {
    try {
      final Response response = await _apiProvider.addSubItem(reminderTypeId, title);
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
  Future<DataState<dynamic>> addSubItemsBulk({required String reminderTypeId, required List<String> titles}) async {
    try {
      final Response response = await _apiProvider.addSubItemsBulk(reminderTypeId, titles);
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
  Future<DataState<dynamic>> editSubItem({required String id, required String title}) async {
    try {
      final Response response = await _apiProvider.editSubItem(id, title);
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
  Future<DataState<dynamic>> deleteSubItem(String id) async {
    try {
      final Response response = await _apiProvider.deleteSubItem(id);
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

  DataState<List<ManageReminderSubItemEntity>> _parseListResponse(dynamic rootData) {
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

    final List<ManageReminderSubItemEntity> items = rawList
        .whereType<Map<String, dynamic>>()
        .map((json) => ManageReminderSubItemModel.fromJson(json).toEntity())
        .toList();

    return DataSuccess(items);
  }
}
