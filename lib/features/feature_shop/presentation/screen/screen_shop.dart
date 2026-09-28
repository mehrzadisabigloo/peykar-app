import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/bloc/app/app_bloc.dart';
import '../../../../core/bloc/error/error_bloc.dart';
import '../../../../core/services/debounce_service.dart';
import '../../../../core/services/locator.dart';
import '../../../../core/themes/theme_main.dart';
import '../../../../core/widgets/empty_state_widget.dart';
import '../../../../core/widgets/error_state_widget.dart';
import '../../../../core/widgets/list_shimmer.dart';
import '../../../../core/widgets/widget_infinite_list.dart';
import '../../../panel_admin_features/feature_manage_shop_products/domain/entity/admin_product_filter_params.dart';
import '../base/base_shop_stateful_widget_state.dart';
import '../bloc/shop_bloc.dart';
import '../../domain/entity/shop_entity.dart';
import '../widget/product_card.dart';
import '../widget/shop_banner.dart';
import '../../../feature_home/presentation/widget/repairman_list_shimmer.dart';
import '../../../../core/widgets/category_picker_sheet.dart';
import '../../../feature_manage_products/domain/entity/manage_products_entity.dart';

class ScreenShop extends StatefulWidget {
  const ScreenShop({super.key});

  @override
  State<ScreenShop> createState() => _ScreenShopState();
}

class _ScreenShopState extends BaseShopStatefulWidgetState<ScreenShop, ShopBloc> {
  _ScreenShopState() : super(locator<ShopBloc>());

  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final DebounceService _debounceService = DebounceService();

  CategoryEntity? _selectedCategory;
  List<CategoryEntity> _allCategories = [];

  @override
  void initState() {
    super.initState();
    bloc.add(const FetchShopCategoriesEvent());
    _refresh();
  }

  void _refresh() {
    bloc.add(FetchShopDataEvent(
        params: AdminProductFilterParams(
      title: _searchController.text,
      categoryId: _selectedCategory?.id,
    )));
  }

  @override
  void dispose() {
    _searchController.dispose();
    _categoryController.dispose();
    _debounceService.dispose();
    super.dispose();
  }

  void _showCategoryPicker() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => CategoryPickerSheet(
        categories: _allCategories,
        onSelected: (cat, path) {
          setState(() {
            _selectedCategory = cat;
            _categoryController.text = path;
          });
          _refresh();
          context.pop();
        },
      ),
    );
  }

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surfaceContainer,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  _buildSearchBar(context),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<ShopBloc, ShopState>(
                builder: (context, state) {
                  List<ShopProduct> items = [];
                  bool hasReachedBottom = false;
                  bool hasError = false;
                  String? errorMessage;

                  if (state is ShopInitial) {
                    return const SizedBox.shrink();
                  }

                  if (state is ShopLoading && state.filters.page == 1) {
                    return ListShimmer(height: 140);
                  }

                  if (state is ShopError) {
                    if (state.filters.page == 1) {
                      return ErrorStateWidget(
                        message: state.message,
                        onRetry: _refresh,
                      );
                    } else {
                      hasError = true;
                      errorMessage = state.message;
                    }
                  }

                  if (state is ShopLoaded) {
                    items = state.products;
                    _allCategories = state.categories;
                    hasReachedBottom = !state.hasMore;
                    if (items.isEmpty && state.errorMessage != null) {
                      hasError = true;
                      errorMessage = state.errorMessage;
                    }
                  } else if (state is ShopLoadingMore) {
                    items = state.products;
                    hasReachedBottom = !state.hasMore;
                  }

                  return Column(
                    children: [
                      if (state is ShopLoaded) ...[
                        ShopBanner(banners: state.banners),
                        SizedBox(height: 20.h),
                      ],
                      _buildCategoryFilter(context),
                      SizedBox(height: 16.h),
                      Expanded(
                        child: WidgetInfiniteList(
                          builder: (context, item) => ProductCard(product: item as ShopProduct),
                          items: items,
                          bloc: bloc.listBloc,
                          itemEquality: (first, second) => (first as ShopProduct).id == (second as ShopProduct).id,
                          hasReachedTop: true,
                          hasReachedBottom: hasReachedBottom,
                          isLoading: false,
                          loadingWidget: const RepairmanListShimmer(),
                          errorWidget: ErrorStateWidget(
                            message: errorMessage ?? "",
                            onRetry: () => bloc.add(const LoadMoreShopProducts()),
                          ),
                          hasErrorOccurred: hasError,
                          loadBottomData: () => bloc.add(const LoadMoreShopProducts()),
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryFilter(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final adminIndigo = DashboardColors.of(context).adminIndigo;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: colorScheme.outlineVariant, width: 1.2),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: _showCategoryPicker,
              child: Padding(
                padding: EdgeInsets.all(16.r),
                child: Row(
                  children: [
                    Icon(Icons.tune_rounded,
                        color: adminIndigo, size: 22.sp),
                    SizedBox(width: 10.w,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'فیلتر دسته بندی',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: colorScheme.onSurface,
                            fontFamily: 'BonyadeKoodak',
                          ),
                        ),
                        if (_selectedCategory != null) ...[
                          SizedBox(height: 6.h),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 4.h),
                            decoration: BoxDecoration(
                              color: adminIndigo.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  _categoryController.text,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                    color: adminIndigo,
                                    fontFamily: 'BonyadeKoodak',
                                  ),
                                ),
                                SizedBox(width: 6.w),
                                Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _selectedCategory = null;
                                        _categoryController.clear();
                                      });
                                      _refresh();
                                    },
                                    borderRadius: BorderRadius.circular(4.r),
                                    child: Padding(
                                      padding: EdgeInsets.all(4.r),
                                      child: Icon(Icons.close_rounded,
                                          size: 16.sp,
                                          color: adminIndigo),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),
                    const Spacer(),
                    if (_selectedCategory == null)
                      Icon(Icons.arrow_drop_down_rounded,
                          color: adminIndigo, size: 22.sp),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final adminIndigo = DashboardColors.of(context).adminIndigo;

    return Container(
      height: 55.h,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(color: colorScheme.outlineVariant, width: 1.2),
        boxShadow: [
          BoxShadow(
            color: colorScheme.onSurface.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        onChanged: (value) {
          _debounceService.run(() {
            _refresh();
          });
        },
        decoration: InputDecoration(
          hintText: 'جستجو در محصولات...',
          hintStyle: TextStyle(
            color: colorScheme.outline,
            fontSize: 14.sp,
            fontFamily: 'BonyadeKoodak',
          ),
          prefixIcon: Icon(
            Icons.search_rounded,
            color: adminIndigo,
            size: 24.sp,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 14.h),
        ),
        style: TextStyle(
          fontSize: 15.sp,
          color: colorScheme.onSurface,
          fontFamily: 'BonyadeKoodak',
        ),
        textAlignVertical: TextAlignVertical.center,
        cursorColor: adminIndigo,
      ),
    );
  }
}
