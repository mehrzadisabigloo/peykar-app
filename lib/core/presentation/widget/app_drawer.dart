import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:resturant_app/core/services/locator.dart';

class AppDrawer extends StatelessWidget {
  final String role;
  const AppDrawer({super.key, required this.role});

  // Safety amber accent from the mechanic palette.
  static const Color _amber = Color(0xFFFFB300);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final bool isAdmin = role == 'admin';

    return Drawer(
      width: 285.w,
      backgroundColor: colorScheme.surface,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          bottomLeft: Radius.circular(30.r),
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
                    SizedBox(height: 14.h),
                  ],
                  _buildSectionLabel(context, 'حساب کاربری'),
                  _buildDrawerItem(
                    context,
                    icon: Icons.person_outline_rounded,
                    title: 'پروفایل کاربری',
                    onTap: () {
                      context.pop();
                      context.pushNamed('profile');
                    },
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.history_rounded,
                    title: 'تاریخچه سفارشات',
                    onTap: () {},
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.favorite_border_rounded,
                    title: 'علاقه‌مندی‌ها',
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
                    onTap: () {},
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
    final bool isRepairman = role == 'repairman';
    final bool isAdmin = role == 'admin';

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            colorScheme.primary,
            Color.lerp(colorScheme.primary, Colors.black, 0.30)!,
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.r),
        ),
        boxShadow: [
          BoxShadow(
            color: colorScheme.primary.withValues(alpha: 0.35),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(24.w, 58.h, 24.w, 26.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(3.r),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2.5),
                  ),
                  child: CircleAvatar(
                    radius: 32.r,
                    backgroundColor: colorScheme.surface,
                    child: Icon(
                      Icons.person_rounded,
                      size: 38.sp,
                      color: colorScheme.primary,
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
            SizedBox(height: 16.h),
            Text(
              isAdmin ? 'مدیر سیستم' : 'کاربر زینو',
              style: TextStyle(
                color: colorScheme.onPrimary,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
              decoration: BoxDecoration(
                color: _amber.withValues(alpha: 0.18),
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(color: Colors.white.withValues(alpha: 0.5)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    isAdmin
                        ? Icons.admin_panel_settings_rounded
                        : (isRepairman ? Icons.build_rounded : Icons.verified_user_rounded),
                    size: 14.sp,
                    color: Colors.white,
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    isAdmin
                        ? 'ادمین زینو'
                        : (isRepairman ? 'تعمیرکار متخصص' : 'مشتری عزیز'),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
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
}
