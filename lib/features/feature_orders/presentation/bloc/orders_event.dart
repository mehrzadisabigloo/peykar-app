part of 'orders_bloc.dart';

abstract class OrdersEvent extends Equatable {
  const OrdersEvent();

  @override
  List<Object?> get props => [];
}

class FetchOrdersEvent extends OrdersEvent {
  const FetchOrdersEvent();
}

class FilterOrdersEvent extends OrdersEvent {
  final OrderStatus? status;
  const FilterOrdersEvent(this.status);

  @override
  List<Object?> get props => [status];
}
