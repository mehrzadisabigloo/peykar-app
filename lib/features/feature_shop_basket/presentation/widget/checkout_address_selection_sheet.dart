import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/widgets/app_bottom_sheet.dart';
import '../bloc/checkout_bloc.dart';
import '../bloc/checkout_event.dart';
import '../bloc/checkout_state.dart';

class CheckoutAddressSelectionSheet {
  static void show({
    required BuildContext context,
    required CheckoutBloc bloc,
    required CheckoutLoaded state,
    required String repairmanId,
    required List<String> allRepairmanIds,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

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
              bloc.add(FetchCheckoutInitialDataEvent(allRepairmanIds));
            }
          },
          icon: const Icon(Icons.add_location_alt_rounded, size: 20),
          label: const Text(
            'افزودن آدرس جدید',
            style: TextStyle(
              fontFamily: 'BonyadeKoodak',
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 54.h),
            backgroundColor: colorScheme.primary,
            foregroundColor: colorScheme.onPrimary,
            elevation: 4,
            shadowColor: colorScheme.primary.withValues(alpha: 0.3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
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
            final isSelected =
                state.selectedAddressIds[repairmanId] == address.id;
            return GestureDetector(
              onTap: () {
                bloc.add(SelectAddressEvent(repairmanId, address.id!));
                Navigator.pop(context);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                margin: EdgeInsets.only(bottom: 12.h),
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  color: isSelected
                      ? colorScheme.primary.withValues(alpha: 0.04)
                      : colorScheme.surface,
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(
                    color: isSelected
                        ? colorScheme.primary
                        : colorScheme.outline.withValues(alpha: 0.1),
                    width: isSelected ? 1.5 : 1.0,
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      isSelected
                          ? Icons.check_circle_rounded
                          : Icons.circle_outlined,
                      color: isSelected
                          ? colorScheme.primary
                          : colorScheme.outlineVariant,
                      size: 22.sp,
                    ),
                    SizedBox(width: 14.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (address.ostan != null ||
                              address.shahrestan != null) ...[
                            Text(
                              '${address.ostan?.name ?? ''}${address.ostan != null && address.shahrestan != null ? '، ' : ''}${address.shahrestan?.name ?? ''}',
                              style: TextStyle(
                                fontSize: 11.sp,
                                color: isSelected
                                    ? colorScheme.primary
                                    : colorScheme.onSurfaceVariant
                                        .withValues(alpha: 0.6),
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
                              fontWeight: isSelected
                                  ? FontWeight.w900
                                  : FontWeight.w600,
                              fontSize: 13.sp,
                              color: colorScheme.onSurface,
                              height: 1.4,
                            ),
                          ),
                          if (address.postalCode != null &&
                              address.postalCode!.isNotEmpty) ...[
                            SizedBox(height: 8.h),
                            Row(
                              children: [
                                Icon(Icons.post_add_rounded,
                                    size: 14.sp,
                                    color: colorScheme.outlineVariant),
                                SizedBox(width: 4.w),
                                Text(
                                  'کد پستی: ${address.postalCode!.toPersianDigit}',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: colorScheme.outlineVariant,
                                    fontFamily: 'BonyadeKoodak',
                                    fontWeight: FontWeight.bold,
                                  ),
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
}
