import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'status_card.dart';

class ErrorStateWidget extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback onRetry;

  const ErrorStateWidget({
    super.key,
    this.title = 'خطایی رخ داده است',
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: StatusCard(
          accentColor: colorScheme.error,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Sophisticated Error Icon with Soft Glow
              Container(
                width: 100.r,
                height: 100.r,
                decoration: BoxDecoration(
                  color: colorScheme.error.withValues(alpha: 0.05),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Container(
                    width: 70.r,
                    height: 70.r,
                    decoration: BoxDecoration(
                      color: colorScheme.error.withValues(alpha: 0.08),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.error_outline_rounded,
                      size: 36.sp,
                      color: colorScheme.error.withValues(alpha: 0.7),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              // Title
              Text(
                title,
                style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w900,
                  color: theme.colorScheme.onSurface,
                  fontFamily: 'BonyadeKoodak',
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10.h),
              // Message
              Text(
                message,
                style: TextStyle(
                  fontSize: 13.sp,
                  color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
                  height: 1.6,
                  fontFamily: 'BonyadeKoodak',
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32.h),
              // Minimalist Retry Button
              TextButton.icon(
                onPressed: onRetry,
                icon: Icon(Icons.refresh_rounded, size: 20.sp),
                label: const Text(
                  'تلاش مجدد',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'BonyadeKoodak',
                  ),
                ),
                style: TextButton.styleFrom(
                  foregroundColor: colorScheme.error,
                  backgroundColor: colorScheme.error.withValues(alpha: 0.08),
                  padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
