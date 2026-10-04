import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/themes/theme_main.dart';
import '../../../../core/utils/extensions.dart';
import '../../../panel_admin_features/feature_manage_addresses/data/model/address_model.dart';
import '../../domain/entity/shop_basket_entity.dart';
import '../bloc/checkout_bloc.dart';
import '../bloc/checkout_event.dart';
import '../bloc/checkout_state.dart';
import '../screen/screen_checkout.dart';
import 'checkout_address_selection_sheet.dart';
import 'checkout_discount_input_sheet.dart';
import 'checkout_payment_selection_sheet.dart';

class CheckoutShopGroupCard extends StatelessWidget {
  final BasketShopGroup group;
  final CheckoutLoaded state;
  final CheckoutBloc bloc;
  final Map<String, TextEditingController> discountControllers;
  final List<String> allRepairmanIds;

  const CheckoutShopGroupCard({
    super.key,
    required this.group,
    required this.state,
    required this.bloc,
    required this.discountControllers,
    required this.allRepairmanIds,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final availableMethods = state.shopPaymentMethods[group.repairmanId] ?? [];
    final selectedMethodId = state.selectedPaymentMethods[group.repairmanId];
    final selectedAddressId = state.selectedAddressIds[group.repairmanId];
    final selectedAddress = state.addresses.firstWhere(
      (a) => a.id == selectedAddressId,
      orElse: () => state.addresses.isNotEmpty
          ? state.addresses.first
          : const AddressModel(),
    );
    final appliedDiscountData = state.shopDiscountDatas[group.repairmanId];

    return Container(
      margin: EdgeInsets.only(bottom: 24.h),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(28.r),
        boxShadow: [
          BoxShadow(
            color: colorScheme.onSurface.withValues(alpha: 0.04),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
          BoxShadow(
            color: colorScheme.primary.withValues(alpha: 0.02),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(20.r),
            child: Row(
              children: [
                Container(
                  width: 52.w,
                  height: 52.w,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        colorScheme.primary.withValues(alpha: 0.12),
                        colorScheme.primary.withValues(alpha: 0.04)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(18.r),
                  ),
                  child: Icon(Icons.local_shipping_rounded,
                      size: 26.sp, color: colorScheme.primary),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ارسال مستقیم از',
                        style: TextStyle(
                          fontSize: 9.sp,
                          color: colorScheme.onSurfaceVariant
                              .withValues(alpha: 0.5),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        group.shopName,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'BonyadeKoodak',
                          color: colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
              height: 1,
              thickness: 0.5,
              indent: 20,
              endIndent: 20,
              color: colorScheme.outlineVariant),
          _buildActionSection(
            context: context,
            icon: Icons.location_on_rounded,
            title: 'مقصد تحویل سفارش',
            content: selectedAddress.id != null
                ? selectedAddress.fullAddress ?? ''
                : 'آدرسی انتخاب نشده است',
            onTap: () => CheckoutAddressSelectionSheet.show(
              context: context,
              bloc: bloc,
              state: state,
              repairmanId: group.repairmanId,
              allRepairmanIds: allRepairmanIds,
            ),
            actionText: 'تغییر آدرس',
            colorScheme: colorScheme,
            iconColor: StatusColors.of(context).warning,
          ),
          Divider(
              height: 1,
              thickness: 0.5,
              indent: 20,
              endIndent: 20,
              color: colorScheme.outlineVariant),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'اقلام این مرسوله',
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: colorScheme.onSurface,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'BonyadeKoodak',
                        ),
                      ),
                      Text(
                        '${group.items.length.toPersianDigit} کالا',
                        style: TextStyle(
                            fontSize: 11.sp,
                            color: colorScheme.primary,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 18.h),
                SizedBox(
                  height: 180.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    physics: const BouncingScrollPhysics(),
                    itemCount: group.items.length,
                    separatorBuilder: (context, index) =>
                        SizedBox(width: 14.w),
                    itemBuilder: (context, index) {
                      final item = group.items[index];
                      return GestureDetector(
                        onTap: () {
                          if (item.productId.isNotEmpty) {
                            context.pushNamed(
                              'product_detail',
                              pathParameters: {'productId': item.productId},
                            );
                          }
                        },
                        child: SizedBox(
                          width: 110.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    width: 110.w,
                                    height: 110.w,
                                    decoration: BoxDecoration(
                                      color: colorScheme.surface,
                                      borderRadius: BorderRadius.circular(20.r),
                                      border: Border.all(
                                          color: colorScheme.outline
                                              .withValues(alpha: 0.1)),
                                      boxShadow: [
                                        BoxShadow(
                                            color: colorScheme.onSurface
                                                .withValues(alpha: 0.02),
                                            blurRadius: 10,
                                            offset: const Offset(0, 4))
                                      ],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20.r),
                                      child: item.imageUrl.isNotEmpty
                                          ? CachedNetworkImage(
                                              imageUrl: item.imageUrl,
                                              fit: BoxFit.cover,
                                            )
                                          : Icon(Icons.shopping_bag_outlined,
                                              color: colorScheme.outline,
                                              size: 36.sp),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 8.h,
                                    right: 8.w,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8.w, vertical: 4.h),
                                      decoration: BoxDecoration(
                                        color: colorScheme.onSurface
                                            .withValues(alpha: 0.85),
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        border: Border.all(
                                            color: colorScheme.surface,
                                            width: 1.5),
                                      ),
                                      child: Text(
                                        '${item.quantity.toPersianDigit}×',
                                        style: TextStyle(
                                            color: colorScheme.surface,
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                item.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w900,
                                  color: colorScheme.onSurface,
                                  fontFamily: 'BonyadeKoodak',
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                '${PersianFormatter.price(item.price)} تومان',
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.bold,
                                  color: colorScheme.primary,
                                  fontFamily: 'BonyadeKoodak',
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Divider(
              height: 1,
              thickness: 0.5,
              indent: 20,
              endIndent: 20,
              color: colorScheme.outlineVariant),
          _buildActionSection(
            context: context,
            icon: Icons.payments_rounded,
            title: 'شیوه پرداخت هزینه',
            content: selectedMethodId != null
                ? (availableMethods
                        .firstWhere((m) => m.id == selectedMethodId,
                            orElse: () => availableMethods.first)
                        .label ??
                    'انتخاب شده')
                : 'انتخاب شیوه پرداخت',
            onTap: () => CheckoutPaymentSelectionSheet.show(
              context: context,
              bloc: bloc,
              state: state,
              repairmanId: group.repairmanId,
              availableMethods: availableMethods,
            ),
            actionText: 'تغییر',
            colorScheme: colorScheme,
            iconColor: StatusColors.of(context).success,
            contentColor: selectedMethodId == null ? colorScheme.error : null,
          ),
          Divider(
              height: 1,
              thickness: 0.5,
              indent: 20,
              endIndent: 20,
              color: colorScheme.outlineVariant),
          _buildActionSection(
            context: context,
            icon: Icons.confirmation_num_rounded,
            title: 'کد تخفیف',
            content: appliedDiscountData != null
                ? 'کد با موفقیت اعمال شد'
                : 'کد تخفیف دارید؟',
            onTap: () {
              final controller = discountControllers[group.repairmanId] ??
                  TextEditingController();
              CheckoutDiscountInputSheet.show(
                context: context,
                bloc: bloc,
                repairmanId: group.repairmanId,
                state: state,
                controller: controller,
              );
            },
            actionText: appliedDiscountData != null ? 'تغییر' : 'افزودن',
            colorScheme: colorScheme,
            iconColor: DashboardColors.of(context).adminIndigo,
          ),
          Container(
            padding: EdgeInsets.all(20.r),
            decoration: BoxDecoration(
              color: colorScheme.onSurface.withValues(alpha: 0.02),
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(28.r)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'مبلغ نهایی این مرسوله',
                        style: TextStyle(
                            fontSize: 10.sp,
                            color: colorScheme.onSurfaceVariant
                                .withValues(alpha: 0.6),
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${PersianFormatter.price(group.groupTotalPrice)} تومان',
                        style: TextStyle(
                            fontSize: 19.sp,
                            fontWeight: FontWeight.w900,
                            color: colorScheme.primary,
                            fontFamily: 'BonyadeKoodak'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 140.w,
                  child: ElevatedButton(
                    onPressed: state.isSubmitting
                        ? null
                        : () => bloc.add(
                            SubmitShopOrderEvent(group.repairmanId)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorScheme.primary,
                      foregroundColor: colorScheme.onPrimary,
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r)),
                      elevation: 4,
                      shadowColor: colorScheme.primary.withValues(alpha: 0.4),
                    ),
                    child: state.isSubmitting
                        ? SizedBox(
                            width: 20.r,
                            height: 20.r,
                            child: CircularProgressIndicator(
                                color: colorScheme.onPrimary, strokeWidth: 2.5),
                          )
                        : Text(
                            'ثبت نهایی',
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w900,
                                fontFamily: 'BonyadeKoodak'),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionSection({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String content,
    required VoidCallback onTap,
    required String actionText,
    required ColorScheme colorScheme,
    Color? iconColor,
    Color? contentColor,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                color: (iconColor ?? colorScheme.primary)
                    .withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(icon,
                  size: 20.sp, color: iconColor ?? colorScheme.primary),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: TextStyle(
                          fontSize: 9.sp,
                          color: colorScheme.onSurfaceVariant
                              .withValues(alpha: 0.5),
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 4.h),
                  Text(
                    content,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: contentColor ?? colorScheme.onSurface,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'BonyadeKoodak',
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: colorScheme.primary.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                children: [
                  Text(
                    actionText,
                    style: TextStyle(
                        fontSize: 10.sp,
                        color: colorScheme.primary,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'BonyadeKoodak'),
                  ),
                  SizedBox(width: 4.w),
                  Icon(Icons.arrow_forward_ios_rounded,
                      size: 10.sp, color: colorScheme.primary),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
