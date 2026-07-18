import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../core/widgets/empty_state_widget.dart';
import '../../../../core/widgets/error_state_widget.dart';
import '../../../../core/bloc/app/app_bloc.dart';
import '../../../../core/bloc/error/error_bloc.dart';
import '../../../../core/services/locator.dart';
import '../base/base_shop_basket_stateful_widget_state.dart';
import '../bloc/shop_basket_bloc.dart';
import '../../domain/entity/shop_basket_entity.dart';

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

    return Container(
      color: const Color(0xFFF8F9FA),
      child: BlocBuilder<ShopBasketBloc, ShopBasketState>(
        builder: (context, state) {
          if (state is ShopBasketLoading) {
            return const Center(child: CircularProgressIndicator());
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
                    padding: EdgeInsets.all(20.w),
                    itemCount: state.entity.shopGroups.length,
                    itemBuilder: (context, index) {
                      return _buildShopGroup(state.entity.shopGroups[index], formatter);
                    },
                  ),
                ),
                _buildBottomSummary(state.entity.totalPrice, formatter),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildShopGroup(BasketShopGroup group, NumberFormat formatter) {
    return Container(
      margin: EdgeInsets.only(bottom: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.store_outlined, size: 20.sp, color: Colors.grey),
              SizedBox(width: 8.w),
              Text(
                group.shopName,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          ...group.items.map((item) => _buildBasketItem(item, formatter)),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'مجموع:',
                  style: TextStyle(fontSize: 14.sp, color: Colors.black87),
                ),
                Text(
                  '${formatter.format(group.groupTotalPrice)} تومان',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          Divider(color: Colors.grey.withValues(alpha: 0.2)),
        ],
      ),
    );
  }

  Widget _buildBasketItem(BasketItem item, NumberFormat formatter) {
    final itemTotal = item.price * item.quantity;
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 60.w,
            height: 60.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.grey[50],
            ),
            child: Icon(Icons.shopping_bag_outlined, color: Colors.blue[600], size: 30.sp),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6.h),
                Row(
                  children: [
                    Text(
                      'قیمت واحد: ',
                      style: TextStyle(fontSize: 11.sp, color: Colors.grey[600]),
                    ),
                    Text(
                      '${formatter.format(item.price)} تومان',
                      style: TextStyle(fontSize: 12.sp, color: Colors.black87),
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                Row(
                  children: [
                    Text(
                      'قیمت کل: ',
                      style: TextStyle(fontSize: 11.sp, color: Colors.grey[600]),
                    ),
                    Text(
                      '${formatter.format(itemTotal)} تومان',
                      style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold, color: const Color(0xFF3F51B5)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Text(
              item.quantity.toString(),
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Colors.blue[700],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomSummary(double total, NumberFormat formatter) {
    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'مجموع کل سبد',
                  style: TextStyle(fontSize: 16.sp, color: Colors.black54),
                ),
                Text(
                  '${formatter.format(total)} تومان',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            SizedBox(
              width: double.infinity,
              height: 55.h,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3F51B5),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
                  elevation: 0,
                ),
                child: Text(
                  'ادامه و پرداخت',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
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
