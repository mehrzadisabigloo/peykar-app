import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/themes/theme_main.dart';
import '../../domain/entity/orders_entity.dart';
import 'package:intl/intl.dart';

class OrderCard extends StatelessWidget {
  final OrdersEntity order;

  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat.decimalPattern();
    final colorScheme = Theme.of(context).colorScheme;
    
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: colorScheme.onSurface.withValues(alpha: 0.04),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStatusBadge(context, order.status, order.statusLabel),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '#${order.orderNumber}',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface.withValues(alpha: 0.87),
                      fontFamily: 'BonyadeKoodak',
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    children: [
                      Text(
                        order.date,
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: colorScheme.outline,
                          fontFamily: 'BonyadeKoodak',
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Icon(Icons.calendar_today_outlined, size: 10.sp, color: colorScheme.outline),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Divider(height: 24.h, color: colorScheme.outlineVariant),
          if (order.items.isNotEmpty) ...[
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        order.items.first.product?.title ?? 'محصول نامشخص',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: colorScheme.onSurface.withValues(alpha: 0.87),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.right,
                      ),
                      if (order.items.length > 1)
                        Text(
                          'و ${order.items.length - 1} مورد دیگر',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: colorScheme.outline,
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(width: 12.w),
                Container(
                  width: 50.w,
                  height: 50.w,
                  decoration: BoxDecoration(
                    color: colorScheme.onSurface.withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: order.items.first.product?.images.isNotEmpty == true
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: CachedNetworkImage(
                            imageUrl: order.items.first.product!.images.first,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Container(color: colorScheme.surfaceContainer),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.image_not_supported_outlined, color: colorScheme.outline),
                          ),
                        )
                      : Icon(Icons.shopping_bag_outlined, color: colorScheme.outline),
                ),
              ],
            ),
            SizedBox(height: 16.h),
          ],
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'تومان',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: colorScheme.outline,
                      fontFamily: 'BonyadeKoodak',
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    currencyFormatter.format(double.tryParse(order.price) ?? 0),
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: DashboardColors.of(context).adminIndigo,
                      fontFamily: 'BonyadeKoodak',
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

  Widget _buildStatusBadge(BuildContext context, OrderStatus status, String label) {
    final colorScheme = Theme.of(context).colorScheme;
    final statusColors = StatusColors.of(context);
    final dashboardColors = DashboardColors.of(context);
    
    Color bgColor;
    Color textColor;

    switch (status) {
      case OrderStatus.paid:
        textColor = statusColors.success;
        bgColor = textColor.withValues(alpha: 0.1);
        break;
      case OrderStatus.inProgress:
        textColor = statusColors.warning;
        bgColor = textColor.withValues(alpha: 0.1);
        break;
      case OrderStatus.sent:
        textColor = statusColors.info;
        bgColor = textColor.withValues(alpha: 0.1);
        break;
      case OrderStatus.completed:
        textColor = dashboardColors.adminTeal;
        bgColor = textColor.withValues(alpha: 0.1);
        break;
      case OrderStatus.canceled:
        textColor = colorScheme.error;
        bgColor = textColor.withValues(alpha: 0.1);
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Text(
        label.isNotEmpty ? label : _getDefaultStatusText(status),
        style: TextStyle(
          color: textColor,
          fontSize: 12.sp,
          fontWeight: FontWeight.bold,
          fontFamily: 'BonyadeKoodak',
        ),
      ),
    );
  }

  String _getDefaultStatusText(OrderStatus status) {
    switch (status) {
      case OrderStatus.paid: return 'پرداخت شده';
      case OrderStatus.inProgress: return 'در حال پردازش';
      case OrderStatus.sent: return 'ارسال شده';
      case OrderStatus.completed: return 'تکمیل شده';
      case OrderStatus.canceled: return 'لغو شده';
    }
  }
}
