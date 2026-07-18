part of 'product_detail_bloc.dart';

abstract class ProductDetailState extends Equatable {
  const ProductDetailState();

  @override
  List<Object?> get props => [];
}

class ProductDetailInitial extends ProductDetailState {
  const ProductDetailInitial();
}

class ProductDetailLoading extends ProductDetailState {
  const ProductDetailLoading();
}

class ProductDetailLoaded extends ProductDetailState {
  final ManageProductsEntity product;
  const ProductDetailLoaded(this.product);

  @override
  List<Object?> get props => [product];
}

class ProductDetailError extends ProductDetailState {
  final String message;
  const ProductDetailError(this.message);

  @override
  List<Object?> get props => [message];
}

class AddToCartLoading extends ProductDetailState {
  const AddToCartLoading();
}

class AddToCartSuccess extends ProductDetailState {
  final String message;
  const AddToCartSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class AddToCartError extends ProductDetailState {
  final String message;
  const AddToCartError(this.message);

  @override
  List<Object?> get props => [message];
}
