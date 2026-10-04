import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:chaharmahal_shop_front/core/routes/app_route_meta.dart';
import 'package:chaharmahal_shop_front/features/feature_appointments/presentation/widget/comment_input_bottom_sheet.dart';
import 'package:chaharmahal_shop_front/features/feature_home/presentation/bloc/main_home_page_bloc.dart';
import 'package:chaharmahal_shop_front/features/feature_home/presentation/widget/home_header.dart';
import 'package:chaharmahal_shop_front/features/feature_home/presentation/widget/main_bottom_nav.dart';
import 'app_drawer.dart';

class MainShell extends StatelessWidget {
  final Widget child;
  final Uri appUri;
  final Object? extra;

  const MainShell({
    super.key,
    required this.child,
    required this.appUri,
    this.extra,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<MainHomePageBloc, MainHomePageState>(
      listenWhen: (previous, current) => 
          current.profile?.pendingFeedback != null && 
          current.profile?.pendingFeedback?.feedbackNotifiedAt == null &&
          previous.profile?.pendingFeedback == null,
      listener: (context, state) {
        final feedback = state.profile!.pendingFeedback!;
        
        // Use a small delay to ensure the shell is fully built
        Future.delayed(const Duration(milliseconds: 500), () {
          if (context.mounted) {
            CommentInputBottomSheet.show(
              context,
              shopName: feedback.shopName,
              repairmanId: feedback.repairmanId,
              repairmanName: feedback.repairmanName,
              repairmanImageId: feedback.repairmanImageId,
              date: feedback.date,
              time: feedback.time,
            );
          }
        });
      },
      child: BlocBuilder<MainHomePageBloc, MainHomePageState>(
        builder: (context, state) {
        final path = appUri.path;
        final AppRouteMeta? meta = extra is AppRouteMeta ? (extra as AppRouteMeta) : null;
        final String title = meta?.title ?? _getTitle(state);
        final bool isSubPage = meta?.isSubPage ?? _fallbackIsSubPage(path);
        final bool isHome = path.startsWith('/home') && (state.role != 'repairman' && state.role != 'admin') && state.index == 4;
        final colorScheme = Theme.of(context).colorScheme;

        final bool isRepairmanHome = path.startsWith('/home') && (state.role == 'repairman' || state.role == 'admin') && state.index == 2;
        final bool isAboutUs = path == '/about_us';

        return Scaffold(
          backgroundColor: colorScheme.surfaceContainerLow,
          appBar: isAboutUs
            ? null
            : (isHome 
                ? const HomeHeader() 
                : AppBar(
                backgroundColor: colorScheme.surface,
                elevation: 0,
                surfaceTintColor: Colors.transparent,
                title: isHome || isRepairmanHome || title == 'داشبورد'
                    ? Image.asset('assets/images/logo.png', height: 40.h, fit: BoxFit.contain)
                    : Text(
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
                              decoration: BoxDecoration(
                                color: colorScheme.error,
                                shape: BoxShape.circle,
                              ),
                              constraints: BoxConstraints(
                                minWidth: 14.w,
                                minHeight: 14.w,
                              ),
                              child: Text(
                                '${state.alarmCount}',
                                style: TextStyle(
                                  color: colorScheme.surface,
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
              )),

          drawer: isSubPage ? null : AppDrawer(role: state.role),
          body: child,
          bottomNavigationBar: MainBottomNav(
            currentIndex: state.index,
            role: state.role,
            onTap: (index) {
              context.read<MainHomePageBloc>().add(ChangeScreen(index));
              if (path != '/home') {
                context.goNamed('home');
              }
            },
          ),
        );
      },
    ),
  );
}

  bool _fallbackIsSubPage(String path) {
    return path.contains('/add_') ||
        path.contains('/product_detail') ||
        path.contains('/shop_basket') ||
        path == '/all_top_repair_shops' ||
        path.startsWith('/repair_shop/') ||
        path.contains('/edit') ||
        path.startsWith('/category_detail/') ||
        path.endsWith('/products') ||
        path.startsWith('/reminder_details') ||
        path.startsWith('/repairman/payment-type') ||
        path.startsWith('/checkout') ||
        path.contains('/manage_shop_settings') ||
        path == '/about_us';
  }

  String _getTitle(MainHomePageState state) {
    final path = appUri.path;

    if (path.startsWith('/repair_shop/')) {
      if (path.endsWith('/products')) return 'همه محصولات';
      return appUri.queryParameters['shop_name'] ?? 'جزئیات تعمیرگاه';
    }

    if (path.startsWith('/category_detail/')) {
      return Uri.decodeComponent(path.split('/').last);
    }

    if (path.startsWith('/home')) {
      return _getHomeTabTitle(state);
    }
    
    if (path.startsWith('/checkout')) return 'تایید و پرداخت';
    if (path.startsWith('/manage_products')) return 'مدیریت محصولات';
    if (path.startsWith('/repairman/payment-type')) return 'روش‌های پرداخت من';
    if (path.startsWith('/add_product')) return 'افزودن محصول';
    if (path.startsWith('/product_detail')) return 'جزئیات محصول';
    if (path.startsWith('/manage_services')) return 'مدیریت خدمات';
    if (path.startsWith('/add_service')) return 'افزودن خدمت';
    if (path.startsWith('/dashboard')) return 'داشبورد';
    if (path.startsWith('/financial_report')) return 'گزارش مالی';
    if (path.startsWith('/orders')) return 'سفارشات';
    if (path.startsWith('/appointments')) return 'نوبت‌ها';
    if (path.startsWith('/create_time_slot')) return 'مدیریت زمان‌بندی';
    if (path.startsWith('/reminders')) return 'یادآورها';
    if (path.startsWith('/add_reminder')) return 'ثبت یادآور جدید';
    if (path.startsWith('/edit_reminder')) return 'ویرایش یادآور';
    if (path.startsWith('/reminder_details')) return 'جزئیات یادآور';
    if (path.startsWith('/admin/panel/services')) return 'مدیریت سرویس‌ها';
    if (path.startsWith('/admin/panel/addresses')) return 'مدیریت آدرس‌ها';
    if (path.startsWith('/admin/panel/occupations')) return 'مدیریت مشاغل';
    if (path.startsWith('/admin/panel/bank_accounts')) return 'مدیریت حساب‌های بانکی';
    if (path.startsWith('/admin/panel/discounts')) return 'مدیریت کدهای تخفیف';
    if (path.startsWith('/admin/panel/sending_methods')) return 'مدیریت روش‌های ارسال';
    if (path.startsWith('/admin/panel/manage_shop_settings')) return 'تنظیمات فروشگاه';
    if (path.startsWith('/admin/dashboard')) return 'داشبورد مدیریت';
    if (path.startsWith('/admin/service_providers')) return 'خدمات دهندگان';
    if (path.startsWith('/admin/transactions')) return 'تراکنش ها';
    if (path.startsWith('/admin/settlements')) return 'تسویه حساب';
    if (path.startsWith('/admin/panel/banners/add')) return 'افزودن بنر';
    if (path.startsWith('/admin/panel/banners/edit')) return 'ویرایش بنر';
    if (path.startsWith('/admin/panel/banners')) return 'مدیریت بنرها';
    if (path.startsWith('/admin/panel')) return 'پنل مدیریت';
    if (path.startsWith('/profile')) return 'پروفایل کاربری';
    if (path == '/shop_basket') return 'سبد خرید';
    if (path == '/shop') return 'فروشگاه';
    if (path == '/about_us') return 'درباره ما';
    
    if (path == '/all_top_repair_shops') return 'تعمیرگاه های برتر';
    if (path.startsWith('/client_services')) return 'خدمات';
    
    return 'زینو';
  }

  String _getHomeTabTitle(MainHomePageState state) {
    if (state.role == 'repairman' || state.role == 'admin') {
      switch (state.index) {
        case 0:
          return 'پروفایل کاربری';
        case 1:
          return 'سفارشات';
        case 2:
          return 'داشبورد';
        case 3:
          return 'مدیریت زمان‌بندی';
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
          return 'رزروهای من';
        case 4:
          return 'خانه';
        default:
          return 'خانه';
      }
    }
  }
}
