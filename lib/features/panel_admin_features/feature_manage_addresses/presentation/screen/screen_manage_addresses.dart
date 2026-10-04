import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:chaharmahal_shop_front/core/widgets/empty_state_widget.dart';
import 'package:chaharmahal_shop_front/core/widgets/error_state_widget.dart';
import 'package:chaharmahal_shop_front/core/widgets/list_shimmer.dart';
import 'package:chaharmahal_shop_front/core/widgets/stylish_popup.dart';
import '../../../../../core/bloc/app/app_bloc.dart';
import '../../../../../core/bloc/error/error_bloc.dart';
import '../../../../../core/services/locator.dart';
import '../../../../../core/widgets/cstm_snakbar.dart';
import '../../../../../core/themes/theme_main.dart';
import '../base/base_manage_addresses_stateful_widget_state.dart';
import '../bloc/manage_addresses_bloc.dart';

class ScreenManageAddresses extends StatefulWidget {
  const ScreenManageAddresses({super.key});

  @override
  State<ScreenManageAddresses> createState() => _ScreenManageAddressesState();
}

class _ScreenManageAddressesState extends BaseManageAddressesStatefulWidgetState<ScreenManageAddresses, ManageAddressesBloc> {
  _ScreenManageAddressesState() : super(locator<ManageAddressesBloc>());

  @override
  void initState() {
    super.initState();
    bloc.add(FetchManageAddressesEvent());
  }

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surfaceContainer,
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton.extended(

        onPressed: () async {
          final result = await context.pushNamed('add_address');
          if (result == true) {
            bloc.add(FetchManageAddressesEvent());
          }
        },
        backgroundColor: colorScheme.primary,
        icon: Icon(Icons.add_location_alt_rounded, color: colorScheme.surface),
        label: Text(
          'افزودن آدرس جدید',
          style: TextStyle(
            color: colorScheme.surface,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            fontFamily: 'BonyadeKoodak',
          ),
        ),
      ),
      body: BlocConsumer<ManageAddressesBloc, ManageAddressesState>(
        listener: (context, state) {
          if (state is ManageAddressesLoaded) {
            if (state.successMessage != null) {
              CstmSnackBar.showSuccess(context, state.successMessage!);
            }
            if (state.errorMessage != null) {
              CstmSnackBar.showError(context, state.errorMessage!);
            }
          }
        },
        builder: (context, state) {
          if (state is ManageAddressesLoading) {
            return ListShimmer(height: 140);
          }
          if (state is ManageAddressesError) {
            return ErrorStateWidget(
              message: state.message,
              onRetry: () => bloc.add(FetchManageAddressesEvent()),
            );
          }
          if (state is ManageAddressesLoaded) {
            if (state.addresses.isEmpty) {
              return const EmptyStateWidget(
                title: 'آدرسی ثبت نشده است',
                description: 'لیست آدرس‌های مدیریت سیستم در حال حاضر خالی است.',
                icon: Icons.map_outlined,
              );
            }
            return ListView.builder(
              padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 100.h),
              itemCount: state.addresses.length,
              itemBuilder: (context, index) {
                final address = state.addresses[index];
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
                            child: Icon(Icons.location_on_rounded, color: colorScheme.primary, size: 22.sp),
                          ),
                          SizedBox(width: 14.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                  Text(
                                    address.fullAddress ?? 'بدون آدرس',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w900,
                                      color: colorScheme.onSurface,
                                      fontFamily: 'BonyadeKoodak',
                                    ),
                                  ),
                                  if (address.ostan != null || address.shahrestan != null) ...[
                                    SizedBox(height: 4.h),
                                    Text(
                                      '${address.ostan?.name ?? ''}${address.ostan != null && address.shahrestan != null ? '، ' : ''}${address.shahrestan?.name ?? ''}',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: colorScheme.primary,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'BonyadeKoodak',
                                      ),
                                    ),
                                  ],
                                  if (address.postalCode != null && address.postalCode!.isNotEmpty) ...[
                                    SizedBox(height: 4.h),
                                    Text(
                                      'کد پستی: ${address.postalCode}',
                                      style: TextStyle(
                                        fontSize: 11.sp,
                                        color: colorScheme.onSurface.withValues(alpha: 0.45),
                                        fontFamily: 'BonyadeKoodak',
                                      ),
                                    ),
                                  ]


                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      Divider(color: colorScheme.outlineVariant),
                      SizedBox(height: 12.h),
                      Row(
                        children: [
                          _buildAddressDetail(Icons.home_outlined, 'پلاک: ${address.pelak ?? '-'}', colorScheme),
                          SizedBox(width: 24.w),
                          _buildAddressDetail(Icons.apartment_rounded, 'واحد: ${address.vahed ?? '-'}', colorScheme),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton.icon(
                            onPressed: (state.deletingId != null) ? null : () => _showDeleteDialog(context, address.id!),
                            icon: (state.deletingId == address.id)
                                ? SizedBox(
                                    width: 16.sp,
                                    height: 16.sp,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: colorScheme.error,
                                    ),
                                  )
                                : Icon(Icons.delete_outline_rounded, size: 18.sp),
                            label: Text(state.deletingId == address.id ? 'حذف...' : 'حذف', style: const TextStyle(fontFamily: 'BonyadeKoodak')),
                            style: TextButton.styleFrom(
                              foregroundColor: colorScheme.error,
                              disabledForegroundColor: colorScheme.error.withValues(alpha: 0.5),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          ElevatedButton.icon(
                            onPressed: (state.deletingId != null)
                                ? null
                                : () async {
                                    final result = await context.pushNamed('edit_address', pathParameters: {'id': address.id!});
                                    if (result == true) {
                                      bloc.add(FetchManageAddressesEvent());
                                    }
                                  },
                            icon: Icon(Icons.edit_outlined, size: 18.sp),
                            label: const Text('ویرایش', style: TextStyle(fontFamily: 'BonyadeKoodak')),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: colorScheme.primary.withValues(alpha: (state.deletingId != null) ? 0.05 : 0.1),
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

  Widget _buildAddressDetail(IconData icon, String text, ColorScheme colorScheme) {
    return Row(
      children: [
        Icon(icon, size: 16.sp, color: colorScheme.onSurface.withValues(alpha: 0.4)),
        SizedBox(width: 6.w),
        Text(
          text,
          style: TextStyle(
            fontSize: 12.sp,
            color: colorScheme.onSurface.withValues(alpha: 0.6),
            fontWeight: FontWeight.w600,
            fontFamily: 'BonyadeKoodak',
          ),
        ),
      ],
    );
  }

  void _showDeleteDialog(BuildContext context, String id) {
    ConfirmationPopup.show(
      context,
      title: 'حذف آدرس',
      description: 'آیا از حذف این آدرس مطمئن هستید؟ این عمل غیرقابل بازگشت است.',
      confirmText: 'حذف',
      cancelText: 'انصراف',
      icon: Icons.delete_forever_rounded,
      onConfirm: () => bloc.add(DeleteAddressEvent(id)),
    );
  }
}
