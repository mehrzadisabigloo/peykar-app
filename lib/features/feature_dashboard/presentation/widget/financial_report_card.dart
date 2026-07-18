import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FinancialReportCard extends StatelessWidget {
  final String? title;
  final String value;
  final String unit;
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final Color? valueColor;

  const FinancialReportCard({
    super.key,
    this.title,
    required this.value,
    this.unit = 'تومان',
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                icon,
                color: iconColor,
                size: 20.sp,
              ),
              if (title != null)
                Text(
                  title!,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.grey[700],
                    fontFamily: 'BonyadeKoodak',
                    fontWeight: FontWeight.w500,
                  ),
                ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                unit,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black87,
                  fontFamily: 'BonyadeKoodak',
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                value,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: valueColor ?? Colors.black87,
                  fontFamily: 'BonyadeKoodak',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
