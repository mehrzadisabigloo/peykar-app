import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/themes/theme_main.dart';
import '../../domain/entity/manage_services_entity.dart';

class ServiceStatsBox extends StatelessWidget {
  final ManageServicesEntity service;

  const ServiceStatsBox({
    super.key,
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  'مدت زمان',
                  style: TextStyle(
                    color: textTheme.bodySmall?.color ??
                        colorScheme.onSurfaceVariant,
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  '۲-۴ ساعت',
                  style: TextStyle(
                    color: colorScheme.onSurface,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 1,
            height: 40.h,
            color: colorScheme.onSurface.withValues(alpha: 0.1),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  'وضعیت رزرو',
                  style: TextStyle(
                    color: textTheme.bodySmall?.color ??
                        colorScheme.onSurfaceVariant,
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  service.status == 'active' ? 'آماده پذیرش' : 'غیرفعال',
                  style: TextStyle(
                    color: service.status == 'active'
                        ? StatusColors.of(context).success
                        : theme.colorScheme.error,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
