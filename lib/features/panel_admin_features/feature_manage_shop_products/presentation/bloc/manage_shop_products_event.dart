import 'package:equatable/equatable.dart';
import '../../domain/entity/admin_product_entity.dart';
import '../../domain/entity/admin_product_filter_params.dart';

abstract class ManageShopProductsEvent extends Equatable {
  const ManageShopProductsEvent();
  @override
  List<Object?> get props => [];
}

class FetchAdminProducts extends ManageShopProductsEvent {
  final AdminProductFilterParams params;
  const FetchAdminProducts(this.params);
  @override
  List<Object?> get props => [params];
}

class LoadMoreAdminProducts extends ManageShopProductsEvent {
  const LoadMoreAdminProducts();
}

class AddAdminProduct extends ManageShopProductsEvent {
  final AdminProductEntity product;
  const AddAdminProduct(this.product);
  @override
  List<Object?> get props => [product];
}

class EditAdminProduct extends ManageShopProductsEvent {
  final String productId;
  final AdminProductEntity product;
  const EditAdminProduct(this.productId, this.product);
  @override
  List<Object?> get props => [productId, product];
}

class DeleteAdminProduct extends ManageShopProductsEvent {
  final String productId;
  const DeleteAdminProduct(this.productId);
  @override
  List<Object?> get props => [productId];
}

class ChangeAdminProductStatus extends ManageShopProductsEvent {
  final String productId;
  const ChangeAdminProductStatus(this.productId);
  @override
  List<Object?> get props => [productId];
}

class FetchAdminProductCategories extends ManageShopProductsEvent {
  const FetchAdminProductCategories();
}
