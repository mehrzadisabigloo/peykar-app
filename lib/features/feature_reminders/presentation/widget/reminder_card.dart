import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../domain/entity/reminders_entity.dart';
import '../../../../core/themes/theme_main.dart';

class ReminderCard extends StatelessWidget {
  final RemindersEntity reminder;
  final VoidCallback? onTap;

  const ReminderCard({super.key, required this.reminder, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final reminderColors = theme.extension<ReminderColors>()!;
    
    Color accentColor = reminder.progressColor;
    // Map semantic colors from entity to theme colors
    if (accentColor.value == Colors.blue.value || 
        accentColor.value == const Color(0xFF3F51B5).value) {
      accentColor = reminderColors.timeColor;
    } else if (accentColor.value == Colors.orange.value || 
               accentColor.value == const Color(0xFFE65100).value) {
      accentColor = reminderColors.kilometerColor;
    } else if (accentColor.value == Colors.red.value) {
      accentColor = colorScheme.error;
    }

    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.04),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: InkWell(
          onTap: onTap,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16.r),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildImage(context),
                    SizedBox(width: 12.w),
                    Expanded(child: _buildDetails(theme, accentColor)),
                    _buildTypeIcon(theme),
                  ],
                ),
              ),
              _buildProgressBar(theme, accentColor),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTypeIcon(ThemeData theme) {
    final bool isTime = reminder.type == ReminderType.time;
    final reminderColors = theme.extension<ReminderColors>()!;
    final Color color = isTime ? reminderColors.timeColor : reminderColors.kilometerColor;
    
    return Container(
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(
        isTime ? Icons.access_time_filled_rounded : Icons.speed_rounded,
        size: 18.sp,
        color: color,
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 56.r,
      height: 56.r,
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: reminder.imageUrl != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: CachedNetworkImage(
                imageUrl: reminder.imageUrl!,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  color: theme.colorScheme.outlineVariant,
                ),
                errorWidget: (context, url, error) => Icon(Icons.image_not_supported_outlined, color: theme.colorScheme.outline),
              ),
            )
          : Icon(Icons.notifications_active_outlined, size: 28.sp, color: theme.colorScheme.outline),
    );
  }

  Widget _buildDetails(ThemeData theme, Color accentColor) {
    String subtitle = reminder.description;
    
    final timeLogs = reminder.timeLogsJalali ?? reminder.timeLogs;
    final kmLogs = reminder.kilometerLogsJalali ?? reminder.kilometerLogs;

    if (reminder.type == ReminderType.time && timeLogs?.isNotEmpty == true) {
      subtitle = "موعد بعدی: ${_toPersianDigit(timeLogs!.first.nextDate)}";
    } else if (reminder.type == ReminderType.kilometer && kmLogs?.isNotEmpty == true) {
      subtitle = "موعد بعدی: ${_toPersianDigit(kmLogs!.first.nextKm.toString())} کیلومتر";
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          reminder.reminderTypeTitle ?? reminder.title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: theme.colorScheme.onSurface.withValues(alpha: 0.87),
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
            color: theme.colorScheme.onSurface.withValues(alpha: 0.54),
            fontFamily: 'BonyadeKoodak',
          ),
        ),
        if(reminder.type == ReminderType.time)...[
          SizedBox(height: 10.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: accentColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Text(
              _toPersianDigit(reminder.remainingText),
              style: TextStyle(
                fontSize: 12.sp,
                color: accentColor,
                fontWeight: FontWeight.bold,
                fontFamily: 'BonyadeKoodak',
              ),
            ),
          ),
        ]

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

  Widget _buildProgressBar(ThemeData theme, Color accentColor) {
    if (reminder.type == ReminderType.kilometer) {
      return const SizedBox.shrink();
    }

    return LinearProgressIndicator(
      value: reminder.progress,
      backgroundColor: theme.colorScheme.outlineVariant,
      valueColor: AlwaysStoppedAnimation<Color>(accentColor),
      minHeight: 6.h,
    );
  }
}
