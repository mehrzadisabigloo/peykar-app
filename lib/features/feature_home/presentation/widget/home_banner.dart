import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBanner extends StatefulWidget {
  const HomeBanner({super.key});

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<BannerData> _banners = [
    BannerData(
      title: 'سرویس دوره‌ای خودرو',
      subtitle: 'با بهترین متخصصین در محل شما',
      buttonText: 'رزرو نوبت',
      color: const Color(0xFF6C63FF),
      icon: Icons.settings_suggest_rounded,
    ),
    BannerData(
      title: 'تخفیف ویژه لاستیک',
      subtitle: 'تا ۲۰٪ تخفیف برای برندهای برتر',
      buttonText: 'مشاهده فروشگاه',
      color: const Color(0xFFFF6584),
      icon: Icons.shopping_basket_rounded,
    ),
    BannerData(
      title: 'کارشناسی تخصصی بدنه',
      subtitle: 'تضمین سلامت خودرو قبل از خرید',
      buttonText: 'درخواست کارشناس',
      color: const Color(0xFF43A047),
      icon: Icons.verified_user_rounded,
    ),
  ];

  @override
  void initState() {
    super.initState();
  }


  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 180.h,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemCount: _banners.length,
            itemBuilder: (context, index) => _buildBannerItem(_banners[index]),
          ),
        ),
        SizedBox(height: 12.h),
        _buildPageIndicator(),
      ],
    );
  }

  Widget _buildBannerItem(BannerData banner) {
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
                backgroundColor: Colors.white.withValues(alpha: 0.1),
              ),
            ),
            Positioned(
              left: -20.w,
              bottom: -20.h,
              child: CircleAvatar(
                radius: 50.r,
                backgroundColor: Colors.white.withValues(alpha: 0.05),
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
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          banner.subtitle,
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.9),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: banner.color,
                            elevation: 0,
                            minimumSize: Size(100.w, 36.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                          ),
                          child: Text(
                            banner.buttonText,
                            style: TextStyle(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.bold,
                            ),
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
                        color: Colors.white.withValues(alpha: 0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        banner.icon,
                        size: 60.sp,
                        color: Colors.white,
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

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _banners.length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 3.w),
          height: 6.h,
          width: _currentPage == index ? 24.w : 6.w,
          decoration: BoxDecoration(
            color: _currentPage == index
                ? const Color(0xFF3F51B5)
                : Colors.grey.withValues(alpha: 0.3),
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
