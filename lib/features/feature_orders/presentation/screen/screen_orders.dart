import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/bloc/app/app_bloc.dart';
import '../../../../core/bloc/error/error_bloc.dart';
import '../../../../core/services/locator.dart';
import '../../domain/entity/orders_entity.dart';
import '../base/base_orders_stateful_widget_state.dart';
import '../bloc/orders_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/empty_state_widget.dart';
import '../../../../core/widgets/error_state_widget.dart';
import '../widget/order_card.dart';
import '../widget/order_card_shimmer.dart';

class ScreenOrders extends StatefulWidget {
  const ScreenOrders({super.key});

  @override
  State<ScreenOrders> createState() => _ScreenOrdersState();
}

class _ScreenOrdersState extends BaseOrdersStatefulWidgetState<ScreenOrders, OrdersBloc> {
  _ScreenOrdersState() : super(locator<OrdersBloc>());

  @override
  void initState() {
    super.initState();
    bloc.add(FetchOrdersEvent());
  }

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
    return Container(
      color: const Color(0xFFF8F9FB),
      child: SafeArea(
        child: BlocBuilder<OrdersBloc, OrdersState>(
          builder: (context, state) {
            if (state is OrdersLoading) {
              return Column(
                children: [
                  SizedBox(height: 20.h),
                  _buildTabsPlaceholder(),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.all(20.r),
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return const OrderCardShimmer();
                      },
                    ),
                  ),
                ],
              );
            }
            if (state is OrdersError) {
              return ErrorStateWidget(
                message: state.message,
                onRetry: () => bloc.add(FetchOrdersEvent()),
              );
            }
            if (state is OrdersLoaded) {
              return Column(
                children: [
                  SizedBox(height: 20.h),
                  _buildTabs(state),
                  Expanded(
                    child: state.filteredOrders.isEmpty
                        ? const EmptyStateWidget(
                            title: 'سفارشی یافت نشد',
                            description: 'شما هنوز هیچ سفارشی در این بخش ندارید.',
                            icon: Icons.receipt_long_outlined,
                          )
                        : ListView.builder(
                            padding: EdgeInsets.all(20.r),
                            itemCount: state.filteredOrders.length,
                            itemBuilder: (context, index) {
                              return OrderCard(order: state.filteredOrders[index]);
                            },
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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      reverse: true,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        children: List.generate(
          4,
          (index) => Container(
            margin: EdgeInsets.symmetric(horizontal: 8.w),
            width: 80.w,
            height: 36.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.r),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabs(OrdersLoaded state) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      reverse: true, // RTL support
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        children: [
          _buildTabItem('لغو شده', OrderStatus.canceled, state.currentStatus == OrderStatus.canceled),
          _buildTabItem('تکمیل شده', OrderStatus.completed, state.currentStatus == OrderStatus.completed),
          _buildTabItem('در حال پردازش', OrderStatus.inProgress, state.currentStatus == OrderStatus.inProgress),
          _buildTabItem('همه', null, state.currentStatus == null),
        ],
      ),
    );
  }

  Widget _buildTabItem(String title, OrderStatus? status, bool isSelected) {
    return GestureDetector(
      onTap: () => bloc.add(FilterOrdersEvent(status)),
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
