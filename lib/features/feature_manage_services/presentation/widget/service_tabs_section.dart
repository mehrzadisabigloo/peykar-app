import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/themes/theme_main.dart';
import '../../domain/entity/manage_services_entity.dart';

class ServiceTabsSection extends StatefulWidget {
  final ManageServicesEntity service;

  const ServiceTabsSection({
    super.key,
    required this.service,
  });

  @override
  State<ServiceTabsSection> createState() => _ServiceTabsSectionState();
}

class _ServiceTabsSectionState extends State<ServiceTabsSection> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final tabs = ['درباره سرویس', 'جزئیات فنی', 'نظرات'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: tabs.asMap().entries.map((entry) {
            final index = entry.key;
            final tab = entry.value;
            final isActive = _selectedTabIndex == index;
            return GestureDetector(
              onTap: () => setState(() => _selectedTabIndex = index),
              child: Container(
                margin: EdgeInsets.only(left: 12.w),
                padding:
                    EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: isActive ? colorScheme.primary : Colors.transparent,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  tab,
                  style: TextStyle(
                    color: isActive
                        ? colorScheme.onPrimary
                        : (textTheme.bodySmall?.color ??
                            colorScheme.onSurfaceVariant),
                    fontSize: 14.sp,
                    fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 20.h),
        if (_selectedTabIndex == 0)
          Text(
            widget.service.description.isNotEmpty
                ? widget.service.description
                : 'توضیحات این سرویس به‌زودی تکمیل خواهد شد. تیم ما با بهترین تجهیزات آماده خدمت‌رسانی است.',
            style: TextStyle(
              color: textTheme.bodySmall?.color ??
                  colorScheme.onSurfaceVariant,
              fontSize: 13.sp,
              height: 1.6,
              fontWeight: FontWeight.w400,
            ),
          )
        else if (_selectedTabIndex == 1)
          Column(
            children: [
              _buildSpecItem('زمان تقریبی', '۲ ساعت', colorScheme),
              _buildSpecItem('تضمین کیفیت', 'دارد', colorScheme),
              _buildSpecItem(
                  'محل ارائه', 'در محل یا تعمیرگاه', colorScheme),
            ],
          )
        else
          Column(
            children: [
              _buildReviewItem(
                  context, 'حسین راد', 'سریع و حرفه‌ای عمل کردند.', 5, colorScheme),
              _buildReviewItem(
                  context, 'سارا امینی', 'قیمت مناسب و برخورد عالی.', 5, colorScheme),
            ],
          ),
        SizedBox(height: 20.h),
        _buildInfoListItem(colorScheme, textTheme),
      ],
    );
  }

  Widget _buildSpecItem(String label, String value, ColorScheme colorScheme) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                  color: colorScheme.onSurface.withValues(alpha: 0.6),
                  fontSize: 13.sp)),
          Text(value,
              style: TextStyle(
                  color: colorScheme.onSurface,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildReviewItem(BuildContext context, String name, String comment,
      int rating, ColorScheme colorScheme) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name,
                  style: TextStyle(
                      color: colorScheme.onSurface,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold)),
              Row(
                children: List.generate(
                    5,
                    (index) => Icon(
                          index < rating
                              ? Icons.star_rounded
                              : Icons.star_outline_rounded,
                          color: StatusColors.of(context).warning,
                          size: 16.sp,
                        )),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(comment,
              style: TextStyle(
                  color: colorScheme.onSurface.withValues(alpha: 0.8),
                  fontSize: 12.sp)),
        ],
      ),
    );
  }

  Widget _buildInfoListItem(ColorScheme colorScheme, TextTheme textTheme) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          Container(
            width: 40.r,
            height: 40.r,
            decoration: BoxDecoration(
              color: colorScheme.surface,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.verified_outlined,
                color: colorScheme.primary, size: 20.sp),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('تضمین کیفیت زینو',
                    style: TextStyle(
                        color: colorScheme.onSurface,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 4.h),
                Text('بازگشت وجه در صورت نارضایتی',
                    style: TextStyle(
                        color: textTheme.bodySmall?.color ??
                            colorScheme.onSurfaceVariant,
                        fontSize: 11.sp)),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios_rounded,
              color: textTheme.bodySmall?.color ??
                  colorScheme.onSurfaceVariant,
              size: 14.sp),
        ],
      ),
    );
  }
}
