import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../domain/entity/repair_shop_entity.dart';

class WorkshopCallBottomBar extends StatelessWidget {
  final RepairShopEntity workshop;
  final VoidCallback onOpenMap;
  final VoidCallback onMakePhoneCall;

  const WorkshopCallBottomBar({
    super.key,
    required this.workshop,
    required this.onOpenMap,
    required this.onMakePhoneCall,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Row(
      children: [
        Container(
          width: 56.h,
          height: 56.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: theme.shadowColor.withValues(alpha: 0.1),
                blurRadius: 20,
                offset: const Offset(0, 10),
              )
            ],
          ),
          child: Material(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(16.r),
            child: InkWell(
              onTap: onOpenMap,
              borderRadius: BorderRadius.circular(16.r),
              splashColor: colorScheme.primary.withValues(alpha: 0.2),
              child: Center(
                child: Icon(Icons.location_on_rounded, size: 22.sp, color: colorScheme.primary),
              ),
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Container(
            height: 56.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: theme.shadowColor.withValues(alpha: 0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                )
              ],
            ),
            child: Material(
              color: colorScheme.primary,
              borderRadius: BorderRadius.circular(16.r),
              child: InkWell(
                onTap: onMakePhoneCall,
                borderRadius: BorderRadius.circular(16.r),
                splashColor: colorScheme.surface.withValues(alpha: 0.2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.call_rounded, size: 20.sp, color: colorScheme.surface),
                    SizedBox(width: 12.w),
                    Text(
                      'تماس با تعمیرگاه',
                      style: theme.textTheme.labelLarge?.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w900,
                        color: colorScheme.surface,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
