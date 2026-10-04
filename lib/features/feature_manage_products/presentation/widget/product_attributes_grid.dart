import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../domain/entity/manage_products_entity.dart';
import '../screen/screen_product_detail.dart';

class ProductAttributesGrid extends StatelessWidget {
  final ManageProductsEntity product;

  const ProductAttributesGrid({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('مشخصات فنی',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w900)),
        SizedBox(height: 16.h),
        Container(
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: Column(
            children: [
              _buildAttrRow(
                Icons.shopping_bag_rounded,
                'حداقل خرید',
                '${PersianFormatter.digits(product.minPurchaseQuantity.toString())} عدد',
                colorScheme,
              ),
              _buildDivider(context),
              _buildAttrRow(
                Icons.shopping_bag_outlined,
                'حداکثر خرید',
                '${PersianFormatter.digits(product.maxPurchaseQuantity.toString())} عدد',
                colorScheme,
              ),
              _buildDivider(context),
              _buildAttrRow(
                Icons.inventory_2_rounded,
                'موجودی انبار',
                '${PersianFormatter.digits(product.stock.toString())} عدد',
                colorScheme,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAttrRow(
      IconData icon, String label, String value, ColorScheme colorScheme) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          Icon(icon,
              size: 20.sp, color: colorScheme.primary.withValues(alpha: 0.7)),
          SizedBox(width: 12.w),
          Text(label,
              style: TextStyle(fontSize: 13.sp, color: colorScheme.outline)),
          const Spacer(),
          Text(
            value,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface.withValues(alpha: 0.87),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider(BuildContext context) => Divider(
      height: 20.h,
      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.05),
      thickness: 1);
}
