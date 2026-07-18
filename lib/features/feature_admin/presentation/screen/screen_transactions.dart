import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/bloc/app/app_bloc.dart';
import '../../../../core/bloc/error/error_bloc.dart';
import '../../../../core/services/locator.dart';
import '../base/base_admin_stateful_widget_state.dart';
import '../bloc/admin_bloc.dart';

class ScreenTransactions extends StatefulWidget {
  const ScreenTransactions({super.key});

  @override
  State<ScreenTransactions> createState() => _ScreenTransactionsState();
}

class _ScreenTransactionsState extends BaseAdminStatefulWidgetState<ScreenTransactions, AdminBloc> {
  _ScreenTransactionsState() : super(locator<AdminBloc>());

  int _selectedTab = 2; // "همه"

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
    return Container(
      color: const Color(0xFFF8F9FB),
      child: Column(
        children: [
          _buildTabs(),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 100.h),
              physics: const BouncingScrollPhysics(),
              itemCount: 4,
              itemBuilder: (context, index) {
                return _buildTransactionCard(index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      reverse: true, // RTL support
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
      child: Row(
        children: [
          _buildTabItem('ناموفق', 0),
          _buildTabItem('موفق', 1),
          _buildTabItem('همه', 2),
        ],
      ),
    );
  }

  Widget _buildTabItem(String title, int index) {
    final isSelected = _selectedTab == index;
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () => setState(() => _selectedTab = index),
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
                color: isSelected ? colorScheme.primary : Colors.grey,
                fontSize: 14.sp,
                fontWeight: isSelected ? FontWeight.w900 : FontWeight.w600,
              ),
            ),
            if (isSelected)
              Container(
                margin: EdgeInsets.only(top: 4.h),
                height: 2.h,
                width: 20.w,
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionCard(int index) {
    final amounts = ['۱,۱۴۰,۰۰۰', '۴۴۰,۰۰۰', '۸۸۰,۰۰۰', '۱,۳۵۰,۰۰۰'];
    final orderNos = ['#۸۸۸۲', '#۸۸۸۶', '#۸۸۸۵', '#۸۸۸۴'];
    final ids = ['۵۸۸۸۷', '۵۸۸۸۶', '۵۸۸۸۵', '۵۸۸۸۴'];
    final dates = ['۱۴۰۳/۰۲/۱۵', '۱۴۰۳/۰۲/۱۵', '۱۴۰۳/۰۲/۱۵', '۱۴۰۳/۰۲/۱۴'];
    final statuses = ['موفق', 'موفق', 'موفق', 'ناموفق'];
    final isSuccess = statuses[index] == 'موفق';
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                  color: (isSuccess ? Colors.green : Colors.red).withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isSuccess ? Icons.swap_vert_rounded : Icons.priority_high_rounded,
                  color: isSuccess ? Colors.green : Colors.red,
                  size: 20.sp,
                ),
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'شماره پیگیری: ${ids[index]}',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w800,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    dates[index],
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              _buildStatusBadge(statuses[index], isSuccess ? Colors.green : Colors.red),
            ],
          ),
          SizedBox(height: 16.h),
          Divider(color: Colors.grey.withValues(alpha: 0.05)),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'سفارش ${orderNos[index]}',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    amounts[index],
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w900,
                      color: const Color(0xFF3F51B5),
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    'تومان',
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(String text, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 10.sp,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
