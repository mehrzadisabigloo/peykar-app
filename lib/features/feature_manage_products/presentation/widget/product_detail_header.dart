import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/themes/theme_main.dart';
import '../../domain/entity/manage_products_entity.dart';
import '../screen/screen_product_detail.dart';

class ProductDetailHeader extends StatelessWidget {
  final ManageProductsEntity product;

  const ProductDetailHeader({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (product.status.toLowerCase() == 'active')
                    Container(
                      margin: EdgeInsets.only(bottom: 8.h),
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: StatusColors.of(context)
                            .success
                            .withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Text(
                        'موجود در انبار',
                        style: TextStyle(
                          color: StatusColors.of(context).success,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  Text(
                    product.title,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w900,
                      color: colorScheme.onSurface.withValues(alpha: 0.9),
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16.w),
            _buildRatingBadge(context),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            if (product.hasDiscount) ...[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: colorScheme.error,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  '${PersianFormatter.digits(product.discountPercentage.toString())}% تخفیف',
                  style: TextStyle(
                    color: colorScheme.surface,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              SizedBox(width: 12.w),
            ],
            Icon(Icons.category_rounded,
                size: 14.sp,
                color: theme.colorScheme.primary.withValues(alpha: 0.6)),
            SizedBox(width: 6.w),
            Text(
              product.category?.title ?? 'دسته‌بندی نشده',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 16.w),
            Icon(Icons.branding_watermark_rounded,
                size: 14.sp, color: colorScheme.outline),
            SizedBox(width: 6.w),
            Text(
              'برند: ${product.repairman?.brand ?? "زینو"}',
              style: theme.textTheme.bodySmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRatingBadge(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: StatusColors.of(context).warning.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star_rounded,
              color: StatusColors.of(context).warning, size: 18.sp),
          SizedBox(width: 4.w),
          Text(
            PersianFormatter.digits('4.8'),
            style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w900),
          ),
        ],
      ),
    );
  }
}
