import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ProductDetailShimmer extends StatelessWidget {
  const ProductDetailShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final baseColor = colorScheme.surfaceContainer;
    final highlightColor = colorScheme.surface;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        body: Stack(
          children: [
            // 1. Hero Image Background
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 420.h,
              child: Shimmer.fromColors(
                baseColor: baseColor,
                highlightColor: highlightColor,
                child: Container(color: colorScheme.surface),
              ),
            ),

            // 2. Main Content Sheet
            DraggableScrollableSheet(
              initialChildSize: 0.6,
              minChildSize: 0.6,
              maxChildSize: 0.95,
              builder: (context, scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(36.r)),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.05),
                        blurRadius: 30,
                        offset: const Offset(0, -10),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      _buildModalHandle(context),
                      Expanded(
                        child: SingleChildScrollView(
                          controller: scrollController,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.fromLTRB(24.w, 12.h, 24.w, 120.h),
                          child: Shimmer.fromColors(
                            baseColor: baseColor,
                            highlightColor: highlightColor,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildHeader(context),
                                SizedBox(height: 24.h),
                                _buildCreatorTile(context, colorScheme),
                                SizedBox(height: 32.h),
                                _buildDescription(context),
                                SizedBox(height: 24.h),
                                _buildKeywords(context),
                                SizedBox(height: 32.h),
                                _buildAttributesGrid(context, colorScheme),
                                SizedBox(height: 32.h),
                                _buildCommentsSection(context, colorScheme),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

            // 3. Fixed Bottom Bar
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 32.h),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
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
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _rect(context, 80.w, 11.h),
                            SizedBox(height: 8.h),
                            _rect(context, 120.w, 22.h),
                          ],
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: _rect(context, double.infinity, 58.h, radius: 18.r),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildModalHandle(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 14.h, bottom: 18.h),
      width: 40.w,
      height: 4.h,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.outlineVariant.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(10.r),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _rect(context, double.infinity, 22.h),
                  SizedBox(height: 8.h),
                  _rect(context, 140.w, 22.h),
                ],
              ),
            ),
            SizedBox(width: 16.w),
            _rect(context, 56.w, 32.h, radius: 12.r),
          ],
        ),
        SizedBox(height: 14.h),
        Row(
          children: [
            _circle(context, 14.sp),
            SizedBox(width: 6.w),
            _rect(context, 72.w, 11.h),
            SizedBox(width: 16.w),
            _circle(context, 14.sp),
            SizedBox(width: 6.w),
            _rect(context, 72.w, 11.h),
          ],
        ),
      ],
    );
  }

  Widget _buildCreatorTile(BuildContext context, ColorScheme colorScheme) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: colorScheme.outlineVariant.withValues(alpha: 0.05)),
        boxShadow: [
          BoxShadow(
            color: colorScheme.onSurface.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          _circle(context, 48.r),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _rect(context, 130.w, 14.h),
                SizedBox(height: 8.h),
                _rect(context, 90.w, 10.h),
              ],
            ),
          ),
          SizedBox(width: 12.w),
          _rect(context, 72.w, 38.h, radius: 14.r),
        ],
      ),
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _rect(context, 100.w, 16.h),
        SizedBox(height: 12.h),
        _rect(context, double.infinity, 12.h),
        SizedBox(height: 8.h),
        _rect(context, double.infinity, 12.h),
        SizedBox(height: 8.h),
        _rect(context, 180.w, 12.h),
      ],
    );
  }

  Widget _buildKeywords(BuildContext context) {
    return Wrap(
      spacing: 10.w,
      runSpacing: 10.h,
      children: List.generate(
        4,
        (index) => _rect(context, 50.w + (index * 10), 30.h, radius: 14.r),
      ),
    );
  }

  Widget _buildAttributesGrid(BuildContext context, ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _rect(context, 110.w, 16.h),
        SizedBox(height: 16.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: colorScheme.onSurface.withValues(alpha: 0.02),
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: Column(
            children: List.generate(4, (index) {
              final row = Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Row(
                  children: [
                    _circle(context, 20.sp),
                    SizedBox(width: 12.w),
                    _rect(context, 80.w, 12.h),
                    const Spacer(),
                    _rect(context, index.isEven ? 110.w : 70.w, 12.h),
                  ],
                ),
              );
              if (index == 3) return row;
              return Column(
                children: [
                  row,
                  Divider(height: 20.h, color: colorScheme.onSurface.withValues(alpha: 0.05), thickness: 1),
                ],
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildCommentsSection(BuildContext context, ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _rect(context, 100.w, 16.h),
            _rect(context, 80.w, 14.h),
          ],
        ),
        SizedBox(height: 12.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(20.r),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(24.r),
            border: Border.all(color: colorScheme.outlineVariant.withValues(alpha: 0.05)),
          ),
          child: Column(
            children: [
              _circle(context, 40.sp),
              SizedBox(height: 12.h),
              _rect(context, 220.w, 12.h),
              SizedBox(height: 8.h),
              _rect(context, 130.w, 11.h),
            ],
          ),
        ),
      ],
    );
  }

  Widget _rect(BuildContext context, double width, double height, {double? radius}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(radius ?? 6.r),
      ),
    );
  }

  Widget _circle(BuildContext context, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        shape: BoxShape.circle,
      ),
    );
  }
}
