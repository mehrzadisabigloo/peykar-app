import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReminderDescriptionCard extends StatelessWidget {
  final TextEditingController controller;
  final Color activeColor;

  const ReminderDescriptionCard({
    super.key,
    required this.controller,
    required this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(32.r),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.04),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        maxLines: 4,
        textAlign: TextAlign.right,
        textDirection: TextDirection.rtl,
        style: TextStyle(
          fontSize: 14.sp,
          color: theme.colorScheme.onSurface,
          fontFamily: 'BonyadeKoodak',
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: theme.colorScheme.surfaceContainerHighest,
          hintText: 'توضیحات خود را اینجا بنویسید...',
          hintStyle: TextStyle(
            fontSize: 14.sp,
            color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
            fontFamily: 'BonyadeKoodak',
          ),
          contentPadding: EdgeInsets.all(16.r),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(
                color: activeColor.withValues(alpha: 0.3), width: 1.5),
          ),
        ),
      ),
    );
  }
}
