import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/resources/consts.dart';
import '../../domain/entity/repairman_entity.dart';

class ProductCreatorTile extends StatelessWidget {
  final RepairmanEntity? creator;

  const ProductCreatorTile({
    super.key,
    required this.creator,
  });

  Future<void> _makeCall(String? num) async {
    if (num == null) return;
    final uri = Uri(scheme: 'tel', path: num);
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final String? avatar = creator?.profileImageId != null
        ? '${Consts.baseFileUrl}${creator!.profileImageId}'
        : null;

    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.1)),
        boxShadow: [
          BoxShadow(
            color: colorScheme.onSurface.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(2.r),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: colorScheme.primary.withValues(alpha: 0.2), width: 2),
            ),
            child: CircleAvatar(
              radius: 24.r,
              backgroundColor: colorScheme.primary.withValues(alpha: 0.05),
              backgroundImage:
                  avatar != null ? CachedNetworkImageProvider(avatar) : null,
              child: avatar == null
                  ? Icon(Icons.storefront_rounded,
                      color: colorScheme.primary, size: 24.sp)
                  : null,
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      creator?.fullName ?? 'تامین‌کننده تایید شده',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Icon(Icons.phone_android,
                        size: 16.sp, color: colorScheme.primary),
                    SizedBox(width: 6.w),
                    Text(
                      creator?.mobile ?? '',
                      style:
                          theme.textTheme.bodySmall?.copyWith(fontSize: 11.sp),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Material(
            color: colorScheme.primary.withValues(alpha: 0.1),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.r)),
            child: InkWell(
              onTap: () => _makeCall(creator?.mobile),
              borderRadius: BorderRadius.circular(14.r),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                child: Row(
                  children: [
                    Icon(Icons.call_rounded,
                        size: 16.sp, color: colorScheme.primary),
                    SizedBox(width: 6.w),
                    Text(
                      'تماس',
                      style: TextStyle(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
