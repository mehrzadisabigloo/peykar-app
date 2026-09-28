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
  final AdminProductFilterParams filters;
  const ShopLoading(this.filters);

  @override
  List<Object?> get props => [filters];
}

class ShopLoaded extends ShopState {
  final List<ShopProduct> products;
  final AdminProductFilterParams filters;
  final bool hasMore;
  final int total;
  final String? errorMessage;
  final List<CategoryEntity> categories;
  final List<BannerEntity> banners;

  const ShopLoaded({
    required this.products,
    required this.filters,
    required this.hasMore,
    required this.total,
    this.errorMessage,
    this.categories = const [],
    this.banners = const [],
  });

  @override
  List<Object?> get props =>
      [products, filters, hasMore, total, errorMessage, categories, banners];
}

class ShopLoadingMore extends ShopState {
  final List<ShopProduct> products;
  final AdminProductFilterParams filters;
  final bool hasMore;
  final int total;
  final List<BannerEntity> banners;

  const ShopLoadingMore({
    required this.products,
    required this.filters,
    required this.hasMore,
    required this.total,
    this.banners = const [],
  });

  @override
  List<Object?> get props => [products, filters, hasMore, total, banners];
}

class ShopError extends ShopState {
  final String message;
  final AdminProductFilterParams filters;
  const ShopError(this.message, this.filters);

  @override
  List<Object?> get props => [message, filters];
}
