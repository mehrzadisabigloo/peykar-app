import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/bloc/app/app_bloc.dart';
import '../../../../core/bloc/error/error_bloc.dart';
import '../../../../core/services/locator.dart';
import '../base/base_dashboard_stateful_widget_state.dart';
import '../bloc/dashboard_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widget/dashboard_stats_card.dart';
import '../widget/sales_chart.dart';

class ScreenDashboard extends StatefulWidget {
  const ScreenDashboard({super.key});

  @override
  State<ScreenDashboard> createState() => _ScreenDashboardState();
}

class _ScreenDashboardState extends BaseDashboardStatefulWidgetState<ScreenDashboard, DashboardBloc> {
  _ScreenDashboardState() : super(locator<DashboardBloc>());

  @override
  void initState() {
    super.initState();
    bloc.add(FetchDashboardDataEvent());
  }

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
    return Container(
      color: const Color(0xFFF8F9FB),
      child: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          if (state is DashboardLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: 20.h),
                _buildStatsGrid(),
                SizedBox(height: 20.h),
                _buildFinancialReportButton(context),
                SizedBox(height: 10.h),

                const SalesChart(),
                SizedBox(height: 100.h), // Space for bottom nav
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildFinancialReportButton(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () => context.pushNamed('financial_report'),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.bar_chart_rounded, size: 18.sp, color: const Color(0xFF0D7B5F)),
              SizedBox(width: 8.w),
              Text(
                'گزارش مالی',
                style: TextStyle(
                  color: const Color(0xFF0D7B5F),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'BonyadeKoodak',
                ),
              ),
              SizedBox(width: 8.w),
              Icon(Icons.chevron_right_rounded, size: 18.sp, color: const Color(0xFF0D7B5F))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatsGrid() {
    return GridView.count(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 15.w,
      mainAxisSpacing: 15.h,
      childAspectRatio: 1.4,
      children: [
        const DashboardStatsCard(
          title: 'فروش امروز',
          value: '۱۲,۵۰۰,۰۰۰',
          icon: Icons.store_outlined,
          iconColor: Color(0xFF3F51B5),
          backgroundColor: Color(0xFFE8EAF6),
        ),
        const DashboardStatsCard(
          title: 'سفارشات جدید',
          value: '۸',
          icon: Icons.shopping_basket_outlined,
          iconColor: Color(0xFF009688),
          backgroundColor: Color(0xFFE0F2F1),
        ),
        const DashboardStatsCard(
          title: 'نوبت های امروز',
          value: '۱۴',
          icon: Icons.calendar_today_outlined,
          iconColor: Color(0xFFFB8C00),
          backgroundColor: Color(0xFFFFF3E0),
        ),
        const DashboardStatsCard(
          title: 'درآمد ماه',
          value: '۲۸۵,۰۰۰,۰۰۰',
          icon: Icons.account_balance_wallet_outlined,
          iconColor: Color(0xFF4CAF50),
          backgroundColor: Color(0xFFE8F5E9),
        ),
      ],
    );
  }
}
