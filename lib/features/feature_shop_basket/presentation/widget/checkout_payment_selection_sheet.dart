import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/app_bottom_sheet.dart';
import '../bloc/checkout_bloc.dart';
import '../bloc/checkout_event.dart';
import '../bloc/checkout_state.dart';

class CheckoutPaymentSelectionSheet {
  static void show({
    required BuildContext context,
    required CheckoutBloc bloc,
    required CheckoutLoaded state,
    required String repairmanId,
    required List availableMethods,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

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
              child: Text(
                'هیچ روش پرداختی یافت نشد',
                style: TextStyle(
                  color: colorScheme.error,
                  fontFamily: 'BonyadeKoodak',
                ),
              ),
            )
          else
            ...availableMethods.map((method) {
              final isSelected =
                  state.selectedPaymentMethods[repairmanId] == method.id;
              return Container(
                margin: EdgeInsets.only(bottom: 8.h),
                child: Material(
                  color: isSelected
                      ? colorScheme.primary.withValues(alpha: 0.05)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(16.r),
                  clipBehavior: Clip.antiAlias,
                  child: ListTile(
                    onTap: () {
                      bloc.add(SelectShopPaymentMethodEvent(
                          repairmanId, method.id!));
                      Navigator.pop(context);
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    leading: Icon(
                      method.type == 'wallet'
                          ? Icons.account_balance_wallet_rounded
                          : Icons.credit_card_rounded,
                      color: isSelected
                          ? colorScheme.primary
                          : colorScheme.onSurfaceVariant,
                    ),
                    title: Text(
                      method.label ?? method.title ?? '',
                      style: TextStyle(
                        fontFamily: 'BonyadeKoodak',
                        fontWeight:
                            isSelected ? FontWeight.w900 : FontWeight.w600,
                        fontSize: 14.sp,
                        color: isSelected
                            ? colorScheme.primary
                            : colorScheme.onSurface,
                      ),
                    ),
                    trailing: Icon(
                      isSelected
                          ? Icons.check_circle_rounded
                          : Icons.circle_outlined,
                      color: isSelected
                          ? colorScheme.primary
                          : colorScheme.outlineVariant,
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
}
