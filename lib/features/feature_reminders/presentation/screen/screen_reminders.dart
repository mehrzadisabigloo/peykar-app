import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/bloc/app/app_bloc.dart';
import '../../../../core/bloc/error/error_bloc.dart';
import '../../../../core/services/locator.dart';
import '../../../../core/widgets/cstm_snakbar.dart';
import '../../../../core/widgets/empty_state_widget.dart';
import '../../../../core/widgets/error_state_widget.dart';
import '../../../../core/widgets/widget_infinite_list.dart';
import '../../domain/entity/reminders_entity.dart';
import '../base/base_reminders_stateful_widget_state.dart';
import '../bloc/reminders_bloc.dart';
import '../widget/reminder_card.dart';
import '../widget/reminder_card_shimmer.dart';

class ScreenReminders extends StatefulWidget {
  const ScreenReminders({super.key});

  @override
  State<ScreenReminders> createState() => _ScreenRemindersState();
}

class _ScreenRemindersState extends BaseRemindersStatefulWidgetState<ScreenReminders, RemindersBloc> {
  _ScreenRemindersState() : super(locator<RemindersBloc>());

  @override
  void initState() {
    super.initState();
    bloc.add(const FetchRemindersEvent());
  }

  @override
  void ninoBlocListener(BuildContext context, AppBlocState appState) {
    if (appState is AppBlocStateDataUpdated &&
        appState.operation == EnumAppOperationType.refresh &&
        appState.data == 'reminders') {
      bloc.add(const FetchRemindersEvent());
    }
  }

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
    final theme = Theme.of(context);

    return Container(
      color: theme.colorScheme.surfaceContainerLow,
      child: BlocListener<RemindersBloc, RemindersState>(
        listener: (context, state) {
          if (state is RemindersLoaded && state.errorToastMessage != null) {
            CstmSnackBar.showError(context, state.errorToastMessage!);
            bloc.add(const ClearReminderErrorToastEvent());
          }
        },
        child: BlocBuilder<RemindersBloc, RemindersState>(
          builder: (context, state) {
            if (state is RemindersInitial || (state is RemindersLoading)) {
              return ListView.builder(
                padding: EdgeInsets.all(20.r),
                itemCount: 6,
                itemBuilder: (context, index) => const ReminderCardShimmer(),
              );
            }

            if (state is RemindersError) {
              return ErrorStateWidget(
                message: state.message,
                onRetry: () => bloc.add(const FetchRemindersEvent()),
              );
            }

            List<RemindersEntity> items = [];
            bool hasMore = false;
            ReminderType? currentType;

            if (state is RemindersLoaded) {
              items = state.filteredReminders;
              hasMore = state.hasMore;
              currentType = state.currentType;
            } else if (state is RemindersLoadingMore) {
              items = state.filteredReminders;
              hasMore = state.hasMore;
              currentType = state.currentType;
            }

            return Stack(
              children: [
                Column(
                  children: [
                    _buildTabs(currentType, theme),
                    SizedBox(height: 10.h),
                    Expanded(
                      child: items.isEmpty
                          ? const EmptyStateWidget(
                              title: 'یادآوری یافت نشد',
                              description: 'شما هنوز هیچ یادآوری برای خدمات خودروی خود ثبت نکرده‌اید.',
                              icon: Icons.notifications_off_outlined,
                            )
                          : WidgetInfiniteList(
                              bloc: bloc.listBloc,
                              items: items,
                              hasReachedTop: true,
                              hasReachedBottom: !hasMore,
                              isLoading: false,
                              hasErrorOccurred: false,
                              errorWidget: const SizedBox.shrink(),
                              loadingWidget: const ReminderCardShimmer(),
                              loadBottomData: () => bloc.add(const LoadMoreRemindersEvent()),
                              itemEquality: (f, s) => (f as RemindersEntity).id == (s as RemindersEntity).id,
                              padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 100.h),
                              builder: (context, item) {
                                final reminder = item as RemindersEntity;
                                return ReminderCard(
                                  reminder: reminder,
                                  onTap: () async {
                                    final result = await context.pushNamed(
                                      'reminder_details',
                                      pathParameters: {'id': reminder.id},
                                    );
                                    if (result == true) {
                                      bloc.add(const FetchRemindersEvent());
                                    }
                                  },
                                );
                              },
                            ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 24.h,
                  right: 24.w,
                  child: FloatingActionButton(
                    onPressed: () async {
                      final result = await context.pushNamed('add_reminder');
                      if (result == true) {
                        bloc.add(const FetchRemindersEvent());
                      }
                    },
                    backgroundColor: theme.colorScheme.primary,
                    elevation: 4,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                    child: Icon(Icons.add_rounded, color: theme.colorScheme.surface, size: 28),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildTabs(ReminderType? currentType, ThemeData theme) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      reverse: true, // RTL support
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        children: [
          _buildTabItem('کیلومتری', ReminderType.kilometer, currentType == ReminderType.kilometer, theme),
          _buildTabItem('زمانی', ReminderType.time, currentType == ReminderType.time, theme),
          _buildTabItem('همه', null, currentType == null, theme),
        ],
      ),
    );
  }

  Widget _buildTabItem(String title, ReminderType? type, bool isSelected, ThemeData theme) {
    return GestureDetector(
      onTap: () => bloc.add(FilterRemindersEvent(type)),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.w),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? Colors.transparent : theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                color: isSelected ? theme.colorScheme.primary : theme.colorScheme.outline,
                fontSize: 14.sp,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                fontFamily: 'BonyadeKoodak',
              ),
            ),
            if (isSelected)
              Container(
                margin: EdgeInsets.only(top: 4.h),
                height: 2.h,
                width: 20.w,
                color: theme.colorScheme.primary,
              ),
          ],
        ),
      ),
    );
  }
}
