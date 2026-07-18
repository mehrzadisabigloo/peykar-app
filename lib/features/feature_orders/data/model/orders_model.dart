// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entity/orders_entity.dart';
import 'order_item_model.dart';

part 'orders_model.freezed.dart';
part 'orders_model.g.dart';

String _anyToString(dynamic value) => value?.toString() ?? '';

String _formatDate(dynamic dateStr) {
  if (dateStr == null) return '';
  try {
    final dateTime = DateTime.parse(dateStr.toString());
    return "${dateTime.year}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.day.toString().padLeft(2, '0')}";
  } catch (e) {
    return dateStr.toString();
  }
}

OrderStatus _mapStatus(dynamic status) {
  final s = status?.toString().toLowerCase();
  switch (s) {
    case 'paid':
      return OrderStatus.paid;
    case 'in_progress':
      return OrderStatus.inProgress;
    case 'sent':
      return OrderStatus.sent;
    case 'completed':
      return OrderStatus.completed;
    case 'canceled':
    case 'cancelled':
      return OrderStatus.canceled;
    default:
      return OrderStatus.inProgress;
  }
}

@freezed
class OrdersModel with _$OrdersModel {
  const factory OrdersModel({
    @JsonKey(fromJson: _anyToString) @Default('') String id,
    @JsonKey(name: 'order_number', fromJson: _anyToString) @Default('') String orderNumber,
    @JsonKey(name: 'payable_amount', fromJson: _anyToString) @Default('0') String price,
    @JsonKey(name: 'transaction_at', fromJson: _formatDate) @Default('') String date,
    @JsonKey(name: 'order_status', fromJson: _mapStatus) @Default(OrderStatus.inProgress) OrderStatus status,
    @JsonKey(name: 'order_status_label', fromJson: _anyToString) @Default('') String statusLabel,
    @Default([]) List<OrderItemModel> items,
  }) = _OrdersModel;

  const OrdersModel._();

  factory OrdersModel.fromJson(Map<String, dynamic> json) =>
      _$OrdersModelFromJson(_processJson(json));

  static Map<String, dynamic> _processJson(Map<String, dynamic> json) {
    final Map<String, dynamic> updatedJson = Map<String, dynamic>.from(json);
    
    if (updatedJson['payable_amount'] == null && updatedJson['total_price'] != null) {
      updatedJson['payable_amount'] = updatedJson['total_price'];
    }
    if (updatedJson['transaction_at'] == null && updatedJson['created_at'] != null) {
      updatedJson['transaction_at'] = updatedJson['created_at'];
    }
    
    return updatedJson;
  }

  OrdersEntity toEntity() => OrdersEntity(
        id: id,
        orderNumber: orderNumber,
        price: price,
        date: date,
        status: status,
        statusLabel: statusLabel,
        items: items.map((e) => e.toEntity()).toList(),
      );

  factory OrdersModel.fromEntity(OrdersEntity entity) => OrdersModel(
        id: entity.id,
        orderNumber: entity.orderNumber,
        price: entity.price,
        date: entity.date,
        status: entity.status,
        statusLabel: entity.statusLabel,
        items: entity.items.map((e) => OrderItemModel.fromEntity(e)).toList(),
      );
}
