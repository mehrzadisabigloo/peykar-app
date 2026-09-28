// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrdersModel _$OrdersModelFromJson(Map<String, dynamic> json) => _OrdersModel(
  id: json['id'] == null ? '' : _anyToString(json['id']),
  orderNumber: json['order_number'] == null
      ? ''
      : _anyToString(json['order_number']),
  price: json['payable_amount'] == null
      ? '0'
      : _anyToString(json['payable_amount']),
  date: json['transaction_at'] == null
      ? ''
      : _formatDate(json['transaction_at']),
  status: json['order_status'] == null
      ? OrderStatus.inProgress
      : _mapStatus(json['order_status']),
  statusLabel: json['order_status_label'] == null
      ? ''
      : _anyToString(json['order_status_label']),
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => OrderItemModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$OrdersModelToJson(_OrdersModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_number': instance.orderNumber,
      'payable_amount': instance.price,
      'transaction_at': instance.date,
      'order_status': _$OrderStatusEnumMap[instance.status]!,
      'order_status_label': instance.statusLabel,
      'items': instance.items,
    };

const _$OrderStatusEnumMap = {
  OrderStatus.paid: 'paid',
  OrderStatus.inProgress: 'inProgress',
  OrderStatus.sent: 'sent',
  OrderStatus.completed: 'completed',
  OrderStatus.canceled: 'canceled',
};
