import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: _getIcon(category.title),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          category.title,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _getIcon(String title) {
    switch (title) {
      case 'مکانیکی':
        return Icon(Icons.handyman_rounded, size: 28.sp, color: Colors.blue[700]);
      case 'سرویس دوره‌ای':
        return Icon(Icons.history_rounded, size: 28.sp, color: Colors.green[600]);
      case 'برق خودرو':
        return Icon(Icons.flash_on_rounded, size: 28.sp, color: Colors.orange[600]);
      case 'صافکاری':
        return Icon(Icons.build_circle_rounded, size: 28.sp, color: Colors.red[400]);
      case 'بیشتر':
        return Icon(Icons.more_horiz_rounded, size: 28.sp, color: Colors.grey[600]);
      case 'تنظیم موتور':
        return Icon(Icons.settings_input_component_rounded, size: 28.sp, color: Colors.purple[400]);
      case 'کارواش':
        return Icon(Icons.local_car_wash_rounded, size: 28.sp, color: Colors.cyan[600]);
      case 'جلوبندی':
        return Icon(Icons.settings_suggest_rounded, size: 28.sp, color: Colors.indigo[400]);
      default:
        return Icon(Icons.settings_suggest, size: 28.sp, color: Colors.blue);
    }
  }
}
