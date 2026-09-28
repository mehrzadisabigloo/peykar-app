import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/resources/consts.dart';
import '../../../../core/widgets/app_bottom_sheet.dart';
import '../../domain/entity/appointments_entity.dart';
import '../bloc/appointments_bloc.dart';
import 'comment_input_bottom_sheet.dart';
import '../../../../core/widgets/cstm_snakbar.dart';
import '../../../../core/themes/theme_main.dart';

class AppointmentCard extends StatelessWidget {
  final AppointmentsEntity appointment;
  final bool isRepairman;

  const AppointmentCard({
    super.key,
    required this.appointment,
    this.isRepairman = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    if (!isRepairman) {
      return InkWell(
        onTap: () => _showDetails(context),
        borderRadius: BorderRadius.circular(20.r),
        child: _buildUserModeCard(context, theme),
      );
    }

    return InkWell(
      onTap: () => _showDetails(context),
      borderRadius: BorderRadius.circular(24.r),
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h, left: 20.w, right: 20.w),
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(24.r),
          boxShadow: [
            BoxShadow(
              color: colorScheme.onSurface.withValues(alpha: 0.04),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                _buildCenterSection(theme),
                SizedBox(
                  width: 10.w,
                ),
                // const Spacer(),
                _buildLeftSection(context, colorScheme),
              ],
            ),
            if (isRepairman) ...[
              if (appointment.status == AppointmentStatus.pending) ...[
                SizedBox(height: 16.h),
                Divider(color: theme.colorScheme.onSurface.withValues(alpha: 0.05)),
                SizedBox(height: 12.h),
                BlocBuilder<AppointmentsBloc, AppointmentsState>(
                  builder: (context, state) {
                    final isProcessing = state is AppointmentsLoaded && state.processingAppointmentId == appointment.id;
                    final processingAction = state is AppointmentsLoaded ? state.processingAction : null;

                    return Row(
                      children: [
                        Expanded(
                          child: _buildActionButton(
                            onTap: isProcessing
                                ? () {}
                                : () => context.read<AppointmentsBloc>().add(AcceptAppointmentEvent(appointment.id)),
                            label: 'مراجعه',
                            icon: Icons.check_circle_outline_rounded,
                            color: StatusColors.of(context).success,
                            isLoading: isProcessing && processingAction == 'accept',
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: _buildActionButton(
                            onTap: isProcessing
                                ? () {}
                                : () => context.read<AppointmentsBloc>().add(DeclineAppointmentEvent(appointment.id)),
                            label: 'عدم مراجعه',
                            icon: Icons.cancel_outlined,
                            color: theme.colorScheme.error,
                            isLoading: isProcessing && processingAction == 'decline',
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ] else if (appointment.status == AppointmentStatus.confirmed) ...[
                SizedBox(height: 16.h),
                Divider(color: theme.colorScheme.onSurface.withValues(alpha: 0.05)),
                SizedBox(height: 12.h),
                BlocBuilder<AppointmentsBloc, AppointmentsState>(
                  builder: (context, state) {
                    final isProcessing = state is AppointmentsLoaded && state.processingAppointmentId == appointment.id;
                    final processingAction = state is AppointmentsLoaded ? state.processingAction : null;

                    return _buildActionButton(
                      onTap: isProcessing
                          ? () {}
                          : () => context.read<AppointmentsBloc>().add(CompleteAppointmentEvent(appointment.id)),
                      label: 'تکمیل نوبت',
                      icon: Icons.task_alt_rounded,
                      color: theme.colorScheme.primary,
                      isFullWidth: true,
                      isLoading: isProcessing && processingAction == 'complete',
                    );
                  },
                ),
              ],
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildUserModeCard(BuildContext context, ThemeData theme) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h, left: 20.w, right: 20.w),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(32.r),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.03),
            blurRadius: 25,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20.r, 20.r, 20.r, 16.r),
            child: Row(
              children: [
                // Repairman Image
                Container(
                  width: 95.r,
                  height: 95.r,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainer,
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  child: appointment.repairmanImageId != null && appointment.repairmanImageId!.isNotEmpty
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(24.r),
                          child: CachedNetworkImage(
                            imageUrl: '${Consts.baseFileUrl}${appointment.repairmanImageId}',
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Container(color: theme.colorScheme.surfaceContainerLow),
                            errorWidget: (context, url, error) => Icon(Icons.person_outline_rounded, color: theme.colorScheme.outlineVariant, size: 45.sp),
                          ),
                        )
                      : Icon(Icons.person_outline_rounded, size: 45.sp, color: theme.colorScheme.outlineVariant),
                ),
                SizedBox(width: 16.w),
                // Details Column
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        appointment.repairmanName ?? 'واحد خدماتی',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w900,
                          color: theme.colorScheme.onSurface.withValues(alpha: 0.87),
                          fontFamily: 'BonyadeKoodak',
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Row(
                        children: [
                          Icon(Icons.location_on_rounded, size: 12.sp, color: theme.colorScheme.onSurface.withValues(alpha: 0.4)),
                          SizedBox(width: 4.w),
                          Expanded(
                            child: Text(
                              appointment.repairmanAddress ?? 'آدرس ثبت نشده است',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 11.sp,
                                color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                                fontWeight: FontWeight.bold,
                                fontFamily: 'BonyadeKoodak',
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 6.h),
                      Row(
                        children: [
                          Icon(Icons.access_time_rounded, size: 14.sp, color: theme.colorScheme.primary.withValues(alpha: 0.5)),
                          SizedBox(width: 6.w),
                          Text(
                            _toPersianDigit(appointment.time),
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w900,
                              color: theme.colorScheme.primary,
                              fontFamily: 'BonyadeKoodak',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Icon(Icons.arrow_forward_ios_rounded, size: 14.sp, color: theme.colorScheme.outlineVariant),
              ],
            ),
          ),
          // Minimal Professional Status Footer
          _buildStatusBadge(context, appointment.status, isFooter: true),
        ],
      ),
    );
  }

  Widget _buildLeftSection(BuildContext context, ColorScheme colorScheme) {
    return _buildStatusBadge(context, appointment.status);
  }

  Widget _buildCenterSection(ThemeData theme) {
    final colorScheme = theme.colorScheme;
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isRepairman ? (appointment.userName ?? 'کاربر زینو') : appointment.serviceName,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 6.h),
          Row(
            children: [
              Icon(
                  isRepairman ? Icons.phone_android_rounded : Icons.person_outline_rounded,
                  size: 14.sp,
                  color: colorScheme.onSurface.withValues(alpha: 0.4)),
              SizedBox(width: 4.w),
              Expanded(
                child: Text(
                  isRepairman ? (appointment.userMobile != null ? _toPersianDigit(appointment.userMobile!) : '—') : appointment.subTitle,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: colorScheme.onSurface.withValues(alpha: 0.5),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(height: 6.h),
          Row(
            children: [
              Icon(Icons.access_time_rounded, size: 14.sp, color: colorScheme.onSurface.withValues(alpha: 0.6)),
              SizedBox(width: 4.w),
              Text(
                _toPersianDigit(appointment.time),
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w900,
                  color: colorScheme.onSurface.withValues(alpha: 0.6),
                  fontFamily: 'BonyadeKoodak',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required VoidCallback onTap,
    required String label,
    required IconData icon,
    required Color color,
    bool isFullWidth = false,
    bool isLoading = false,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        width: isFullWidth ? double.infinity : null,
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: color.withValues(alpha: 0.1)),
        ),
        child: isLoading
            ? Center(
                child: SizedBox(
                  width: 20.sp,
                  height: 20.sp,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(color),
                  ),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, size: 18.sp, color: color),
                  SizedBox(width: 8.w),
                  Text(
                    label,
                    style: TextStyle(
                      color: color,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'BonyadeKoodak',
                    ),
                  ),
                ],
              ),
      ),
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

  Widget _buildStatusBadge(BuildContext context, AppointmentStatus status, {bool isFooter = false}) {
    final statusColors = StatusColors.of(context);
    Color color;
    String text;
    IconData icon;

    switch (status) {
      case AppointmentStatus.confirmed:
        color = statusColors.success;
        text = 'تأیید شده';
        icon = Icons.check_circle_rounded;
        break;
      case AppointmentStatus.pending:
        color = statusColors.warning;
        text = 'در انتظار تایید';
        icon = Icons.hourglass_empty_rounded;
        break;
      case AppointmentStatus.canceled:
        color = Theme.of(context).colorScheme.error;
        text = 'لغو شده';
        icon = Icons.cancel_rounded;
        break;
      case AppointmentStatus.completed:
        color = statusColors.info;
        text = 'تکمیل شده';
        icon = Icons.task_alt_rounded;
        break;
    }

    if (isFooter) {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.05),
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(32.r)),
          border: Border(top: BorderSide(color: color.withValues(alpha: 0.03))),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 14.sp, color: color.withValues(alpha: 0.7)),
            SizedBox(width: 8.w),
            Text(
              text,
              style: TextStyle(
                color: color.withValues(alpha: 0.8),
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                fontFamily: 'BonyadeKoodak',
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14.sp, color: color),
          SizedBox(width: 8.w),
          Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: 12.sp,
              fontWeight: FontWeight.w900,
              fontFamily: 'BonyadeKoodak',
            ),
          ),
        ],
      ),
    );
  }

  void _showDetails(BuildContext context) {
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
          isRepairman ? _buildUserHeader(context) : _buildRepairmanHeader(context),
          
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
                      ? _toPersianDigit(appointment.jalaliDate!) 
                      : (appointment.date != null ? _toPersianDigit(appointment.date!) : '—'),
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
                  value: _toPersianDigit(appointment.time),
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
                    _buildStatusBadge(context, appointment.status),
                  ],
                ),
              ],
            ),
          ),

          // 2.5 Rate Your Experience Card (New Placement)
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
                      Navigator.pop(context); // Close Detail Modal
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

          // 4. Location Card (Repairman mode shows User address, User mode shows Repairman address)
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
                // Address Row
                InkWell(
                  onTap: isRepairman ? null : () {
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
                // Phone Row
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
                              _toPersianDigit((isRepairman ? appointment.userMobile : appointment.repairmanMobile) ?? '—'),
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
                // Map Action
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

  Widget _buildInfoRow(
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

  Widget _buildRepairmanHeader(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Row(
      children: [
        // Image with refined border & shadow
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
        // Name & Brand
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
        // Primary Call Action
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

  Widget _buildUserHeader(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Row(
      children: [
        // Image with refined border & shadow
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
        // Name & Details
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
                  appointment.userMobile != null ? _toPersianDigit(appointment.userMobile!) : 'بدون شماره',
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
        // Primary Call Action
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

  Widget _buildSectionHeader(BuildContext context, String title, IconData icon) {
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

  Future<void> _openMap(double lat, double lng) async {
    final url = Uri.parse('https://www.google.com/maps/search/?api=1&query=$lat,$lng');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

}
