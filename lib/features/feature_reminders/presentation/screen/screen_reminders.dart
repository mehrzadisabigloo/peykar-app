import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/bloc/app/app_bloc.dart';
import '../../../../core/bloc/error/error_bloc.dart';
import '../../../../core/services/locator.dart';
import '../../../../core/widgets/empty_state_widget.dart';
import '../../domain/entity/reminders_entity.dart';
import '../base/base_reminders_stateful_widget_state.dart';
import '../bloc/reminders_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    bloc.add(FetchRemindersEvent());
  }

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
    return Container(
      color: const Color(0xFFF8F9FB),
      child: SafeArea(
        child: BlocBuilder<RemindersBloc, RemindersState>(
          builder: (context, state) {
            if (state is RemindersLoading) {
              return Column(
                children: [
                  SizedBox(height: 20.h),
                  _buildTabsPlaceholder(),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.all(20.r),
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return const ReminderCardShimmer();
                      },
                    ),
                  ),
                ],
              );
            }
            if (state is RemindersError) {
              return Center(child: Text(state.message));
            }
            if (state is RemindersLoaded) {
              return Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 20.h),
                      _buildTabs(state),
                      Expanded(
                        child: state.filteredReminders.isEmpty
                            ? const EmptyStateWidget(
                                title: 'یادآوری یافت نشد',
                                description: 'شما هنوز هیچ یادآوری برای خدمات خودروی خود ثبت نکرده‌اید.',
                                icon: Icons.notifications_off_outlined,
                              )
                            : ListView.builder(
                                padding: EdgeInsets.all(20.r),
                                itemCount: state.filteredReminders.length,
                                itemBuilder: (context, index) {
                                  return ReminderCard(reminder: state.filteredReminders[index]);
                                },
                              ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 20.h,
                    left: 20.w,
                    child: FloatingActionButton(
                      onPressed: () async {
                        final result = await context.pushNamed('add_reminder');
                        if (result == true) {
                          bloc.add(FetchRemindersEvent());
                        }
                      },
                      backgroundColor: const Color(0xFF3F51B5),
                      child: const Icon(Icons.add, color: Colors.white),
                    ),
                  ),
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget _buildTabsPlaceholder() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          3,
          (index) => Container(
            width: 80.w,
            height: 20.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabs(RemindersLoaded state) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      reverse: true, // RTL support
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        children: [
          _buildTabItem('کیلومتری', ReminderType.kilometer, state.currentType == ReminderType.kilometer),
          _buildTabItem('زمانی', ReminderType.time, state.currentType == ReminderType.time),
          _buildTabItem('همه', null, state.currentType == null),
        ],
      ),
    );
  }

  Widget _buildTabItem(String title, ReminderType? type, bool isSelected) {
    return GestureDetector(
      onTap: () => bloc.add(FilterRemindersEvent(type)),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.w),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? Colors.transparent : Colors.white,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                color: isSelected ? const Color(0xFF3F51B5) : Colors.grey,
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
                color: const Color(0xFF3F51B5),
              ),
          ],
        ),
      ),
    );
  }
}
