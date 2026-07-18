part of 'shop_bloc.dart';

abstract class ShopState extends Equatable {
  const ShopState();

  @override
  List<Object?> get props => [];
}

class ShopInitial extends ShopState {
  const ShopInitial();
}

class ShopLoading extends ShopState {
  const ShopLoading();
}

class ShopLoaded extends ShopState {
  final ShopEntity entity;
  const ShopLoaded(this.entity);

  @override
  List<Object?> get props => [entity];
}

class ShopError extends ShopState {
  final String message;
  const ShopError(this.message);

  @override
  List<Object?> get props => [message];
}
