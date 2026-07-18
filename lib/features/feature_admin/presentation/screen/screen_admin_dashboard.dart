import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/bloc/app/app_bloc.dart';
import '../../../../core/bloc/error/error_bloc.dart';
import '../../../../core/services/locator.dart';
import '../base/base_admin_stateful_widget_state.dart';
import '../bloc/admin_bloc.dart';
import '../../../../features/feature_dashboard/presentation/widget/dashboard_stats_card.dart';
import '../widget/admin_income_chart.dart';

class ScreenAdminDashboard extends StatefulWidget {
  const ScreenAdminDashboard({super.key});

  @override
  State<ScreenAdminDashboard> createState() => _ScreenAdminDashboardState();
}

class _ScreenAdminDashboardState extends BaseAdminStatefulWidgetState<ScreenAdminDashboard, AdminBloc> {
  _ScreenAdminDashboardState() : super(locator<AdminBloc>());

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      color: const Color(0xFFF8F9FB),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20.w, 24.h, 20.w, 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'داشبورد مدیریتی',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w900,
                                color: colorScheme.onSurface,
                              ),
                            ),
                            Text(
                              'خلاصه وضعیت امروز سیستم',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: colorScheme.onSurface.withValues(alpha: 0.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Container(
                        padding: EdgeInsets.all(10.r),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.03),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Icon(Icons.calendar_today_rounded, size: 20.sp, color: colorScheme.primary),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(20.w),
            sliver: SliverToBoxAdapter(
              child: _buildAdminStatsGrid(),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: const AdminIncomeChart(),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(20.w),
              child: Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A237E),
                  borderRadius: BorderRadius.circular(24.r),
                  image: DecorationImage(
                    image: const NetworkImage('https://www.transparenttextures.com/patterns/cubes.png'),
                    opacity: 0.1,
                    colorFilter: ColorFilter.mode(Colors.white.withValues(alpha: 0.1), BlendMode.srcIn),
                  ),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'گزارش جامع سالانه',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'تحلیل دقیق روند رشد زینو در سال جاری',
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.7),
                            fontSize: 11.sp,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFF1A237E),
                        minimumSize: Size(80.w, 40.h),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                        elevation: 0,
                      ),
                      child: const Text('مشاهده'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 100.h)),
        ],
      ),
    );
  }

  Widget _buildAdminStatsGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 16.w,
      mainAxisSpacing: 16.h,
      childAspectRatio: 1.2,
      children: const [
        DashboardStatsCard(
          title: 'خدمات دهندگان',
          value: '۱,۲۸۰',
          icon: Icons.storefront_rounded,
          iconColor: Color(0xFF3F51B5),
          backgroundColor: Colors.white,
        ),
        DashboardStatsCard(
          title: 'کل کاربران',
          value: '۱۲,۵۶۰',
          icon: Icons.people_alt_rounded,
          iconColor: Color(0xFF00897B),
          backgroundColor: Colors.white,
        ),
        DashboardStatsCard(
          title: 'نوبت های امروز',
          value: '۹۲',
          icon: Icons.event_available_rounded,
          iconColor: Color(0xFFE64A19),
          backgroundColor: Colors.white,
        ),
        DashboardStatsCard(
          title: 'سفارشات امروز',
          value: '۴۸۶',
          icon: Icons.shopping_bag_rounded,
          iconColor: Color(0xFFF9A825),
          backgroundColor: Colors.white,
        ),
      ],
    );
  }
}
