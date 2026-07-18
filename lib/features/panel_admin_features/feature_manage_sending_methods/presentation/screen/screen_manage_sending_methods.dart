import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:resturant_app/core/widgets/empty_state_widget.dart';
import 'package:resturant_app/core/widgets/list_shimmer.dart';
import 'package:resturant_app/core/widgets/stylish_popup.dart';
import '../../../../../../core/bloc/app/app_bloc.dart';
import '../../../../../../core/bloc/error/error_bloc.dart';
import '../../../../../../core/services/locator.dart';
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
      backgroundColor: const Color(0xFFF8F9FB),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final result = await context.pushNamed('add_sending_method');
          if (result == true) {
            bloc.add(FetchSendingMethodsEvent());
          }
        },
        backgroundColor: colorScheme.primary,
        icon: const Icon(Icons.add_road_rounded, color: Colors.white),
        label: Text(
          'ایجاد روش جدید',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocBuilder<ManageSendingMethodsBloc, ManageSendingMethodsState>(
        builder: (context, state) {
          if (state is ManageSendingMethodsLoading) {
            return const ListShimmer(height: 160);
          }
          if (state is ManageSendingMethodsError) {
            return EmptyStateWidget(
              title: 'خطا در بارگذاری',
              description: state.message,
              icon: Icons.error_outline_rounded,
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
            return RefreshIndicator(
              onRefresh: () async => bloc.add(FetchSendingMethodsEvent()),
              child: ListView.builder(
                padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 100.h),
                itemCount: state.methods.length,
                itemBuilder: (context, index) {
                  final method = state.methods[index];
                  final bool isProcessing = state.processingId == method.id;

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
                            Switch(
                              value: method.isActive,
                              onChanged: isProcessing ? null : (val) {
                                bloc.add(ChangeSendingMethodStatusEvent(method.id!));
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
                            _buildInfoItem(Icons.location_on_rounded, '${method.locations?.length ?? 0} محدوده اختصاصی'),
                            _buildInfoItem(Icons.calendar_today_rounded, 'ایجاد: ${method.createdAt?.split('T')[0] ?? '-'}'),
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
                                onPressed: () => _showDeleteDialog(context, method.id!),
                                icon: Icon(Icons.delete_outline_rounded, size: 18.sp),
                                label: const Text('حذف'),
                                style: TextButton.styleFrom(foregroundColor: colorScheme.error),
                              ),
                            SizedBox(width: 8.w),
                            ElevatedButton.icon(
                              onPressed: () async {
                                final result = await context.pushNamed('edit_sending_method', pathParameters: {'id': method.id!});
                                if (result == true) {
                                  bloc.add(FetchSendingMethodsEvent());
                                }
                              },
                              icon: Icon(Icons.edit_outlined, size: 18.sp),
                              label: const Text('ویرایش'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: colorScheme.primary.withValues(alpha: 0.1),
                                foregroundColor: colorScheme.primary,
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
      title: 'حذف روش ارسال',
      description: 'آیا از حذف این روش ارسال مطمئن هستید؟ این عمل غیرقابل بازگشت است.',
      confirmText: 'حذف',
      cancelText: 'انصراف',
      icon: Icons.delete_forever_rounded,
      onConfirm: () => bloc.add(DeleteSendingMethodEvent(id)),
    );
  }
}
