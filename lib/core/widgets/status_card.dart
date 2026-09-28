import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatusCard extends StatelessWidget {
  final Widget child;
  final Color? accentColor;

  const StatusCard({
    super.key,
    required this.child,
    this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(32.r),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(32.r),
        border: Border.all(
          color: (accentColor ?? colorScheme.onSurfaceVariant).withValues(alpha: 0.1),
          width: 1.2,
        ),
        boxShadow: [
          // Soft global shadow
          BoxShadow(
            color: colorScheme.onSurface.withValues(alpha: 0.03),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
          // Accent colored glow
          BoxShadow(
            color: (accentColor ?? Colors.transparent).withValues(alpha: 0.02),
            blurRadius: 40,
            offset: const Offset(0, 20),
          ),
        ],
      ),
      child: child,
    );
  }
}
