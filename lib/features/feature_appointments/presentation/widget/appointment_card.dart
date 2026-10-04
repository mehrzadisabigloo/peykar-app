import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/consts.dart';
import '../../../../core/themes/theme_main.dart';
import '../../domain/entity/appointments_entity.dart';
import '../bloc/appointments_bloc.dart';
import 'appointment_action_buttons.dart';
import 'appointment_details_sheet.dart';
import 'appointment_status_chip.dart';

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
        onTap: () => AppointmentDetailsSheet.show(context, appointment: appointment, isRepairman: isRepairman),
        borderRadius: BorderRadius.circular(20.r),
        child: _buildUserModeCard(context, theme),
      );
    }

    return InkWell(
      onTap: () => AppointmentDetailsSheet.show(context, appointment: appointment, isRepairman: isRepairman),
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
                SizedBox(width: 10.w),
                AppointmentStatusChip(status: appointment.status),
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
                          child: AppointmentActionButton(
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
                          child: AppointmentActionButton(
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

                    return AppointmentActionButton(
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
                            AppointmentDetailsSheet.toPersianDigit(appointment.time),
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
          AppointmentStatusChip(status: appointment.status, isFooter: true),
        ],
      ),
    );
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
                color: colorScheme.onSurface.withValues(alpha: 0.4),
              ),
              SizedBox(width: 4.w),
              Expanded(
                child: Text(
                  isRepairman
                      ? (appointment.userMobile != null ? AppointmentDetailsSheet.toPersianDigit(appointment.userMobile!) : '—')
                      : appointment.subTitle,
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
                AppointmentDetailsSheet.toPersianDigit(appointment.time),
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
}
