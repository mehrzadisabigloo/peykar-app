import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class RatingsShimmer extends StatelessWidget {
  const RatingsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      children: List.generate(3, (index) => Container(
        margin: EdgeInsets.only(bottom: 16.h),
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(24.r),
          boxShadow: [
            BoxShadow(
              color: colorScheme.onSurface.withValues(alpha: 0.03),
              blurRadius: 15,
              offset: const Offset(0, 6),
            ),
          ],
          border: Border.all(color: colorScheme.outlineVariant.withValues(alpha: 0.05)),
        ),
        child: Shimmer.fromColors(
          baseColor: colorScheme.surfaceContainer,
          highlightColor: colorScheme.surface,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 36.r,
                    height: 36.r,
                    decoration: BoxDecoration(
                      color: colorScheme.surface,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(width: 80.w, height: 10.h, color: colorScheme.surface),
                      SizedBox(height: 8.h),
                      Container(width: 40.w, height: 8.h, color: colorScheme.surface),
                    ],
                  ),
                  const Spacer(),
                  Container(width: 40.w, height: 16.h, decoration: BoxDecoration(color: colorScheme.surface, borderRadius: BorderRadius.circular(4.r))),
                ],
              ),
              SizedBox(height: 16.h),
              Container(width: double.infinity, height: 10.h, decoration: BoxDecoration(color: colorScheme.surface, borderRadius: BorderRadius.circular(4.r))),
              SizedBox(height: 8.h),
              Container(width: 200.w, height: 10.h, decoration: BoxDecoration(color: colorScheme.surface, borderRadius: BorderRadius.circular(4.r))),
            ],
          ),
        ),
      )),
    );
  }
}
