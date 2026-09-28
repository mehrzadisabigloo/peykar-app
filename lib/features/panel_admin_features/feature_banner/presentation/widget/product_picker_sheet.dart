import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/services/locator.dart';
import '../../../../../../core/widgets/empty_state_widget.dart';
import '../../../../../../core/widgets/error_state_widget.dart';
import '../../../feature_manage_shop_products/domain/entity/admin_product_entity.dart';
import '../../../feature_manage_shop_products/domain/entity/admin_product_filter_params.dart';
import '../../../feature_manage_shop_products/domain/repository/manage_shop_products_repository.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../../../core/services/debounce_service.dart';


class ProductPickerSheet extends StatefulWidget {
  final Function(AdminProductEntity) onSelected;

  const ProductPickerSheet({
    super.key,
    required this.onSelected,
  });

  @override
  State<ProductPickerSheet> createState() => _ProductPickerSheetState();
}

class _ProductPickerSheetState extends State<ProductPickerSheet> {
  final TextEditingController _searchController = TextEditingController();
  final DebounceService _debounceService = DebounceService();
  final List<AdminProductEntity> _products = [];
  bool _isLoading = false;
  bool _hasMore = true;
  int _currentPage = 1;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchProducts(isRefresh: true);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debounceService.dispose();
    super.dispose();
  }

  Future<void> _fetchProducts({bool isRefresh = false}) async {
    if (_isLoading) return;

    if (isRefresh) {
      setState(() {
        _currentPage = 1;
        _products.clear();
        _hasMore = true;
        _errorMessage = null;
      });
    }

    setState(() => _isLoading = true);

    final repo = locator<ManageShopProductsRepository>();
    final result = await repo.listActiveAdminProducts(AdminProductFilterParams(
      page: _currentPage,
      title: _searchController.text,
      isPaginate: true,
      countItem: 20,
    ));

    if (mounted) {
      setState(() {
        _isLoading = false;
        if (result is DataSuccess) {
          final newProducts = result.data!.products;
          _products.addAll(newProducts);
          _hasMore = result.data!.hasMore;
          _currentPage++;
        } else {
          _errorMessage = result.error ?? 'خطا در دریافت محصولات';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      height: 0.85.sh,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32.r)),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        children: [
          // Elegant Header
          Container(
            padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 16.h),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.vertical(top: Radius.circular(32.r)),
            ),
            child: Column(
              children: [
                Container(
                  width: 40.w,
                  height: 4.h,
                  margin: EdgeInsets.only(bottom: 16.h),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.r),
                      decoration: BoxDecoration(
                        color: colorScheme.primary.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                      child: Icon(Icons.inventory_2_rounded, color: colorScheme.primary, size: 22.sp),
                    ),
                    SizedBox(width: 14.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'انتخاب محصول مقصد',
                            style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w900,
                              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.87),
                              letterSpacing: -0.5,
                            ),
                          ),
                          Text(
                            'جستجو و انتخاب محصول برای لینک به بنر',
                            style: TextStyle(fontSize: 11.sp, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.45), fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      style: IconButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.04),
                        padding: EdgeInsets.all(8.r),
                      ),
                      icon: Icon(Icons.close_rounded, size: 20.sp, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.54)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // Search Bar Area
          Padding(
            padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 16.h),
            child: Container(
              height: 52.h,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainer,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.03)),
              ),
              child: TextField(
                controller: _searchController,
                onChanged: (v) => _debounceService.run(() => _fetchProducts(isRefresh: true)),
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
                decoration: InputDecoration(
                  hintText: 'جستجوی نام محصول...',
                  hintStyle: TextStyle(fontSize: 13.sp, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.38), fontWeight: FontWeight.normal),
                  prefixIcon: Icon(Icons.search_rounded, size: 22.sp, color: colorScheme.primary.withValues(alpha: 0.6)),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 14.h),
                ),
              ),
            ),
          ),
          
          Divider(height: 1, thickness: 1, color: Theme.of(context).colorScheme.outlineVariant),
          
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.surfaceContainer.withValues(alpha: 0.5),
              child: _buildList(colorScheme),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildList(ColorScheme colorScheme) {
    if (_isLoading && _products.isEmpty) {
      return ListView.builder(
        padding: EdgeInsets.all(24.w),
        itemCount: 6,
        itemBuilder: (context, index) => _buildShimmerItem(),
      );
    }

    if (_errorMessage != null && _products.isEmpty) {
      return ErrorStateWidget(
        message: _errorMessage!,
        onRetry: () => _fetchProducts(isRefresh: true),
      );
    }

    if (_products.isEmpty) {
      return const EmptyStateWidget(
        title: 'محصولی یافت نشد',
        description: 'با این نام محصولی در سیستم پیدا نکردیم.',
        icon: Icons.inventory_2_outlined,
      );
    }

    return ListView.builder(
      padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 24.h),
      physics: const BouncingScrollPhysics(),
      itemCount: _products.length + (_hasMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == _products.length) {
          _fetchProducts();
          return Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 24.h),
              child: SizedBox(
                width: 26.r,
                height: 26.r,
                child: CircularProgressIndicator(strokeWidth: 2.5, color: colorScheme.primary.withValues(alpha: 0.6)),
              ),
            ),
          );
        }

        final product = _products[index];
        return Container(
          margin: EdgeInsets.only(bottom: 12.h),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.02),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => widget.onSelected(product),
              borderRadius: BorderRadius.circular(20.r),
              child: Container(
                padding: EdgeInsets.all(12.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.04), width: 1),
                ),
                child: Row(
                  children: [
                    // Enhanced Image Container
                    Container(
                      width: 64.r,
                      height: 64.r,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceContainer,
                        borderRadius: BorderRadius.circular(18.r),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18.r),
                        child: product.images.isNotEmpty
                            ? CachedNetworkImage(
                                imageUrl: product.imageUrl,
                                fit: BoxFit.cover,
                                errorWidget: (c, e, s) => Icon(Icons.inventory_2_rounded, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.12), size: 28.sp),
                                placeholder: (c, u) => Container(color: Theme.of(context).colorScheme.outlineVariant),
                              )
                            : Icon(Icons.inventory_2_rounded, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.12), size: 28.sp),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w800,
                              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.87),
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                            decoration: BoxDecoration(
                              color: colorScheme.primary.withValues(alpha: 0.04),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.category_rounded, size: 12.sp, color: colorScheme.primary.withValues(alpha: 0.5)),
                                SizedBox(width: 6.w),
                                Text(
                                  product.category?.title ?? 'بدون دسته‌بندی',
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    color: colorScheme.primary.withValues(alpha: 0.7),
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(6.r),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceContainer,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.arrow_forward_ios_rounded, size: 14.sp, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.26)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildShimmerItem() {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.03)),
      ),
      child: Row(
        children: [
          Container(
            width: 56.r,
            height: 56.r,
            decoration: BoxDecoration(color: Theme.of(context).colorScheme.surfaceContainer, borderRadius: BorderRadius.circular(16.r)),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(width: 120.w, height: 14.h, decoration: BoxDecoration(color: Theme.of(context).colorScheme.surfaceContainer, borderRadius: BorderRadius.circular(4.r))),
                SizedBox(height: 8.h),
                Container(width: 80.w, height: 10.h, decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface, borderRadius: BorderRadius.circular(4.r))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
