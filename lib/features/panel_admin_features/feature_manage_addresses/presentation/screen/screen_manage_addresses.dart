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
      backgroundColor: const Color(0xFFF8F9FB),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton.extended(

        onPressed: () async {
          final result = await context.pushNamed('add_address');
          if (result == true) {
            bloc.add(FetchManageAddressesEvent());
          }
        },
        backgroundColor: colorScheme.primary,
        icon: const Icon(Icons.add_location_alt_rounded, color: Colors.white),
        label: Text(
          'افزودن آدرس جدید',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocBuilder<ManageAddressesBloc, ManageAddressesState>(
        builder: (context, state) {
          if (state is ManageAddressesLoading) {
            return const ListShimmer(height: 140);
          }
          if (state is ManageAddressesError) {
            return EmptyStateWidget(
              title: 'خطا در بارگذاری',
              description: state.message,
              icon: Icons.error_outline_rounded,
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
            return RefreshIndicator(
              onRefresh: () async => bloc.add(FetchManageAddressesEvent()),
              child: ListView.builder(
                padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 100.h),
                itemCount: state.addresses.length,
                itemBuilder: (context, index) {
                  final address = state.addresses[index];
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
                                    ),
                                  ),
                                  if (address.postalCode != null && address.postalCode!.isNotEmpty)...[
                                    SizedBox(height: 4.h),
                                    Text(
                                      'کد پستی: ${address.postalCode}',
                                      style: TextStyle(
                                        fontSize: 11.sp,
                                        color: Colors.black45,
                                      ),
                                    ),
                                  ]


                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        Divider(color: Colors.grey.withValues(alpha: 0.05)),
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
                            if (state is ManageAddressesLoaded && state.deletingId == address.id)
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24.w),
                                child: SizedBox(
                                  width: 18.sp,
                                  height: 18.sp,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: colorScheme.error,
                                  ),
                                ),
                              )
                            else
                              TextButton.icon(
                                onPressed: () => _showDeleteDialog(context, address.id!),
                                icon: Icon(Icons.delete_outline_rounded, size: 18.sp),
                                label: const Text('حذف'),
                                style: TextButton.styleFrom(foregroundColor: colorScheme.error),
                              ),
                            SizedBox(width: 8.w),
                            ElevatedButton.icon(
                              onPressed: () async {
                                final result = await context.pushNamed('edit_address', pathParameters: {'id': address.id!});
                                if (result == true) {
                                  bloc.add(FetchManageAddressesEvent());
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
