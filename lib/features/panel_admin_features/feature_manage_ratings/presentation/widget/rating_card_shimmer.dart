import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class RatingCardShimmer extends StatelessWidget {
  const RatingCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      margin: EdgeInsets.fromLTRB(20.w, 0, 20.w, 16.h),
      padding: EdgeInsets.all(16.w),
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
                  width: 40.r,
                  height: 40.r,
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                SizedBox(width: 14.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(width: 100.w, height: 12.h, color: colorScheme.surface),
                      SizedBox(height: 8.h),
                      Container(width: 60.w, height: 10.h, color: colorScheme.surface),
                    ],
                  ),
                ),
                Container(width: 40.w, height: 24.h, decoration: BoxDecoration(color: colorScheme.surface, borderRadius: BorderRadius.circular(8.r))),
              ],
            ),
            SizedBox(height: 16.h),
            Container(width: double.infinity, height: 60.h, decoration: BoxDecoration(color: colorScheme.surface, borderRadius: BorderRadius.circular(16.r))),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(width: 60.w, height: 16.h, color: colorScheme.surface),
                Container(width: 100.w, height: 36.h, decoration: BoxDecoration(color: colorScheme.surface, borderRadius: BorderRadius.circular(12.r))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
