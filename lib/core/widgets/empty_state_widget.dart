import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'status_card.dart';

class EmptyStateWidget extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const EmptyStateWidget({
    super.key,
    required this.title,
    required this.description,
    this.icon = Icons.inventory_2_outlined,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: StatusCard(
          accentColor: colorScheme.primary,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Refined Icon with Soft Glow
              Container(
                width: 100.r,
                height: 100.r,
                decoration: BoxDecoration(
                  color: colorScheme.primary.withValues(alpha: 0.05),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Container(
                    width: 70.r,
                    height: 70.r,
                    decoration: BoxDecoration(
                      color: colorScheme.primary.withValues(alpha: 0.08),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      icon,
                      size: 36.sp,
                      color: colorScheme.primary.withValues(alpha: 0.6),
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
              // Description
              Text(
                description,
                style: TextStyle(
                  fontSize: 13.sp,
                  color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
                  height: 1.6,
                  fontFamily: 'BonyadeKoodak',
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
