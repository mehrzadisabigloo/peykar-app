import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../core/themes/theme_main.dart';
import '../../../../core/services/locator.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/widgets/cstm_snakbar.dart';
import '../../../../core/widgets/error_state_widget.dart';
import '../../../../core/widgets/list_shimmer.dart';
import '../../../../core/widgets/app_bottom_sheet.dart';
import '../../../panel_admin_features/feature_manage_addresses/data/model/address_model.dart';
import '../../../panel_admin_features/feature_manage_payment_types/data/model/payment_type_model.dart';
import '../../domain/entity/shop_basket_entity.dart';
import '../bloc/checkout_bloc.dart';
import '../bloc/checkout_event.dart';
import '../bloc/checkout_state.dart';

class PersianFormatter {
  PersianFormatter._();
  static String price(num value) {
    final formatter = NumberFormat('#,###');
    return formatter.format(value).toPersianDigit;
  }
}

class ScreenCheckout extends StatefulWidget {
  final ShopBasketEntity basket;
  const ScreenCheckout({super.key, required this.basket});

  @override
  State<ScreenCheckout> createState() => _ScreenCheckoutState();
}

class _ScreenCheckoutState extends State<ScreenCheckout> {
  late final CheckoutBloc _bloc;
  final Map<String, TextEditingController> _discountControllers = {};

  @override
  void initState() {
    super.initState();
    _bloc = locator<CheckoutBloc>();
    for (var group in widget.basket.shopGroups) {
      _discountControllers[group.repairmanId] = TextEditingController();
    }
    _bloc.add(FetchCheckoutInitialDataEvent(
      widget.basket.shopGroups.map((g) => g.repairmanId).toList(),
    ));
  }

  @override
  void dispose() {
    for (var controller in _discountControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surfaceContainer,
      body: BlocProvider.value(
        value: _bloc,
        child: BlocConsumer<CheckoutBloc, CheckoutState>(
          listener: (context, state) {
            if (state is CheckoutLoaded) {
              if (state.successMessage != null) {
                CstmSnackBar.showSuccess(context, state.successMessage!);
                if (state.successMessage!.contains("سفارش")) {
                  context.go('/orders');
                }
              }
              if (state.errorMessage != null) {
                CstmSnackBar.showError(context, state.errorMessage!);
              }
            }
          },
          builder: (context, state) {
            if (state is CheckoutLoading) {
              return ListShimmer(height: 120);
            }
            if (state is CheckoutError) {
              return ErrorStateWidget(
                message: state.message,
                onRetry: () => _bloc.add(FetchCheckoutInitialDataEvent(
                  widget.basket.shopGroups.map((g) => g.repairmanId).toList(),
                )),
              );
            }
            if (state is CheckoutLoaded) {
              return Column(
                children: [
                  _buildTopProgressIndicator(colorScheme),
                  Expanded(
                    child: CustomScrollView(
                      physics: const BouncingScrollPhysics(),
                      slivers: [
                        SliverToBoxAdapter(
                          child: _buildOrderSummary(widget.basket, colorScheme),
                        ),
                        SliverPadding(
                          padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 40.h),
                          sliver: SliverList(
                            delegate: SliverChildListDelegate([
                              ...widget.basket.shopGroups.map(
                                (group) => _buildPremiumShopGroup(group, state, colorScheme),
                              ),
                              SizedBox(height: 40.h),
                            ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  void _showAddressSelectionSheet(CheckoutLoaded state, ColorScheme colorScheme, String repairmanId) {
    AppBottomSheet.show(
      context,
      title: 'انتخاب آدرس تحویل',
      icon: Icons.location_on_rounded,
      isScrollable: false,
      actions: [
        ElevatedButton.icon(
          onPressed: () async {
            Navigator.pop(context);
            final result = await context.pushNamed('add_address');
            if (result == true) {
              _bloc.add(FetchCheckoutInitialDataEvent(
                widget.basket.shopGroups.map((g) => g.repairmanId).toList(),
              ));
            }
          },
          icon: const Icon(Icons.add_location_alt_rounded, size: 20),
          label: const Text('افزودن آدرس جدید', style: TextStyle(fontFamily: 'BonyadeKoodak', fontWeight: FontWeight.bold)),
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 54.h),
            backgroundColor: colorScheme.primary,
            foregroundColor: colorScheme.onPrimary,
            elevation: 4,
            shadowColor: colorScheme.primary.withValues(alpha: 0.3),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
          ),
        ),
      ],
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 0.5.sh),
        child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const BouncingScrollPhysics(),
          itemCount: state.addresses.length,
          itemBuilder: (context, index) {
            final address = state.addresses[index];
            final isSelected = state.selectedAddressIds[repairmanId] == address.id;
            return GestureDetector(
              onTap: () {
                _bloc.add(SelectAddressEvent(repairmanId, address.id!));
                Navigator.pop(context);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                margin: EdgeInsets.only(bottom: 12.h),
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  color: isSelected ? colorScheme.primary.withValues(alpha: 0.04) : colorScheme.surface,
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(
                    color: isSelected ? colorScheme.primary : colorScheme.outline.withValues(alpha: 0.1),
                    width: isSelected ? 1.5 : 1.0,
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      isSelected ? Icons.check_circle_rounded : Icons.circle_outlined,
                      color: isSelected ? colorScheme.primary : colorScheme.outlineVariant,
                      size: 22.sp,
                    ),
                    SizedBox(width: 14.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (address.ostan != null || address.shahrestan != null) ...[
                            Text(
                              '${address.ostan?.name ?? ''}${address.ostan != null && address.shahrestan != null ? '، ' : ''}${address.shahrestan?.name ?? ''}',
                              style: TextStyle(
                                fontSize: 11.sp,
                                color: isSelected ? colorScheme.primary : colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
                                fontWeight: FontWeight.bold,
                                fontFamily: 'BonyadeKoodak',
                              ),
                            ),
                            SizedBox(height: 4.h),
                          ],
                          Text(
                            address.fullAddress ?? '',
                            style: TextStyle(
                              fontFamily: 'BonyadeKoodak',
                              fontWeight: isSelected ? FontWeight.w900 : FontWeight.w600,
                              fontSize: 13.sp,
                              color: colorScheme.onSurface,
                              height: 1.4,
                            ),
                          ),
                          if (address.postalCode != null && address.postalCode!.isNotEmpty) ...[
                            SizedBox(height: 8.h),
                            Row(
                              children: [
                                Icon(Icons.post_add_rounded, size: 14.sp, color: colorScheme.outlineVariant),
                                SizedBox(width: 4.w),
                                Text(
                                  'کد پستی: ${address.postalCode!.toPersianDigit}',
                                  style: TextStyle(fontSize: 10.sp, color: colorScheme.outlineVariant, fontFamily: 'BonyadeKoodak', fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildPremiumShopGroup(BasketShopGroup group, CheckoutLoaded state, ColorScheme colorScheme) {
    final availableMethods = state.shopPaymentMethods[group.repairmanId] ?? [];
    final selectedMethodId = state.selectedPaymentMethods[group.repairmanId];
    final selectedAddressId = state.selectedAddressIds[group.repairmanId];
    final selectedAddress = state.addresses.firstWhere(
      (a) => a.id == selectedAddressId,
      orElse: () => state.addresses.isNotEmpty ? state.addresses.first : const AddressModel(),
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
          // 1. Shipment Header
          Padding(
            padding: EdgeInsets.all(20.r),
            child: Row(
              children: [
                Container(
                  width: 52.w,
                  height: 52.w,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [colorScheme.primary.withValues(alpha: 0.12), colorScheme.primary.withValues(alpha: 0.04)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(18.r),
                  ),
                  child: Icon(Icons.local_shipping_rounded, size: 26.sp, color: colorScheme.primary),
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
                          color: colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
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
                // Container(
                //   padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                //   decoration: BoxDecoration(
                //     color: Colors.blue.withValues(alpha: 0.08),
                //     borderRadius: BorderRadius.circular(10.r),
                //   ),
                //   child: Row(
                //     children: [
                //       Icon(Icons.verified_rounded, size: 14.sp, color: Colors.blue.shade600),
                //       SizedBox(width: 4.w),
                //       Text(
                //         'تایید شده',
                //         style: TextStyle(fontSize: 10.sp, color: Colors.blue.shade700, fontWeight: FontWeight.w900),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),

          Divider(height: 1, thickness: 0.5, indent: 20, endIndent: 20, color: colorScheme.outlineVariant),

          // 2. Interactive Address
          _buildActionSection(
            icon: Icons.location_on_rounded,
            title: 'مقصد تحویل سفارش',
            content: selectedAddress.id != null
                ? selectedAddress.fullAddress ?? ''
                : 'آدرسی انتخاب نشده است',
            onTap: () => _showAddressSelectionSheet(state, colorScheme, group.repairmanId),
            actionText: 'تغییر آدرس',
            colorScheme: colorScheme,
            iconColor: StatusColors.of(context).warning,
          ),

          Divider(height: 1, thickness: 0.5, indent: 20, endIndent: 20, color: colorScheme.outlineVariant),

          // 3. Products Scroll
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
                        style: TextStyle(fontSize: 11.sp, color: colorScheme.primary, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 18.h),
                SizedBox(
                  height: 180.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 0.h),
                    physics: const BouncingScrollPhysics(),
                    itemCount: group.items.length,
                    separatorBuilder: (context, index) => SizedBox(width: 14.w),
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
                                      border: Border.all(color: colorScheme.outline.withValues(alpha: 0.1)),
                                      boxShadow: [
                                        BoxShadow(color: colorScheme.onSurface.withValues(alpha: 0.02), blurRadius: 10, offset: const Offset(0, 4))
                                      ],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20.r),
                                      child: item.imageUrl.isNotEmpty
                                          ? CachedNetworkImage(
                                              imageUrl: item.imageUrl,
                                              fit: BoxFit.cover,
                                            )
                                          : Icon(Icons.shopping_bag_outlined, color: colorScheme.outline, size: 36.sp),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 8.h,
                                    right: 8.w,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                                      decoration: BoxDecoration(
                                        color: colorScheme.onSurface.withValues(alpha: 0.85),
                                        borderRadius: BorderRadius.circular(10.r),
                                        border: Border.all(color: colorScheme.surface, width: 1.5),
                                      ),
                                      child: Text(
                                        '${item.quantity.toPersianDigit}×',
                                        style: TextStyle(color: colorScheme.surface, fontSize: 11.sp, fontWeight: FontWeight.w900),
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

          Divider(height: 1, thickness: 0.5, indent: 20, endIndent: 20, color: colorScheme.outlineVariant),

          // 4. Payment Choice
          _buildActionSection(
            icon: Icons.payments_rounded,
            title: 'شیوه پرداخت هزینه',
            content: selectedMethodId != null 
                ? (availableMethods.firstWhere((m) => m.id == selectedMethodId, orElse: () => availableMethods.first).label ?? 'انتخاب شده')
                : 'انتخاب شیوه پرداخت',
            onTap: () => _showPaymentSelectionSheet(state, colorScheme, group.repairmanId, availableMethods),
            actionText: 'تغییر',
            colorScheme: colorScheme,
            iconColor: StatusColors.of(context).success,
            contentColor: selectedMethodId == null ? colorScheme.error : null,
          ),

          Divider(height: 1, thickness: 0.5, indent: 20, endIndent: 20, color: colorScheme.outlineVariant),

          // 5. Discount
          _buildActionSection(
            icon: Icons.confirmation_num_rounded,
            title: 'کد تخفیف',
            content: appliedDiscountData != null ? 'کد با موفقیت اعمال شد' : 'کد تخفیف دارید؟',
            onTap: () => _showDiscountInputSheet(group.repairmanId, state, colorScheme),
            actionText: appliedDiscountData != null ? 'تغییر' : 'افزودن',
            colorScheme: colorScheme,
            iconColor: DashboardColors.of(context).adminIndigo,
          ),

          // 6. Summary Footer
          Container(
            padding: EdgeInsets.all(20.r),
            decoration: BoxDecoration(
              color: colorScheme.onSurface.withValues(alpha: 0.02),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(28.r)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'مبلغ نهایی این مرسوله',
                        style: TextStyle(fontSize: 10.sp, color: colorScheme.onSurfaceVariant.withValues(alpha: 0.6), fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${PersianFormatter.price(group.groupTotalPrice)} تومان',
                        style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w900, color: colorScheme.primary, fontFamily: 'BonyadeKoodak'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 140.w,
                  child: ElevatedButton(
                    onPressed: state.isSubmitting ? null : () => _bloc.add(SubmitShopOrderEvent(group.repairmanId)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorScheme.primary,
                      foregroundColor: colorScheme.onPrimary,
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                      elevation: 4,
                      shadowColor: colorScheme.primary.withValues(alpha: 0.4),
                    ),
                    child: state.isSubmitting
                        ? SizedBox(width: 20.r, height: 20.r, child: CircularProgressIndicator(color: colorScheme.onPrimary, strokeWidth: 2.5))
                        : Text('ثبت نهایی', style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w900, fontFamily: 'BonyadeKoodak')),
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
                color: (iconColor ?? colorScheme.primary).withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(icon, size: 20.sp, color: iconColor ?? colorScheme.primary),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontSize: 9.sp, color: colorScheme.onSurfaceVariant.withValues(alpha: 0.5), fontWeight: FontWeight.bold)),
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
                    style: TextStyle(fontSize: 10.sp, color: colorScheme.primary, fontWeight: FontWeight.w900, fontFamily: 'BonyadeKoodak'),
                  ),
                  SizedBox(width: 4.w),
                  Icon(Icons.arrow_forward_ios_rounded, size: 10.sp, color: colorScheme.primary),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDiscountInputSheet(String repairmanId, CheckoutLoaded state, ColorScheme colorScheme) {
    final controller = _discountControllers[repairmanId]!;
    final appliedDiscountData = state.shopDiscountDatas[repairmanId];

    AppBottomSheet.show(
      context,
      title: 'وارد کردن کد تخفیف',
      icon: Icons.confirmation_num_rounded,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: colorScheme.outline.withValues(alpha: 0.1)),
            ),
            child: TextField(
              controller: controller,
              autofocus: true,
              style: TextStyle(fontFamily: 'BonyadeKoodak', fontWeight: FontWeight.bold, fontSize: 15.sp),
              decoration: InputDecoration(
                hintText: 'کد خود را اینجا وارد کنید',
                hintStyle: TextStyle(fontSize: 13.sp, color: colorScheme.outline, fontFamily: 'BonyadeKoodak'),
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(height: 24.h),
          ElevatedButton(
            onPressed: state.isSubmitting
                ? null
                : () {
                    _bloc.add(ApplyDiscountEvent(repairmanId, controller.text.trim()));
                    Navigator.pop(context);
                  },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 54.h),
              backgroundColor: appliedDiscountData != null ? StatusColors.of(context).success : colorScheme.primary,
              foregroundColor: colorScheme.surface,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
            ),
            child: state.isSubmitting
                ? SizedBox(width: 24.r, height: 24.r, child: CircularProgressIndicator(color: colorScheme.surface, strokeWidth: 3))
                : Text(appliedDiscountData != null ? 'تغییر کد' : 'بررسی و اعمال',
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w900, fontFamily: 'BonyadeKoodak')),
          ),
          SizedBox(height: 32.h),
        ],
      ),
    );
  }

  void _showPaymentSelectionSheet(CheckoutLoaded state, ColorScheme colorScheme, String repairmanId, List availableMethods) {
    AppBottomSheet.show(
      context,
      title: 'انتخاب شیوه پرداخت',
      icon: Icons.payments_outlined,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (availableMethods.isEmpty)
             Padding(
               padding: EdgeInsets.symmetric(vertical: 40.h),
               child: Text('هیچ روش پرداختی یافت نشد', style: TextStyle(color: colorScheme.error, fontFamily: 'BonyadeKoodak')),
             )
          else
            ...availableMethods.map((method) {
              final isSelected = state.selectedPaymentMethods[repairmanId] == method.id;
              return Container(
                margin: EdgeInsets.only(bottom: 8.h),
                child: Material(
                  color: isSelected ? colorScheme.primary.withValues(alpha: 0.05) : Colors.transparent,
                  borderRadius: BorderRadius.circular(16.r),
                  clipBehavior: Clip.antiAlias,
                  child: ListTile(
                    onTap: () {
                      _bloc.add(SelectShopPaymentMethodEvent(repairmanId, method.id!));
                      Navigator.pop(context);
                    },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                    leading: Icon(
                      method.type == 'wallet' ? Icons.account_balance_wallet_rounded : Icons.credit_card_rounded,
                      color: isSelected ? colorScheme.primary : colorScheme.onSurfaceVariant,
                    ),
                    title: Text(method.label ?? method.title ?? '',
                        style: TextStyle(
                          fontFamily: 'BonyadeKoodak',
                          fontWeight: isSelected ? FontWeight.w900 : FontWeight.w600,
                          fontSize: 14.sp,
                          color: isSelected ? colorScheme.primary : colorScheme.onSurface,
                        )),
                    trailing: Icon(
                      isSelected ? Icons.check_circle_rounded : Icons.circle_outlined,
                      color: isSelected ? colorScheme.primary : colorScheme.outlineVariant,
                    ),
                  ),
                ),
              );
            }),
          SizedBox(height: 32.h),
        ],
      ),
    );
  }

  Widget _buildTopProgressIndicator(ColorScheme colorScheme) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 30.w),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: colorScheme.onSurface.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          _buildStep(1, 'سبد خرید', true, colorScheme),
          _buildDivider(true, colorScheme),
          _buildStep(2, 'تایید آدرس', true, colorScheme),
          _buildDivider(false, colorScheme),
          _buildStep(3, 'پرداخت', false, colorScheme),
        ],
      ),
    );
  }

  Widget _buildStep(int step, String title, bool isCompleted, ColorScheme colorScheme) {
    final isActive = step == 2;
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 24.w,
          height: 24.w,
          decoration: BoxDecoration(
            color: isCompleted && !isActive ? colorScheme.primary : colorScheme.surface,
            shape: BoxShape.circle,
            border: Border.all(
              color: isCompleted || isActive ? colorScheme.primary : colorScheme.outlineVariant.withValues(alpha: 0.5),
              width: 1.5,
            ),
          ),
          child: Center(
            child: isCompleted && !isActive
                ? Icon(Icons.check, size: 14.sp, color: colorScheme.surface)
                : Text(
                    step.toPersianDigit,
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w900,
                      color: isActive ? colorScheme.primary : colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
                    ),
                  ),
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          title,
          style: TextStyle(
            fontSize: 9.sp,
            fontFamily: 'BonyadeKoodak',
            fontWeight: isActive || isCompleted ? FontWeight.w900 : FontWeight.bold,
            color: isActive || isCompleted ? colorScheme.onSurface : colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
          ),
        ),
      ],
    );
  }

  Widget _buildDivider(bool isCompleted, ColorScheme colorScheme) {
    return Expanded(
      child: Container(
        height: 1.5,
        margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: isCompleted ? colorScheme.primary.withValues(alpha: 0.5) : colorScheme.outlineVariant.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(1),
        ),
      ),
    );
  }

  Widget _buildOrderSummary(ShopBasketEntity basket, ColorScheme colorScheme) {
    return const SizedBox.shrink();
  }

  Widget _buildPriceRow(String label, String value, ColorScheme colorScheme, {Color? valueColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(color: colorScheme.onSurfaceVariant.withValues(alpha: 0.8), fontSize: 13.sp, fontFamily: 'BonyadeKoodak', fontWeight: FontWeight.bold)),
        Text(value,
            style: TextStyle(
              color: valueColor ?? colorScheme.onSurface,
              fontWeight: FontWeight.w900,
              fontSize: 14.sp,
              fontFamily: 'BonyadeKoodak',
            )),
      ],
    );
  }
}
