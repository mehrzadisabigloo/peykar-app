import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/themes/theme_main.dart';
import '../../domain/entity/manage_reminder_types_entity.dart';

class ReminderTypeCard extends StatelessWidget {
  final ManageReminderTypeEntity type;
  final bool isDeleting;
  final bool isEditing;
  final bool isStatusChanging;
  final Function(bool) onStatusChanged;
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  final VoidCallback onManageSubItems;

  const ReminderTypeCard({
    super.key,
    required this.type,
    required this.isDeleting,
    required this.isEditing,
    required this.isStatusChanging,
    required this.onStatusChanged,
    required this.onDelete,
    required this.onEdit,
    required this.onManageSubItems,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final bool isActive = type.isActive;
    final bool isAnyActionInProgress = isDeleting || isEditing || isStatusChanging;

    return Container(
      margin: EdgeInsets.fromLTRB(20.w, 0, 20.w, 20.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.04),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.r),
        child: Column(
          children: [
            // Header Section
            Container(
              padding: EdgeInsets.all(16.r),
              child: Row(
                children: [
                  _buildIconContainer(context, colorScheme),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          type.title,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w900,
                            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.87),
                            fontFamily: 'BonyadeKoodak',
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4.h),
                        Row(
                          children: [
                            Icon(Icons.layers_outlined, size: 12.sp, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.38)),
                            SizedBox(width: 4.w),
                            Text(
                              '${type.subCategories?.length ?? 0} زیرمجموعه فعال',
                              style: TextStyle(
                                fontSize: 11.sp,
                                color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.45),
                                fontWeight: FontWeight.w600,
                                fontFamily: 'BonyadeKoodak',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  _buildStatusBadge(context, isActive, colorScheme),
                ],
              ),
            ),

            // Action Divider
            Divider(height: 1, thickness: 1, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.03)),

            // Actions Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Row(
                children: [
                  _buildPrimaryAction(
                    label: 'زیرمجموعه‌ها',
                    icon: Icons.account_tree_rounded,
                    onTap: isAnyActionInProgress ? null : onManageSubItems,
                    colorScheme: colorScheme,
                  ),
                  const Spacer(),
                  _buildIconButton(
                    icon: Icons.edit_note_rounded,
                    color: colorScheme.primary,
                    onTap: onEdit,
                    isLoading: isEditing,
                  ),
                  SizedBox(width: 10.w),
                  _buildIconButton(
                    icon: Icons.delete_sweep_rounded,
                    color: colorScheme.error,
                    onTap: onDelete,
                    isLoading: isDeleting,
                  ),
                  SizedBox(width: 10.w),
                  _buildSwitch(context, isActive, colorScheme, isStatusChanging),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconContainer(BuildContext context, ColorScheme colorScheme) {
    return Container(
      width: 54.r,
      height: 54.r,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [colorScheme.primary, colorScheme.primary.withValues(alpha: 0.75)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: colorScheme.primary.withValues(alpha: 0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Icon(
        Icons.category_rounded,
        color: Theme.of(context).colorScheme.surface,
        size: 26.sp,
      ),
    );
  }

  Widget _buildStatusBadge(BuildContext context, bool isActive, ColorScheme colorScheme) {
    final baseColor = isActive ? StatusColors.of(context).success : StatusColors.of(context).warning;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: baseColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: baseColor.withValues(alpha: 0.15)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6.r,
            height: 6.r,
            decoration: BoxDecoration(
              color: baseColor,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 6.w),
          Text(
            isActive ? 'فعال' : 'غیرفعال',
            style: TextStyle(
              fontSize: 11.sp,
              color: baseColor,
              fontWeight: FontWeight.w900,
              fontFamily: 'BonyadeKoodak',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrimaryAction({
    required String label,
    required IconData icon,
    required VoidCallback? onTap,
    required ColorScheme colorScheme,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: colorScheme.primary.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Icon(icon, size: 18.sp, color: colorScheme.primary),
            SizedBox(width: 8.w),
            Text(
              label,
              style: TextStyle(
                color: colorScheme.primary,
                fontSize: 12.sp,
                fontWeight: FontWeight.w900,
                fontFamily: 'BonyadeKoodak',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
    required bool isLoading,
  }) {
    return InkWell(
      onTap: isLoading ? null : onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        width: 40.r,
        height: 40.r,
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: isLoading
            ? Padding(
                padding: EdgeInsets.all(12.r),
                child: CircularProgressIndicator(strokeWidth: 2, color: color),
              )
            : Icon(icon, color: color, size: 22.sp),
      ),
    );
  }

  Widget _buildSwitch(BuildContext context, bool isActive, ColorScheme colorScheme, bool isChanging) {
    if (isChanging) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: SizedBox(
          width: 20.r,
          height: 20.r,
          child: CircularProgressIndicator(strokeWidth: 2, color: colorScheme.primary),
        ),
      );
    }
    return Transform.scale(
      scale: 0.8,
      child: Switch(
        value: isActive,
        onChanged: onStatusChanged,
        activeColor: colorScheme.primary,
        activeTrackColor: colorScheme.primary.withValues(alpha: 0.2),
        inactiveThumbColor: Theme.of(context).colorScheme.surface,
        inactiveTrackColor: Theme.of(context).colorScheme.outlineVariant,
      ),
    );
  }
}
