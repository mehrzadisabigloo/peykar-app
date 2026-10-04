import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../feature_manage_products/domain/entity/repairman_entity.dart';

class ServiceCreatorRow extends StatelessWidget {
  final RepairmanEntity? repairman;

  const ServiceCreatorRow({
    super.key,
    required this.repairman,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final title = repairman?.fullName.isNotEmpty == true
        ? repairman!.fullName
        : 'نام تعمیرگاه';
    final subtitle =
        repairman?.brand?.isNotEmpty == true ? repairman!.brand! : 'متخصص فنی';

    return Row(
      children: [
        Container(
          width: 44.r,
          height: 44.r,
          decoration: BoxDecoration(
            color: colorScheme.primary,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.handyman_outlined,
              color: colorScheme.onPrimary, size: 20.sp),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: colorScheme.onSurface,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                subtitle,
                style: TextStyle(
                  color: textTheme.bodySmall?.color ??
                      colorScheme.onSurfaceVariant,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: colorScheme.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Row(
            children: [
              Icon(Icons.verified_user_rounded,
                  color: colorScheme.primary, size: 14.sp),
              SizedBox(width: 6.w),
              Text(
                'تایید شده',
                style: TextStyle(
                  color: colorScheme.primary,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
