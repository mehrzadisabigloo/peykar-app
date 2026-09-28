import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/bloc/base/base_bloc.dart';
import '../../../../../core/resources/data_state.dart';
import '../../domain/repository/manage_shop_products_repository.dart';
import 'manage_shop_products_event.dart';
import 'manage_shop_products_state.dart';
import '../../../../../core/bloc/widget_infinite_list/widget_infinite_list_bloc.dart';
import '../../domain/entity/admin_product_entity.dart';
import '../../domain/entity/admin_product_filter_params.dart';

class ManageShopProductsBloc extends BaseBloc<ManageShopProductsEvent, ManageShopProductsState> {
  final ManageShopProductsRepository _repository;
  final WidgetInfiniteListBloc listBloc;

  ManageShopProductsBloc(this._repository, this.listBloc) : super(ManageShopProductsInitial()) {
    on<FetchAdminProducts>(_onFetchAdminProducts);
    on<LoadMoreAdminProducts>(_onLoadMoreAdminProducts);
    on<AddAdminProduct>(_onAddAdminProduct);
    on<EditAdminProduct>(_onEditAdminProduct);
    on<DeleteAdminProduct>(_onDeleteAdminProduct);
    on<ChangeAdminProductStatus>(_onChangeAdminProductStatus);
    on<FetchAdminProductCategories>(_onFetchCategories);
  }

  AdminProductFilterParams _currentFilters = const AdminProductFilterParams();
  List<AdminProductEntity> _products = [];

  Future<void> _onFetchAdminProducts(FetchAdminProducts event, Emitter<ManageShopProductsState> emit) async {
    _currentFilters = event.params.copyWith(page: 1);
    _products = [];

    emit(ManageShopProductsLoading(_currentFilters));
    final result = await _repository.listAdminProducts(_currentFilters);

    if (result is DataSuccess && result.data != null) {
      _products = result.data!.products;
      emit(ManageShopProductsLoaded(
        products: _products,
        filters: _currentFilters,
        hasMore: result.data!.hasMore,
        total: result.data!.total,
      ));
    } else {
      emit(ManageShopProductsError(result.error ?? 'خطا در دریافت لیست محصولات', _currentFilters));
    }
  }

  Future<void> _onLoadMoreAdminProducts(LoadMoreAdminProducts event, Emitter<ManageShopProductsState> emit) async {
    final currentState = state;
    if (currentState is! ManageShopProductsLoaded || !currentState.hasMore) return;

    emit(ManageShopProductsLoadingMore(
      products: _products,
      filters: _currentFilters,
      hasMore: currentState.hasMore,
      total: currentState.total,
    ));

    _currentFilters = _currentFilters.copyWith(page: _currentFilters.page + 1);
    final result = await _repository.listAdminProducts(_currentFilters);
    listBloc.add(WidgetInfiniteListBlocEventHideBottomLoading());

    if (result is DataSuccess && result.data != null) {
      _products = [..._products, ...result.data!.products];
      emit(ManageShopProductsLoaded(
        products: _products,
        filters: _currentFilters,
        hasMore: result.data!.hasMore,
        total: result.data!.total,
      ));
    } else {
      _currentFilters = _currentFilters.copyWith(page: _currentFilters.page - 1);
      emit(ManageShopProductsLoaded(
        products: _products,
        filters: _currentFilters,
        hasMore: currentState.hasMore,
        total: currentState.total,
        errorMessage: result.error,
      ));
    }
  }

  Future<void> _onAddAdminProduct(AddAdminProduct event, Emitter<ManageShopProductsState> emit) async {
    emit(AdminProductActionLoading(products: _products, processingId: 'adding'));

    final result = await _repository.addAdminProduct(event.product);
    if (result is DataSuccess) {
      emit(const AdminProductActionSuccess('محصول با موفقیت اضافه شد'));
    } else {
      emit(ManageShopProductsError(result.error ?? 'خطا در اضافه کردن محصول', _currentFilters));
    }
  }

  Future<void> _onEditAdminProduct(EditAdminProduct event, Emitter<ManageShopProductsState> emit) async {
    emit(AdminProductActionLoading(products: _products, processingId: event.productId));

    final result = await _repository.editAdminProduct(event.productId, event.product);
    if (result is DataSuccess) {
      emit(const AdminProductActionSuccess('محصول با موفقیت ویرایش شد'));
    } else {
      emit(ManageShopProductsError(result.error ?? 'خطا در ویرایش محصول', _currentFilters));
    }
  }

  Future<void> _onDeleteAdminProduct(DeleteAdminProduct event, Emitter<ManageShopProductsState> emit) async {
    emit(AdminProductActionLoading(products: _products, processingId: event.productId, isDeleting: true));

    final result = await _repository.deleteAdminProduct(event.productId);
    if (result is DataSuccess) {
      if (state is AdminProductActionLoading) {
        // We can just fetch again to update the list
        add(FetchAdminProducts(_currentFilters));
        // Also emit success to show snackbar
        emit(const AdminProductActionSuccess('محصول با موفقیت حذف شد'));
      }
    } else {
      emit(ManageShopProductsError(result.error ?? 'خطا در حذف محصول', _currentFilters));
    }
  }

  Future<void> _onChangeAdminProductStatus(ChangeAdminProductStatus event, Emitter<ManageShopProductsState> emit) async {
    emit(AdminProductActionLoading(products: _products, processingId: event.productId, isDeleting: false));

    final result = await _repository.changeAdminProductStatus(event.productId);
    if (result is DataSuccess) {
      if (state is AdminProductActionLoading) {
        add(FetchAdminProducts(_currentFilters));
        emit(const AdminProductActionSuccess('وضعیت محصول با موفقیت تغییر کرد'));
      }
    } else {
      emit(ManageShopProductsError(result.error ?? 'خطا در تغییر وضعیت محصول', _currentFilters));
    }
  }

  Future<void> _onFetchCategories(FetchAdminProductCategories event, Emitter<ManageShopProductsState> emit) async {
    final result = await _repository.fetchCategories();
    if (result is DataSuccess && result.data != null) {
      emit(AdminProductCategoriesLoaded(result.data!));
    }
    // Silently fail or handle error if needed, but usually we just want the list if it succeeds
  }
}
