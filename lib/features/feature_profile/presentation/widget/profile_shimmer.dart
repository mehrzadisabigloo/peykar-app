import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ProfileShimmer extends StatelessWidget {
  const ProfileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          SizedBox(height: 10.h),
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 60.r, left: 20.w, right: 20.w),
                child: Container(
                  height: 380.h,
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
                    baseColor: colorScheme.surfaceContainer,
                    highlightColor: colorScheme.surface,
                    child: Padding(
                      padding: EdgeInsets.all(24.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 60.r),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 150.w,
                                    height: 20.h,
                                    decoration: BoxDecoration(
                                      color: colorScheme.surface,
                                      borderRadius: BorderRadius.circular(4.r),
                                    ),
                                  ),
                                  SizedBox(height: 12.h),
                                  Container(
                                    width: 100.w,
                                    height: 14.h,
                                    decoration: BoxDecoration(
                                      color: colorScheme.surface,
                                      borderRadius: BorderRadius.circular(4.r),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: 80.w,
                                height: 24.h,
                                decoration: BoxDecoration(
                                  color: colorScheme.surface,
                                  borderRadius: BorderRadius.circular(16.r),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 24.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(3, (index) => Container(
                              width: 80.w,
                              height: 60.h,
                              decoration: BoxDecoration(
                                color: colorScheme.surface,
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                            )),
                          ),
                          SizedBox(height: 24.h),
                          Container(
                            width: double.infinity,
                            height: 60.h,
                            decoration: BoxDecoration(
                              color: colorScheme.surface,
                              borderRadius: BorderRadius.circular(24.r),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                child: Shimmer.fromColors(
                  baseColor: colorScheme.surfaceContainer,
                  highlightColor: colorScheme.surface,
                  child: Container(
                    width: 130.r,
                    height: 130.r,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colorScheme.surface,
                      border: Border.all(color: colorScheme.surface, width: 4),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Container(
              height: 300.h,
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
                baseColor: colorScheme.surfaceContainer,
                highlightColor: colorScheme.surface,
                child: Padding(
                  padding: EdgeInsets.all(20.r),
                  child: Column(
                    children: List.generate(5, (index) => Padding(
                      padding: EdgeInsets.only(bottom: 24.h),
                      child: Row(
                        children: [
                          Container(
                            width: 24.r,
                            height: 24.r,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: colorScheme.surface,
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Container(
                            width: 150.w,
                            height: 16.h,
                            decoration: BoxDecoration(
                              color: colorScheme.surface,
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            width: 16.w,
                            height: 16.h,
                            decoration: BoxDecoration(
                              color: colorScheme.surface,
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                          ),
                        ],
                      ),
                    )),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 100.h),
        ],
      ),
    );
  }
}
