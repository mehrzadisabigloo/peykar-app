import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/themes/theme_main.dart';
import '../../../../core/resources/consts.dart';
import '../../../panel_admin_features/feature_banner/domain/entity/banner_entity.dart';

class HomeBanner extends StatefulWidget {
  final List<BannerEntity> banners;
  const HomeBanner({super.key, this.banners = const []});

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bannersToShow = widget.banners.isNotEmpty ? widget.banners : _getDefaultBanners(context);

    return Column(
      children: [
        SizedBox(
          height: 160.h,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemCount: bannersToShow.length,
            itemBuilder: (context, index) {
              final item = bannersToShow[index];
              if (item is BannerEntity) {
                return _buildRemoteBannerItem(context, item);
              }
              return _buildDefaultBannerItem(context, item as BannerData);
            },
          ),
        ),
        SizedBox(height: 12.h),
        _buildPageIndicator(context, bannersToShow.length),
      ],
    );
  }

  List<dynamic> _getDefaultBanners(BuildContext context) {
    return [
      BannerData(
        title: 'سرویس دوره‌ای خودرو',
        subtitle: 'با بهترین متخصصین در محل شما',
        buttonText: 'رزرو نوبت',
        color: Theme.of(context).colorScheme.primary,
        icon: Icons.settings_suggest_rounded,
      ),
      BannerData(
        title: 'تخفیف ویژه لاستیک',
        subtitle: 'تا ۲۰٪ تخفیف برای برندهای برتر',
        buttonText: 'مشاهده فروشگاه',
        color: StatusColors.of(context).warning,
        icon: Icons.shopping_basket_rounded,
      ),
      BannerData(
        title: 'کارشناسی تخصصی بدنه',
        subtitle: 'تضمین سلامت خودرو قبل از خرید',
        buttonText: 'درخواست کارشناس',
        color: StatusColors.of(context).success,
        icon: Icons.verified_user_rounded,
      ),
    ];
  }

  Widget _buildRemoteBannerItem(BuildContext context, BannerEntity banner) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {
        if (banner.activityType == 'reminder') {
          context.pushNamed('reminders');
        } else if (banner.activityType == 'product' && banner.activityId != null) {
          context.pushNamed('product_detail', pathParameters: {'productId': banner.activityId!});
        }
      },
      borderRadius: BorderRadius.circular(28.r),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28.r),
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.1),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(28.r),
          child: banner.firstImageId.isNotEmpty
              ? CachedNetworkImage(
                  imageUrl: '${Consts.baseFileUrl}${banner.firstImageId}',
                  fit: BoxFit.fill,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: theme.colorScheme.surfaceContainer,
                    highlightColor: theme.colorScheme.surface,
                    child: Container(color: theme.colorScheme.surface),
                  ),
                  errorWidget: (context, url, error) => _buildPlaceholder(context),
                )
              : _buildPlaceholder(context),
        ),
      ),
    );
  }

  Widget _buildPlaceholder(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Center(
        child: Icon(Icons.photo_outlined, color: Theme.of(context).colorScheme.surface, size: 40),
      ),
    );
  }

  Widget _buildDefaultBannerItem(BuildContext context, BannerData banner) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28.r),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            banner.color,
            banner.color.withValues(alpha: 0.8),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: banner.color.withValues(alpha: 0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28.r),
        child: Stack(
          children: [
            // Decorative background circles
            Positioned(
              right: -30.w,
              top: -30.h,
              child: CircleAvatar(
                radius: 80.r,
                backgroundColor: theme.colorScheme.surface.withValues(alpha: 0.1),
              ),
            ),
            Positioned(
              left: -20.w,
              bottom: -20.h,
              child: CircleAvatar(
                radius: 50.r,
                backgroundColor: theme.colorScheme.surface.withValues(alpha: 0.05),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(24.r),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          banner.title,
                          style: TextStyle(
                            color: theme.colorScheme.surface,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          banner.subtitle,
                          style: TextStyle(
                            color: theme.colorScheme.surface.withValues(alpha: 0.9),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.all(12.r),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surface.withValues(alpha: 0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        banner.icon,
                        size: 60.sp,
                        color: theme.colorScheme.surface,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageIndicator(BuildContext context, int count) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 3.w),
          height: 6.h,
          width: _currentPage == index ? 24.w : 6.w,
          decoration: BoxDecoration(
            color: _currentPage == index
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(3.r),
          ),
        ),
      ),
    );
  }
}

class BannerData {
  final String title;
  final String subtitle;
  final String buttonText;
  final Color color;
  final IconData icon;

  BannerData({
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.color,
    required this.icon,
  });
}
