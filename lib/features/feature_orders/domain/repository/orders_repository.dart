import '../../../../core/resources/data_state.dart';
import '../entity/orders_entity.dart';

abstract class OrdersRepository {
  Future<DataState<List<OrdersEntity>>> fetchOrders();
}
