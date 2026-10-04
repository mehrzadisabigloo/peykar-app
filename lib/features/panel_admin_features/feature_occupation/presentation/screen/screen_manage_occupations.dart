import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chaharmahal_shop_front/core/widgets/empty_state_widget.dart';
import 'package:chaharmahal_shop_front/core/widgets/error_state_widget.dart';
import 'package:chaharmahal_shop_front/core/widgets/management_card_shimmer.dart';
import '../../../../../../core/bloc/app/app_bloc.dart';
import '../../../../../../core/bloc/error/error_bloc.dart';
import '../../../../../../core/services/locator.dart';
import '../../../../../../core/widgets/cstm_snakbar.dart';
import '../../../../../../core/themes/theme_main.dart';
import '../base/base_occupation_stateful_widget_state.dart';
import '../bloc/occupation_bloc.dart';
import '../bloc/occupation_event.dart';
import '../bloc/occupation_state.dart';

class ScreenManageOccupations extends StatefulWidget {
  const ScreenManageOccupations({super.key});

  @override
  State<ScreenManageOccupations> createState() => _ScreenManageOccupationsState();
}

class _ScreenManageOccupationsState extends BaseOccupationStatefulWidgetState<ScreenManageOccupations, OccupationBloc> {
  _ScreenManageOccupationsState() : super(locator<OccupationBloc>());

  @override
  void initState() {
    super.initState();
    bloc.add(const FetchOccupationsEvent());
  }

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      body: BlocConsumer<OccupationBloc, OccupationState>(
        listener: (context, state) {
          if (state is OccupationsLoaded) {
            if (state.successMessage != null) {
              CstmSnackBar.showSuccess(context, state.successMessage!);
            }
            if (state.errorMessage != null) {
              CstmSnackBar.showError(context, state.errorMessage!);
            }
          }
          if (state is OccupationActionSuccess) {
            CstmSnackBar.showSuccess(context, state.message);
            bloc.add(const FetchOccupationsEvent());
          }
        },
        builder: (context, state) {
          if (state is OccupationInitial || state is OccupationLoading) {
            return ListView.builder(
              padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 100.h),
              itemCount: 5,
              itemBuilder: (context, index) => const ManagementCardShimmer(height: 100),
            );
          }

          if (state is OccupationError) {
            return ErrorStateWidget(
              message: state.message,
              onRetry: () => bloc.add(const FetchOccupationsEvent()),
            );
          }

          if (state is OccupationsLoaded) {
            final occupations = state.occupationList.occupations;
            if (occupations.isEmpty) {
              return const EmptyStateWidget(
                title: 'هیچ شغلی ثبت نشده است',
                description: 'لیست مشاغل در حال حاضر خالی است.',
                icon: Icons.work_outline_rounded,
              );
            }

            return ListView.builder(
                padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 100.h),
                itemCount: occupations.length,
                itemBuilder: (context, index) {
                  final occupation = occupations[index];
                  final isOrderProcessing = state is OccupationsLoaded && state.orderProcessingId == occupation.id;
                  final isStatusProcessing = state is OccupationsLoaded && state.statusProcessingId == occupation.id;

                  return Container(
                    margin: EdgeInsets.only(bottom: 16.h),
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(24.r),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.03),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: (isOrderProcessing || isStatusProcessing) ? null : () => bloc.add(MoveOccupationUpEvent(occupation.id!)),
                              icon: const Icon(Icons.keyboard_arrow_up_rounded),
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                            ),
                            isOrderProcessing
                              ? SizedBox(
                                  width: 12.sp,
                                  height: 12.sp,
                                  child: CircularProgressIndicator(strokeWidth: 2, color: colorScheme.primary),
                                )
                              : Text(
                                  '${occupation.sortOrder}',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                    color: colorScheme.primary,
                                  ),
                                ),
                            IconButton(
                              onPressed: (isOrderProcessing || isStatusProcessing) ? null : () => bloc.add(MoveOccupationDownEvent(occupation.id!)),
                              icon: const Icon(Icons.keyboard_arrow_down_rounded),
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                            ),
                          ],
                        ),
                        SizedBox(width: 12.w),
                        Container(
                          padding: EdgeInsets.all(10.r),
                          decoration: BoxDecoration(
                            color: colorScheme.primary.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Icon(Icons.work_outline_rounded, color: colorScheme.primary, size: 22.sp),
                        ),
                        SizedBox(width: 14.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                occupation.title ?? 'بدون عنوان',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w900,
                                  color: colorScheme.onSurface,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              _buildStatusBadge(occupation.isActive),
                            ],
                          ),
                        ),
                        isStatusProcessing
                            ? Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12.w),
                                child: SizedBox(
                                  width: 20.sp,
                                  height: 20.sp,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: colorScheme.primary,
                                  ),
                                ),
                              )
                            : Switch(
                                value: occupation.isActive,
                                onChanged: isOrderProcessing ? null : (value) => bloc.add(ChangeOccupationStatusEvent(occupation.id!)),
                                activeThumbColor: colorScheme.primary,
                                activeTrackColor: colorScheme.primary.withValues(alpha: 0.2),
                              ),
                      ],
                    ),
                  );
                },
              );
            }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildStatusBadge(bool isActive) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: isActive ? StatusColors.of(context).success.withValues(alpha: 0.1) : StatusColors.of(context).warning.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Text(
        isActive ? 'فعال' : 'غیرفعال',
        style: TextStyle(
          color: isActive ? StatusColors.of(context).success : StatusColors.of(context).warning,
          fontSize: 10.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
