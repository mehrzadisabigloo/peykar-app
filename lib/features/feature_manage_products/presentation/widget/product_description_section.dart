import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../domain/entity/manage_products_entity.dart';

class ProductDescriptionSection extends StatelessWidget {
  final ManageProductsEntity product;

  const ProductDescriptionSection({
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
        Text(
          'توضیحات کالا',
          style: theme.textTheme.headlineSmall?.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          product.description.isNotEmpty
              ? product.description
              : 'توضیحات تکمیلی برای این محصول ثبت نشده است.',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
            height: 1.7,
          ),
        ),
        if (product.keywords.isNotEmpty) ...[
          SizedBox(height: 24.h),
          Wrap(
            spacing: 10.w,
            runSpacing: 10.h,
            children: product.keywords
                .map((k) => Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 14.w, vertical: 8.h),
                      decoration: BoxDecoration(
                        color: colorScheme.primary.withValues(alpha: 0.04),
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                      child: Text(
                        k,
                        style: TextStyle(
                          color: colorScheme.primary,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ))
                .toList(),
          ),
        ],
      ],
    );
  }
}
