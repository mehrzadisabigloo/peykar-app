import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:resturant_app/core/widgets/empty_state_widget.dart';
import 'package:resturant_app/core/widgets/list_shimmer.dart';
import 'package:resturant_app/core/widgets/stylish_popup.dart';
import '../../../../../core/bloc/app/app_bloc.dart';
import '../../../../../core/bloc/error/error_bloc.dart';
import '../../../../../core/services/locator.dart';
import '../base/base_manage_discounts_stateful_widget_state.dart';
import '../bloc/manage_discounts_bloc.dart';

class ScreenManageDiscounts extends StatefulWidget {
  const ScreenManageDiscounts({super.key});

  @override
  State<ScreenManageDiscounts> createState() => _ScreenManageDiscountsState();
}

class _ScreenManageDiscountsState extends BaseManageDiscountsStatefulWidgetState<ScreenManageDiscounts, ManageDiscountsBloc> {
  _ScreenManageDiscountsState() : super(locator<ManageDiscountsBloc>());

  @override
  void initState() {
    super.initState();
    bloc.add(FetchDiscountsEvent());
  }

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final result = await context.pushNamed('add_discount');
          if (result == true) {
            bloc.add(FetchDiscountsEvent());
          }
        },
        backgroundColor: colorScheme.primary,
        icon: const Icon(Icons.local_offer_rounded, color: Colors.white),
        label: Text(
          'ایجاد کد جدید',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocBuilder<ManageDiscountsBloc, ManageDiscountsState>(
        builder: (context, state) {
          if (state is ManageDiscountsLoading) {
            return const ListShimmer(height: 160);
          }
          if (state is ManageDiscountsError) {
            return EmptyStateWidget(
              title: 'خطا در بارگذاری',
              description: state.message,
              icon: Icons.error_outline_rounded,
            );
          }
          if (state is ManageDiscountsLoaded) {
            if (state.discounts.isEmpty) {
              return const EmptyStateWidget(
                title: 'کد تخفیفی یافت نشد',
                description: 'هنوز هیچ کد تخفیفی در سیستم ثبت نشده است.',
                icon: Icons.confirmation_number_outlined,
              );
            }
            return RefreshIndicator(
              onRefresh: () async => bloc.add(FetchDiscountsEvent()),
              child: ListView.builder(
                padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 100.h),
                itemCount: state.discounts.length,
                itemBuilder: (context, index) {
                  final discount = state.discounts[index];
                  final bool isProcessing = state.processingId == discount.id;

                  return Container(
                    margin: EdgeInsets.only(bottom: 16.h),
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.03),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10.r),
                              decoration: BoxDecoration(
                                color: colorScheme.primary.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Icon(Icons.local_offer_rounded, color: colorScheme.primary, size: 22.sp),
                            ),
                            SizedBox(width: 14.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    discount.discountCode ?? '---',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w900,
                                      color: colorScheme.onSurface,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                  Text(
                                    discount.discountType == 'percentage' 
                                        ? '${discount.discountPercentage}% تخفیف'
                                        : '${discount.discountAmount} تومان تخفیف',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: colorScheme.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Switch(
                              value: discount.isActive,
                              onChanged: isProcessing ? null : (val) {
                                bloc.add(ChangeDiscountStatusEvent(discount.id!));
                              },
                              activeColor: colorScheme.primary,
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        Divider(color: Colors.grey.withValues(alpha: 0.05)),
                        SizedBox(height: 12.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildInfoItem(Icons.event_note_rounded, 'انقضا: ${discount.discountCodeExpiresAt ?? '-'}'),
                            _buildInfoItem(Icons.loop_rounded, 'تعداد: ${discount.discountCodeUseNumber ?? '-'}'),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            if (isProcessing)
                              SizedBox(
                                width: 24.sp,
                                height: 24.sp,
                                child: CircularProgressIndicator(strokeWidth: 2, color: colorScheme.error),
                              )
                            else
                              TextButton.icon(
                                onPressed: () => _showDeleteDialog(context, discount.id!),
                                icon: Icon(Icons.delete_outline_rounded, size: 18.sp),
                                label: const Text('حذف'),
                                style: TextButton.styleFrom(foregroundColor: colorScheme.error),
                              ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 14.sp, color: Colors.black38),
        SizedBox(width: 6.w),
        Text(
          text,
          style: TextStyle(
            fontSize: 11.sp,
            color: Colors.black54,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  void _showDeleteDialog(BuildContext context, String id) {
    ConfirmationPopup.show(
      context,
      title: 'حذف کد تخفیف',
      description: 'آیا از حذف این کد تخفیف مطمئن هستید؟ این عمل غیرقابل بازگشت است.',
      confirmText: 'حذف',
      cancelText: 'انصراف',
      icon: Icons.delete_forever_rounded,
      onConfirm: () => bloc.add(DeleteDiscountEvent(id)),
    );
  }
}
