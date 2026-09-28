import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/themes/theme_main.dart';
import '../../domain/entity/client_services_entity.dart';

class CategoryItem extends StatelessWidget {
  final ServiceCategory category;

  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 65.w,
          height: 65.w,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: _getIcon(context, category.title),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          category.title,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.87),
          ),
        ),
      ],
    );
  }

  Widget _getIcon(BuildContext context, String title) {
    final statusColors = StatusColors.of(context);
    final colorScheme = Theme.of(context).colorScheme;
    final dashboardColors = DashboardColors.of(context);

    switch (title) {
      case 'مکانیکی':
        return Icon(Icons.handyman_rounded, size: 28.sp, color: statusColors.info);
      case 'سرویس دوره‌ای':
        return Icon(Icons.history_rounded, size: 28.sp, color: statusColors.success);
      case 'برق خودرو':
        return Icon(Icons.flash_on_rounded, size: 28.sp, color: statusColors.warning);
      case 'صافکاری':
        return Icon(Icons.build_circle_rounded, size: 28.sp, color: colorScheme.error);
      case 'بیشتر':
        return Icon(Icons.more_horiz_rounded, size: 28.sp, color: colorScheme.outline);
      case 'تنظیم موتور':
        return Icon(Icons.settings_input_component_rounded, size: 28.sp, color: dashboardColors.adminIndigo);
      case 'کارواش':
        return Icon(Icons.local_car_wash_rounded, size: 28.sp, color: statusColors.info);
      case 'جلوبندی':
        return Icon(Icons.settings_suggest_rounded, size: 28.sp, color: dashboardColors.adminIndigo);
      default:
        return Icon(Icons.settings_suggest, size: 28.sp, color: statusColors.info);
    }
  }
}
