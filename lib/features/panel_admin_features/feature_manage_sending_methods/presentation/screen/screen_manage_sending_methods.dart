import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:chaharmahal_shop_front/core/widgets/empty_state_widget.dart';
import 'package:chaharmahal_shop_front/core/widgets/management_card_shimmer.dart';
import 'package:chaharmahal_shop_front/core/widgets/stylish_popup.dart';
import '../../../../../../core/bloc/app/app_bloc.dart';
import '../../../../../../core/bloc/error/error_bloc.dart';
import '../../../../../../core/services/locator.dart';
import '../../../../../../core/widgets/cstm_snakbar.dart';
import '../../../../../core/widgets/error_state_widget.dart';
import '../base/base_manage_sending_methods_stateful_widget_state.dart';
import '../bloc/manage_sending_methods_bloc.dart';

class ScreenManageSendingMethods extends StatefulWidget {
  const ScreenManageSendingMethods({super.key});

  @override
  State<ScreenManageSendingMethods> createState() => _ScreenManageSendingMethodsState();
}

class _ScreenManageSendingMethodsState extends BaseManageSendingMethodsStatefulWidgetState<ScreenManageSendingMethods, ManageSendingMethodsBloc> {
  _ScreenManageSendingMethodsState() : super(locator<ManageSendingMethodsBloc>());

  @override
  void initState() {
    super.initState();
    bloc.add(FetchSendingMethodsEvent());
  }

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final result = await context.pushNamed('add_sending_method');
          if (result == true) {
            bloc.add(FetchSendingMethodsEvent());
          }
        },
        backgroundColor: colorScheme.primary,
        icon: Icon(Icons.add_road_rounded, color: colorScheme.surface),
        label: Text(
          'ایجاد روش جدید',
          style: TextStyle(
            color: colorScheme.surface,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocConsumer<ManageSendingMethodsBloc, ManageSendingMethodsState>(
        listener: (context, state) {
          if (state is ManageSendingMethodsLoaded) {
            if (state.errorMessage != null) {
              CstmSnackBar.showError(context, state.errorMessage!);
            }
            if (state.successMessage != null) {
              CstmSnackBar.showSuccess(context, state.successMessage!);
            }
          }
        },
        builder: (context, state) {
          if (state is ManageSendingMethodsInitial || state is ManageSendingMethodsLoading) {
            return ListView.builder(
              padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 100.h),
              itemCount: 5,
              itemBuilder: (context, index) => const ManagementCardShimmer(height: 160),
            );
          }
          if (state is ManageSendingMethodsError) {
            return ErrorStateWidget(
              message: state.message,
              onRetry: () => bloc.add(FetchSendingMethodsEvent()),
            );
          }
          if (state is ManageSendingMethodsLoaded) {
            if (state.methods.isEmpty) {
              return const EmptyStateWidget(
                title: 'روشی یافت نشد',
                description: 'هنوز هیچ روش ارسالی در سیستم ثبت نشده است.',
                icon: Icons.local_shipping_outlined,
              );
            }
            return ListView.builder(
                padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 100.h),
                itemCount: state.methods.length,
                itemBuilder: (context, index) {
                  final method = state.methods[index];
                  final bool isProcessing = state.processingId == method.id;
                  final bool isDeleting = state.isDeleting;

                  return Container(
                    margin: EdgeInsets.only(bottom: 16.h),
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(24.r),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.03),
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
                              child: Icon(Icons.local_shipping_rounded, color: colorScheme.primary, size: 22.sp),
                            ),
                            SizedBox(width: 14.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    method.title ?? '---',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w900,
                                      color: colorScheme.onSurface,
                                    ),
                                  ),
                                  Text(
                                    '${method.price} تومان (پایه)',
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
                                value: method.isActive,
                                onChanged: (isProcessing)
                                    ? null
                                    : (val) {
                                        bloc.add(ChangeSendingMethodStatusEvent(method.id!));
                                      },
                                activeThumbColor: colorScheme.primary,
                                activeTrackColor: colorScheme.primary.withValues(alpha: 0.2),
                              ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        Divider(color: Theme.of(context).colorScheme.outlineVariant.withValues(alpha: 0.05)),
                        SizedBox(height: 12.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildInfoItem(Icons.location_on_rounded, '${method.locations?.length ?? 0} محدوده اختصاصی'),
                            _buildInfoItem(Icons.calendar_today_rounded, 'ایجاد: ${method.createdAt?.split('T')[0] ?? '-'}'),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton.icon(
                              onPressed: isProcessing ? null : () => _showDeleteDialog(context, method.id!),
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
                            SizedBox(width: 8.w),
                            ElevatedButton.icon(
                              onPressed: isProcessing
                                  ? null
                                  : () async {
                                      final result = await context.pushNamed('edit_sending_method', pathParameters: {'id': method.id!});
                                      if (result == true) {
                                        bloc.add(FetchSendingMethodsEvent());
                                      }
                                    },
                              icon: Icon(Icons.edit_outlined, size: 18.sp),
                              label: const Text('ویرایش'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: colorScheme.primary.withValues(alpha: isProcessing ? 0.05 : 0.1),
                                foregroundColor: colorScheme.primary,
                                disabledForegroundColor: colorScheme.primary.withValues(alpha: 0.5),
                                minimumSize: Size(80.w, 40.h),
                                elevation: 0,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
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
      title: 'حذف روش ارسال',
      description: 'آیا از حذف این روش ارسال مطمئن هستید؟ این عمل غیرقابل بازگشت است.',
      confirmText: 'حذف',
      cancelText: 'انصراف',
      icon: Icons.delete_forever_rounded,
      onConfirm: () => bloc.add(DeleteSendingMethodEvent(id)),
    );
  }
}
