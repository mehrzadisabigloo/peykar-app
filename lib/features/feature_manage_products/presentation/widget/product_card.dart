import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as intl;
import '../../../../core/themes/theme_main.dart';
import '../../domain/entity/manage_products_entity.dart';

class ProductCard extends StatelessWidget {
  final ManageProductsEntity product;
  final VoidCallback? onTap;

  const ProductCard({
    super.key,
    required this.product,
    this.onTap,
  });

  Widget _buildPlaceholder(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.surfaceContainer, // Indigo 50
            Theme.of(context).colorScheme.surfaceContainer, // Grey 100
          ],
        ),
      ),
      child: Icon(
        Icons.inventory_2_outlined,
        color: DashboardColors.of(context).adminIndigo.withValues(alpha: 0.3),
        size: 30.sp,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final formatter = intl.NumberFormat('#,###', 'fa_IR');

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: colorScheme.onSurface.withValues(alpha: 0.04),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24.r),
        child: Padding(
          padding: EdgeInsets.all(12.r),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Product Image with subtle discount overlay
              Stack(
                children: [
                  Container(
                    width: 90.r,
                    height: 90.r,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: colorScheme.surfaceContainer,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                      child: product.imageUrl.isNotEmpty
                          ? CachedNetworkImage(
                              imageUrl: product.imageUrl,
                              fit: BoxFit.cover,
                              errorWidget: (context, error, stackTrace) => _buildPlaceholder(context),
                              placeholder: (context, url) => Container(
                                color: colorScheme.outlineVariant,
                              ),
                            )
                          : _buildPlaceholder(context),
                    ),
                  ),
                  if (product.hasDiscount)
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: colorScheme.error,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20.r),
                            bottomLeft: Radius.circular(12.r),
                          ),
                        ),
                        child: Text(
                          '${product.discountPercentage}٪',
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: colorScheme.surface,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(width: 16.w),
              // Content Section
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            product.name,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: colorScheme.onSurface,
                              letterSpacing: -0.5,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        _buildStatusBadge(context, product.status),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      product.description,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: colorScheme.outline,
                        height: 1.4,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Price section
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (product.hasDiscount)
                              Text(
                                formatter.format(product.price),
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  color: colorScheme.outlineVariant,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  formatter.format(product.hasDiscount ? product.finalPrice : product.price),
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w800,
                                    color: DashboardColors.of(context).adminIndigo,
                                  ),
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  'تومان',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: DashboardColors.of(context).adminIndigo,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        // Stock Indicator
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                          decoration: BoxDecoration(
                            color: colorScheme.surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.inventory_2_outlined,
                                size: 12.sp,
                                color: DashboardColors.of(context).adminIndigo,
                              ),
                              SizedBox(width: 6.w),
                              Text(
                                product.stock.toString(),
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700,
                                  color: DashboardColors.of(context).adminIndigo,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusBadge(BuildContext context, String status) {
    final isActive = status == 'Active';
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: (isActive ? StatusColors.of(context).success : StatusColors.of(context).warning).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Text(
        isActive ? 'فعال' : 'غیرفعال',
        style: TextStyle(
          fontSize: 10.sp,
          color: isActive ? StatusColors.of(context).success : StatusColors.of(context).warning,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
