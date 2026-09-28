import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:resturant_app/core/widgets/empty_state_widget.dart';
import 'package:resturant_app/core/widgets/management_card_shimmer.dart';
import 'package:resturant_app/core/widgets/stylish_popup.dart';
import '../../../../../core/bloc/app/app_bloc.dart';
import '../../../../../core/bloc/error/error_bloc.dart';
import '../../../../../core/services/locator.dart';
import '../../../../../../core/widgets/cstm_snakbar.dart';
import '../../../../../core/widgets/error_state_widget.dart';
import '../../../../../../core/themes/theme_main.dart';
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
      backgroundColor: colorScheme.surfaceContainer,
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final result = await context.pushNamed('add_discount');
          if (result == true) {
            bloc.add(FetchDiscountsEvent());
          }
        },
        backgroundColor: colorScheme.primary,
        icon: Icon(Icons.local_offer_rounded, color: colorScheme.surface),
        label: Text(
          'ایجاد کد جدید',
          style: TextStyle(
            color: colorScheme.surface,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocConsumer<ManageDiscountsBloc, ManageDiscountsState>(
        listener: (context, state) {
          if (state is ManageDiscountsLoaded) {
            if (state.errorMessage != null) {
              CstmSnackBar.showError(context, state.errorMessage!);
            }
            if (state.successMessage != null) {
              CstmSnackBar.showSuccess(context, state.successMessage!);
            }
          }
        },
        builder: (context, state) {
          if (state is ManageDiscountsInitial || state is ManageDiscountsLoading) {
            return ListView.builder(
              padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 100.h),
              itemCount: 5,
              itemBuilder: (context, index) => const ManagementCardShimmer(height: 160),
            );
          }
          if (state is ManageDiscountsError) {
            return ErrorStateWidget(
              message: state.message,
              onRetry: () => bloc.add(FetchDiscountsEvent()),
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
            return ListView.builder(
                padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 100.h),
                itemCount: state.discounts.length,
                itemBuilder: (context, index) {
                  final discount = state.discounts[index];
                  final bool isProcessing = state.processingId == discount.id;
                  final bool isDeleting = state.isDeleting;

                  return Container(
                    margin: EdgeInsets.only(bottom: 16.h),
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: colorScheme.surface,
                      borderRadius: BorderRadius.circular(24.r),
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
                            if (isProcessing && !isDeleting)
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: SizedBox(
                                  width: 20.r,
                                  height: 20.r,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: colorScheme.primary,
                                  ),
                                ),
                              )
                            else
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
                        Divider(color: colorScheme.outlineVariant),
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
                            TextButton.icon(
                              onPressed: isProcessing ? null : () => _showDeleteDialog(context, discount.id!),
                              icon: (isProcessing && isDeleting)
                                  ? SizedBox(
                                      width: 16.sp,
                                      height: 16.sp,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: colorScheme.error,
                                      ),
                                    )
                                  : Icon(Icons.delete_outline_rounded, size: 18.sp),
                              label: Text(isProcessing && isDeleting ? 'حذف...' : 'حذف'),
                              style: TextButton.styleFrom(
                                foregroundColor: colorScheme.error,
                                disabledForegroundColor: colorScheme.error.withValues(alpha: 0.5),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
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
        Icon(icon, size: 14.sp, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.38)),
        SizedBox(width: 6.w),
        Text(
          text,
          style: TextStyle(
            fontSize: 11.sp,
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.54),
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
