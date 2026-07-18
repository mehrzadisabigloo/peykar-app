import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../domain/entity/appointments_entity.dart';

class AppointmentCard extends StatelessWidget {
  final AppointmentsEntity appointment;

  const AppointmentCard({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          _buildLeftSection(),
          const Spacer(),
          _buildCenterSection(),
          SizedBox(width: 12.w),
          Icon(Icons.chevron_right, size: 20.sp, color: Colors.grey[400]),
        ],
      ),
    );
  }

  Widget _buildLeftSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          appointment.time,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF3F51B5),
            fontFamily: 'BonyadeKoodak',
          ),
        ),
        SizedBox(height: 8.h),
        _buildStatusBadge(appointment.status),
      ],
    );
  }

  Widget _buildCenterSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          appointment.serviceName,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            fontFamily: 'BonyadeKoodak',
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          appointment.subTitle,
          style: TextStyle(
            fontSize: 12.sp,
            color: Colors.grey,
            fontFamily: 'BonyadeKoodak',
          ),
        ),
      ],
    );
  }

  Widget _buildStatusBadge(AppointmentStatus status) {
    Color bgColor;
    Color textColor;
    String text;

    switch (status) {
      case AppointmentStatus.confirmed:
        bgColor = const Color(0xFFE8F5E9);
        textColor = const Color(0xFF2E7D32);
        text = 'تأیید شده';
        break;
      case AppointmentStatus.pending:
        bgColor = const Color(0xFFFFF3E0);
        textColor = const Color(0xFFEF6C00);
        text = 'در انتظار';
        break;
      case AppointmentStatus.canceled:
        bgColor = const Color(0xFFFFEBEE);
        textColor = const Color(0xFFC62828);
        text = 'لغو شده';
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 10.sp,
          fontWeight: FontWeight.bold,
          fontFamily: 'BonyadeKoodak',
        ),
      ),
    );
  }
}
