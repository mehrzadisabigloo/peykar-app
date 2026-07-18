import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/bloc/base/base_bloc.dart';
import '../../domain/entity/orders_entity.dart';
import '../../domain/repository/orders_repository.dart';
import '../../../../core/resources/data_state.dart';

part 'orders_event.dart';
part 'orders_state.dart';

class OrdersBloc extends BaseBloc<OrdersEvent, OrdersState> {
  final OrdersRepository ordersRepository;

  OrdersBloc(this.ordersRepository) : super(const OrdersInitial()) {
    on<FetchOrdersEvent>(_onFetchOrders);
    on<FilterOrdersEvent>(_onFilterOrders);
  }

  Future<void> _onFetchOrders(FetchOrdersEvent event, Emitter<OrdersState> emit) async {
    emit(const OrdersLoading());
    final dataState = await ordersRepository.fetchOrders();

    if (dataState is DataSuccess) {
      emit(OrdersLoaded(
        allOrders: dataState.data!,
        filteredOrders: dataState.data!,
      ));
    } else {
      emit(OrdersError(dataState.error ?? "خطا در دریافت اطلاعات"));
    }
  }

  void _onFilterOrders(FilterOrdersEvent event, Emitter<OrdersState> emit) {
    if (state is OrdersLoaded) {
      final currentState = state as OrdersLoaded;
      List<OrdersEntity> filtered;
      if (event.status == null) {
        filtered = currentState.allOrders;
      } else {
        filtered = currentState.allOrders.where((o) => o.status == event.status).toList();
      }
      emit(OrdersLoaded(
        allOrders: currentState.allOrders,
        filteredOrders: filtered,
        currentStatus: event.status,
      ));
    }
  }
}
