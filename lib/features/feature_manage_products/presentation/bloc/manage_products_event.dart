part of 'manage_products_bloc.dart';

abstract class ManageProductsEvent extends Equatable {
  const ManageProductsEvent();

  @override
  List<Object?> get props => [];
}

class FetchManageProductsDataEvent extends ManageProductsEvent {
  const FetchManageProductsDataEvent();
}
