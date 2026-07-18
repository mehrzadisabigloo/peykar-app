import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ServiceCardShimmer extends StatelessWidget {
  const ServiceCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          children: [
            // Image Placeholder
            Container(
              width: 80.w,
              height: 80.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                color: Colors.white,
              ),
            ),
            SizedBox(width: 16.w),
            // Text Placeholders
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 120.w,
                    height: 14.h,
                    color: Colors.white,
                  ),
                  SizedBox(height: 12.h),
                  Container(
                    width: 80.w,
                    height: 12.h,
                    color: Colors.white,
                  ),
                  SizedBox(height: 12.h),
                  Container(
                    width: 100.w,
                    height: 14.h,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            // Icon Placeholder
            Container(
              width: 20.w,
              height: 20.h,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
