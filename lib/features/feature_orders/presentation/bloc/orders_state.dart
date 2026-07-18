part of 'orders_bloc.dart';

abstract class OrdersState extends Equatable {
  const OrdersState();

  @override
  List<Object?> get props => [];
}

class OrdersInitial extends OrdersState {
  const OrdersInitial();
}

class OrdersLoading extends OrdersState {
  const OrdersLoading();
}

class OrdersLoaded extends OrdersState {
  final List<OrdersEntity> allOrders;
  final List<OrdersEntity> filteredOrders;
  final OrderStatus? currentStatus;

  const OrdersLoaded({
    required this.allOrders,
    required this.filteredOrders,
    this.currentStatus,
  });

  @override
  List<Object?> get props => [allOrders, filteredOrders, currentStatus];
}

class OrdersError extends OrdersState {
  final String message;
  const OrdersError(this.message);

  @override
  List<Object?> get props => [message];
}
