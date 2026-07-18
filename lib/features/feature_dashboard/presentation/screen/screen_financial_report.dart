import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/bloc/app/app_bloc.dart';
import '../../../../core/bloc/error/error_bloc.dart';
import '../../../../core/services/locator.dart';
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
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
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
            color: Colors.black87,
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
              const FinancialReportCard(
                value: '۲۰۰,۰۰۰',
                icon: Icons.access_time_filled_rounded,
                iconColor: Color(0xFF3F51B5),
                backgroundColor: Color(0xFFE8EAF6),
              ),
              SizedBox(height: 15.h),
              const FinancialReportCard(
                value: '۲۴۰,۰۰۰',
                icon: Icons.check_circle_rounded,
                iconColor: Color(0xFF4CAF50),
                backgroundColor: Color(0xFFE8F5E9),
              ),
            ],
          ),
        ),
        SizedBox(width: 15.w),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              const FinancialReportCard(
                title: 'درآمد کل',
                value: '۲۸,۵۰۰,۰۰۰',
                icon: Icons.account_balance_wallet_rounded,
                iconColor: Color(0xFF3F51B5),
                backgroundColor: Colors.white,
              ),
              SizedBox(height: 15.h),
              const FinancialReportCard(
                title: 'تسویه شده',
                value: '۱۷,۲۵۰,۰۰۰',
                icon: Icons.track_changes_rounded,
                iconColor: Color(0xFF4CAF50),
                backgroundColor: Color(0xFFE8F5E9),
                valueColor: Color(0xFF2E7D32),
              ),
              SizedBox(height: 15.h),
              const FinancialReportCard(
                title: 'تسویه نشده',
                value: '۴۲,۲۵۰,۰۰۰',
                icon: Icons.history_rounded,
                iconColor: Color(0xFFE53935),
                backgroundColor: Color(0xFFFFEBEE),
                valueColor: Color(0xFFC62828),
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
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
              color: Colors.black87,
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
                          color: const Color(0xFF3F51B5),
                          value: 40,
                          title: '',
                          radius: 30.r,
                        ),
                        PieChartSectionData(
                          color: const Color(0xFF8D6E63),
                          value: 37,
                          title: '',
                          radius: 30.r,
                        ),
                        PieChartSectionData(
                          color: const Color(0xFF303F9F),
                          value: 20,
                          title: '',
                          radius: 30.r,
                        ),
                        PieChartSectionData(
                          color: const Color(0xFFD7CCC8),
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
                    _buildLegendItem('مکانیک', '۴۰٪', const Color(0xFF3F51B5)),
                    _buildLegendItem('اتوسرویس', '۳۷٪', const Color(0xFF8D6E63)),
                    _buildLegendItem('برق خودرو', '۲۰٪', const Color(0xFF303F9F)),
                    _buildLegendItem('سایر', '۱۶٪', const Color(0xFFD7CCC8)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(String title, String percentage, Color color) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            percentage,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.grey[600],
              fontFamily: 'BonyadeKoodak',
            ),
          ),
          const Spacer(),
          Text(
            title,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.black87,
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
