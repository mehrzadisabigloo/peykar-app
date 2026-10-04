import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/themes/theme_main.dart';
import '../bloc/repair_shop_bloc.dart';

class BookingBottomBar extends StatelessWidget {
  final RepairShopState state;
  final bool isSuccess;
  final bool canGoNext;
  final int currentStep;
  final VoidCallback onPressed;

  const BookingBottomBar({
    super.key,
    required this.state,
    required this.isSuccess,
    required this.canGoNext,
    required this.currentStep,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isSubmitting =
        state.reservationStatus == ReservationStatus.submitting;
    final isReview = currentStep == 2;

    return Container(
      padding: EdgeInsets.fromLTRB(
          24.w, 16.h, 24.w, 16.h + MediaQuery.of(context).padding.bottom),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed:
            (isSubmitting || (!canGoNext && !isSuccess)) ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isSuccess
              ? StatusColors.of(context).success
              : (canGoNext || isReview
                  ? theme.colorScheme.primary
                  : theme.colorScheme.primary.withValues(alpha: 0.5)),
          minimumSize: Size(double.infinity, 54.h),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r)),
          disabledBackgroundColor: isSuccess
              ? StatusColors.of(context).success.withValues(alpha: 0.5)
              : theme.colorScheme.primary.withValues(alpha: 0.5),
        ),
        child: isSubmitting
            ? SizedBox(
                height: 24.h,
                width: 24.h,
                child: CircularProgressIndicator(
                    color: theme.colorScheme.surface, strokeWidth: 2),
              )
            : Text(
                isSuccess
                    ? 'بازگشت'
                    : isReview
                        ? 'تایید و رزرو نهایی'
                        : 'ادامه',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w800,
                  color: theme.colorScheme.surface,
                ),
              ),
      ),
    );
  }
}
