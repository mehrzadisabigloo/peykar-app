import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/themes/theme_main.dart';
import '../../domain/entity/manage_products_entity.dart';
import '../screen/screen_product_detail.dart';

class ProductCommentsSection extends StatelessWidget {
  final ManageProductsEntity product;

  const ProductCommentsSection({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final List<Map<String, dynamic>> mockComments = [
      {
        'name': 'علی محمدی',
        'date': '۱۴۰۲/۰۶/۱۲',
        'rating': 5.0,
        'comment':
            'واقعا محصول با کیفیتی بود، پیشنهاد می‌کنم حتما بخرید. ارسال هم خیلی سریع انجام شد.',
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
        'rating': 5.0,
        'comment':
            'عالی بود، دقیقاً همانی که در تصاویر می‌بینید. ممنون از تیم زینو.',
        'verified': false,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('نظرات کاربران',
                    style: theme.textTheme.headlineSmall?.copyWith(
                        fontSize: 18.sp, fontWeight: FontWeight.w900)),
                SizedBox(height: 2.h),
                Row(
                  children: [
                    Icon(Icons.star_rounded,
                        color: StatusColors.of(context).warning, size: 16.sp),
                    SizedBox(width: 4.w),
                    Text(
                      PersianFormatter.digits('۴.۸ از ۵'),
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: colorScheme.outline,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      '(${PersianFormatter.digits('۱۲۴')} نظر)',
                      style: TextStyle(
                          fontSize: 11.sp, color: colorScheme.outline),
                    ),
                  ],
                ),
              ],
            ),
            TextButton(
              onPressed: () => context.pushNamed('product_all_comments',
                  pathParameters: {'productId': product.id}),
              child: Text('مشاهده همه',
                  style: TextStyle(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w900)),
            ),
          ],
        ),
        SizedBox(height: 18.h),
        if (mockComments.isEmpty)
          _buildEmptyComments(colorScheme)
        else
          SizedBox(
            height: 185.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              itemCount: mockComments.length,
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              separatorBuilder: (context, index) => SizedBox(width: 16.w),
              itemBuilder: (context, index) => SizedBox(
                width: 300.w,
                child: _buildCommentItem(context, mockComments[index], theme),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildEmptyComments(ColorScheme colorScheme) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.r),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.1)),
      ),
      child: Column(
        children: [
          Icon(Icons.chat_bubble_outline_rounded,
              size: 40.sp, color: colorScheme.outlineVariant),
          SizedBox(height: 12.h),
          Text(
            'هنوز نظری برای این محصول ثبت نشده است.',
            style: TextStyle(color: colorScheme.outline, fontSize: 13.sp),
          ),
          SizedBox(height: 8.h),
          Text(
            'شما می‌توانید اولین نفر باشید!',
            style: TextStyle(
                color: colorScheme.primary,
                fontSize: 12.sp,
                fontWeight: FontWeight.w900),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentItem(
      BuildContext context, Map<String, dynamic> data, ThemeData theme) {
    final colorScheme = theme.colorScheme;
    final bool isVerified = data['verified'] ?? false;
    final double rating = data['rating'] ?? 0.0;

    return Container(
      padding: EdgeInsets.all(18.r),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.08)),
        boxShadow: [
          BoxShadow(
            color: colorScheme.onSurface.withValues(alpha: 0.02),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: colorScheme.primary.withValues(alpha: 0.1),
                      width: 1.5),
                ),
                padding: EdgeInsets.all(2.r),
                child: CircleAvatar(
                  radius: 18.r,
                  backgroundColor: colorScheme.primary.withValues(alpha: 0.05),
                  child: Text(
                    data['name'].substring(0, 1),
                    style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w900,
                        color: colorScheme.primary),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data['name'],
                      style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w900, fontSize: 14.sp),
                    ),
                    if (isVerified)
                      Row(
                        children: [
                          Icon(Icons.verified_user_rounded,
                              size: 10.sp,
                              color: StatusColors.of(context).success),
                          SizedBox(width: 4.w),
                          Text(
                            'خریدار محصول',
                            style: TextStyle(
                              fontSize: 9.sp,
                              color: StatusColors.of(context).success,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              Column(
                children: [
                  Text(
                    PersianFormatter.digits(data['date']),
                    style: theme.textTheme.bodySmall?.copyWith(
                        fontSize: 10.sp, color: colorScheme.outline),
                  ),
                  SizedBox(height: 5.h),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: StatusColors.of(context)
                          .warning
                          .withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.star_rounded,
                            color: StatusColors.of(context).warning,
                            size: 14.sp),
                        SizedBox(width: 4.w),
                        Text(
                          PersianFormatter.digits(rating.toString()),
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w900,
                            color: StatusColors.of(context).warning,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: Text(
              data['comment'],
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.7),
                height: 1.6,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
