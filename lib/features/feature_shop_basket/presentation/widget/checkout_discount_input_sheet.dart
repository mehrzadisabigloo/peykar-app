import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/themes/theme_main.dart';
import '../../../../core/widgets/app_bottom_sheet.dart';
import '../bloc/checkout_bloc.dart';
import '../bloc/checkout_event.dart';
import '../bloc/checkout_state.dart';

class CheckoutDiscountInputSheet {
  static void show({
    required BuildContext context,
    required CheckoutBloc bloc,
    required String repairmanId,
    required CheckoutLoaded state,
    required TextEditingController controller,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final appliedDiscountData = state.shopDiscountDatas[repairmanId];

    AppBottomSheet.show(
      context,
      title: 'وارد کردن کد تخفیف',
      icon: Icons.confirmation_num_rounded,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
            decoration: BoxDecoration(
              color:
                  colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(
                  color: colorScheme.outline.withValues(alpha: 0.1)),
            ),
            child: TextField(
              controller: controller,
              autofocus: true,
              style: TextStyle(
                fontFamily: 'BonyadeKoodak',
                fontWeight: FontWeight.bold,
                fontSize: 15.sp,
              ),
              decoration: InputDecoration(
                hintText: 'کد خود را اینجا وارد کنید',
                hintStyle: TextStyle(
                  fontSize: 13.sp,
                  color: colorScheme.outline,
                  fontFamily: 'BonyadeKoodak',
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(height: 24.h),
          ElevatedButton(
            onPressed: state.isSubmitting
                ? null
                : () {
                    bloc.add(ApplyDiscountEvent(
                        repairmanId, controller.text.trim()));
                    Navigator.pop(context);
                  },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 54.h),
              backgroundColor: appliedDiscountData != null
                  ? StatusColors.of(context).success
                  : colorScheme.primary,
              foregroundColor: colorScheme.surface,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r)),
            ),
            child: state.isSubmitting
                ? SizedBox(
                    width: 24.r,
                    height: 24.r,
                    child: CircularProgressIndicator(
                        color: colorScheme.surface, strokeWidth: 3),
                  )
                : Text(
                    appliedDiscountData != null ? 'تغییر کد' : 'بررسی و اعمال',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'BonyadeKoodak',
                    ),
                  ),
          ),
          SizedBox(height: 32.h),
        ],
      ),
    );
  }
}
