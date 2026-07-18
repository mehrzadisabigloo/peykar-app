import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../domain/entity/orders_entity.dart';
import 'package:intl/intl.dart';

class OrderCard extends StatelessWidget {
  final OrdersEntity order;

  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat.decimalPattern();
    
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
        border: Border.all(color: Colors.grey.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStatusBadge(order.status, order.statusLabel),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '#${order.orderNumber}',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
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
                          color: Colors.grey,
                          fontFamily: 'BonyadeKoodak',
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Icon(Icons.calendar_today_outlined, size: 10.sp, color: Colors.grey),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Divider(height: 24.h, color: Colors.grey.withValues(alpha: 0.1)),
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
                          color: Colors.black87,
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
                            color: Colors.grey,
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
                    color: Colors.grey.withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: order.items.first.product?.images.isNotEmpty == true
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: Image.network(
                            order.items.first.product!.images.first,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.image_not_supported_outlined, color: Colors.grey),
                          ),
                        )
                      : const Icon(Icons.shopping_bag_outlined, color: Colors.grey),
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
                      color: Colors.grey,
                      fontFamily: 'BonyadeKoodak',
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    currencyFormatter.format(double.tryParse(order.price) ?? 0),
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF3F51B5),
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

  Widget _buildStatusBadge(OrderStatus status, String label) {
    Color bgColor;
    Color textColor;

    switch (status) {
      case OrderStatus.paid:
        bgColor = const Color(0xFFE8F5E9);
        textColor = const Color(0xFF2E7D32);
        break;
      case OrderStatus.inProgress:
        bgColor = const Color(0xFFFFF3E0);
        textColor = const Color(0xFFEF6C00);
        break;
      case OrderStatus.sent:
        bgColor = const Color(0xFFE3F2FD);
        textColor = const Color(0xFF1565C0);
        break;
      case OrderStatus.completed:
        bgColor = const Color(0xFFE0F2F1);
        textColor = const Color(0xFF00695C);
        break;
      case OrderStatus.canceled:
        bgColor = const Color(0xFFFFEBEE);
        textColor = const Color(0xFFC62828);
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
