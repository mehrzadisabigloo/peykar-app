import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../domain/entity/manage_products_entity.dart';
import '../screen/screen_product_detail.dart';

class ProductDetailBottomBar extends StatelessWidget {
  final ManageProductsEntity product;
  final bool isLoading;
  final VoidCallback onAddToCart;

  const ProductDetailBottomBar({
    super.key,
    required this.product,
    required this.isLoading,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 32.h),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28.r)),
        boxShadow: [
          BoxShadow(
            color: colorScheme.primary.withValues(alpha: 0.08),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'قیمت مصرف‌کننده',
                  style: TextStyle(
                    color: colorScheme.outline,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Text(
                      PersianFormatter.price(product.hasDiscount
                          ? product.finalPrice
                          : product.price),
                      style: TextStyle(
                        color: colorScheme.primary,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      'تومان',
                      style: TextStyle(
                        color: colorScheme.primary,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                if (product.hasDiscount)
                  Row(
                    children: [
                      Text(
                        PersianFormatter.price(product.price),
                        style: TextStyle(
                          color: colorScheme.outlineVariant,
                          fontSize: 13.sp,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 4.w, vertical: 1.h),
                        decoration: BoxDecoration(
                          color: colorScheme.error.withValues(alpha: 0.05),
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: Text(
                          '${PersianFormatter.digits(product.discountPercentage.toString())}%-',
                          style: TextStyle(
                            color: colorScheme.error,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: ElevatedButton(
              onPressed: isLoading ? null : onAddToCart,
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.primary,
                foregroundColor: colorScheme.surface,
                minimumSize: Size(double.infinity, 58.h),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.r)),
                elevation: 0,
              ),
              child: isLoading
                  ? SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(
                          strokeWidth: 2.5, color: colorScheme.surface),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shopping_cart_checkout_rounded,
                            size: 20.sp),
                        SizedBox(width: 8.w),
                        Text(
                          'افزودن به سبد',
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
