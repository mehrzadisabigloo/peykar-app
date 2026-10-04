import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/bloc/app/app_bloc.dart';
import '../../../../core/bloc/error/error_bloc.dart';
import '../../../../core/services/locator.dart';
import '../../../../core/themes/theme_main.dart';
import '../../../panel_admin_features/feature_banner/domain/entity/banner_entity.dart';
import '../base/base_dashboard_stateful_widget_state.dart';
import '../bloc/dashboard_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widget/dashboard_stats_card.dart';
import '../widget/dashboard_banner_shimmer.dart';
import 'package:chaharmahal_shop_front/core/services/shop_settings_holder.dart';
import 'package:chaharmahal_shop_front/features/feature_home/presentation/bloc/main_home_page_bloc.dart';
import 'package:chaharmahal_shop_front/features/feature_home/presentation/widget/home_banner.dart';

class ScreenDashboard extends StatefulWidget {
  const ScreenDashboard({super.key});

  @override
  State<ScreenDashboard> createState() => _ScreenDashboardState();
}

class _ScreenDashboardState extends BaseDashboardStatefulWidgetState<ScreenDashboard, DashboardBloc> {
  _ScreenDashboardState() : super(locator<DashboardBloc>());

  @override
  void initState() {
    super.initState();
    bloc.add(FetchDashboardDataEvent());
  }

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
    final theme = Theme.of(context);
    return Container(
      color: theme.colorScheme.surfaceContainerLow,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<DashboardBloc, DashboardState>(
              builder: (context, state) {
                if (state is DashboardLoading) {
                  return Column(
                    children: [
                      SizedBox(height: 10.h),
                      const DashboardBannerShimmer(),
                    ],
                  );
                }

                final banners = state is DashboardLoaded ? state.banners : <BannerEntity>[];

                if (banners.isNotEmpty) {
                  return Column(
                    children: [
                      SizedBox(height: 10.h),
                      HomeBanner(banners: banners),
                    ],
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  _buildMainTabs(context),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBanner(BuildContext context) {
    final bannerColor = Theme.of(context).colorScheme.primary;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
      height: 160.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28.r),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            bannerColor,
            bannerColor.withValues(alpha: 0.8),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: bannerColor.withValues(alpha: 0.3),
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
                backgroundColor: Theme.of(context).colorScheme.surface.withValues(alpha: 0.1),
              ),
            ),
            Positioned(
              left: -20.w,
              bottom: -20.h,
              child: CircleAvatar(
                radius: 50.r,
                backgroundColor: Theme.of(context).colorScheme.surface.withValues(alpha: 0.05),
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
                        Image.asset(
                          'assets/images/logo.png',
                          height: 32.h,
                          color: Theme.of(context).colorScheme.surface,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          'مدیریت هوشمند',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.surface,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'BonyadeKoodak',
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'پنل اختصاصی مدیریت تعمیرکاران',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.9),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'BonyadeKoodak',
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
                        color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.engineering_rounded,
                        size: 60.sp,
                        color: Theme.of(context).colorScheme.surface,
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

  Widget _buildMainTabs(BuildContext context) {
    final settingsHolder = locator<ShopSettingsHolder>();
    final isAdminShopActive = settingsHolder.isAdminShopActive;
    final isRepairShopActive = settingsHolder.isRepairShopActive;

    return Column(
      children: [
        _buildTabItem(
          context: context,
          title: 'نوبت ها',
          subtitle: 'مدیریت و مشاهده رزروهای مشتریان',
          icon: Icons.calendar_today_rounded,
          color: StatusColors.of(context).warning,
          onTap: () => context.pushNamed('appointments'),
        ),
        if (isAdminShopActive) ...[
          SizedBox(height: 12.h),
          _buildTabItem(
            context: context,
            title: 'خرید عمده',
            subtitle: 'سفارش قطعات و لوازم با قیمت همکار',
            icon: Icons.shopping_cart_rounded,
            color: StatusColors.of(context).info,
            onTap: () => context.pushNamed('shop'),
          ),
        ],
        SizedBox(height: 12.h),
        _buildTabItem(
          context: context,
          title: 'گزارش مالی',
          subtitle: 'بررسی درآمد و تراکنش های فروشگاه',
          icon: Icons.bar_chart_rounded,
          color: StatusColors.of(context).success,
          onTap: () => context.pushNamed('financial_report'),
        ),
        if (isRepairShopActive) ...[
          SizedBox(height: 12.h),
          _buildTabItem(
            context: context,
            title: 'فروشگاه من',
            subtitle: 'مدیریت موجودی و قیمت محصولات',
            icon: Icons.storefront_rounded,
            color: DashboardColors.of(context).adminAccent,
            onTap: () => context.pushNamed('manage_products'),
          ),
        ],
      ],
    );
  }

  Widget _buildTabItem({
    required BuildContext context,
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(32.r),
          border: Border.all(
            color: color.withValues(alpha: 0.1),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            // Right Side: Large Icon with Overlay
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 90.r,
                  height: 90.r,
                  margin: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  child: Center(
                    child: Icon(
                      icon,
                      size: 40.sp,
                      color: color.withValues(alpha: 0.3),
                    ),
                  ),
                ),
                // Small overlay icon
                Positioned(
                  bottom: 8.r,
                  right: 8.r,
                  child: Container(
                    width: 35.r,
                    height: 35.r,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(15.r),
                      border: Border.all(
                        color: theme.colorScheme.surface,
                        width: 2,
                      ),
                    ),
                    child: Icon(
                      icon,
                      size: 14.sp,
                      color: theme.colorScheme.surface,
                    ),
                  ),
                ),
              ],
            ),

            // Middle: Text Section
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w900,
                        color: theme.colorScheme.onSurface,
                        fontFamily: 'BonyadeKoodak',
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: theme.colorScheme.onSurface.withValues(alpha: 0.4),
                        fontFamily: 'BonyadeKoodak',
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Left Side: Arrow Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Container(
                width: 32.r,
                height: 32.r,
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: color.withValues(alpha: 0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.r),
                  child: SvgPicture.asset(
                    'assets/svgs/left_arrow.svg',
                    colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget _buildStatsGrid() {
  //   return GridView.count(
  //     padding: EdgeInsets.zero,
  //     shrinkWrap: true,
  //     physics: const NeverScrollableScrollPhysics(),
  //     crossAxisCount: 2,
  //     crossAxisSpacing: 15.w,
  //     mainAxisSpacing: 15.h,
  //     childAspectRatio: 1.4,
  //     children: [
  //       const DashboardStatsCard(
  //         title: 'فروش امروز',
  //         value: '۱۲,۵۰۰,۰۰۰',
  //         icon: Icons.store_outlined,
  //         iconColor: Color(0xFF3F51B5),
  //         backgroundColor: Color(0xFFE8EAF6),
  //       ),
  //       const DashboardStatsCard(
  //         title: 'سفارشات جدید',
  //         value: '۸',
  //         icon: Icons.shopping_basket_outlined,
  //         iconColor: Color(0xFF009688),
  //         backgroundColor: Color(0xFFE0F2F1),
  //       ),
  //       const DashboardStatsCard(
  //         title: 'نوبت های امروز',
  //         value: '۱۴',
  //         icon: Icons.calendar_today_outlined,
  //         iconColor: Color(0xFFFB8C00),
  //         backgroundColor: Color(0xFFFFF3E0),
  //       ),
  //       const DashboardStatsCard(
  //         title: 'درآمد ماه',
  //         value: '۲۸۵,۰۰۰,۰۰۰',
  //         icon: Icons.account_balance_wallet_outlined,
  //         iconColor: Color(0xFF4CAF50),
  //         backgroundColor: Color(0xFFE8F5E9),
  //       ),
  //     ],
  //   );
  // }
}
