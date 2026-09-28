import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/persian_formatter.dart';
import '../../../feature_manage_products/domain/entity/manage_products_entity.dart';
import 'screen_repair_shop.dart'; // For PersianFormatter

class ScreenAllRepairShopProducts extends StatelessWidget {
  final String repairmanId;
  final List<ManageProductsEntity> products;

  const ScreenAllRepairShopProducts({
    super.key,
    required this.repairmanId,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        body: products.isEmpty
            ? _buildEmptyState(theme)
            : GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.68,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 20.h,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return _buildProductGridCard(context, products[index]);
                },
              ),
      ),
    );
  }

  Widget _buildEmptyState(ThemeData theme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inventory_2_outlined, size: 64.sp, color: theme.colorScheme.outline.withValues(alpha: 0.2)),
          SizedBox(height: 16.h),
          Text(
            'محصولی یافت نشد',
            style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.outline),
          ),
        ],
      ),
    );
  }

  Widget _buildProductGridCard(BuildContext context, ManageProductsEntity product) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return GestureDetector(
      onTap: () => context.pushNamed(
        'product_detail',
        pathParameters: {'productId': product.id},
      ),
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(28.r),
          boxShadow: [
            BoxShadow(
              color: colorScheme.primary.withValues(alpha: 0.05),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            Expanded(
              flex: 6,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: colorScheme.primary.withValues(alpha: 0.03),
                      borderRadius: BorderRadius.circular(28.r),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(28.r),
                      child: product.imageUrl.isNotEmpty
                          ? CachedNetworkImage(
                              imageUrl: product.imageUrl,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                              errorWidget: (_, _, _) => Center(
                                child: Icon(Icons.shopping_bag_outlined, color: colorScheme.primary.withValues(alpha: 0.1), size: 48.sp),
                              ),
                            )
                          : Center(
                              child: Icon(Icons.shopping_bag_outlined, color: colorScheme.primary.withValues(alpha: 0.1), size: 48.sp),
                            ),
                    ),
                  ),
                ],
              ),
            ),
            // Info Section
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.fromLTRB(14.w, 12.h, 14.w, 14.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w900,
                        fontSize: 14.sp,
                        color: colorScheme.onSurface,
                        height: 1.2,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              PersianFormatter.price(product.price),
                              style: TextStyle(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w900,
                                color: colorScheme.primary,
                                fontFamily: 'BonyadeKoodak',
                              ),
                            ),
                            Text(
                              'تومان',
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 14.sp,
                          color: colorScheme.primary.withValues(alpha: 0.3),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
