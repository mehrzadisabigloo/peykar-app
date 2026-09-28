import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../core/themes/theme_main.dart';
import '../../../../core/utils/extensions.dart';
import '../../domain/entity/shop_entity.dart';

class ProductCard extends StatelessWidget {
  final ShopProduct product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final formatter = NumberFormat('#,###');

    return GestureDetector(
      onTap: () => context.pushNamed('product_detail', pathParameters: {'productId': product.id}),
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(24.r),
          boxShadow: [
            BoxShadow(
              color: theme.shadowColor.withValues(alpha: 0.03),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
          border: Border.all(color: colorScheme.outline.withValues(alpha: 0.05)),
        ),
        child: Row(
          children: [
            // 1. Image Section with Discount Badge
            Stack(
              children: [
                Container(
                  width: 110.r,
                  height: 110.r,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.r),
                    child: product.imageUrl.isNotEmpty
                        ? CachedNetworkImage(
                            imageUrl: product.imageUrl,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Container(color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.2)),
                            errorWidget: (context, url, error) => Icon(Icons.image_not_supported_outlined, color: colorScheme.outline),
                          )
                        : Icon(Icons.shopping_bag_outlined, color: colorScheme.primary, size: 40.sp),
                  ),
                ),
                if (product.hasDiscount && product.discountPercentage != null)
                  Positioned(
                    top: 8.r,
                    right: 8.r,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: colorScheme.error,
                        borderRadius: BorderRadius.circular(8.r),
                        boxShadow: [
                          BoxShadow(color: colorScheme.error.withValues(alpha: 0.2), blurRadius: 8, offset: const Offset(0, 2)),
                        ],
                      ),
                      child: Text(
                        '${product.discountPercentage!.toInt().toString().toPersianDigit}٪',
                        style: TextStyle(
                          color: colorScheme.onError,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'BonyadeKoodak',
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            
            SizedBox(width: 16.w),

            // 2. Info Section
            Expanded(
              child: SizedBox(
                height: 110.r,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      product.title,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w900,
                        color: colorScheme.onSurface,
                        fontFamily: 'BonyadeKoodak',
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    
                    SizedBox(height: 6.h),
                    
                    // Stock Status
                    Row(
                      children: [
                        Icon(
                          product.isAvailable ? Icons.inventory_2_rounded : Icons.history_rounded,
                          size: 14.sp,
                          color: product.isAvailable ? StatusColors.of(context).success : colorScheme.error, // Semantic green for available
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          product.isAvailable 
                            ? 'موجودی: ${product.stock.toString().toPersianDigit} عدد' 
                            : 'ناموجود',
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: product.isAvailable ? StatusColors.of(context).success : colorScheme.error,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'BonyadeKoodak',
                          ),
                        ),
                      ],
                    ),
                    
                    const Spacer(),

                    // Price Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            if (product.hasDiscount && product.finalPrice != null) ...[
                              Text(
                                '${formatter.format(product.price).toPersianDigit} تومان',
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  color: colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
                                  decoration: TextDecoration.lineThrough,
                                  fontFamily: 'BonyadeKoodak',
                                ),
                              ),
                              SizedBox(height: 2.h),
                              Text(
                                '${formatter.format(product.finalPrice).toPersianDigit} تومان',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w900,
                                  color: colorScheme.primary,
                                  fontFamily: 'BonyadeKoodak',
                                ),
                              ),
                            ] else
                              Text(
                                '${formatter.format(product.price).toPersianDigit} تومان',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w900,
                                  color: colorScheme.primary,
                                  fontFamily: 'BonyadeKoodak',
                                ),
                              ),
                          ],
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
