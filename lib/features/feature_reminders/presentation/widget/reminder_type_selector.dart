import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReminderTypeSelector extends StatelessWidget {
  final bool isKilometer;
  final Color activeColor;
  final VoidCallback onTimeSelected;
  final VoidCallback onKilometerSelected;

  const ReminderTypeSelector({
    super.key,
    required this.isKilometer,
    required this.activeColor,
    required this.onTimeSelected,
    required this.onKilometerSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.all(6.r),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.04),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildTypeButton(
              theme,
              'زمانی',
              !isKilometer,
              onTimeSelected,
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: _buildTypeButton(
              theme,
              'کیلومتری',
              isKilometer,
              onKilometerSelected,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypeButton(
    ThemeData theme,
    String title,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected ? activeColor : Colors.transparent,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isSelected
                  ? theme.colorScheme.surface
                  : theme.colorScheme.onSurfaceVariant,
              fontSize: 14.sp,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              fontFamily: 'BonyadeKoodak',
            ),
          ),
        ),
      ),
    );
  }
}
