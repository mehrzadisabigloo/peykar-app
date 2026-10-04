import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart' as intl;
import '../../../../../core/bloc/app/app_bloc.dart';
import '../../../../../core/bloc/error/error_bloc.dart';
import '../../../../../core/services/locator.dart';
import '../../../../../core/widgets/cstm_snakbar.dart';
import '../../../../../core/widgets/stylish_popup.dart';
import '../../../../../core/widgets/empty_state_widget.dart';
import '../../../../../core/widgets/error_state_widget.dart';
import '../../../../../core/widgets/list_shimmer.dart';
import '../../../../../core/widgets/widget_infinite_list.dart';
import '../../domain/entity/admin_product_entity.dart';
import '../../domain/entity/admin_product_filter_params.dart';
import '../base/base_manage_shop_products_stateful_widget_state.dart';
import '../bloc/manage_shop_products_bloc.dart';
import '../bloc/manage_shop_products_event.dart';
import '../bloc/manage_shop_products_state.dart';
import '../../../../feature_home/presentation/widget/repairman_list_shimmer.dart';

class ScreenManageShopProducts extends StatefulWidget {
  const ScreenManageShopProducts({super.key});

  @override
  State<ScreenManageShopProducts> createState() => _ScreenManageShopProductsState();
}

class _ScreenManageShopProductsState extends BaseManageShopProductsStatefulWidgetState<ScreenManageShopProducts, ManageShopProductsBloc> {
  _ScreenManageShopProductsState() : super(locator<ManageShopProductsBloc>());

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  void _refresh() {
    bloc.add(const FetchAdminProducts(AdminProductFilterParams(isPaginate: true)));
  }

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surfaceContainer,
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _openAddEditScreen(context),
        backgroundColor: colorScheme.primary,
        icon: Icon(Icons.add_shopping_cart_rounded, color: colorScheme.surface),
        label: Text(
          'افزودن محصول جدید',
          style: TextStyle(
            color: colorScheme.surface,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocListener<ManageShopProductsBloc, ManageShopProductsState>(
        listener: (context, state) {
          if (state is AdminProductActionSuccess) {
            CstmSnackBar.showSuccess(context, state.message);
            _refresh();
          }
          if (state is ManageShopProductsError) {
             CstmSnackBar.showError(context, state.message);
          }
          if (state is ManageShopProductsLoaded) {
            if (state.successMessage != null) {
              CstmSnackBar.showSuccess(context, state.successMessage!);
            }
            if (state.errorMessage != null) {
              CstmSnackBar.showError(context, state.errorMessage!);
            }
          }
        },
        child: BlocBuilder<ManageShopProductsBloc, ManageShopProductsState>(
          builder: (context, state) {
            List<AdminProductEntity> items = [];
            bool hasReachedBottom = false;
            bool hasError = false;
            String? errorMessage;
            String? processingId;
            bool isDeleting = false;

            if (state is ManageShopProductsInitial) {
              return const SizedBox.shrink();
            }

            if (state is ManageShopProductsLoading && state.filters.page == 1) {
              return ListShimmer(height: 140);
            }

            if (state is AdminProductActionLoading) {
              processingId = state.processingId;
              items = state.products;
              isDeleting = state.isDeleting;
            }

            if (state is ManageShopProductsError) {
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

            if (state is ManageShopProductsLoaded) {
              items = state.products;
              hasReachedBottom = !state.hasMore;
              if (items.isEmpty && state.errorMessage != null) {
                hasError = true;
                errorMessage = state.errorMessage;
              }
            } else if (state is ManageShopProductsLoadingMore) {
              items = state.products;
              hasReachedBottom = !state.hasMore;
            }

            if (items.isEmpty && !hasError && state is! ManageShopProductsLoading && state is! AdminProductActionLoading) {
              return const EmptyStateWidget(
                title: 'محصولی یافت نشد',
                description: 'هنوز هیچ محصولی برای فروش عمده ثبت نشده است.',
                icon: Icons.inventory_2_rounded,
              );
            }

            return WidgetInfiniteList(
              builder: (context, item) {
                final product = item as AdminProductEntity;
                return _buildProductCard(
                  context,
                  product,
                  colorScheme,
                  isProcessing: processingId == product.id && !isDeleting,
                  isDeleting: processingId == product.id && isDeleting,
                );
              },
              items: items,
              bloc: bloc.listBloc,
              itemEquality: (first, second) => (first as AdminProductEntity).id == (second as AdminProductEntity).id,
              hasReachedTop: true,
              hasReachedBottom: hasReachedBottom,
              isLoading: false,
              loadingWidget: const RepairmanListShimmer(),
              errorWidget: ErrorStateWidget(
                message: errorMessage ?? "",
                onRetry: () => bloc.add(const LoadMoreAdminProducts()),
              ),
              hasErrorOccurred: hasError,
              loadBottomData: () => bloc.add(const LoadMoreAdminProducts()),
              padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 100.h),
            );
          },
        ),
      ),
    );
  }

  Widget _buildProductCard(
    BuildContext context,
    AdminProductEntity product,
    ColorScheme colorScheme, {
    bool isProcessing = false,
    bool isDeleting = false,
  }) {
    final isActive = product.status == 'Active';
    final formatter = intl.NumberFormat('#,###');

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: colorScheme.onSurface.withValues(alpha: 0.03),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => context.pushNamed('product_detail', pathParameters: {'productId': product.id!}),
          borderRadius: BorderRadius.circular(24.r),
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    // Product Image
                    Container(
                      width: 70.r,
                      height: 70.r,
                      decoration: BoxDecoration(
                        color: colorScheme.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.r),
                        child: product.imageUrl.isNotEmpty
                            ? CachedNetworkImage(
                                imageUrl: product.imageUrl,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => Container(color: colorScheme.outlineVariant),
                                errorWidget: (context, url, error) => _buildPlaceholder(colorScheme),
                              )
                            : _buildPlaceholder(colorScheme),
                      ),
                    ),
                    SizedBox(width: 14.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.title,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w900,
                              color: colorScheme.onSurface,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            '${formatter.format(product.price)} تومان',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (isProcessing)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: SizedBox(
                          width: 20.r,
                          height: 20.r,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: colorScheme.primary,
                          ),
                        ),
                      )
                    else
                      Switch(
                        value: isActive,
                        onChanged: (val) => bloc.add(ChangeAdminProductStatus(product.id!)),
                        activeThumbColor: colorScheme.primary,
                        activeTrackColor: colorScheme.primary.withValues(alpha: 0.2),
                      ),
                  ],
                ),
                SizedBox(height: 12.h),
                Text(
                  product.description,
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: colorScheme.onSurface.withValues(alpha: 0.45),
                    height: 1.4,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 16.h),
                Divider(color: colorScheme.outlineVariant),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildInfoItem(Icons.inventory_2_outlined, 'موجودی: ${product.stock} عدد'),
                    _buildInfoItem(Icons.calendar_today_rounded, 'ایجاد: ${product.createdAt?.split('T')[0] ?? '-'}'),
                  ],
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton.icon(
                      onPressed: (isProcessing || isDeleting) ? null : () => _confirmDelete(context, product),
                      icon: isDeleting
                          ? SizedBox(
                              width: 16.sp,
                              height: 16.sp,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: colorScheme.error,
                              ),
                            )
                          : Icon(Icons.delete_outline_rounded, size: 18.sp),
                      label: Text(isDeleting ? 'حذف...' : 'حذف'),
                      style: TextButton.styleFrom(
                        foregroundColor: colorScheme.error,
                        disabledForegroundColor: colorScheme.error.withValues(alpha: 0.5),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    TextButton.icon(
                      onPressed: (isProcessing || isDeleting) ? null : () => _openAddEditScreen(context, product: product),
                      icon: Icon(Icons.edit_note_rounded, size: 22.sp),
                      label: const Text('ویرایش'),
                      style: TextButton.styleFrom(
                        backgroundColor: colorScheme.primary.withValues(alpha: (isProcessing || isDeleting) ? 0.05 : 0.1),
                        foregroundColor: colorScheme.primary,
                        disabledForegroundColor: colorScheme.primary.withValues(alpha: 0.5),
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                        splashFactory: NoSplash.splashFactory,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholder(ColorScheme colorScheme) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colorScheme.primary.withValues(alpha: 0.05),
            colorScheme.primary.withValues(alpha: 0.1),
          ],
        ),
      ),
      child: Icon(
        Icons.inventory_2_outlined,
        color: colorScheme.primary.withValues(alpha: 0.3),
        size: 30.sp,
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String text) {
    return Row(

      children: [
        Icon(icon, size: 14.sp, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.38)),
        SizedBox(width: 6.w),
        Text(
          text,
          style: TextStyle(
            fontSize: 11.sp,
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.54),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  void _openAddEditScreen(BuildContext context, {AdminProductEntity? product}) async {
    final result = await context.pushNamed('add_edit_admin_product', extra: product);
    if (result == true) {
      _refresh();
    }
  }

  void _confirmDelete(BuildContext context, AdminProductEntity product) {
    ConfirmationPopup.show(
      context,
      title: 'حذف محصول',
      description: 'آیا از حذف محصول "${product.title}" اطمینان دارید؟ این عمل غیرقابل بازگشت است.',
      confirmText: 'حذف',
      cancelText: 'انصراف',
      icon: Icons.delete_forever_rounded,
      onConfirm: () => bloc.add(DeleteAdminProduct(product.id!)),
    );
  }
}
