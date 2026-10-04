import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddReminderBottomBar extends StatelessWidget {
  final bool isLoading;
  final bool isEditMode;
  final Color activeColor;
  final VoidCallback onSubmit;

  const AddReminderBottomBar({
    super.key,
    required this.isLoading,
    required this.isEditMode,
    required this.activeColor,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 32.h),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32.r)),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SizedBox(
        width: double.infinity,
        height: 56.h,
        child: ElevatedButton(
          onPressed: isLoading ? null : onSubmit,
          style: ElevatedButton.styleFrom(
            backgroundColor: activeColor,
            foregroundColor: theme.colorScheme.surface,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
          ),
          child: isLoading
              ? SizedBox(
                  height: 24.h,
                  width: 24.h,
                  child: CircularProgressIndicator(
                    color: theme.colorScheme.surface,
                    strokeWidth: 2.5,
                  ),
                )
              : Text(
                  isEditMode ? 'بروزرسانی یادآور' : 'ثبت یادآور',
                  style: TextStyle(
                    color: theme.colorScheme.surface,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'BonyadeKoodak',
                  ),
                ),
        ),
      ),
    );
  }
}
