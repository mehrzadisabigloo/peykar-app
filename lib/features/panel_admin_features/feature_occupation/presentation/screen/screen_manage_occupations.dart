import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturant_app/core/widgets/empty_state_widget.dart';
import 'package:resturant_app/core/widgets/error_state_widget.dart';
import 'package:resturant_app/core/widgets/list_shimmer.dart';
import '../../../../../../core/bloc/app/app_bloc.dart';
import '../../../../../../core/bloc/error/error_bloc.dart';
import '../../../../../../core/services/locator.dart';
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
      backgroundColor: const Color(0xFFF8F9FB),
      body: BlocConsumer<OccupationBloc, OccupationState>(
        listener: (context, state) {
          if (state is OccupationActionSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message), backgroundColor: Colors.green),
            );
            bloc.add(const FetchOccupationsEvent());
          }
          if (state is OccupationError && state.message.isNotEmpty) {
             // We only show snackbar for errors that happen during actions, 
             // for initial load errors we use the ErrorStateWidget in the builder.
             // However, some apps show both. Standardizing on builder for now if it's a major error.
          }
        },
        builder: (context, state) {
          if (state is OccupationLoading) {
            return const ListShimmer(height: 100);
          }

          if (state is OccupationError) {
            return ErrorStateWidget(
              message: state.message,
              onRetry: () => bloc.add(const FetchOccupationsEvent()),
            );
          }

          if (state is OccupationsLoaded) {
            final occupations = state.occupations;
            if (occupations.isEmpty) {
              return const EmptyStateWidget(
                title: 'هیچ شغلی ثبت نشده است',
                description: 'لیست مشاغل در حال حاضر خالی است.',
                icon: Icons.work_outline_rounded,
              );
            }

            return RefreshIndicator(
              onRefresh: () async => bloc.add(const FetchOccupationsEvent()),
              child: ListView.builder(
                padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 100.h),
                itemCount: occupations.length,
                itemBuilder: (context, index) {
                  final occupation = occupations[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 16.h),
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.03),
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
                              onPressed: () => bloc.add(MoveOccupationUpEvent(occupation.id!)),
                              icon: const Icon(Icons.keyboard_arrow_up_rounded),
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                            ),
                            Text(
                              '${occupation.sortOrder}',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: colorScheme.primary,
                              ),
                            ),
                            IconButton(
                              onPressed: () => bloc.add(MoveOccupationDownEvent(occupation.id!)),
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
                        Switch(
                          value: occupation.isActive,
                          onChanged: (value) => bloc.add(ChangeOccupationStatusEvent(occupation.id!)),
                          activeThumbColor: colorScheme.primary,
                        ),
                      ],
                    ),
                  );
                },
              ),
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
        color: isActive ? Colors.green.withValues(alpha: 0.1) : Colors.orange.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Text(
        isActive ? 'فعال' : 'غیرفعال',
        style: TextStyle(
          color: isActive ? Colors.green : Colors.orange,
          fontSize: 10.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
