import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/themes/theme_main.dart';

class UpcomingServicesSection extends StatelessWidget {
  const UpcomingServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
          child: Text(
            'سرویس‌های نزدیک موعد',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        
        _buildServiceItem(
          title: 'تعویض روغن موتور',
          subtitle: '۴۵ روز دیگر',
          date: '۱۴۰۱/۰۹/۰۵',
          icon: Icons.opacity,
          iconColor: Colors.orange,
          indicatorColor: Colors.green,
        ),
        
        SizedBox(height: 12.h),
        
        _buildServiceItem(
          title: 'تعویض تسمه تایم',
          subtitle: '۴ روز باقی مانده',
          date: '',
          icon: Icons.timer,
          iconColor: ThemeMain.errorColor,
          indicatorColor: Colors.blue,
        ),
      ],
    );
  }

  Widget _buildServiceItem({
    required String title,
    required String subtitle,
    required String date,
    required IconData icon,
    required Color iconColor,
    required Color indicatorColor,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: ThemeMain.greyBorder.withOpacity(0.5)),
      ),
      child: Row(

        children: [

          // Secondary Icon/Indicator
          Icon(
            Icons.eco_outlined,
            color: indicatorColor,
            size: 24.sp,
          ),
          SizedBox(width: 15.w),

          // Details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4.h),
              Row(
                children: [
                  if (date.isNotEmpty) ...[
                    Text(
                      date,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: ThemeMain.greyText,
                      ),
                    ),
                    SizedBox(width: 8.w),
                  ],
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: ThemeMain.greyText,
                    ),
                  ),
                ],
              ),
            ],
          ),

          Spacer(),

          // Icon Container
          Container(
            width: 48.w,
            height: 48.w,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 24.sp),
          ),

        ],
      ),
    );
  }
}
