import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/themes/theme_main.dart';
import 'screen_product_detail.dart';

class ScreenAllComments extends StatelessWidget {
  final String productId;
  const ScreenAllComments({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Mock data for the full list
    final List<Map<String, dynamic>> mockComments = [
      {
        'name': 'علی محمدی',
        'date': '۱۴۰۲/۰۶/۱۲',
        'rating': 5.0,
        'comment': 'واقعا محصول با کیفیتی بود، پیشنهاد می‌کنم حتما بخرید. ارسال هم خیلی سریع انجام شد.',
        'verified': true,
      },
      {
        'name': 'مریم رضایی',
        'date': '۱۴۰۲/۰۶/۱۰',
        'rating': 4.0,
        'comment': 'بسیار کاربردی و عالی. فقط کاش بسته‌بندی کمی محکم‌تر بود.',
        'verified': true,
      },
      {
        'name': 'رضا علوی',
        'date': '۱۴۰۲/۰۶/۰۸',
        'rating': 4.5,
        'comment': 'عالی بود، دقیقاً همانی که در تصاویر می‌بینید. ممنون از تیم زینو.',
        'verified': false,
      },
      {
        'name': 'سارا احمدی',
        'date': '۱۴۰۲/۰۶/۰۵',
        'rating': 3.0,
        'comment': 'معمولی بود. قیمت نسبت به کیفیت کمی بالا بود.',
        'verified': true,
      },
    ];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
        body: ListView.separated(
          padding: EdgeInsets.all(20.r),
          itemCount: mockComments.length,
          separatorBuilder: (context, index) => SizedBox(height: 16.h),
          itemBuilder: (context, index) => _FullCommentItem(data: mockComments[index]),
        ),
      ),
    );
  }
}

class _FullCommentItem extends StatelessWidget {
  final Map<String, dynamic> data;
  const _FullCommentItem({required this.data});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final bool isVerified = data['verified'] ?? false;
    final double rating = data['rating'] ?? 0.0;

    return Container(
      padding: EdgeInsets.all(18.r),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.03),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundColor: colorScheme.primary.withValues(alpha: 0.1),
                child: Text(
                  data['name'].substring(0, 1),
                  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w900, color: colorScheme.primary),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data['name'],
                      style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w900, fontSize: 14.sp),
                    ),
                    if (isVerified)
                      Row(
                        children: [
                          Icon(Icons.verified_user_rounded, size: 10.sp, color: StatusColors.of(context).success),
                          SizedBox(width: 4.w),
                          Text('خریدار محصول', style: TextStyle(fontSize: 9.sp, color: StatusColors.of(context).success, fontWeight: FontWeight.bold)),
                        ],
                      ),
                  ],
                ),
              ),
              Text(
                PersianFormatter.digits(data['date']),
                style: theme.textTheme.bodySmall?.copyWith(fontSize: 11.sp),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Row(
                children: List.generate(5, (index) {
                  return Icon(
                    index < rating.floor() 
                      ? Icons.star_rounded 
                      : (index < rating ? Icons.star_half_rounded : Icons.star_outline_rounded),
                    color: StatusColors.of(context).warning,
                    size: 18.sp,
                  );
                }),
              ),
              SizedBox(width: 10.w),
              Text(
                '${PersianFormatter.digits(rating.toString())} / ${PersianFormatter.digits('۵')}',
                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w900, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.87)),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            data['comment'],
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.87),
              height: 1.7,
              fontSize: 13.sp,
            ),
          ),
        ],
      ),
    );
  }
}
