import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/services/locator.dart';
import '../../../../core/services/shop_settings_holder.dart';
import '../../domain/entity/profile_entity.dart';

class ProfileMenuItems extends StatelessWidget {
  final ProfileEntity profile;

  const ProfileMenuItems({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final settingsHolder = locator<ShopSettingsHolder>();
    final isAdminShopActive = settingsHolder.isAdminShopActive;
    final isRepairShopActive = settingsHolder.isRepairShopActive;

    final role = profile.role.toLowerCase();
    bool showCart = true;

    if (role == 'repairman') {
      showCart = isAdminShopActive;
    } else if (role == 'admin') {
      showCart = isAdminShopActive;
    } else {
      showCart = isRepairShopActive;
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surface.withValues(alpha: 0.6),
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.1),
            width: 1.5,
          ),
        ),
        child: Column(
          children: [
            if (showCart)
              _buildMenuItem(
                context,
                Icons.shopping_basket_outlined,
                'سبد خرید',
                onTap: () => context.pushNamed('shop_basket'),
              ),
            _buildMenuItem(context, Icons.image_outlined, 'تصاویر من'),
            _buildMenuItem(context, Icons.star_outline, 'اشتراک و اعتبار'),
            _buildMenuItem(context, Icons.bar_chart_outlined, 'آمار'),
            _buildMenuItem(
              context,
              Icons.settings_outlined,
              'تنظیمات',
              isLast: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    IconData icon,
    String title, {
    bool isLast = false,
    VoidCallback? onTap,
  }) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            child: Row(
              children: [
                Icon(icon,
                    size: 24.sp,
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.8)),
                SizedBox(width: 16.w),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
                    ),
                  ),
                ),
                Icon(Icons.chevron_left,
                    size: 24.sp,
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.5)),
              ],
            ),
          ),
          if (!isLast)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Divider(
                height: 1,
                color: theme.colorScheme.onSurface.withValues(alpha: 0.05),
              ),
            ),
        ],
      ),
    );
  }
}
