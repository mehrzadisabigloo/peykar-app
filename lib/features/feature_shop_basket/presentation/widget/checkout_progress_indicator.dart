import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/extensions.dart';

class CheckoutProgressIndicator extends StatelessWidget {
  const CheckoutProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 30.w),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: colorScheme.onSurface.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          _buildStep(1, 'سبد خرید', true, colorScheme),
          _buildDivider(true, colorScheme),
          _buildStep(2, 'تایید آدرس', true, colorScheme),
          _buildDivider(false, colorScheme),
          _buildStep(3, 'پرداخت', false, colorScheme),
        ],
      ),
    );
  }

  Widget _buildStep(
      int step, String title, bool isCompleted, ColorScheme colorScheme) {
    final isActive = step == 2;
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 24.w,
          height: 24.w,
          decoration: BoxDecoration(
            color: isCompleted && !isActive
                ? colorScheme.primary
                : colorScheme.surface,
            shape: BoxShape.circle,
            border: Border.all(
              color: isCompleted || isActive
                  ? colorScheme.primary
                  : colorScheme.outlineVariant.withValues(alpha: 0.5),
              width: 1.5,
            ),
          ),
          child: Center(
            child: isCompleted && !isActive
                ? Icon(Icons.check, size: 14.sp, color: colorScheme.surface)
                : Text(
                    step.toPersianDigit,
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w900,
                      color: isActive
                          ? colorScheme.primary
                          : colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
                    ),
                  ),
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          title,
          style: TextStyle(
            fontSize: 9.sp,
            fontFamily: 'BonyadeKoodak',
            fontWeight:
                isActive || isCompleted ? FontWeight.w900 : FontWeight.bold,
            color: isActive || isCompleted
                ? colorScheme.onSurface
                : colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
          ),
        ),
      ],
    );
  }

  Widget _buildDivider(bool isCompleted, ColorScheme colorScheme) {
    return Expanded(
      child: Container(
        height: 1.5,
        margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: isCompleted
              ? colorScheme.primary.withValues(alpha: 0.5)
              : colorScheme.outlineVariant.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(1),
        ),
      ),
    );
  }
}
