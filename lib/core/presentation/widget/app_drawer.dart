import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:chaharmahal_shop_front/core/enums/user_role.dart';
import 'package:chaharmahal_shop_front/core/services/locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../features/feature_home/presentation/bloc/main_home_page_bloc.dart';
import '../../../features/feature_profile/domain/entity/profile_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chaharmahal_shop_front/core/themes/theme_main.dart';
import '../../resources/consts.dart';

class AppDrawer extends StatelessWidget {
  final String role;
  const AppDrawer({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final userRole = UserRole.fromString(role);
    final bool isAdmin = userRole.isAdmin;
    final bool isRepairman = userRole.isRepairman;

    return Drawer(
      width: 285.w,
      backgroundColor: colorScheme.surface,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.r),
          bottomLeft: Radius.circular(12.r),
        ),
      ),
      child: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 18.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isAdmin) ...[
                    _buildSectionLabel(context, 'مدیریت سیستم'),
                    _buildDrawerItem(
                      context,
                      icon: Icons.admin_panel_settings_outlined,
                      title: 'پنل ادمین',
                      onTap: () {
                        context.pop();
                        context.pushNamed('panel_admin');
                      },
                    ),
                    _buildDrawerItem(
                      context,
                      icon: Icons.dashboard_outlined,
                      title: 'داشبورد',
                      onTap: () {
                        context.pop();
                        context.pushNamed('admin_dashboard');
                      },
                    ),
                    _buildDrawerItem(
                      context,
                      icon: Icons.people_outline_rounded,
                      title: 'خدمات دهندگان',
                      onTap: () {
                        context.pop();
                        context.pushNamed('admin_service_providers');
                      },
                    ),
                    _buildDrawerItem(
                      context,
                      icon: Icons.receipt_long_rounded,
                      title: 'تراکنش ها',
                      onTap: () {
                        context.pop();
                        context.pushNamed('admin_transactions');
                      },
                    ),
                    _buildDrawerItem(
                      context,
                      icon: Icons.account_balance_wallet_outlined,
                      title: 'تسویه حساب',
                      onTap: () {
                        context.pop();
                        context.pushNamed('admin_settlements');
                      },
                    ),
                    _buildDrawerItem(
                      context,
                      icon: Icons.notifications_active_outlined,
                      title: 'مدیریت انواع یادآور',
                      onTap: () {
                        context.pop();
                        context.pushNamed('manage_reminder_types');
                      },
                    ),
                    _buildDrawerItem(
                      context,
                      icon: Icons.payments_rounded,
                      title: 'روش های پرداخت من',
                      onTap: () {
                        context.pop();
                        context.pushNamed('repairman_payment_type');
                      },
                    ),
                    SizedBox(height: 14.h),
                  ],
                  if (isRepairman) ...[
                    _buildSectionLabel(context, 'مدیریت تعمیرگاه'),
                    _buildDrawerItem(
                      context,
                      icon: Icons.payments_rounded,
                      title: 'روش های پرداخت',
                      onTap: () {
                        context.pop();
                        context.pushNamed('repairman_payment_type');
                      },
                    ),
                    _buildDrawerItem(
                      context,
                      icon: Icons.local_offer_rounded,
                      title: 'کد تخفیف',
                      onTap: () {
                        context.pop();
                        // No navigation for now as requested
                      },
                    ),
                    SizedBox(height: 14.h),
                  ],
                  _buildSectionLabel(context, 'حساب کاربری'),
                  _buildDrawerItem(
                    context,
                    icon: Icons.history_rounded,
                    title: 'تاریخچه سفارشات',
                    onTap: () {},
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.favorite_border_rounded,
                    title: 'سرگرمی',
                    onTap: () {},
                  ),
                  SizedBox(height: 14.h),
                  _buildSectionLabel(context, 'پشتیبانی و تنظیمات'),
                  _buildDrawerItem(
                    context,
                    icon: Icons.settings_outlined,
                    title: 'تنظیمات',
                    onTap: () {},
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.info_outline_rounded,
                    title: 'درباره ما',
                    onTap: () {
                      context.pop();
                      context.pushNamed('about_us');
                    },
                  ),
                ],
              ),
            ),
          ),
          _buildLogoutButton(context),
          SizedBox(height: 10.h),
          SizedBox(height: 18.h),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<MainHomePageBloc, MainHomePageState>(
      builder: (context, state) {
        final ProfileEntity? profile = state.profile;

        final userRole = UserRole.fromString(profile?.role ?? role);
        final bool isRepairman = userRole.isRepairman;
        final bool isAdmin = userRole.isAdmin;
        final String displayName = profile?.fullName ?? (isAdmin ? 'مدیر سیستم' : 'کاربر زینو');

        return InkWell(
          onTap: () {
            context.pop();
            context.pushNamed('profile');
          },
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  colorScheme.primary,
                  Color.lerp(colorScheme.primary, colorScheme.onSurface, 0.25)!,
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12.r),
              ),
              boxShadow: [
                BoxShadow(
                  color: colorScheme.primary.withValues(alpha: 0.3),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(20.w, 60.h, 20.w, 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.all(2.r),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: colorScheme.onPrimary.withValues(alpha: 0.8), width: 2),
                            ),
                            child: CircleAvatar(
                              radius: 30.r,
                              backgroundColor: colorScheme.surface,
                              backgroundImage: (profile?.profileImageId != null && profile!.profileImageId!.isNotEmpty)
                                  ? CachedNetworkImageProvider('${Consts.baseFileUrl}${profile.profileImageId}')
                                  : null,
                              child: (profile?.profileImageId == null || profile!.profileImageId!.isEmpty)
                                  ? Icon(
                                      Icons.person_rounded,
                                      size: 32.sp,
                                      color: colorScheme.primary,
                                    )
                                  : null,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.all(4.r),
                              decoration: BoxDecoration(
                                color: StatusColors.of(context).warning,
                                shape: BoxShape.circle,
                                border: Border.all(color: colorScheme.surface, width: 1.5),
                              ),
                              child: Icon(
                                isAdmin
                                    ? Icons.admin_panel_settings_rounded
                                    : (isRepairman ? Icons.build_rounded : Icons.verified_user_rounded),
                                size: 10.sp,
                                color: colorScheme.onPrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              displayName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: colorScheme.onPrimary,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'BonyadeKoodak',
                              ),
                            ),
                            if (profile?.mobile != null) ...[
                              SizedBox(height: 2.h),
                              Text(
                                _toPersianDigit(profile!.mobile),
                                style: TextStyle(
                                  color: colorScheme.onPrimary.withValues(alpha: 0.7),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'BonyadeKoodak',
                                ),
                              ),
                            ],
                            SizedBox(height: 4.h),
                            Row(
                              children: [
                                Text(
                                  'مشاهده پروفایل',
                                  style: TextStyle(
                                    color: colorScheme.onPrimary.withValues(alpha: 0.7),
                                    fontSize: 11.sp,
                                    fontFamily: 'BonyadeKoodak',
                                  ),
                                ),
                                Icon(Icons.chevron_right_rounded, color: colorScheme.onPrimary.withValues(alpha: 0.7), size: 14.sp),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

          ),
        );
      },
    );
  }

  Widget _buildSectionLabel(BuildContext context, String label) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: EdgeInsets.only(right: 8.w, bottom: 10.h),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.3,
          color: colorScheme.onSurface.withValues(alpha: 0.45),
        ),
      ),
    );
  }

  Widget _buildDrawerItem(
      BuildContext context, {
        required IconData icon,
        required String title,
        required VoidCallback onTap,
        Color? accent,
      }) {
    final colorScheme = Theme.of(context).colorScheme;
    final Color color = accent ?? colorScheme.primary;

    return Padding(
      padding: EdgeInsets.only(bottom: 6.h),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16.r),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 9.h),
            child: Row(
              children: [
                Container(
                  width: 40.w,
                  height: 40.w,
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Icon(icon, size: 20.sp, color: color),
                ),
                SizedBox(width: 14.w),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right_rounded,
                  size: 20.sp,
                  color: colorScheme.onSurface.withValues(alpha: 0.3),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () async {
            final storage = locator<FlutterSecureStorage>();
            await storage.delete(key: 'token');
            await storage.delete(key: 'status');
            if (context.mounted) {
              context.go('/');
            }
          },
          borderRadius: BorderRadius.circular(16.r),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
            decoration: BoxDecoration(
              color: colorScheme.error.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: colorScheme.error.withValues(alpha: 0.25)),
            ),
            child: Row(
              children: [
                Container(
                  width: 35.w,
                  height: 35.w,
                  decoration: BoxDecoration(
                    color: colorScheme.error.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Icon(
                    Icons.logout_rounded,
                    color: colorScheme.error,
                    size: 20.sp,
                  ),
                ),
                SizedBox(width: 14.w),
                Text(
                  'خروج از حساب',
                  style: TextStyle(
                    color: colorScheme.error,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _toPersianDigit(String input) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const persian = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];
    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(english[i], persian[i]);
    }
    return input;
  }
}
