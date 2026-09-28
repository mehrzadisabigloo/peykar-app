import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBottomSheet extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final Widget child;
  final List<Widget>? actions;
  final bool isScrollable;
  final double? initialChildSize;
  final double? minChildSize;
  final double? maxChildSize;

  const AppBottomSheet({
    super.key,
    this.title,
    this.icon,
    required this.child,
    this.actions,
    this.isScrollable = false,
    this.initialChildSize,
    this.minChildSize,
    this.maxChildSize,
  });

  static Future<T?> show<T>(
    BuildContext context, {
    String? title,
    IconData? icon,
    required Widget child,
    List<Widget>? actions,
    bool isScrollable = false,
    double initialChildSize = 0.5,
    double minChildSize = 0.3,
    double maxChildSize = 0.9,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => AppBottomSheet(
        title: title,
        icon: icon,
        actions: actions,
        isScrollable: isScrollable,
        initialChildSize: initialChildSize,
        minChildSize: minChildSize,
        maxChildSize: maxChildSize,
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return DraggableScrollableSheet(
      initialChildSize: initialChildSize ?? 0.5,
      minChildSize: minChildSize ?? 0.3,
      maxChildSize: maxChildSize ?? 0.9,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.vertical(top: Radius.circular(32.r)),
            boxShadow: [
              BoxShadow(
                color: colorScheme.onSurface.withValues(alpha: 0.1),
                blurRadius: 40,
                offset: const Offset(0, -10),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Handle
                Container(
                  width: 40.w,
                  height: 4.h,
                  margin: EdgeInsets.symmetric(vertical: 12.h),
                  decoration: BoxDecoration(
                    color: colorScheme.outlineVariant.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
                // Header
                if (title != null || icon != null)
                  Padding(
                    padding: EdgeInsets.fromLTRB(24.w, 8.h, 24.w, 20.h),
                    child: Row(
                      children: [
                        if (icon != null) ...[
                          Container(
                            padding: EdgeInsets.all(10.r),
                            decoration: BoxDecoration(
                              color: colorScheme.primary.withValues(alpha: 0.08),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Icon(icon, color: colorScheme.primary, size: 20.sp),
                          ),
                          SizedBox(width: 14.w),
                        ],
                        if (title != null)
                          Expanded(
                            child: Text(
                              title!,
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w900,
                                fontFamily: 'BonyadeKoodak',
                                color: colorScheme.onSurface,
                              ),
                            ),
                          ),
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(Icons.close_rounded, color: colorScheme.onSurfaceVariant),
                          style: IconButton.styleFrom(
                            backgroundColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
                            padding: EdgeInsets.all(8.r),
                          ),
                        ),
                      ],
                    ),
                  ),
                // Body
                Expanded(
                  child: SingleChildScrollView(
                    controller: scrollController,
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: child,
                  ),
                ),
                // Actions
                if (actions != null && actions!.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.fromLTRB(24.w, 24.h, 24.w, 32.h),
                    child: Row(
                      children: actions!
                          .map((action) => Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                                  child: action,
                                ),
                              ))
                          .toList(),
                    ),
                  )
                else
                  SizedBox(height: 32.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
