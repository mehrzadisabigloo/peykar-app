import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_app/core/bloc/base/base_bloc.dart';
import 'package:resturant_app/features/feature_manage_products/domain/repository/manage_products_repository.dart';
import 'package:resturant_app/core/resources/data_state.dart';

part 'add_product_event.dart';
part 'add_product_state.dart';

class AddProductBloc extends BaseBloc<AddProductEvent, AddProductState> {
  final ManageProductsRepository _repository;

  AddProductBloc(this._repository) : super(const AddProductInitial()) {
    on<AddProductSubmitEvent>(_onAddProductSubmit);
  }

  Future<void> _onAddProductSubmit(AddProductSubmitEvent event, Emitter<AddProductState> emit) async {
    emit(const AddProductLoading());
    
    final dataState = await _repository.addProduct(
      title: event.title,
      description: event.description,
      images: event.images,
      keywords: event.keywords,
      price: event.price,
      stock: event.stock,
      maxPurchaseQuantity: event.maxPurchaseQuantity,
    );

    if (dataState is DataSuccess) {
      emit(const AddProductSuccess());
    } else {
      emit(AddProductError(dataState.error ?? "خطایی در ثبت محصول رخ داد"));
    }
  }
}
