import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkshopSectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onSeeAll;
  final bool showSeeAll;

  const WorkshopSectionHeader({
    super.key,
    required this.title,
    required this.onSeeAll,
    this.showSeeAll = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w900,
          ),
        ),
        if (showSeeAll)
          TextButton(
            onPressed: onSeeAll,
            child: Text(
              'مشاهده همه',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }
}
