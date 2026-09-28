import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturant_app/core/widgets/empty_state_widget.dart';
import 'package:resturant_app/core/widgets/error_state_widget.dart';
import 'package:resturant_app/core/widgets/management_card_shimmer.dart';
import '../../../../../../core/bloc/app/app_bloc.dart';
import '../../../../../../core/bloc/error/error_bloc.dart';
import '../../../../../../core/services/locator.dart';
import '../../../../../../core/widgets/cstm_snakbar.dart';
import '../../../../../../core/themes/theme_main.dart';
import '../base/base_manage_payment_types_stateful_widget_state.dart';
import '../bloc/manage_payment_types_bloc.dart';

class ScreenManagePaymentTypes extends StatefulWidget {
  const ScreenManagePaymentTypes({super.key});

  @override
  State<ScreenManagePaymentTypes> createState() => _ScreenManagePaymentTypesState();
}

class _ScreenManagePaymentTypesState extends BaseManagePaymentTypesStatefulWidgetState<ScreenManagePaymentTypes, ManagePaymentTypesBloc> {
  _ScreenManagePaymentTypesState() : super(locator<ManagePaymentTypesBloc>());

  @override
  void initState() {
    super.initState();
    bloc.add(const FetchPaymentTypesEvent());
  }

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      // appBar: AppBar(
      //   title: Text(
      //     'مدیریت روش‌های پرداخت',
      //     style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
      //   ),
      //   centerTitle: true,
      //   elevation: 0,
      //   backgroundColor: Colors.white,
      //   foregroundColor: colorScheme.onSurface,
      // ),
      body: BlocConsumer<ManagePaymentTypesBloc, ManagePaymentTypesState>(
        listener: (context, state) {
          if (state.successMessage != null) {
            CstmSnackBar.showSuccess(context, state.successMessage!);
            bloc.add(const FetchPaymentTypesEvent());
          }
          if (state.errorMessage != null) {
             CstmSnackBar.showError(context, state.errorMessage!);
          }
        },
        builder: (context, state) {
          if (state is ManagePaymentTypesInitial || state is ManagePaymentTypesLoading) {
            return ListView.builder(
              padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 100.h),
              itemCount: 5,
              itemBuilder: (context, index) => const ManagementCardShimmer(height: 100),
            );
          }

          if (state is ManagePaymentTypesError && state is! PaymentTypesLoaded) {
            return ErrorStateWidget(
              message: state.message,
              onRetry: () => bloc.add(const FetchPaymentTypesEvent()),
            );
          }

          if (state is PaymentTypesLoaded) {
            final paymentTypes = state.paymentTypes;
            if (paymentTypes.isEmpty) {
              return const EmptyStateWidget(
                title: 'هیچ روش پرداختی ثبت نشده است',
                description: 'لیست روش‌های پرداخت در حال حاضر خالی است.',
                icon: Icons.payment_outlined,
              );
            }

            return ListView.builder(
                padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 20.h),
                itemCount: paymentTypes.length,
                itemBuilder: (context, index) {
                  final item = paymentTypes[index];
                  final isProcessing = state is PaymentTypesLoaded && state.processingId == item.id;

                  return Container(
                    margin: EdgeInsets.only(bottom: 16.h),
                    padding: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.03),
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
                                  color: colorScheme.onSurface,
                                ),
                              ),
                              if (item.title != null && item.label != null) ...[
                                SizedBox(height: 4.h),
                                Text(
                                  item.title!,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: colorScheme.onSurface.withValues(alpha: 0.5),
                                  ),
                                ),
                              ],
                              SizedBox(height: 8.h),
                              _buildStatusBadge(item.isActive),
                            ],
                          ),
                        ),
                        isProcessing
                            ? Padding(
                                padding: EdgeInsets.symmetric(horizontal: 14.w),
                                child: SizedBox(
                                  width: 20.r,
                                  height: 20.r,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: colorScheme.primary,
                                  ),
                                ),
                              )
                            : Switch(
                                value: item.isActive,
                                onChanged: isProcessing ? null : (value) {
                                  if (item.id != null) {
                                    bloc.add(ChangePaymentTypeStatusEvent(item.id!));
                                  }
                                },
                                activeColor: isProcessing ? colorScheme.primary.withValues(alpha: 0.5) : colorScheme.primary,
                                activeTrackColor: colorScheme.primary.withValues(alpha: 0.2),
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

  Widget _buildStatusBadge(bool isActive) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: isActive ? StatusColors.of(context).success.withValues(alpha: 0.1) : Theme.of(context).colorScheme.outline.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Text(
        isActive ? 'فعال' : 'غیرفعال',
        style: TextStyle(
          color: isActive ? StatusColors.of(context).success : Theme.of(context).colorScheme.outline,
          fontSize: 10.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
