import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/bloc/base/base_bloc.dart';
import '../../../feature_manage_products/domain/entity/manage_products_entity.dart';
import '../../domain/repository/shop_repository.dart';
import '../../../../core/resources/data_state.dart';
import '../../../panel_admin_features/feature_manage_shop_products/domain/entity/admin_product_filter_params.dart';
import '../../../panel_admin_features/feature_manage_shop_products/domain/entity/admin_product_entity.dart';
import '../../../panel_admin_features/feature_manage_shop_products/domain/entity/admin_product_list_entity.dart';
import '../../domain/entity/shop_entity.dart';
import '../../../../core/bloc/widget_infinite_list/widget_infinite_list_bloc.dart';
import '../../../panel_admin_features/feature_banner/domain/entity/banner_entity.dart';
import '../../../panel_admin_features/feature_banner/domain/entity/banner_list_entity.dart';
import '../../../panel_admin_features/feature_banner/domain/repository/banner_repository.dart';

part 'shop_event.dart';
part 'shop_state.dart';

class ShopBloc extends BaseBloc<ShopEvent, ShopState> {
  final ShopRepository shopRepository;
  final BannerRepository bannerRepository;
  final WidgetInfiniteListBloc listBloc;

  ShopBloc(this.shopRepository, this.bannerRepository, this.listBloc) : super(const ShopInitial()) {
    on<FetchShopDataEvent>(_onFetchShopData);
    on<LoadMoreShopProducts>(_onLoadMoreShopProducts);
    on<FetchShopCategoriesEvent>(_onFetchShopCategories);
  }

  AdminProductFilterParams _currentFilters = const AdminProductFilterParams();
  List<ShopProduct> _products = [];
  List<CategoryEntity> _categories = [];
  List<BannerEntity> _banners = [];

  Future<void> _onFetchShopCategories(
      FetchShopCategoriesEvent event, Emitter<ShopState> emit) async {
    final result = await shopRepository.fetchCategories();
    if (result is DataSuccess) {
      _categories = result.data!;
      if (state is ShopLoaded) {
        final currentState = state as ShopLoaded;
        emit(ShopLoaded(
          products: currentState.products,
          filters: currentState.filters,
          hasMore: currentState.hasMore,
          total: currentState.total,
          categories: _categories,
          banners: _banners,
        ));
      }
    }
  }

  Future<void> _onFetchShopData(
      FetchShopDataEvent event, Emitter<ShopState> emit) async {
    _currentFilters = event.params.copyWith(page: 1);
    _products = [];

    emit(ShopLoading(_currentFilters));
    
    // Parallel fetch for speed
    final responses = await Future.wait([
      shopRepository.fetchShopData(_currentFilters),
      bannerRepository.fetchActiveBanners(const BannerFilterParams(place: 'shop', isPaginate: false)),
    ]);

    final productResult = responses[0] as DataState<AdminProductListEntity>;
    final bannerResult = responses[1] as DataState<BannerListEntity>;

    if (bannerResult is DataSuccess) {
      _banners = bannerResult.data!.banners;
    }

    if (productResult is DataSuccess && productResult.data != null) {
      _products =
          productResult.data!.products.map((e) => _mapToShopProduct(e)).toList();
      emit(ShopLoaded(
        products: _products,
        filters: _currentFilters,
        hasMore: productResult.data!.hasMore,
        total: productResult.data!.total,
        categories: _categories,
        banners: _banners,
      ));
    } else {
      emit(ShopError(
          productResult.error ?? 'خطا در دریافت لیست محصولات', _currentFilters));
    }
  }

  Future<void> _onLoadMoreShopProducts(LoadMoreShopProducts event, Emitter<ShopState> emit) async {
    final currentState = state;
    if (currentState is! ShopLoaded || !currentState.hasMore) return;

    emit(ShopLoadingMore(
      products: _products,
      filters: _currentFilters,
      hasMore: currentState.hasMore,
      total: currentState.total,
      banners: _banners,
    ));

    _currentFilters = _currentFilters.copyWith(page: _currentFilters.page + 1);
    final result = await shopRepository.fetchShopData(_currentFilters);
    listBloc.add(WidgetInfiniteListBlocEventHideBottomLoading());

    if (result is DataSuccess && result.data != null) {
      final newProducts = result.data!.products.map((e) => _mapToShopProduct(e)).toList();
      _products = [..._products, ...newProducts];
      emit(ShopLoaded(
        products: _products,
        filters: _currentFilters,
        hasMore: result.data!.hasMore,
        total: result.data!.total,
        categories: _categories,
        banners: _banners,
      ));
    } else {
      _currentFilters = _currentFilters.copyWith(page: _currentFilters.page - 1);
      emit(ShopLoaded(
        products: _products,
        filters: _currentFilters,
        hasMore: currentState.hasMore,
        total: currentState.total,
        errorMessage: result.error,
        categories: _categories,
        banners: _banners,
      ));
    }
  }

  ShopProduct _mapToShopProduct(AdminProductEntity e) {
    return ShopProduct(
      id: e.id ?? '',
      title: e.title,
      imageUrl: e.imageUrl,
      price: e.price,
      isAvailable: e.stock > 0,
      category: 'قطعات',
      stock: e.stock,
      finalPrice: e.finalPrice,
      hasDiscount: e.hasDiscount ?? false,
      discountPercentage: e.discountPercentage,
    );
  }
}
