import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/themes/theme_main.dart';
import '../../domain/entity/manage_reminder_sub_item_entity.dart';

class ReminderSubItemCard extends StatelessWidget {
  final ManageReminderSubItemEntity item;
  final bool isDeleting;
  final bool isEditing;
  final bool isStatusChanging;
  final Function(bool) onStatusChanged;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const ReminderSubItemCard({
    super.key,
    required this.item,
    required this.isDeleting,
    required this.isEditing,
    required this.isStatusChanging,
    required this.onStatusChanged,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final bool isActive = item.isActive;
    final bool isAnyActionInProgress = isDeleting || isEditing || isStatusChanging;

    return Container(
      margin: EdgeInsets.fromLTRB(16.w, 0, 16.w, 12.h),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: colorScheme.onSurface.withValues(alpha: 0.02),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
        border: Border.all(color: colorScheme.secondary.withValues(alpha: 0.05)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.r),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(12.r),
              child: Row(
                children: [
                  Container(
                    width: 44.r,
                    height: 44.r,
                    decoration: BoxDecoration(
                      color: colorScheme.secondary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Icon(
                      Icons.subdirectory_arrow_left_rounded,
                      color: colorScheme.secondary,
                      size: 20.sp,
                    ),
                  ),
                  SizedBox(width: 14.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w800,
                            color: colorScheme.onSurface,
                            fontFamily: 'BonyadeKoodak',
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          'آیتم زیرمجموعه یادآور',
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: colorScheme.onSurface.withValues(alpha: 0.38),
                            fontWeight: FontWeight.w600,
                            fontFamily: 'BonyadeKoodak',
                          ),
                        ),
                      ],
                    ),
                  ),
                  _buildStatusBadge(context, isActive, colorScheme),
                ],
              ),
            ),
            
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: colorScheme.onSurface.withValues(alpha: 0.02),
                border: Border(top: BorderSide(color: colorScheme.onSurface.withValues(alpha: 0.03))),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (isStatusChanging)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: SizedBox(
                        width: 16.sp,
                        height: 16.sp,
                        child: CircularProgressIndicator(strokeWidth: 2.5, color: colorScheme.primary),
                      ),
                    )
                  else
                    Transform.scale(
                      scale: 0.7,
                      child: Switch(
                        value: isActive,
                        onChanged: isAnyActionInProgress ? null : onStatusChanged,
                        activeColor: colorScheme.primary,
                      ),
                    ),
                  const Spacer(),
                  IconButton(
                    onPressed: isDeleting ? null : onDelete,
                    icon: isDeleting
                        ? SizedBox(width: 14.r, height: 14.r, child: CircularProgressIndicator(strokeWidth: 2, color: colorScheme.error))
                        : Icon(Icons.delete_outline_rounded, color: colorScheme.error, size: 20.sp),
                    style: IconButton.styleFrom(
                      backgroundColor: colorScheme.error.withValues(alpha: 0.05),
                      padding: EdgeInsets.all(8.r),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  IconButton(
                    onPressed: isEditing ? null : onEdit,
                    icon: isEditing
                        ? SizedBox(width: 14.r, height: 14.r, child: CircularProgressIndicator(strokeWidth: 2, color: colorScheme.primary))
                        : Icon(Icons.edit_outlined, color: colorScheme.primary, size: 20.sp),
                    style: IconButton.styleFrom(
                      backgroundColor: colorScheme.primary.withValues(alpha: 0.05),
                      padding: EdgeInsets.all(8.r),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBadge(BuildContext context, bool isActive, ColorScheme colorScheme) {
    final statusColor = isActive ? StatusColors.of(context).success : StatusColors.of(context).warning;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: statusColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Text(
        isActive ? 'فعال' : 'غیرفعال',
        style: TextStyle(
          fontSize: 9.sp,
          color: statusColor,
          fontWeight: FontWeight.w900,
          fontFamily: 'BonyadeKoodak',
        ),
      ),
    );
  }
}
