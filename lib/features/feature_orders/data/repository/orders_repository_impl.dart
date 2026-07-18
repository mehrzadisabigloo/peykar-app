import 'package:dio/dio.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/entity/orders_entity.dart';
import '../../domain/repository/orders_repository.dart';
import '../data_source/remote/orders_api_provider.dart';
import '../model/orders_model.dart';

class OrdersRepositoryImpl extends OrdersRepository {
  final OrdersApiProvider _apiProvider;
  OrdersRepositoryImpl(this._apiProvider);

  @override
  Future<DataState<List<OrdersEntity>>> fetchOrders() async {
    try {
      final Response response = await _apiProvider.getOrders();

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

        final List<OrdersEntity> orders = rawList
            .whereType<Map<String, dynamic>>()
            .map((json) => OrdersModel.fromJson(json).toEntity())
            .toList();

        return DataSuccess(orders);
      } else {
        return DataFailed(response.data is Map ? (response.data['message'] ?? "Error") : "Error");
      }
    } catch (e) {
      return const DataFailed('پاسخی دریافت نشد');
    }
  }
}
