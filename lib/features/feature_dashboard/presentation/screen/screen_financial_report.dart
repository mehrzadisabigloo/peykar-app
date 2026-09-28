import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/bloc/app/app_bloc.dart';
import '../../../../core/bloc/error/error_bloc.dart';
import '../../../../core/services/locator.dart';
import '../../../../core/themes/theme_main.dart';
import '../base/base_dashboard_stateful_widget_state.dart';
import '../bloc/dashboard_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import '../widget/financial_report_card.dart';

class ScreenFinancialReport extends StatefulWidget {
  const ScreenFinancialReport({super.key});

  @override
  State<ScreenFinancialReport> createState() => _ScreenFinancialReportState();
}

class _ScreenFinancialReportState extends BaseDashboardStatefulWidgetState<ScreenFinancialReport, DashboardBloc> {
  _ScreenFinancialReportState() : super(locator<DashboardBloc>());

  @override
  void initState() {
    super.initState();
    // In a real app, we might fetch specific financial data here
  }

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surfaceContainer,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              _buildMonthSelector(),
              SizedBox(height: 20.h),
              _buildStatsGrid(),
              SizedBox(height: 30.h),
              _buildDonutChartSection(),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMonthSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios, size: 16),
        ),
        Text(
          'ماه جاری',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
            fontFamily: 'BonyadeKoodak',
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_forward_ios, size: 16),
        ),
      ],
    );
  }

  Widget _buildStatsGrid() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: [
              FinancialReportCard(
                value: '۲۰۰,۰۰۰',
                icon: Icons.access_time_filled_rounded,
                iconColor: DashboardColors.of(context).adminIndigo,
                backgroundColor: DashboardColors.of(context).adminIndigo.withValues(alpha: 0.1),
              ),
              SizedBox(height: 15.h),
              FinancialReportCard(
                value: '۲۴۰,۰۰۰',
                icon: Icons.check_circle_rounded,
                iconColor: StatusColors.of(context).success,
                backgroundColor: StatusColors.of(context).success.withValues(alpha: 0.1),
              ),
            ],
          ),
        ),
        SizedBox(width: 15.w),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              FinancialReportCard(
                title: 'درآمد کل',
                value: '۲۸,۵۰۰,۰۰۰',
                icon: Icons.account_balance_wallet_rounded,
                iconColor: DashboardColors.of(context).adminIndigo,
                backgroundColor: Theme.of(context).colorScheme.surface,
              ),
              SizedBox(height: 15.h),
              FinancialReportCard(
                title: 'تسویه شده',
                value: '۱۷,۲۵۰,۰۰۰',
                icon: Icons.track_changes_rounded,
                iconColor: StatusColors.of(context).success,
                backgroundColor: StatusColors.of(context).success.withValues(alpha: 0.1),
                valueColor: StatusColors.of(context).success,
              ),
              SizedBox(height: 15.h),
              FinancialReportCard(
                title: 'تسویه نشده',
                value: '۴۲,۲۵۰,۰۰۰',
                icon: Icons.history_rounded,
                iconColor: Theme.of(context).colorScheme.error,
                backgroundColor: Theme.of(context).colorScheme.error.withValues(alpha: 0.1),
                valueColor: Theme.of(context).colorScheme.error,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDonutChartSection() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'درصد فروش بر اساس خدمات',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
              fontFamily: 'BonyadeKoodak',
            ),
          ),
          SizedBox(height: 30.h),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: SizedBox(
                  height: 180.h,
                  child: PieChart(
                    PieChartData(
                      sectionsSpace: 0,
                      centerSpaceRadius: 50.r,
                      sections: [
                        PieChartSectionData(
                          color: DashboardColors.of(context).adminIndigo,
                          value: 40,
                          title: '',
                          radius: 30.r,
                        ),
                        PieChartSectionData(
                          color: DashboardColors.of(context).adminOrange,
                          value: 37,
                          title: '',
                          radius: 30.r,
                        ),
                        PieChartSectionData(
                          color: DashboardColors.of(context).adminTeal,
                          value: 20,
                          title: '',
                          radius: 30.r,
                        ),
                        PieChartSectionData(
                          color: DashboardColors.of(context).adminYellow,
                          value: 16,
                          title: '',
                          radius: 30.r,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20.w),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    _buildLegendItem(context, 'مکانیک', '۴۰٪', DashboardColors.of(context).adminIndigo),
                    _buildLegendItem(context, 'اتوسرویس', '۳۷٪', DashboardColors.of(context).adminOrange),
                    _buildLegendItem(context, 'برق خودرو', '۲۰٪', DashboardColors.of(context).adminTeal),
                    _buildLegendItem(context, 'سایر', '۱۶٪', DashboardColors.of(context).adminYellow),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(BuildContext context, String title, String percentage, Color color) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            percentage,
            style: TextStyle(
              fontSize: 12.sp,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontFamily: 'BonyadeKoodak',
            ),
          ),
          const Spacer(),
          Text(
            title,
            style: TextStyle(
              fontSize: 12.sp,
              color: Theme.of(context).colorScheme.onSurface,
              fontFamily: 'BonyadeKoodak',
            ),
          ),
          SizedBox(width: 8.w),
          Container(
            width: 12.w,
            height: 12.w,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(3.r),
            ),
          ),
        ],
      ),
    );
  }
}
