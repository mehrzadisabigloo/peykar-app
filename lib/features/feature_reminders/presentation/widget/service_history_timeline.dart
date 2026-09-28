import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../domain/entity/reminders_entity.dart';
import '../../../../core/utils/extensions.dart';

class ServiceHistoryTimeline extends StatelessWidget {
  final RemindersEntity reminder;

  const ServiceHistoryTimeline({super.key, required this.reminder});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final hasRealLogs = (reminder.type == ReminderType.time &&
            ((reminder.timeLogsJalali != null && reminder.timeLogsJalali!.isNotEmpty) ||
                (reminder.timeLogs != null && reminder.timeLogs!.isNotEmpty))) ||
        (reminder.type == ReminderType.kilometer &&
            ((reminder.kilometerLogsJalali != null && reminder.kilometerLogsJalali!.isNotEmpty) ||
                (reminder.kilometerLogs != null && reminder.kilometerLogs!.isNotEmpty)));

    if (!hasRealLogs) {
      return _buildEmptyState(colorScheme);
    }

    List<dynamic> logs = [];
    if (reminder.type == ReminderType.time) {
      logs = reminder.timeLogsJalali ?? reminder.timeLogs!;
    } else {
      logs = reminder.kilometerLogsJalali ?? reminder.kilometerLogs!;
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: logs.length,
      padding: EdgeInsets.zero,
      separatorBuilder: (context, index) => Divider(
        height: 48.h,
        color: colorScheme.outlineVariant.withValues(alpha: 0.1),
      ),
      itemBuilder: (context, index) {
        final log = logs[index];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  reminder.type == ReminderType.time
                      ? 'سرویس دوره ${(logs.length - index).toPersianDigit}'
                      : 'ثبت کارکرد ${(logs.length - index).toPersianDigit}',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w900,
                    color: colorScheme.onSurface,
                    fontFamily: 'BonyadeKoodak',
                  ),
                ),
                Text(
                  (reminder.type == ReminderType.time ? log.doneDate.toString() : log.date.toString()).toPersianDigit,
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
                    fontFamily: 'BonyadeKoodak',
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),

            // Content: Soft Row Layout
            Container(
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: reminder.progressColor.withValues(alpha: 0.04),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Row(
                children: [
                  if (reminder.type == ReminderType.time) ...[
                    _buildSoftStat(context, 'تاریخ انجام', log.doneDate.toString().toPersianDigit, Icons.history_rounded),
                    _buildVerticalDivider(reminder.progressColor),
                    _buildSoftStat(context, 'تاریخ یادآوری', log.nextDate.toString().toPersianDigit, Icons.event_note_rounded, isAccent: true),
                  ] else ...[
                    _buildSoftStat(context, 'از (کیلومتر انجام)', '${log.doneKm.toString().toPersianDigit} کیلومتر', Icons.speed_rounded),
                    _buildVerticalDivider(reminder.progressColor),
                    _buildSoftStat(context, 'تا (کیلومتر بعدی)', '${log.nextKm.toString().toPersianDigit} کیلومتر', Icons.flag_rounded, isAccent: true),
                  ],
                ],
              ),
            ),

            // Service Items
            if (log.items != null && (log.items as List).isNotEmpty) ...[
              SizedBox(height: 12.h),
              Wrap(
                spacing: 8.w,
                runSpacing: 8.h,
                children: (log.items as List<String>).map((item) => _buildMinimalPill(context, item, reminder.progressColor)).toList(),
              ),
            ],
          ],
        );
      },
    );
  }

  Widget _buildSoftStat(BuildContext context, String label, String value, IconData icon, {bool isAccent = false}) {
    final colorScheme = Theme.of(context).colorScheme;
    final color = isAccent ? reminder.progressColor : colorScheme.onSurfaceVariant.withValues(alpha: 0.6);

    return Expanded(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 12.sp, color: color.withValues(alpha: 0.5)),
              SizedBox(width: 6.w),
              Text(
                label,
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
                  fontFamily: 'BonyadeKoodak',
                ),
              ),
            ],
          ),
          SizedBox(height: 6.h),
          Text(
            value,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w900,
              color: isAccent ? reminder.progressColor : colorScheme.onSurface,
              fontFamily: 'BonyadeKoodak',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVerticalDivider(Color accentColor) {
    return Container(
      width: 1.w,
      height: 24.h,
      color: accentColor.withValues(alpha: 0.1),
    );
  }

  Widget _buildMinimalPill(BuildContext context, String text, Color accentColor) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: accentColor.withValues(alpha: 0.1)),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.bold,
          color: colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
          fontFamily: 'BonyadeKoodak',
        ),
      ),
    );
  }

  Widget _buildEmptyState(ColorScheme colorScheme) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 40.h),
      child: Center(
        child: Text(
          'هنوز سوابقی ثبت نشده است',
          style: TextStyle(
            color: colorScheme.onSurfaceVariant.withValues(alpha: 0.3),
            fontFamily: 'BonyadeKoodak',
            fontSize: 13.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
