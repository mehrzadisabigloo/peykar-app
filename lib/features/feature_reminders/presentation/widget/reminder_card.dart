import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../domain/entity/reminders_entity.dart';

class ReminderCard extends StatelessWidget {
  final RemindersEntity reminder;

  const ReminderCard({super.key, required this.reminder});

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
      child: Column(
        children: [
          Row(
            children: [
              _buildImage(),
              const Spacer(),
              _buildDetails(),
            ],
          ),
          SizedBox(height: 16.h),
          _buildProgressBar(),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      width: 60.r,
      height: 60.r,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: reminder.imageUrl != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: CachedNetworkImage(
                imageUrl: reminder.imageUrl!,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  color: Colors.grey[200],
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            )
          : Icon(Icons.notifications_active_outlined, size: 30.sp, color: Colors.grey),
    );
  }

  Widget _buildDetails() {
    String subtitle = reminder.description;
    if (reminder.type == ReminderType.time && reminder.timeLogs?.isNotEmpty == true) {
      subtitle = "آخرین انجام: ${_toPersianDigit(reminder.timeLogs!.first.doneDate)}";
    } else if (reminder.type == ReminderType.kilometer && reminder.kilometerLogs?.isNotEmpty == true) {
      subtitle = "آخرین انجام: ${_toPersianDigit(reminder.kilometerLogs!.first.doneKm.toString())} کیلومتر";
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          reminder.title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            fontFamily: 'BonyadeKoodak',
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          subtitle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 12.sp,
            color: Colors.grey,
            fontFamily: 'BonyadeKoodak',
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          _toPersianDigit(reminder.remainingText),
          style: TextStyle(
            fontSize: 12.sp,
            color: reminder.progressColor,
            fontWeight: FontWeight.bold,
            fontFamily: 'BonyadeKoodak',
          ),
        ),
      ],
    );
  }

  String _toPersianDigit(String input) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const persian = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];
    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(english[i], persian[i]);
    }
    return input;
  }

  Widget _buildProgressBar() {
    if (reminder.type == ReminderType.kilometer) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4.r),
          child: LinearProgressIndicator(
            value: reminder.progress,
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation<Color>(reminder.progressColor),
            minHeight: 8.h,
          ),
        ),
      ],
    );
  }
}
