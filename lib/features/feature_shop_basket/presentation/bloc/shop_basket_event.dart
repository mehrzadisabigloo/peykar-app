part of 'shop_basket_bloc.dart';


abstract class ShopBasketEvent extends Equatable {
  const ShopBasketEvent();

  @override
  List<Object?> get props => [];
}

class FetchShopBasketDataEvent extends ShopBasketEvent {
  const FetchShopBasketDataEvent();
}
