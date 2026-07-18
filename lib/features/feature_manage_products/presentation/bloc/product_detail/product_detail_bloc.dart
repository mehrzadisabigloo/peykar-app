import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/bloc/base/base_bloc.dart';
import '../../../domain/repository/manage_products_repository.dart';
import '../../../../../core/resources/data_state.dart';
import '../../../domain/entity/manage_products_entity.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends BaseBloc<ProductDetailEvent, ProductDetailState> {
  final ManageProductsRepository manageProductsRepository;

  ProductDetailBloc(this.manageProductsRepository) : super(const ProductDetailInitial()) {
    on<FetchProductDetail>(_onFetchProductDetail);
    on<AddToCartEvent>(_onAddToCart);
  }

  Future<void> _onFetchProductDetail(FetchProductDetail event, Emitter<ProductDetailState> emit) async {
    emit(const ProductDetailLoading());
    
    final dataState = await manageProductsRepository.fetchProductById(event.productId);

    if (dataState is DataSuccess) {
      emit(ProductDetailLoaded(dataState.data!));
    } else {
      emit(ProductDetailError(dataState.error ?? "خطا در دریافت جزئیات محصول"));
    }
  }

  Future<void> _onAddToCart(AddToCartEvent event, Emitter<ProductDetailState> emit) async {
    emit(const AddToCartLoading());
    final dataState = await manageProductsRepository.addToCart(
      productId: event.productId,
      quantity: event.quantity,
      cartType: event.cartType,
      discountCodeId: event.discountCodeId,
    );

    if (dataState is DataSuccess) {
      emit(const AddToCartSuccess("محصول با موفقیت به سبد خرید اضافه شد"));
    } else {
      emit(AddToCartError(dataState.error ?? "خطا در افزودن به سبد خرید"));
    }
  }
}
