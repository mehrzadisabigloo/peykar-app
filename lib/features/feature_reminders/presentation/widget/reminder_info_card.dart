import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../domain/entity/reminders_entity.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/themes/theme_main.dart';

class ReminderInfoCard extends StatelessWidget {
  final RemindersEntity reminder;

  const ReminderInfoCard({super.key, required this.reminder});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final reminderColors = theme.extension<ReminderColors>()!;

    Color accentColor = reminder.progressColor;

    // Use theme colors as fallback/override for default type colors
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
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(32.r),
        boxShadow: [
          BoxShadow(
            color: accentColor.withValues(alpha: 0.12),
            blurRadius: 40,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(24.r),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 72.r,
                      height: 72.r,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            accentColor.withValues(alpha: 0.2),
                            accentColor.withValues(alpha: 0.05),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                      child: Center(
                        child: Icon(
                          reminder.type == ReminderType.time ? Icons.access_time_filled_rounded : Icons.speed_rounded,
                          color: accentColor,
                          size: 32.sp,
                        ),
                      ),
                    ),
                    SizedBox(width: 18.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            reminder.reminderTypeTitle ?? reminder.title,
                            style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'BonyadeKoodak',
                              color: colorScheme.onSurface,
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Text(
                            reminder.description.isEmpty ? 'بدون توضیحات اضافی' : reminder.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'BonyadeKoodak',
                              color: colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                            decoration: BoxDecoration(
                              color: accentColor.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Text(
                              reminder.type == ReminderType.time ? 'سرویس دوره‌ای' : 'سرویس کیلومتری',
                              style: TextStyle(
                                color: accentColor,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'BonyadeKoodak',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                if (reminder.type == ReminderType.time) ...[
                  SizedBox(height: 28.h),
                  _buildProgressSection(theme, accentColor),
                ],
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.r),
            decoration: BoxDecoration(
              color: accentColor.withValues(alpha: 0.04),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(32.r)),
            ),
            child: Row(
              children: [
                if (reminder.type == ReminderType.time) ...[
                  _buildCompactInfo(
                    context,
                    'آخرین وضعیت',
                    reminder.remainingText.toPersianDigit,
                    Icons.auto_graph_rounded,
                    accentColor,
                  ),
                  Container(width: 1.w, height: 32.h, color: accentColor.withValues(alpha: 0.1)),
                ],
                _buildCompactInfo(
                  context,
                  'موعد بعدی',
                  _getNextServiceInfo(),
                  Icons.event_note_rounded,
                  accentColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getNextServiceInfo() {
    if (reminder.type == ReminderType.time) {
      final logs = reminder.timeLogsJalali ?? reminder.timeLogs;
      if (logs != null && logs.isNotEmpty) {
        return logs.first.nextDate.toPersianDigit;
      }
    } else {
      final logs = reminder.kilometerLogsJalali ?? reminder.kilometerLogs;
      if (logs != null && logs.isNotEmpty) {
        return "${logs.first.nextKm.toString().toPersianDigit} کیلومتر";
      }
    }
    return 'ثبت نشده';
  }

  Widget _buildProgressSection(ThemeData theme, Color accentColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'میزان مصرف',
              style: TextStyle(
                fontSize: 13.sp,
                color: theme.colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.bold,
                fontFamily: 'BonyadeKoodak',
              ),
            ),
            Text(
              '${(reminder.progress * 100).toInt().toPersianDigit}٪',
              style: TextStyle(
                fontSize: 14.sp,
                color: accentColor,
                fontWeight: FontWeight.w900,
                fontFamily: 'BonyadeKoodak',
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Stack(
          children: [
            Container(
              height: 12.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: theme.colorScheme.outlineVariant.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              height: 12.h,
              width: (1.sw - 88.w) * reminder.progress,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    accentColor,
                    accentColor.withValues(alpha: 0.6),
                  ],
                ),
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                    color: accentColor.withValues(alpha: 0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCompactInfo(BuildContext context, String label, String value, IconData icon, Color accentColor, {Color? valueColor}) {
    final theme = Theme.of(context);
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 18.sp, color: accentColor.withValues(alpha: 0.5)),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 10.sp,
                  color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
                  fontFamily: 'BonyadeKoodak',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                value,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13.sp,
                  color: valueColor ?? theme.colorScheme.onSurface,
                  fontFamily: 'BonyadeKoodak',
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
