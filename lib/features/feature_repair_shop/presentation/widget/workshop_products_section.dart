import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../domain/entity/repair_shop_entity.dart';
import 'workshop_section_header.dart';
import 'workshop_product_card.dart';

class WorkshopProductsSection extends StatelessWidget {
  final RepairShopEntity workshop;
  final VoidCallback onSeeAll;
  final Function(String) onProductTap;

  const WorkshopProductsSection({
    super.key,
    required this.workshop,
    required this.onSeeAll,
    required this.onProductTap,
  });

  @override
  Widget build(BuildContext context) {
    final products = workshop.products;
    final theme = Theme.of(context);

    return Column(
      children: [
        WorkshopSectionHeader(
          title: 'محصولات برتر',
          onSeeAll: onSeeAll,
        ),
        SizedBox(height: 16.h),
        SizedBox(
          height: 265.h,
          child: products.isEmpty
              ? Center(
                  child: Text('محصولی یافت نشد', style: theme.textTheme.bodySmall),
                )
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(bottom: 20.h, right: 4.w, left: 4.w),
                  physics: const BouncingScrollPhysics(),
                  itemCount: products.length,
                  itemBuilder: (context, index) => WorkshopProductCard(
                    product: products[index],
                    onTap: () => onProductTap(products[index].id),
                  ),
                ),
        ),
      ],
    );
  }
}
