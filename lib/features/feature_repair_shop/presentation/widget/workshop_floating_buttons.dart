import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkshopFloatingButtons extends StatelessWidget {
  final VoidCallback onFavoriteTap;

  const WorkshopFloatingButtons({super.key, required this.onFavoriteTap});

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return Positioned(
      top: topPadding + 16.h,
      left: 20.w,
      right: 20.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _CircleIconButton(
            icon: Icons.favorite_border_rounded,
            onTap: onFavoriteTap,
          ),
        ],
      ),
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _CircleIconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: theme.colorScheme.surface,
      shape: const CircleBorder(),
      elevation: 4,
      shadowColor: theme.colorScheme.onSurface.withValues(alpha: 0.1),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: Container(
          padding: EdgeInsets.all(12.r),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: theme.colorScheme.outline.withValues(alpha: 0.1), width: 1),
          ),
          child: Icon(icon, color: theme.colorScheme.onSurface, size: 22.sp),
        ),
      ),
    );
  }
}
