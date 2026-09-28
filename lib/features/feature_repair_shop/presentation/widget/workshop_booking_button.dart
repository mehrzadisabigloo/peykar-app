import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/themes/theme_main.dart';

class WorkshopBookingButton extends StatelessWidget {
  final VoidCallback onTap;

  const WorkshopBookingButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: StatusColors.of(context).warning,
        minimumSize: Size(double.infinity, 48.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        elevation: 4,
        shadowColor: StatusColors.of(context).warning.withValues(alpha: 0.3),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.calendar_today_rounded, size: 18.sp, color: Theme.of(context).colorScheme.surface),
          SizedBox(width: 12.w),
          Text(
            'رزرو نوبت',
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w900, color: Theme.of(context).colorScheme.surface),
          ),
        ],
      ),
    );
  }
}
