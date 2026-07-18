import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainBottomNav extends StatelessWidget {
  final int currentIndex;
  final String role;
  final Function(int) onTap;

  const MainBottomNav({
    super.key,
    required this.currentIndex,
    required this.role,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isRepairman = role == 'repairman' || role == 'admin';

    return Container(
      margin: EdgeInsets.only(
        left: 24.r,
        right: 24.r,
        bottom: 24.r
      ),
      height: 64.h,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(32.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: isRepairman ? _buildRepairmanItems() : _buildUserItems(),
        ),
      ),
    );
  }

  List<Widget> _buildUserItems() {
    return [
      _NavItem(
        icon: Icons.home_outlined,
        label: 'خانه',
        isSelected: currentIndex == 4,
        onTap: () => onTap(4),
      ),
      _NavItem(
        icon: Icons.design_services_outlined,
        label: 'خدمات مشتری',
        isSelected: currentIndex == 3,
        onTap: () => onTap(3),
      ),
      _NavItem(
        icon: Icons.storefront,
        label: 'فروشگاه',
        isSelected: currentIndex == 2,
        onTap: () => onTap(2),
      ),
      _NavItem(
        icon: Icons.notifications_none,
        label: 'یادآورها',
        isSelected: currentIndex == 1,
        onTap: () => onTap(1),
      ),
      _NavItem(
        icon: Icons.person_outline,
        label: 'پروفایل',
        isSelected: currentIndex == 0,
        onTap: () => onTap(0),
      ),
    ];
  }

  List<Widget> _buildRepairmanItems() {
    return [
      _NavItem(
        icon: Icons.dashboard_outlined,
        label: 'داشبورد',
        isSelected: currentIndex == 4,
        onTap: () => onTap(4),
      ),
      _NavItem(
        icon: Icons.manage_accounts_outlined,
        label: 'مدیریت خدمات',
        isSelected: currentIndex == 3,
        onTap: () => onTap(3),
      ),
      _NavItem(
        icon: Icons.calendar_month_outlined,
        label: 'نوبت‌ها',
        isSelected: currentIndex == 2,
        onTap: () => onTap(2),
      ),
      _NavItem(
        icon: Icons.add_shopping_cart_sharp,
        label: 'محصولات',
        isSelected: currentIndex == 1,
        onTap: () => onTap(1),
      ),
      _NavItem(
        icon: Icons.shopping_bag_outlined,
        label: 'سفارشات',
        isSelected: currentIndex == 0,
        onTap: () => onTap(0),
      ),
    ];
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: isSelected ? 16.w : 8.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? theme.colorScheme.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? theme.colorScheme.onPrimary : theme.colorScheme.onSurface.withValues(alpha: 0.6),
              size: 24.sp,
            ),
            if (isSelected) ...[
              SizedBox(width: 8.w),
              Text(
                label,
                style: TextStyle(
                  color: theme.colorScheme.onPrimary,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
