import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/resources/consts.dart';
import '../../../../core/themes/theme_main.dart';
import '../../../../core/widgets/app_bottom_sheet.dart';
import '../../../../core/widgets/cstm_snakbar.dart';
import '../../domain/entity/appointments_entity.dart';
import 'appointment_status_chip.dart';
import 'comment_input_bottom_sheet.dart';

class AppointmentDetailsSheet {
  static String toPersianDigit(String input) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const persian = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];
    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(english[i], persian[i]);
    }
    return input;
  }

  static void show(BuildContext context, {required AppointmentsEntity appointment, required bool isRepairman}) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    AppBottomSheet.show(
      context,
      title: 'جزئیات نوبت',
      icon: Icons.info_outline_rounded,
      isScrollable: true,
      initialChildSize: 0.6,
      minChildSize: 0.45,
      maxChildSize: 0.75,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Header Section (Repairman or User)
          _buildSectionHeader(context, isRepairman ? 'اطلاعات مشتری' : 'واحد خدماتی', isRepairman ? Icons.person_rounded : Icons.store_rounded),
          SizedBox(height: 16.h),
          isRepairman ? _buildUserHeader(context, appointment) : _buildRepairmanHeader(context, appointment),

          SizedBox(height: 32.h),

          // 2. Main Appointment Info Card
          _buildSectionHeader(context, 'زمان و وضعیت نوبت', Icons.event_note_rounded),
          SizedBox(height: 16.h),
          Container(
            padding: EdgeInsets.all(20.r),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(24.r),
              border: Border.all(color: colorScheme.outline.withValues(alpha: 0.1)),
              boxShadow: [
                BoxShadow(
                  color: colorScheme.onSurface.withValues(alpha: 0.02),
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                _buildInfoRow(
                  context,
                  icon: Icons.calendar_today_rounded,
                  label: 'تاریخ نوبت',
                  value: appointment.jalaliDate != null
                      ? toPersianDigit(appointment.jalaliDate!)
                      : (appointment.date != null ? toPersianDigit(appointment.date!) : '—'),
                  color: colorScheme.primary,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: Divider(height: 1, color: colorScheme.outline.withValues(alpha: 0.05)),
                ),
                _buildInfoRow(
                  context,
                  icon: Icons.access_time_rounded,
                  label: 'زمان مراجعه',
                  value: toPersianDigit(appointment.time),
                  color: colorScheme.primary,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: Divider(height: 1, color: colorScheme.outline.withValues(alpha: 0.05)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.shield_outlined, size: 18.sp, color: colorScheme.onSurfaceVariant),
                        SizedBox(width: 12.w),
                        Text(
                          'وضعیت نوبت',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: colorScheme.onSurface.withValues(alpha: 0.4),
                            fontFamily: 'BonyadeKoodak',
                          ),
                        ),
                      ],
                    ),
                    AppointmentStatusChip(status: appointment.status),
                  ],
                ),
              ],
            ),
          ),

          // Rating section
          if (!isRepairman && appointment.status == AppointmentStatus.completed) ...[
            SizedBox(height: 24.h),
            _buildSectionHeader(context, 'امتیاز به تعمیرگاه', Icons.star_outline_rounded),
            SizedBox(height: 16.h),
            Container(
              padding: EdgeInsets.all(20.r),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    colorScheme.primary.withValues(alpha: 0.08),
                    colorScheme.primary.withValues(alpha: 0.02),
                  ],
                ),
                borderRadius: BorderRadius.circular(24.r),
                border: Border.all(color: colorScheme.primary.withValues(alpha: 0.1)),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10.r),
                        decoration: BoxDecoration(
                          color: colorScheme.surface,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.rate_review_rounded, color: colorScheme.primary, size: 20.sp),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ثبت بازخورد و ارزیابی نوبت',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: colorScheme.onSurface,
                                fontFamily: 'BonyadeKoodak',
                              ),
                            ),
                            SizedBox(height: 2.h),
                            Text(
                              'مشارکت شما در ارزیابی نوبت، موجب ارتقای سطح کیفی خدمات خواهد بود',
                              style: TextStyle(
                                fontSize: 11.sp,
                                color: colorScheme.onSurface.withValues(alpha: 0.5),
                                fontFamily: 'BonyadeKoodak',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Future.delayed(const Duration(milliseconds: 300), () {
                        if (context.mounted) {
                          if (appointment.repairmanId != null) {
                            CommentInputBottomSheet.show(
                              context,
                              shopName: appointment.repairmanName ?? 'تعمیرکار',
                              repairmanId: appointment.repairmanId!,
                            );
                          } else {
                            CstmSnackBar.showError(context, 'خطا: شناسه تعمیرکار یافت نشد');
                          }
                        }
                      });
                    },
                    borderRadius: BorderRadius.circular(16.r),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      decoration: BoxDecoration(
                        color: colorScheme.surface,
                        borderRadius: BorderRadius.circular(16.r),
                        boxShadow: [
                          BoxShadow(
                            color: colorScheme.primary.withValues(alpha: 0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.star_rounded, color: StatusColors.of(context).warning, size: 18.sp),
                          SizedBox(width: 8.w),
                          Text(
                            'ثبت دیدگاه و امتیاز',
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w900,
                              color: colorScheme.primary,
                              fontFamily: 'BonyadeKoodak',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],

          SizedBox(height: 32.h),

          // 3. Service Description Section
          if (appointment.description != null && appointment.description!.isNotEmpty) ...[
            _buildSectionHeader(context, 'توضیحات و یادداشت', Icons.description_rounded),
            SizedBox(height: 16.h),
            Container(
              padding: EdgeInsets.all(20.r),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(24.r),
                border: Border.all(color: colorScheme.outline.withValues(alpha: 0.1)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 4.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: colorScheme.primary.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(2.r),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Text(
                      appointment.description!,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: colorScheme.onSurface.withValues(alpha: 0.7),
                        height: 1.6,
                        fontFamily: 'BonyadeKoodak',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h),
          ],

          // 4. Location Card
          _buildSectionHeader(context, isRepairman ? 'آدرس مشتری' : 'اطلاعات و آدرس واحد', Icons.location_on_rounded),
          SizedBox(height: 16.h),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(28.r),
              border: Border.all(color: colorScheme.outline.withValues(alpha: 0.1)),
              boxShadow: [
                BoxShadow(
                  color: colorScheme.primary.withValues(alpha: 0.03),
                  blurRadius: 30,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: isRepairman
                      ? null
                      : () {
                          final lat = isRepairman ? appointment.userLat : appointment.repairmanLat;
                          final lng = isRepairman ? appointment.userLng : appointment.repairmanLng;
                          if (lat != null && lng != null) {
                            _openMap(lat, lng);
                          }
                        },
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 16.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10.r),
                          decoration: BoxDecoration(
                            color: colorScheme.primary.withValues(alpha: 0.06),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Icon(Icons.location_on_rounded, size: 20.sp, color: colorScheme.primary),
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                isRepairman ? 'آدرس محل مراجعه' : 'آدرس تعمیرگاه / فروشگاه',
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  color: colorScheme.onSurface.withValues(alpha: 0.4),
                                  fontFamily: 'BonyadeKoodak',
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                (isRepairman ? appointment.userAddress : appointment.repairmanAddress) ?? '—',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: colorScheme.onSurface,
                                  height: 1.5,
                                  fontFamily: 'BonyadeKoodak',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 20.h),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10.r),
                        decoration: BoxDecoration(
                          color: colorScheme.primary.withValues(alpha: 0.06),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Icon(Icons.phone_rounded, size: 20.sp, color: colorScheme.primary),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              isRepairman ? 'شماره تماس مشتری' : 'شماره تماس واحد',
                              style: TextStyle(
                                fontSize: 11.sp,
                                color: colorScheme.onSurface.withValues(alpha: 0.4),
                                fontFamily: 'BonyadeKoodak',
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              toPersianDigit((isRepairman ? appointment.userMobile : appointment.repairmanMobile) ?? '—'),
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w900,
                                color: colorScheme.onSurface,
                                fontFamily: 'BonyadeKoodak',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Builder(builder: (context) {
                  if (isRepairman) return const SizedBox.shrink();
                  final lat = isRepairman ? appointment.userLat : appointment.repairmanLat;
                  final lng = isRepairman ? appointment.userLng : appointment.repairmanLng;
                  if (lat != null && lng != null) {
                    return InkWell(
                      onTap: () => _openMap(lat, lng),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        decoration: BoxDecoration(
                          color: colorScheme.primary,
                          borderRadius: BorderRadius.vertical(bottom: Radius.circular(28.r)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.map_rounded, size: 20.sp, color: colorScheme.surface),
                            SizedBox(width: 12.w),
                            Text(
                              'مشاهده روی نقشه و مسیریابی',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w900,
                                color: colorScheme.surface,
                                fontFamily: 'BonyadeKoodak',
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                }),
              ],
            ),
          ),

          SizedBox(height: 40.h),
        ],
      ),
    );
  }

  static Widget _buildSectionHeader(BuildContext context, String title, IconData icon) {
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      children: [
        Icon(icon, size: 18.sp, color: colorScheme.primary),
        SizedBox(width: 8.w),
        Text(
          title,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w900,
            color: colorScheme.onSurface.withValues(alpha: 0.87),
            fontFamily: 'BonyadeKoodak',
          ),
        ),
      ],
    );
  }

  static Widget _buildInfoRow(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, size: 18.sp, color: colorScheme.onSurfaceVariant),
            SizedBox(width: 12.w),
            Text(
              label,
              style: TextStyle(
                fontSize: 12.sp,
                color: colorScheme.onSurface.withValues(alpha: 0.4),
                fontFamily: 'BonyadeKoodak',
              ),
            ),
          ],
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w900,
            color: colorScheme.onSurface.withValues(alpha: 0.87),
            fontFamily: 'BonyadeKoodak',
          ),
        ),
      ],
    );
  }

  static Widget _buildRepairmanHeader(BuildContext context, AppointmentsEntity appointment) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Container(
          width: 100.r,
          height: 100.r,
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(28.r),
            boxShadow: [
              BoxShadow(
                color: colorScheme.primary.withValues(alpha: 0.08),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
            border: Border.all(color: colorScheme.outline.withValues(alpha: 0.1)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(28.r),
            child: appointment.repairmanImageId != null && appointment.repairmanImageId!.isNotEmpty
                ? CachedNetworkImage(
                    imageUrl: '${Consts.baseFileUrl}${appointment.repairmanImageId}',
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(color: colorScheme.surfaceContainerLow),
                    errorWidget: (context, url, error) => Icon(Icons.store_rounded, color: colorScheme.primary.withValues(alpha: 0.2), size: 45.sp),
                  )
                : Icon(Icons.store_rounded, size: 45.sp, color: colorScheme.primary.withValues(alpha: 0.2)),
          ),
        ),
        SizedBox(width: 20.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                appointment.repairmanName ?? 'تعمیرکار زینو',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w900,
                  color: colorScheme.onSurface,
                  fontFamily: 'BonyadeKoodak',
                ),
              ),
              SizedBox(height: 6.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: colorScheme.primary.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  appointment.repairmanAddress?.split('،').first ?? 'تعمیرگاه مجاز',
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary,
                    fontFamily: 'BonyadeKoodak',
                  ),
                ),
              ),
            ],
          ),
        ),
        if (appointment.repairmanMobile != null)
          Material(
            color: colorScheme.primary,
            borderRadius: BorderRadius.circular(18.r),
            elevation: 4,
            shadowColor: colorScheme.primary.withValues(alpha: 0.3),
            child: InkWell(
              onTap: () => launchUrl(Uri.parse('tel:${appointment.repairmanMobile}')),
              borderRadius: BorderRadius.circular(18.r),
              child: Container(
                padding: EdgeInsets.all(14.r),
                child: Icon(Icons.call_rounded, color: colorScheme.surface, size: 24.sp),
              ),
            ),
          ),
      ],
    );
  }

  static Widget _buildUserHeader(BuildContext context, AppointmentsEntity appointment) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Container(
          width: 100.r,
          height: 100.r,
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(28.r),
            boxShadow: [
              BoxShadow(
                color: colorScheme.primary.withValues(alpha: 0.08),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
            border: Border.all(color: colorScheme.outline.withValues(alpha: 0.1)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(28.r),
            child: appointment.userImageId != null && appointment.userImageId!.isNotEmpty
                ? CachedNetworkImage(
                    imageUrl: '${Consts.baseFileUrl}${appointment.userImageId}',
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(color: colorScheme.surfaceContainerLow),
                    errorWidget: (context, url, error) => Icon(Icons.person_rounded, color: colorScheme.primary.withValues(alpha: 0.2), size: 45.sp),
                  )
                : Icon(Icons.person_rounded, size: 45.sp, color: colorScheme.primary.withValues(alpha: 0.2)),
          ),
        ),
        SizedBox(width: 20.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                appointment.userName ?? 'کاربر زینو',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w900,
                  color: colorScheme.onSurface,
                  fontFamily: 'BonyadeKoodak',
                ),
              ),
              SizedBox(height: 6.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: colorScheme.primary.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  appointment.userMobile != null ? toPersianDigit(appointment.userMobile!) : 'بدون شماره',
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary,
                    fontFamily: 'BonyadeKoodak',
                  ),
                ),
              ),
            ],
          ),
        ),
        if (appointment.userMobile != null)
          Material(
            color: colorScheme.primary,
            borderRadius: BorderRadius.circular(18.r),
            elevation: 4,
            shadowColor: colorScheme.primary.withValues(alpha: 0.3),
            child: InkWell(
              onTap: () => launchUrl(Uri.parse('tel:${appointment.userMobile}')),
              borderRadius: BorderRadius.circular(18.r),
              child: Container(
                padding: EdgeInsets.all(14.r),
                child: Icon(Icons.call_rounded, color: colorScheme.surface, size: 24.sp),
              ),
            ),
          ),
      ],
    );
  }

  static Future<void> _openMap(double lat, double lng) async {
    final url = Uri.parse('https://www.google.com/maps/search/?api=1&query=$lat,$lng');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }
}
