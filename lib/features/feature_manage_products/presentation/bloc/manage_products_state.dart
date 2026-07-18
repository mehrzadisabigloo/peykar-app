part of 'manage_products_bloc.dart';

abstract class ManageProductsState extends Equatable {
  const ManageProductsState();

  @override
  List<Object?> get props => [];
}

class ManageProductsInitial extends ManageProductsState {
  const ManageProductsInitial();
}

class ManageProductsLoading extends ManageProductsState {
  const ManageProductsLoading();
}

class ManageProductsLoaded extends ManageProductsState {
  final List<ManageProductsEntity> products;
  const ManageProductsLoaded(this.products);

  @override
  List<Object?> get props => [products];
}

class ManageProductsError extends ManageProductsState {
  final String message;
  const ManageProductsError(this.message);

  @override
  List<Object?> get props => [message];
}
