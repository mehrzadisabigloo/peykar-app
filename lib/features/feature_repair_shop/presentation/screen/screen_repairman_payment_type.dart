import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/bloc/app/app_bloc.dart';
import '../../../../core/bloc/error/error_bloc.dart';
import '../../../../core/services/locator.dart';
import '../../../../core/widgets/cstm_snakbar.dart';
import '../../../../core/widgets/empty_state_widget.dart';
import '../../../../core/widgets/error_state_widget.dart';
import '../../../../core/widgets/list_shimmer.dart';
import '../../../../core/themes/theme_main.dart';
import '../../../panel_admin_features/feature_manage_payment_types/data/model/payment_type_model.dart';
import '../../../../core/widgets/app_bottom_sheet.dart';
import '../../../../core/widgets/stylish_popup.dart';
import '../base/base_repair_shop_stateful_widget_state.dart';
import '../bloc/repairman_payment_type_bloc.dart';

class ScreenRepairmanPaymentType extends StatefulWidget {
  const ScreenRepairmanPaymentType({super.key});

  @override
  State<ScreenRepairmanPaymentType> createState() => _ScreenRepairmanPaymentTypeState();
}

class _ScreenRepairmanPaymentTypeState extends BaseRepairShopStatefulWidgetState<ScreenRepairmanPaymentType, RepairmanPaymentTypeBloc> {
  _ScreenRepairmanPaymentTypeState() : super(locator<RepairmanPaymentTypeBloc>());

  @override
  void initState() {
    super.initState();
    bloc.add(FetchMyPaymentTypesEvent());
  }

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surfaceContainer,
      body: BlocConsumer<RepairmanPaymentTypeBloc, RepairmanPaymentTypeState>(
        listener: (context, state) {
          if (state is RepairmanPaymentTypeLoaded) {
            if (state.successMessage != null) {
              CstmSnackBar.showSuccess(context, state.successMessage!);
            }
            if (state.errorMessage != null) {
              CstmSnackBar.showError(context, state.errorMessage!);
            }
          }
        },
        builder: (context, state) {
          if (state is RepairmanPaymentTypeLoading) {
            return ListShimmer(height: 100);
          }

          if (state is RepairmanPaymentTypeError) {
            return ErrorStateWidget(
              message: state.message,
              onRetry: () => bloc.add(FetchMyPaymentTypesEvent()),
            );
          }

          if (state is RepairmanPaymentTypeLoaded) {
            return Column(
              children: [
                Expanded(
                  child: state.myPaymentTypes.isEmpty
                      ? const EmptyStateWidget(
                          title: 'روشی ثبت نشده است',
                          description: 'شما هنوز هیچ روش پرداختی برای خود فعال نکرده‌اید.',
                          icon: Icons.payments_outlined,
                        )
                      : RefreshIndicator(
                          onRefresh: () async => bloc.add(FetchMyPaymentTypesEvent()),
                          child: ListView.builder(
                            padding: EdgeInsets.all(20.r),
                            itemCount: state.myPaymentTypes.length,
                            itemBuilder: (context, index) {
                              final item = state.myPaymentTypes[index];
                              return _buildPaymentTypeCard(context, item, colorScheme, state);
                            },
                          ),
                        ),
                ),
                _buildAddButton(context, state, colorScheme),
              ],
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildPaymentTypeCard(BuildContext context, PaymentTypeModel item, ColorScheme colorScheme, RepairmanPaymentTypeLoaded state) {
    final bool isDeleting = state.processingId == item.id;
    
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: colorScheme.onSurface.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: colorScheme.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(Icons.payments_outlined, color: colorScheme.primary, size: 24.sp),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.label ?? item.title ?? 'نامشخص',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'BonyadeKoodak',
                  ),
                ),
                if (item.title != null) ...[
                  SizedBox(height: 4.h),
                  Text(
                    item.title!,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: colorScheme.onSurface.withValues(alpha: 0.45),
                      fontFamily: 'BonyadeKoodak',
                    ),
                  ),
                ],
              ],
            ),
          ),
          isDeleting
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: SizedBox(
                    width: 20.r,
                    height: 20.r,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: colorScheme.error,
                    ),
                  ),
                )
              : IconButton(
                  onPressed: state.isActionLoading || state.processingId != null
                      ? null
                      : () {
                          if (item.id != null) {
                            _showDeleteConfirmation(context, item.id!);
                          }
                        },
                  icon: Icon(Icons.delete_outline_rounded, color: colorScheme.error),
                ),
        ],
      ),
    );
  }

  Widget _buildAddButton(BuildContext context, RepairmanPaymentTypeLoaded state, ColorScheme colorScheme) {
    return Padding(
      padding: EdgeInsets.all(20.r),
      child: ElevatedButton(
        onPressed: state.isActionLoading ? null : () => _showAddBottomSheet(context, state),
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.surface,
          minimumSize: Size(double.infinity, 56.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          elevation: 0,
        ),
        child: state.isActionLoading
            ? SizedBox(
                width: 24.r,
                height: 24.r,
                child: CircularProgressIndicator(color: colorScheme.surface, strokeWidth: 2),
              )
            : Text(
                'افزودن روش پرداخت جدید',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'BonyadeKoodak',
                  color: colorScheme.surface,
                ),
              ),
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context, int id) {
    final colorScheme = Theme.of(context).colorScheme;
    ConfirmationPopup.show(
      context,
      title: 'حذف روش پرداخت',
      description: 'آیا از حذف این روش پرداخت اطمینان دارید؟ این عمل غیرقابل بازگشت است.',
      confirmText: 'حذف',
      cancelText: 'انصراف',
      icon: Icons.delete_forever_rounded,
      iconColor: colorScheme.error,
      confirmColor: colorScheme.error,
      onConfirm: () {
        bloc.add(RemovePaymentTypeEvent(id));
      },
    );
  }

  void _showAddBottomSheet(BuildContext context, RepairmanPaymentTypeLoaded state) {
    final available = state.allActivePaymentTypes.where((a) => !state.myPaymentTypes.any((m) => m.id == a.id)).toList();
    final colorScheme = Theme.of(context).colorScheme;

    AppBottomSheet.show(
      context,
      title: 'انتخاب روش پرداخت',
      icon: Icons.add_card_rounded,
      child: available.isEmpty
          ? const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: Text(
                  'تمامی روش‌های موجود قبلاً اضافه شده‌اند.',
                  style: TextStyle(fontFamily: 'BonyadeKoodak'),
                ),
              ),
            )
          : ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: available.length,
              separatorBuilder: (context, index) => Divider(color: colorScheme.outlineVariant),
              itemBuilder: (context, index) {
                final item = available[index];
                return Material(
                  color: Colors.transparent,
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      item.label ?? item.title ?? '',
                      style: TextStyle(
                        fontFamily: 'BonyadeKoodak',
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                    subtitle: Text(
                      item.title ?? '',
                      style: TextStyle(
                        fontFamily: 'BonyadeKoodak',
                        fontSize: 12.sp,
                        color: colorScheme.onSurface.withValues(alpha: 0.45),
                      ),
                    ),
                    leading: Container(
                      padding: EdgeInsets.all(8.r),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Icon(Icons.payment, color: Theme.of(context).colorScheme.primary, size: 20.sp),
                    ),
                    onTap: () {
                      if (item.id != null) {
                        bloc.add(AddPaymentTypeEvent(item.id!));
                      }
                      Navigator.pop(context);
                    },
                  ),
                );
              },
            ),
    );
  }
}
