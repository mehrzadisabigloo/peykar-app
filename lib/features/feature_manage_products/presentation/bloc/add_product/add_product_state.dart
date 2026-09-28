part of 'add_product_bloc.dart';

abstract class AddProductState extends Equatable {
  const AddProductState();

  @override
  List<Object?> get props => [];
}

class AddProductInitial extends AddProductState {
  const AddProductInitial();
}

class AddProductLoading extends AddProductState {
  const AddProductLoading();
}

class CategoriesLoading extends AddProductState {
  const CategoriesLoading();
}

class CategoriesLoaded extends AddProductState {
  final List<CategoryEntity> categories;
  const CategoriesLoaded(this.categories);

  @override
  List<Object?> get props => [categories];
}

class AddProductSuccess extends AddProductState {
  const AddProductSuccess();
}

class AddProductError extends AddProductState {
  final String message;
  const AddProductError(this.message);

  @override
  List<Object?> get props => [message];
}
