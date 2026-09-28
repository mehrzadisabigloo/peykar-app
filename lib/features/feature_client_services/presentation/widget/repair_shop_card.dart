import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/themes/theme_main.dart';
import '../../../feature_home/domain/entity/user_entity.dart';

class RepairShopCard extends StatelessWidget {
  final UserEntity shop;

  const RepairShopCard({super.key, required this.shop});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(
        'repair_shop',
        pathParameters: {'repairman_id': shop.id ?? ''},
        queryParameters: {'shop_name': shop.displayName},
      ),
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.04),
              blurRadius: 15,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // Image Section
            Container(
              width: 90.w,
              height: 90.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
              ),
              child: Center(
                child: Icon(Icons.store_rounded, color: StatusColors.of(context).info, size: 45.sp),
              ),
            ),
            SizedBox(width: 16.w),
            // Info Section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        shop.displayName,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.87),
                        ),
                      ),
                      // Rating placeholder as API UserEntity doesn't have it
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: StatusColors.of(context).warning.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Row(
                          children: [
                            Text(
                              '4.8',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: StatusColors.of(context).warning,
                              ),
                            ),
                            SizedBox(width: 4.w),
                            Icon(Icons.star_rounded, color: StatusColors.of(context).warning, size: 16.sp),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Icon(Icons.phone_iphone_rounded, color: Theme.of(context).colorScheme.outline, size: 14.sp),
                      SizedBox(width: 4.w),
                      Text(
                        shop.mobile ?? '—',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Wrap(
                    spacing: 8.w,
                    runSpacing: 8.h,
                    children: [
                      _buildTag(context, shop.role ?? 'تعمیرکار'),
                      _buildTag(context, shop.status == 'active' ? 'فعال' : 'غیرفعال'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(BuildContext context, String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: StatusColors.of(context).info.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 10.sp, 
          color: StatusColors.of(context).info,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
