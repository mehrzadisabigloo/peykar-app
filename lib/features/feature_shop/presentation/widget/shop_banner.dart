import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/resources/consts.dart';
import '../../../../core/themes/theme_main.dart';
import '../../../panel_admin_features/feature_banner/domain/entity/banner_entity.dart';

class ShopBanner extends StatefulWidget {
  final List<BannerEntity> banners;
  const ShopBanner({super.key, this.banners = const []});

  @override
  State<ShopBanner> createState() => _ShopBannerState();
}

class _ShopBannerState extends State<ShopBanner> {
  final PageController _pageController = PageController();
  Timer? _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    if (widget.banners.length > 1) {
      _startAutoPlay();
    }
  }

  void _startAutoPlay() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_currentPage < widget.banners.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOutQuart,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.banners.isEmpty) return const SizedBox.shrink();
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SizedBox(
              height: 170.h,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() => _currentPage = index);
                },
                itemCount: widget.banners.length,
                itemBuilder: (context, index) => _buildBannerItem(widget.banners[index]),
              ),
            ),
            if (widget.banners.length > 1)
              Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: widget.banners.length,
                  effect: ExpandingDotsEffect(
                    dotHeight: 6.h,
                    dotWidth: 6.w,
                    activeDotColor: colorScheme.surface,
                    dotColor: colorScheme.surface.withValues(alpha: 0.5),
                    expansionFactor: 4,
                    spacing: 6.w,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildBannerItem(BannerEntity banner) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
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
        margin: EdgeInsets.symmetric(horizontal: 4.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28.r),
          boxShadow: [
            BoxShadow(
              color: theme.primaryColor.withValues(alpha: 0.15),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(28.r),
          child: Stack(
            fit: StackFit.expand,
            children: [
              banner.firstImageId.isNotEmpty
                  ? CachedNetworkImage(
                      imageUrl: '${Consts.baseFileUrl}${banner.firstImageId}',
                      fit: BoxFit.fill,
                      placeholder: (context, url) => _buildShimmerLoading(context),
                      errorWidget: (context, url, error) => _buildPlaceholder(context),
                    )
                  : _buildPlaceholder(context),
              // Subtle Gradient Overlay for premium look
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      colorScheme.onSurface.withValues(alpha: 0.3),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildShimmerLoading(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Shimmer.fromColors(
      baseColor: colorScheme.surfaceContainer,
      highlightColor: colorScheme.surface,
      child: Container(
        color: colorScheme.surface,
      ),
    );
  }

  Widget _buildPlaceholder(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final adminIndigo = DashboardColors.of(context).adminIndigo;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            adminIndigo,
            adminIndigo.withValues(alpha: 0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.image_not_supported_outlined, color: colorScheme.surface.withValues(alpha: 0.5), size: 40.sp),
            SizedBox(height: 8.h),
            Text(
              'تصویر موجود نیست',
              style: TextStyle(color: colorScheme.surface.withValues(alpha: 0.5), fontSize: 12.sp),
            ),
          ],
        ),
      ),
    );
  }
}
