import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/themes/theme_main.dart';
import 'package:resturant_app/core/resources/consts.dart';
import 'package:resturant_app/features/panel_admin_features/feature_banner/domain/entity/banner_entity.dart';

class BannerCard extends StatelessWidget {
  final BannerEntity banner;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final ValueChanged<bool> onStatusChange;
  final bool isDeleting;
  final bool isChangingStatus;

  const BannerCard({
    super.key,
    required this.banner,
    required this.onEdit,
    required this.onDelete,
    required this.onStatusChange,
    this.isDeleting = false,
    this.isChangingStatus = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: colorScheme.onSurface.withValues(alpha: 0.04), width: 1),
        boxShadow: [
          BoxShadow(
            color: colorScheme.onSurface.withValues(alpha: 0.02),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Enhanced Banner Preview
              Container(
                width: 90.r,
                height: 90.r,
                decoration: BoxDecoration(
                  color: colorScheme.primary.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(18.r),
                  border: Border.all(color: colorScheme.primary.withValues(alpha: 0.1), width: 1.5),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: (banner.firstImageId.isNotEmpty)
                      ? CachedNetworkImage(
                          imageUrl: '${Consts.baseFileUrl}${banner.firstImageId}',
                          fit: BoxFit.fill,
                          errorWidget: (context, error, stackTrace) => _buildPlaceholder(colorScheme),
                          placeholder: (context, url) => Container(color: colorScheme.surface),
                        )
                      : _buildPlaceholder(colorScheme),
                ),
              ),
              SizedBox(width: 14.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          banner.place == 'shop' ? Icons.storefront_rounded : 
                          banner.place == 'service_provider' ? Icons.handyman_rounded : 
                          Icons.person_pin_circle_rounded,
                          size: 16.sp,
                          color: colorScheme.primary.withValues(alpha: 0.7),
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          _getPlaceText(banner.place),
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w900,
                            color: colorScheme.onSurface,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6.h),
                    _buildStatusBadge(context, banner.isActive),
                  ],
                ),
              ),
              isChangingStatus
                  ? SizedBox(
                      width: 40.w,
                      height: 40.w,
                      child: Center(
                        child: SizedBox(
                          width: 18.sp,
                          height: 18.sp,
                          child: CircularProgressIndicator(
                            color: colorScheme.primary,
                            strokeWidth: 2.5,
                          ),
                        ),
                      ),
                    )
                  : Transform.scale(
                      scale: 0.85,
                      child: Switch(
                        value: banner.isActive,
                        onChanged: onStatusChange,
                        activeThumbColor: colorScheme.primary,
                        activeTrackColor: colorScheme.primary.withValues(alpha: 0.2),
                        inactiveThumbColor: colorScheme.outline,
                        inactiveTrackColor: colorScheme.outlineVariant,
                      ),
                    ),
            ],
          ),
          SizedBox(height: 10.h),
          Divider(color: colorScheme.outlineVariant, thickness: 1),
          SizedBox(height: 10.h),
          
          Row(
            children: [
              _buildDetail(Icons.collections_rounded, 'تصاویر: ${banner.images?.length ?? 0}', colorScheme),
              SizedBox(width: 20.w),
              _buildDetail(Icons.ads_click_rounded, 'نوع فعالیت: ${_getActivityText(banner.images)}', colorScheme),
            ],
          ),

          SizedBox(height: 20.h),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton.icon(
                onPressed: (isDeleting || isChangingStatus) ? null : onDelete,
                icon: isDeleting
                    ? SizedBox(
                        width: 16.sp,
                        height: 16.sp,
                        child: CircularProgressIndicator(
                          color: colorScheme.error,
                          strokeWidth: 2,
                        ),
                      )
                    : Icon(Icons.delete_sweep_rounded, size: 20.sp),
                label: Text(
                  isDeleting ? 'حذف...' : 'حذف بنر',
                  style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, fontFamily: 'BonyadeKoodak'),
                ),
                style: TextButton.styleFrom(
                  foregroundColor: colorScheme.error,
                  disabledForegroundColor: colorScheme.error.withValues(alpha: 0.5),
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                ),
              ),
              SizedBox(width: 8.w),
              ElevatedButton.icon(
                onPressed: (isDeleting || isChangingStatus) ? null : onEdit,
                icon: Icon(Icons.edit_note_rounded, size: 20.sp),
                label: const Text('ویرایش'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.primary.withValues(alpha: (isDeleting || isChangingStatus) ? 0.04 : 0.08),
                  foregroundColor: colorScheme.primary,
                  disabledForegroundColor: colorScheme.primary.withValues(alpha: 0.5),
                  minimumSize: Size(90.w, 42.h),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.r),
                    side: BorderSide(color: colorScheme.primary.withValues(alpha: (isDeleting || isChangingStatus) ? 0.05 : 0.1)),
                  ),
                  textStyle: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'BonyadeKoodak',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetail(IconData icon, String text, ColorScheme colorScheme) {
    return Row(
      children: [
        Icon(icon, size: 16.sp, color: colorScheme.onSurface.withValues(alpha: 0.4)),
        SizedBox(width: 6.w),
        Text(
          text,
          style: TextStyle(
            fontSize: 12.sp,
            color: colorScheme.onSurface.withValues(alpha: 0.6),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildPlaceholder(ColorScheme colorScheme) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colorScheme.primary.withValues(alpha: 0.05),
            colorScheme.primary.withValues(alpha: 0.1),
          ],
        ),
      ),
      child: Icon(
        Icons.photo_library_outlined,
        color: colorScheme.primary.withValues(alpha: 0.3),
        size: 30.sp,
      ),
    );
  }

  String _getPlaceText(String? place) {
    switch (place) {
      case 'shop':
        return 'فروشگاه';
      case 'service_provider':
        return 'خدمات دهنده';
      case 'customer':
        return 'مشتری';
      default:
        return place ?? 'نامشخص';
    }
  }

  String _getActivityText(Map<String, dynamic>? images) {
    if (images == null || images.isEmpty) return 'نامشخص';
    final List<String> translated = [];
    for (var key in images.keys) {
      switch (key) {
        case 'info':
          translated.add('اطلاعیه');
          break;
        case 'product':
          translated.add('محصول');
          break;
        case 'reminder':
          translated.add('یادآور');
          break;
      }
    }
    return translated.isEmpty ? 'نامشخص' : translated.join('، ');
  }

  Widget _buildStatusBadge(BuildContext context, bool isActive) {
    final statusColors = StatusColors.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: (isActive ? statusColors.success : statusColors.warning).withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: (isActive ? statusColors.success : statusColors.warning).withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6.r,
            height: 6.r,
            decoration: BoxDecoration(
              color: isActive ? statusColors.success : statusColors.warning,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 6.w),
          Text(
            isActive ? 'نمایش فعال' : 'عدم نمایش',
            style: TextStyle(
              color: isActive ? statusColors.success : statusColors.warning,
              fontSize: 10.sp,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}
