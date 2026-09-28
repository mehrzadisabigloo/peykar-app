import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as intl;
import '../../domain/entity/manage_service_entity.dart';

class ServiceCard extends StatelessWidget {
  final ManageServiceEntity service;
  final VoidCallback? onTap;
  final Function(bool)? onStatusChanged;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;
  final bool isProcessing;
  final bool isDeleting;

  const ServiceCard({
    super.key,
    required this.service,
    this.onTap,
    this.onStatusChanged,
    this.onDelete,
    this.onEdit,
    this.isProcessing = false,
    this.isDeleting = false,
  });

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
        Icons.miscellaneous_services_rounded,
        color: colorScheme.primary.withValues(alpha: 0.3),
        size: 30.sp,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final formatter = intl.NumberFormat('#,###');
    final dateFormatter = intl.DateFormat('yyyy/MM/dd');
    final bool isActive = service.status == 'Active';

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: colorScheme.onSurface.withValues(alpha: 0.03),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Service Image / Icon Container
              Container(
                width: 70.r,
                height: 70.r,
                decoration: BoxDecoration(
                  color: colorScheme.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: service.images.isNotEmpty
                      ? CachedNetworkImage(
                          imageUrl: service.images.first,
                          fit: BoxFit.cover,
                          errorWidget: (context, error, stackTrace) => _buildPlaceholder(colorScheme),
                          placeholder: (context, url) => Container(color: colorScheme.outlineVariant),
                        )
                      : _buildPlaceholder(colorScheme),
                ),
              ),
              SizedBox(width: 14.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      service.title,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w900,
                        color: colorScheme.onSurface,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '${formatter.format(service.priceMin)} - ${formatter.format(service.priceMax)} تومان',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              if (isProcessing)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: SizedBox(
                    width: 20.r,
                    height: 20.r,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: colorScheme.primary,
                    ),
                  ),
                )
              else
                Switch(
                  value: isActive,
                  onChanged: onStatusChanged,
                  activeThumbColor: colorScheme.primary,
                  activeTrackColor: colorScheme.primary.withValues(alpha: 0.2),
                ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            service.description,
            style: TextStyle(
              fontSize: 11.sp,
              color: colorScheme.onSurface.withValues(alpha: 0.45),
              height: 1.4,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 16.h),
          Divider(color: colorScheme.onSurface.withValues(alpha: 0.05)),
          SizedBox(height: 12.h),
          _buildInfoItem(context, Icons.calendar_today_rounded, 'ایجاد: ${dateFormatter.format(service.createdAt)}'),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton.icon(
                onPressed: (isProcessing || isDeleting) ? null : onDelete,
                icon: isDeleting
                    ? SizedBox(
                        width: 16.sp,
                        height: 16.sp,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: colorScheme.error,
                        ),
                      )
                    : Icon(Icons.delete_outline_rounded, size: 18.sp),
                label: Text(isDeleting ? 'حذف...' : 'حذف'),
                style: TextButton.styleFrom(
                  foregroundColor: colorScheme.error,
                  disabledForegroundColor: colorScheme.error.withValues(alpha: 0.5),
                ),
              ),
              SizedBox(width: 8.w),
              ElevatedButton.icon(
                onPressed: (isProcessing || isDeleting) ? null : onEdit,
                icon: Icon(Icons.edit_outlined, size: 18.sp),
                label: const Text('ویرایش'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.primary.withValues(alpha: (isProcessing || isDeleting) ? 0.05 : 0.1),
                  foregroundColor: colorScheme.primary,
                  disabledForegroundColor: colorScheme.primary.withValues(alpha: 0.5),
                  minimumSize: Size(80.w, 40.h),
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(BuildContext context, IconData icon, String text) {
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      children: [
        Icon(icon, size: 14.sp, color: colorScheme.onSurface.withValues(alpha: 0.38)),
        SizedBox(width: 6.w),
        Text(
          text,
          style: TextStyle(
            fontSize: 11.sp,
            color: colorScheme.onSurface.withValues(alpha: 0.54),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
