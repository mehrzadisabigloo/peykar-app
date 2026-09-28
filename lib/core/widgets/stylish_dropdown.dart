import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StylishDropdownItem<T> {
  final T value;
  final String label;
  final IconData? icon;

  StylishDropdownItem({
    required this.value,
    required this.label,
    this.icon,
  });
}

class StylishDropdown<T> extends StatelessWidget {
  final String hint;
  final T? value;
  final List<StylishDropdownItem<T>> items;
  final ValueChanged<T?> onChanged;
  final IconData? leadingIcon;
  final bool isExpanded;

  const StylishDropdown({
    super.key,
    required this.hint,
    required this.value,
    required this.items,
    required this.onChanged,
    this.leadingIcon,
    this.isExpanded = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final selectedItem = items.where((element) => element.value == value).firstOrNull;

    return PopupMenuButton<T>(
      onSelected: onChanged,
      offset: Offset(0, 50.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      elevation: 8,
      color: colorScheme.surface,
      itemBuilder: (context) => items.map((item) {
        final isSelected = item.value == value;
        return PopupMenuItem<T>(
          value: item.value,
          child: Row(
            children: [
              if (item.icon != null) ...[
                Icon(
                  item.icon,
                  size: 18.sp,
                  color: isSelected ? colorScheme.primary : colorScheme.onSurfaceVariant,
                ),
                SizedBox(width: 12.w),
              ],
              Text(
                item.label,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? colorScheme.primary : colorScheme.onSurface,
                  fontFamily: 'BonyadeKoodak',
                ),
              ),
              const Spacer(),
              if (isSelected)
                Icon(
                  Icons.check_circle_rounded,
                  size: 16.sp,
                  color: colorScheme.primary,
                ),
            ],
          ),
        );
      }).toList(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: colorScheme.onSurface.withValues(alpha: 0.04),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: isExpanded ? MainAxisSize.max : MainAxisSize.min,
          children: [
            if (leadingIcon != null) ...[
              Icon(leadingIcon, size: 18.sp, color: colorScheme.onSurface),
              SizedBox(width: 8.w),
            ],
            Text(
              selectedItem?.label ?? hint,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurface,
                fontFamily: 'BonyadeKoodak',
              ),
            ),
            SizedBox(width: 8.w),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 20.sp,
              color: colorScheme.onSurface.withValues(alpha: 0.5),
            ),
          ],
        ),
      ),
    );
  }

}
