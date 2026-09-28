part of 'shop_bloc.dart';

abstract class ShopEvent extends Equatable {
  const ShopEvent();

  @override
  List<Object?> get props => [];
}

class FetchShopDataEvent extends ShopEvent {
  final AdminProductFilterParams params;
  const FetchShopDataEvent({this.params = const AdminProductFilterParams()});

  @override
  List<Object?> get props => [params];
}

class LoadMoreShopProducts extends ShopEvent {
  const LoadMoreShopProducts();
}

class FetchShopCategoriesEvent extends ShopEvent {
  const FetchShopCategoriesEvent();
}
