part of 'shop_basket_bloc.dart';


abstract class ShopBasketState extends Equatable {
  const ShopBasketState();

  @override
  List<Object?> get props => [];
}

class ShopBasketInitial extends ShopBasketState {
  const ShopBasketInitial();
}

class ShopBasketLoading extends ShopBasketState {
  const ShopBasketLoading();
}

class ShopBasketLoaded extends ShopBasketState {
  final ShopBasketEntity entity;
  const ShopBasketLoaded(this.entity);

  @override
  List<Object?> get props => [entity];
}

class ShopBasketError extends ShopBasketState {
  final String message;
  const ShopBasketError(this.message);

  @override
  List<Object?> get props => [message];
}
