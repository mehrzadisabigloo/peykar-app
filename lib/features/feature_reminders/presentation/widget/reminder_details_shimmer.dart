import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ReminderDetailsShimmer extends StatelessWidget {
  const ReminderDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final baseColor = colorScheme.surfaceContainer;
    final highlightColor = colorScheme.surface;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Column(
          children: [
            _buildInfoCard(colorScheme, baseColor, highlightColor),
            SizedBox(height: 32.h),
            _buildManagementSection(colorScheme, baseColor, highlightColor),
            SizedBox(height: 120.h),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomActions(colorScheme, baseColor, highlightColor),
    );
  }

  Widget _buildInfoCard(ColorScheme colorScheme, Color baseColor, Color highlightColor) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(32.r),
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
        baseColor: baseColor,
        highlightColor: highlightColor,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(24.r),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Icon Placeholder
                      _rect(72.r, 72.r, colorScheme, radius: 24.r),
                      SizedBox(width: 18.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Title
                            _rect(160.w, 24.h, colorScheme),
                            SizedBox(height: 10.h),
                            // Description lines
                            _rect(200.w, 12.h, colorScheme),
                            SizedBox(height: 8.h),
                            _rect(140.w, 12.h, colorScheme),
                            SizedBox(height: 12.h),
                            // Type Tag
                            _rect(90.w, 24.h, colorScheme, radius: 8.r),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 28.h),
                  // Progress Section
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _rect(80.w, 14.h, colorScheme),
                          _rect(50.w, 14.h, colorScheme),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      _rect(double.infinity, 12.h, colorScheme, radius: 100),
                    ],
                  ),
                ],
              ),
            ),
            // Bottom Compact Info Row
            Container(
              padding: EdgeInsets.all(20.r),
              decoration: BoxDecoration(
                color: colorScheme.onSurface.withValues(alpha: 0.02),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(32.r)),
              ),
              child: Row(
                children: [
                  _compactInfoItem(colorScheme),
                  Container(width: 1.w, height: 32.h, color: colorScheme.outlineVariant.withValues(alpha: 0.2)),
                  _compactInfoItem(colorScheme),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildManagementSection(ColorScheme colorScheme, Color baseColor, Color highlightColor) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(32.r),
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
        baseColor: baseColor,
        highlightColor: highlightColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: EdgeInsets.all(24.r),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          _rect(4.w, 24.h, colorScheme, radius: 4.r),
                          SizedBox(width: 12.w),
                          _rect(120.w, 18.h, colorScheme),
                        ],
                      ),
                      _rect(90.w, 40.h, colorScheme, radius: 18.r), // Add Action button
                    ],
                  ),
                ],
              ),
            ),
            // History Section
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(24.r),
              decoration: BoxDecoration(
                color: colorScheme.onSurface.withValues(alpha: 0.02),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(32.r)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      _circle(20.r, colorScheme),
                      SizedBox(width: 12.w),
                      _rect(100.w, 15.h, colorScheme),
                    ],
                  ),
                  SizedBox(height: 32.h),
                  // History Timeline Items
                  _historyItem(colorScheme),
                  SizedBox(height: 32.h),
                  _historyItem(colorScheme),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _compactInfoItem(ColorScheme colorScheme) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _circle(20.r, colorScheme),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _rect(70.w, 10.h, colorScheme),
              SizedBox(height: 8.h),
              _rect(90.w, 14.h, colorScheme),
            ],
          ),
        ],
      ),
    );
  }

  Widget _historyItem(ColorScheme colorScheme) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            _circle(14.r, colorScheme),
            Container(width: 2.w, height: 80.h, color: colorScheme.surface),
          ],
        ),
        SizedBox(width: 18.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _rect(150.w, 16.h, colorScheme),
              SizedBox(height: 16.h),
              _rect(double.infinity, 100.h, colorScheme, radius: 24.r),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBottomActions(ColorScheme colorScheme, Color baseColor, Color highlightColor) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 32.h),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: colorScheme.onSurface.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: highlightColor,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: _rect(double.infinity, 56.h, colorScheme, radius: 20.r),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _rect(double.infinity, 56.h, colorScheme, radius: 20.r),
            ),
          ],
        ),
      ),
    );
  }

  Widget _rect(double width, double height, ColorScheme colorScheme, {double? radius}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(radius ?? 6.r),
      ),
    );
  }

  Widget _circle(double size, ColorScheme colorScheme) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        shape: BoxShape.circle,
      ),
    );
  }
}
