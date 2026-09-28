import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../core/widgets/empty_state_widget.dart';
import '../../../../core/widgets/error_state_widget.dart';
import '../../../../core/bloc/app/app_bloc.dart';
import '../../../../core/bloc/error/error_bloc.dart';
import '../../../../core/services/locator.dart';
import '../base/base_shop_basket_stateful_widget_state.dart';
import '../bloc/shop_basket_bloc.dart';
import '../../domain/entity/shop_basket_entity.dart';
import '../widget/shop_basket_shimmer.dart';

class ScreenShopBasket extends StatefulWidget {
  const ScreenShopBasket({super.key});

  @override
  State<ScreenShopBasket> createState() => _ScreenShopBasketState();
}

class _ScreenShopBasketState extends BaseShopBasketStatefulWidgetState<ScreenShopBasket, ShopBasketBloc> {
  _ScreenShopBasketState() : super(locator<ShopBasketBloc>());

  @override
  void initState() {
    super.initState();
    bloc.add(FetchShopBasketDataEvent());
  }

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
    final formatter = NumberFormat('#,###');
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      color: colorScheme.surfaceContainerHighest,
      child: BlocBuilder<ShopBasketBloc, ShopBasketState>(
        builder: (context, state) {
          if (state is ShopBasketLoading) {
            return const ShopBasketShimmer();
          }
          if (state is ShopBasketError) {
            return ErrorStateWidget(
              message: state.message,
              onRetry: () => bloc.add(FetchShopBasketDataEvent()),
            );
          }
          if (state is ShopBasketLoaded) {
            final isEmpty = state.entity.shopGroups.isEmpty || 
                           state.entity.shopGroups.every((g) => g.items.isEmpty);

            if (isEmpty) {
              return const EmptyStateWidget(
                title: 'سبد خرید شما خالی است',
                description: 'محصولات مورد نیاز خود را به سبد خرید اضافه کنید.',
                icon: Icons.shopping_basket_outlined,
              );
            }

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    itemCount: state.entity.shopGroups.length,
                    itemBuilder: (context, index) {
                      return _buildShopGroup(state.entity.shopGroups[index], formatter);
                    },
                  ),
                ),
                _buildBottomSummary(context, state.entity, formatter),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildShopGroup(BasketShopGroup group, NumberFormat formatter) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      margin: EdgeInsets.only(bottom: 24.h),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(25.r),
        boxShadow: [
          BoxShadow(
            color: colorScheme.onSurface.withValues(alpha: 0.03),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.r),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                    color: colorScheme.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Icon(Icons.storefront_rounded, size: 22.sp, color: colorScheme.primary),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Text(
                    group.shopName,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w900,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    '${group.items.length} کالا',
                    style: TextStyle(
                      fontSize: 10.sp, 
                      color: colorScheme.onSurface.withValues(alpha: 0.6), 
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(height: 1, thickness: 0.5, color: colorScheme.outline.withValues(alpha: 0.5)),
          Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              children: [
                ...group.items.map((item) => _buildBasketItem(item, formatter)),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: colorScheme.primary.withValues(alpha: 0.05),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(25.r)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'مجموع این فروشگاه:',
                  style: TextStyle(
                    fontSize: 12.sp, 
                    color: colorScheme.onSurface.withValues(alpha: 0.6), 
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  '${formatter.format(group.groupTotalPrice)} تومان',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w900,
                    color: colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBasketItem(BasketItem item, NumberFormat formatter) {
    final colorScheme = Theme.of(context).colorScheme;
    final itemTotal = item.price * item.quantity;
    return GestureDetector(
      onTap: () {
        if (item.productId.isNotEmpty) {
          context.pushNamed(
            'product_detail',
            pathParameters: {'productId': item.productId},
          );
        }
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 90.w,
              height: 90.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18.r),
                color: colorScheme.surfaceContainerHighest,
                border: Border.all(color: colorScheme.outline.withValues(alpha: 0.5)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18.r),
                child: item.imageUrl.isNotEmpty
                    ? CachedNetworkImage(
                        imageUrl: item.imageUrl,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(color: colorScheme.surfaceContainerHighest),
                        errorWidget: (context, url, error) => Icon(Icons.image_not_supported_outlined, color: colorScheme.outline),
                      )
                    : Icon(Icons.shopping_bag_outlined, color: colorScheme.primary.withValues(alpha: 0.3), size: 35.sp),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.sp, 
                      fontWeight: FontWeight.w900, 
                      color: colorScheme.onSurface
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'قیمت واحد: ${formatter.format(item.price)}',
                            style: TextStyle(
                              fontSize: 11.sp, 
                              color: colorScheme.onSurface.withValues(alpha: 0.5), 
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            '${formatter.format(itemTotal)} تومان',
                            style: TextStyle(
                              fontSize: 14.sp, 
                              fontWeight: FontWeight.w900, 
                              color: colorScheme.primary
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
                        decoration: BoxDecoration(
                          color: colorScheme.primary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(color: colorScheme.primary.withValues(alpha: 0.2)),
                        ),
                        child: Text(
                          '${item.quantity} عدد',
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w900,
                            color: colorScheme.primary,
                          ),
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
    );
  }

  Widget _buildBottomSummary(BuildContext context, ShopBasketEntity entity, NumberFormat formatter) {
    final colorScheme = Theme.of(context).colorScheme;
    int totalItems = 0;
    for (var group in entity.shopGroups) {
      for (var item in group.items) {
        totalItems += item.quantity;
      }
    }

    return Container(
      padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 16.h),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
        boxShadow: [
          BoxShadow(
            color: colorScheme.onSurface.withValues(alpha: 0.08),
            blurRadius: 25,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'مجموع کل ($totalItems کالا)',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: colorScheme.onSurface.withValues(alpha: 0.5),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        formatter.format(entity.totalPrice),
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w900,
                          color: colorScheme.primary,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        'تومان',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w800,
                          color: colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 54.h,
              width: 160.w,
              child: ElevatedButton(
                onPressed: () {
                  context.pushNamed('checkout', extra: entity);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  foregroundColor: colorScheme.onPrimary,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.r),
                  ),
                  elevation: 5,
                  shadowColor: colorScheme.primary.withValues(alpha: 0.3),
                ),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        colorScheme.primary,
                        colorScheme.primary.withValues(alpha: 0.8),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(18.r),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'تایید و ادامه',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Icon(Icons.arrow_forward_rounded, size: 18.sp),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
