import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:resturant_app/features/feature_home/presentation/bloc/main_home_page_bloc.dart';
import 'package:resturant_app/features/feature_home/presentation/widget/home_header.dart';
import 'app_drawer.dart';

class MainShell extends StatelessWidget {
  final Widget child;
  final Uri appUri;

  const MainShell({
    super.key,
    required this.child,
    required this.appUri,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainHomePageBloc, MainHomePageState>(
      builder: (context, state) {
        final path = appUri.path;
        final String title = _getTitle(state);
        final bool showFilter = title == 'نوبت‌ها' || title == 'یادآورها' || title == 'ثبت یادآور جدید' || title == 'تراکنش ها' || title == 'تسویه حساب';
        
        final bool isSubPage = path.contains('/add_') || path.contains('/product_detail') || path.contains('/shop_basket') || path == '/all_top_repair_shops' || path.startsWith('/repair_shop/') || path.contains('/edit');
        final bool isHome = path.startsWith('/home') && state.role != 'repairman' && state.index == 4;
        final colorScheme = Theme.of(context).colorScheme;

        return Scaffold(
          backgroundColor: Color(0xFFF8F9FA),
          appBar: isHome ? const HomeHeader() : AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            surfaceTintColor: Colors.transparent,
            title: Text(
              title,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w900,
                color: colorScheme.onSurface,
              ),
            ),
            centerTitle: true,
            leading: Builder(
              builder: (context) => isSubPage
                  ? IconButton(
                      icon: Icon(Icons.arrow_back_ios_new_rounded, color: colorScheme.onSurface, size: 20.sp),
                      onPressed: () => context.pop(),
                    )
                  : IconButton(
                      icon: Container(
                        padding: EdgeInsets.all(8.r),
                        decoration: BoxDecoration(
                          color: colorScheme.primary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Icon(Icons.menu_open_rounded, size: 22.sp, color: colorScheme.primary),
                      ),
                      onPressed: () => Scaffold.of(context).openDrawer(),
                    ),
            ),
            actions: [
              if (showFilter)
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.tune_rounded, size: 22.sp, color: colorScheme.onSurface.withValues(alpha: 0.6)),
                ),
              if (state.alarmCount > 0)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(Icons.notifications_none_rounded, size: 24.sp, color: colorScheme.onSurface),
                      Positioned(
                        top: 12.h,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(4.r),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          constraints: BoxConstraints(
                            minWidth: 14.w,
                            minHeight: 14.w,
                          ),
                          child: Text(
                            '${state.alarmCount}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 9.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              SizedBox(width: 8.w),
            ],
          ),
          drawer: isSubPage ? null : AppDrawer(role: state.role),
          body: child,
        );
      },
    );
  }

  String _getTitle(MainHomePageState state) {
    final path = appUri.path;

    if (path.startsWith('/repair_shop/')) {
      return appUri.queryParameters['shop_name'] ?? 'جزئیات تعمیرگاه';
    }

    if (path.startsWith('/home')) {
      return _getHomeTabTitle(state);
    }
    
    if (path.startsWith('/manage_products')) return 'مدیریت محصولات';
    if (path.startsWith('/add_product')) return 'افزودن محصول';
    if (path.startsWith('/product_detail')) return 'جزئیات محصول';
    if (path.startsWith('/manage_services')) return 'مدیریت خدمات';
    if (path.startsWith('/add_service')) return 'افزودن خدمت';
    if (path.startsWith('/dashboard')) return 'داشبورد';
    if (path.startsWith('/financial_report')) return 'گزارش مالی';
    if (path.startsWith('/orders')) return 'سفارشات';
    if (path.startsWith('/appointments')) return 'نوبت‌ها';
    if (path.startsWith('/reminders')) return 'یادآورها';
    if (path.startsWith('/add_reminder')) return 'ثبت یادآور جدید';
    if (path.startsWith('/admin/panel/addresses')) return 'مدیریت آدرس‌ها';
    if (path.startsWith('/admin/panel/occupations')) return 'مدیریت مشاغل';
    if (path.startsWith('/admin/panel/bank_accounts')) return 'مدیریت حساب‌های بانکی';
    if (path.startsWith('/admin/panel/discounts')) return 'مدیریت کدهای تخفیف';
    if (path.startsWith('/admin/panel/sending_methods')) return 'مدیریت روش‌های ارسال';
    if (path.startsWith('/admin/dashboard')) return 'داشبورد مدیریت';
    if (path.startsWith('/admin/service_providers')) return 'خدمات دهندگان';
    if (path.startsWith('/admin/transactions')) return 'تراکنش ها';
    if (path.startsWith('/admin/settlements')) return 'تسویه حساب';
    if (path.startsWith('/admin/panel')) return 'پنل مدیریت';
    if (path.startsWith('/profile')) return 'پروفایل کاربری';
    if (path == '/shop_basket') return 'سبد خرید';
    if (path == '/shop') return 'فروشگاه';
    
    if (path == '/all_top_repair_shops') return 'تعمیرگاه های برتر';
    if (path.startsWith('/client_services')) return 'خدمات';
    
    return 'زینو';
  }

  String _getHomeTabTitle(MainHomePageState state) {
    if (state.role == 'repairman') {
      switch (state.index) {
        case 0:
          return 'سفارشات';
        case 1:
          return 'مدیریت محصولات';
        case 2:
          return 'نوبت‌ها';
        case 3:
          return 'مدیریت خدمات';
        case 4:
          return 'داشبورد';
        default:
          return 'داشبورد';
      }
    } else {
      switch (state.index) {
        case 0:
          return 'پروفایل';
        case 1:
          return 'یادآورها';
        case 2:
          return 'فروشگاه';
        case 3:
          return 'خدمات مشتری';
        case 4:
          return 'خانه';
        default:
          return 'خانه';
      }
    }
  }
}
