import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/bloc/base/base_bloc.dart';
import '../../domain/repository/shop_basket_repository.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/entity/shop_basket_entity.dart';

part 'shop_basket_event.dart';
part 'shop_basket_state.dart';

class ShopBasketBloc extends BaseBloc<ShopBasketEvent, ShopBasketState> {
  final ShopBasketRepository shopBasketRepository;

  ShopBasketBloc(this.shopBasketRepository) : super(const ShopBasketInitial()) {
    on<FetchShopBasketDataEvent>(_onFetchShopBasketData);
  }

  Future<void> _onFetchShopBasketData(FetchShopBasketDataEvent event, Emitter<ShopBasketState> emit) async {
    emit(const ShopBasketLoading());
    final dataState = await shopBasketRepository.fetchShopBasketData();

    if (dataState is DataSuccess) {
      emit(ShopBasketLoaded(dataState.data!));
    } else {
      emit(ShopBasketError(dataState.error ?? "خطایی در دریافت سبد خرید رخ داد"));
    }
  }
}
