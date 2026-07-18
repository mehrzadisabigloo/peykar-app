part of 'product_detail_bloc.dart';

abstract class ProductDetailEvent extends Equatable {
  const ProductDetailEvent();

  @override
  List<Object?> get props => [];
}

class FetchProductDetail extends ProductDetailEvent {
  final String productId;
  const FetchProductDetail(this.productId);

  @override
  List<Object?> get props => [productId];
}

class AddToCartEvent extends ProductDetailEvent {
  final String productId;
  final int quantity;
  final String cartType;
  final String? discountCodeId;

  const AddToCartEvent({
    required this.productId,
    required this.quantity,
    this.cartType = 'current',
    this.discountCodeId,
  });

  @override
  List<Object?> get props => [productId, quantity, cartType, discountCodeId];
}
