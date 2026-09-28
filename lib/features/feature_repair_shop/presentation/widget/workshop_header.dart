import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/themes/theme_main.dart';
import '../../../../core/utils/persian_formatter.dart';
import '../../domain/entity/repair_shop_entity.dart';
import 'workshop_info_tile.dart';

class WorkshopHeader extends StatelessWidget {
  final RepairShopEntity workshop;
  final VoidCallback onOpenMap;
  final Function(String?) onMakePhoneCall;

  const WorkshopHeader({
    super.key,
    required this.workshop,
    required this.onOpenMap,
    required this.onMakePhoneCall,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final w = workshop;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          w.name,
          style: theme.textTheme.headlineMedium?.copyWith(
            fontSize: 24.sp,
            fontWeight: FontWeight.w900,
            color: colorScheme.onSurface.withValues(alpha: 0.9),
            letterSpacing: -0.5,
          ),
        ),
        SizedBox(height: 14.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: colorScheme.primary.withValues(alpha: 0.04),
            borderRadius: BorderRadius.circular(14.r),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.near_me_rounded, size: 14.sp, color: colorScheme.primary),
              SizedBox(width: 6.w),
              Text(
                '${PersianFormatter.digits(w.distanceKm?.toStringAsFixed(1) ?? '۰.۰')} کیلومتر',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w900,
                  color: colorScheme.primary,
                  fontFamily: 'BonyadeKoodak',
                ),
              ),
              SizedBox(width: 12.w),
              Container(width: 1.w, height: 10.h, color: colorScheme.primary.withValues(alpha: 0.1)),
              SizedBox(width: 12.w),
              Icon(Icons.star_rounded, color: StatusColors.of(context).warning, size: 18.sp),
              SizedBox(width: 4.w),
              Text(
                PersianFormatter.digits(w.rating.toStringAsFixed(1)),
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w900,
                  color: colorScheme.onSurface.withValues(alpha: 0.87),
                  fontFamily: 'BonyadeKoodak',
                ),
              ),
              SizedBox(width: 4.w),
              Text(
                '/',
                style: TextStyle(color: colorScheme.outlineVariant, fontSize: 12.sp),
              ),
              SizedBox(width: 4.w),
              Icon(Icons.person_rounded, color: colorScheme.outlineVariant, size: 14.sp),
              SizedBox(width: 4.w),
              Text(
                PersianFormatter.digits(w.reviewsCount.toString()),
                style: TextStyle(
                  fontSize: 12.sp,
                  color: colorScheme.outline,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'BonyadeKoodak',
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12.h),
        WorkshopInfoTile(
          icon: Icons.location_on_rounded,
          title: 'آدرس تعمیرگاه',
          content: (w.address?.isNotEmpty ?? false) ? w.address! : 'آدرس ثبت نشده است',
          onTap: onOpenMap,
          iconColor: colorScheme.primary,
        ),
        SizedBox(height: 8.h),
        WorkshopInfoTile(
          icon: Icons.phone_android_rounded,
          title: 'شماره همراه',
          content: PersianFormatter.digits(w.mobile ?? '---'),
          onTap: () => onMakePhoneCall(w.mobile),
          iconColor: StatusColors.of(context).info,
        ),
        if (w.phoneNumbers != null && w.phoneNumbers!.isNotEmpty) ...[
          SizedBox(height: 8.h),
          WorkshopInfoTile(
            icon: Icons.phone_rounded,
            title: 'شماره ثابت',
            content: PersianFormatter.digits(w.phoneNumbers!),
            onTap: () => onMakePhoneCall(w.phoneNumbers),
            iconColor: StatusColors.of(context).success,
          ),
        ],
        if (w.email != null && w.email!.isNotEmpty) ...[
          SizedBox(height: 8.h),
          WorkshopInfoTile(
            icon: Icons.email_outlined,
            title: 'ایمیل',
            content: w.email!,
            onTap: () {},
            iconColor: colorScheme.error,
          ),
        ],
      ],
    );
  }
}
