import 'order_item_entity.dart';

enum OrderStatus {
  paid,
  inProgress,
  sent,
  completed,
  canceled,
}

class OrdersEntity {
  final String id;
  final String orderNumber;
  final String price;
  final String date;
  final OrderStatus status;
  final String statusLabel;
  final List<OrderItemEntity> items;

  OrdersEntity({
    required this.id,
    required this.orderNumber,
    required this.price,
    required this.date,
    required this.status,
    required this.statusLabel,
    required this.items,
  });
}
