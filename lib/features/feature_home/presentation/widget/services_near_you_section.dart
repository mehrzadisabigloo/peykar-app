import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/themes/theme_main.dart';

class ServicesNearYouSection extends StatelessWidget {
  const ServicesNearYouSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Text(
                'خدمات نزدیک شما',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                'مشاهده همه',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: ThemeMain.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        
        SizedBox(
          height: 180.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                width: 200.w,
                margin: EdgeInsets.only(left: 15.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Colors.white,
                  border: Border.all(color: ThemeMain.greyBorder.withOpacity(0.5)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Service Image Placeholder
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          color: ThemeMain.greyBackground,
                          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/temp.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    // Service Name
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.all(12.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'تعمیرگاه تخصصی زینو',
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.right,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 6.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  '۱.۲ کیلومتر',
                                  style: TextStyle(fontSize: 11.sp, color: ThemeMain.greyText),
                                ),
                                const Spacer(),
                                Text(
                                  '۴.۸',
                                  style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
                                ),
                                Icon(Icons.star, color: Colors.amber, size: 14.sp),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        SizedBox(height: 100.h), // Bottom padding for navigation bar
      ],
    );
  }
}
