import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../domain/entity/manage_products_entity.dart';
import '../screen/screen_product_detail.dart';

class ProductDetailHeroImages extends StatelessWidget {
  final ManageProductsEntity product;
  final PageController pageController;

  const ProductDetailHeroImages({
    super.key,
    required this.product,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Stack(
      fit: StackFit.expand,
      children: [
        product.images.isNotEmpty
            ? PageView.builder(
                controller: pageController,
                itemCount: product.images.length,
                itemBuilder: (context, index) => Hero(
                  tag: 'prod_img_${product.id}_$index',
                  child: CachedNetworkImage(
                    imageUrl: product.images[index],
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) =>
                        _buildPlaceholder(context),
                  ),
                ),
              )
            : _buildPlaceholder(context),
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  colorScheme.onSurface.withValues(alpha: 0.4),
                  Colors.transparent,
                ],
                stops: const [0.0, 0.25],
              ),
            ),
          ),
        ),
        if (product.images.length > 1)
          Positioned(
            bottom: 50.h,
            right: 24.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: colorScheme.onSurface.withValues(alpha: 0.4),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: ListenableBuilder(
                listenable: pageController,
                builder: (context, child) {
                  int currentPage = pageController.hasClients
                      ? (pageController.page?.round() ?? 0)
                      : 0;
                  return Text(
                    PersianFormatter.digits(
                        '${currentPage + 1} از ${product.images.length}'),
                    style: TextStyle(
                      color: colorScheme.surface,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildPlaceholder(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      color: colorScheme.outlineVariant,
      alignment: Alignment.center,
      child: Icon(Icons.shopping_bag_outlined,
          color: colorScheme.outline, size: 64.sp),
    );
  }
}
