import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/bloc/app/app_bloc.dart';
import '../../../../../core/bloc/error/error_bloc.dart';
import '../../../../../core/services/locator.dart';
import '../../../../../core/themes/theme_main.dart';
import '../base/base_panel_admin_stateful_widget_state.dart';
import '../bloc/panel_admin_bloc.dart';

class ScreenPanelAdmin extends StatefulWidget {
  const ScreenPanelAdmin({super.key});

  @override
  State<ScreenPanelAdmin> createState() => _ScreenPanelAdminState();
}

class _ScreenPanelAdminState extends BasePanelAdminStatefulWidgetState<ScreenPanelAdmin, PanelAdminBloc> {
  _ScreenPanelAdminState() : super(locator<PanelAdminBloc>());

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          _buildSliverAppBar(context, colorScheme),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20.w, 24.h, 20.w, 8.h),
              child: _buildSectionHeader('مدیریت عمومی', Icons.grid_view_rounded, colorScheme),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 16.h,
                childAspectRatio: 1.1,
              ),
              delegate: SliverChildListDelegate([
                _buildModernCard(
                  context,
                  title: 'مدیریت کاربران',
                  subtitle: 'لیست و وضعیت کاربران',
                  icon: Icons.people_alt_rounded,
                  color: DashboardColors.of(context).adminTeal,
                  onTap: () => context.pushNamed('manage_users'),
                ),
                _buildModernCard(
                  context,
                  title: 'مدیریت بنرها',
                  subtitle: 'تغییر تصاویر اسلایدر',
                  icon: Icons.collections_rounded,
                  color: DashboardColors.of(context).adminYellow,
                  onTap: () => context.pushNamed('manage_banners'),
                ),
                _buildModernCard(
                  context,
                  title: 'مدیریت مشاغل',
                  subtitle: 'ویرایش لیست شغل‌ها',
                  icon: Icons.work_history_rounded,
                  color: DashboardColors.of(context).adminIndigo,
                  onTap: () => context.pushNamed('manage_occupations'),
                ),
                _buildModernCard(
                  context,
                  title: 'مدیریت امتیازها',
                  subtitle: 'تایید و نمایش نظرات',
                  icon: Icons.reviews_rounded,
                  color: DashboardColors.of(context).adminOrange,
                  onTap: () => context.pushNamed('manage_ratings'),
                ),
              ]),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20.w, 32.h, 20.w, 8.h),
              child: _buildSectionHeader('مدیریت فروشگاه', Icons.shopping_bag_rounded, colorScheme),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 16.h,
                childAspectRatio: 1.1,
              ),
              delegate: SliverChildListDelegate([
                _buildModernCard(
                  context,
                  title: 'محصولات عمده',
                  subtitle: 'مدیریت قطعات و لوازم',
                  icon: Icons.inventory_2_rounded,
                  color: DashboardColors.of(context).adminIndigo,
                  onTap: () => context.pushNamed('manage_shop_products'),
                ),
                _buildModernCard(
                  context,
                  title: 'کدهای تخفیف',
                  subtitle: 'تعریف و مدیریت تخفیف‌ها',
                  icon: Icons.local_offer_rounded,
                  color: DashboardColors.of(context).adminAccent,
                  onTap: () => context.pushNamed('manage_discounts'),
                ),
                _buildModernCard(
                  context,
                  title: 'روش‌های ارسال',
                  subtitle: 'مدیریت هزینه‌های پیک',
                  icon: Icons.local_shipping_rounded,
                  color: DashboardColors.of(context).adminTeal,
                  onTap: () => context.pushNamed('manage_sending_methods'),
                ),
                _buildModernCard(
                  context,
                  title: 'حساب‌های بانکی',
                  subtitle: 'مدیریت تسویه حساب‌ها',
                  icon: Icons.account_balance_rounded,
                  color: DashboardColors.of(context).adminOrange,
                  onTap: () => context.pushNamed('manage_bank_accounts'),
                ),
                _buildModernCard(
                  context,
                  title: 'روش‌های پرداخت',
                  subtitle: 'مشاهده و تغییر وضعیت',
                  icon: Icons.payments_rounded,
                  color: StatusColors.of(context).success,
                  onTap: () => context.pushNamed('manage_payment_types'),
                ),
                _buildModernCard(
                  context,
                  title: 'تنظیمات فروشگاه',
                  subtitle: 'فعال/غیرفعال‌سازی بخش‌ها',
                  icon: Icons.settings_applications_rounded,
                  color: DashboardColors.of(context).adminTeal,
                  onTap: () => context.pushNamed('manage_shop_settings'),
                ),
              ]),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20.w, 32.h, 20.w, 8.h),
              child: _buildSectionHeader('مدیریت خدمات', Icons.build_circle_rounded, colorScheme),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 16.h,
                childAspectRatio: 1.1,
              ),
              delegate: SliverChildListDelegate([
                _buildModernCard(
                  context,
                  title: 'مدیریت سرویس‌ها',
                  subtitle: 'لیست و کنترل خدمات',
                  icon: Icons.miscellaneous_services_rounded,
                  color: DashboardColors.of(context).adminYellow,
                  onTap: () => context.pushNamed('manage_service'),
                ),
                _buildModernCard(
                  context,
                  title: 'انواع یادآور',
                  subtitle: 'تعریف دسته‌بندی یادآورها',
                  icon: Icons.notifications_active_outlined,
                  color: DashboardColors.of(context).adminYellow,
                  onTap: () => context.pushNamed('manage_reminder_types'),
                ),
              ]),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 40.h)),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar(BuildContext context, ColorScheme colorScheme) {
    return SliverAppBar(
      expandedHeight: 135.h,
      floating: false,
      pinned: false,
      elevation: 0,
      backgroundColor: colorScheme.primary,
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                colorScheme.primary,
                colorScheme.primary.withValues(alpha: 0.8),
              ],
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: -20.h,
                left: -20.w,
                child: Icon(
                  Icons.admin_panel_settings_rounded,
                  size: 200.sp,
                  color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.05),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(12.r),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            child: Icon(
                              Icons.admin_panel_settings_rounded,
                              color: Theme.of(context).colorScheme.surface,
                              size: 28.sp,
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'پنل مدیریت',
                                style: TextStyle(
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w900,
                                  color: Theme.of(context).colorScheme.surface,
                                  fontFamily: 'BonyadeKoodak',
                                ),
                              ),
                              Text(
                                'خوش آمدید به مرکز کنترل سیستم',
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.8),
                                  fontFamily: 'BonyadeKoodak',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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

  Widget _buildSectionHeader(String title, IconData icon, ColorScheme colorScheme) {
    return Row(
      children: [
        Icon(icon, size: 20.sp, color: colorScheme.primary.withValues(alpha: 0.7)),
        SizedBox(width: 8.w),
        Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w900,
            color: colorScheme.onSurface,
            fontFamily: 'BonyadeKoodak',
          ),
        ),
      ],
    );
  }

  Widget _buildModernCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.04),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(24.r),
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.r),
                      decoration: BoxDecoration(
                        color: color.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                      child: Icon(icon, color: color, size: 24.sp),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 12.sp,
                      color: Theme.of(context).colorScheme.outlineVariant,
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w900,
                    color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.87),
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
                    color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.45),
                    fontFamily: 'BonyadeKoodak',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
