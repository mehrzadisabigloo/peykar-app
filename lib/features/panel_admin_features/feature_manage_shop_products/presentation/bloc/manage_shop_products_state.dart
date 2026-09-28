import 'package:equatable/equatable.dart';
import '../../../../feature_manage_products/domain/entity/manage_products_entity.dart';
import '../../domain/entity/admin_product_entity.dart';
import '../../domain/entity/admin_product_filter_params.dart';

abstract class ManageShopProductsState extends Equatable {
  const ManageShopProductsState();
  @override
  List<Object?> get props => [];
}

class ManageShopProductsInitial extends ManageShopProductsState {}

class ManageShopProductsLoading extends ManageShopProductsState {
  final AdminProductFilterParams filters;
  const ManageShopProductsLoading(this.filters);
  @override
  List<Object?> get props => [filters];
}

class ManageShopProductsLoaded extends ManageShopProductsState {
  final List<AdminProductEntity> products;
  final AdminProductFilterParams filters;
  final bool hasMore;
  final int total;
  final String? errorMessage;
  final String? successMessage;
  final String? processingId;
  final bool isDeleting;

  const ManageShopProductsLoaded({
    required this.products,
    required this.filters,
    required this.hasMore,
    required this.total,
    this.errorMessage,
    this.successMessage,
    this.processingId,
    this.isDeleting = false,
  });

  ManageShopProductsLoaded copyWith({
    List<AdminProductEntity>? products,
    AdminProductFilterParams? filters,
    bool? hasMore,
    int? total,
    String? errorMessage,
    String? successMessage,
    String? processingId,
    bool? isDeleting,
    bool clearProcessingId = false,
    bool clearMessages = false,
  }) {
    return ManageShopProductsLoaded(
      products: products ?? this.products,
      filters: filters ?? this.filters,
      hasMore: hasMore ?? this.hasMore,
      total: total ?? this.total,
      errorMessage: errorMessage ?? (clearMessages ? null : this.errorMessage),
      successMessage: successMessage ?? (clearMessages ? null : this.successMessage),
      processingId: processingId ?? (clearProcessingId ? null : this.processingId),
      isDeleting: isDeleting ?? this.isDeleting,
    );
  }

  @override
  List<Object?> get props => [products, filters, hasMore, total, errorMessage, successMessage, processingId, isDeleting];
}

class ManageShopProductsLoadingMore extends ManageShopProductsState {
  final List<AdminProductEntity> products;
  final AdminProductFilterParams filters;
  final bool hasMore;
  final int total;

  const ManageShopProductsLoadingMore({
    required this.products,
    required this.filters,
    required this.hasMore,
    required this.total,
  });

  @override
  List<Object?> get props => [products, filters, hasMore, total];
}

class ManageShopProductsError extends ManageShopProductsState {
  final String message;
  final AdminProductFilterParams filters;
  const ManageShopProductsError(this.message, this.filters);
  @override
  List<Object?> get props => [message, filters];
}

class AdminProductActionSuccess extends ManageShopProductsState {
  final String message;
  const AdminProductActionSuccess(this.message);
  @override
  List<Object?> get props => [message];
}

class AdminProductActionLoading extends ManageShopProductsState {
  final List<AdminProductEntity> products;
  final String? processingId;
  final bool isDeleting;

  const AdminProductActionLoading({
    required this.products,
    this.processingId,
    this.isDeleting = false,
  });

  @override
  List<Object?> get props => [products, processingId, isDeleting];
}

class AdminProductCategoriesLoaded extends ManageShopProductsState {
  final List<CategoryEntity> categories;
  const AdminProductCategoriesLoaded(this.categories);
  @override
  List<Object?> get props => [categories];
}
