import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:resturant_app/core/themes/theme_main.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../features/feature_home/presentation/bloc/main_home_page_bloc.dart';


class ScreenAboutUs extends StatelessWidget {
  const ScreenAboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocBuilder<MainHomePageBloc, MainHomePageState>(
        builder: (context, state) {
          final bool isAdmin = state.role == 'admin';

          return Scaffold(
            backgroundColor: colorScheme.surface,
            floatingActionButton: isAdmin
                ? FloatingActionButton.extended(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('قابلیت ویرایش بزودی اضافه خواهد شد')),
                      );
                    },
                    backgroundColor: colorScheme.primary,
                    icon: Icon(Icons.edit_rounded, color: colorScheme.onPrimary),
                    label: Text(
                      'ویرایش اطلاعات',
                      style: TextStyle(color: colorScheme.onPrimary, fontWeight: FontWeight.bold),
                    ),
                  )
                : null,
            body: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                // 1. App Bar with Illustration & Logo
                SliverAppBar(
                  expandedHeight: 260.h,
                  pinned: true,
                  backgroundColor: colorScheme.primary,
                  elevation: 0,
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back_ios_new_rounded, color: colorScheme.onPrimary, size: 20),
                    onPressed: () => context.pop(),
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      fit: StackFit.expand,
                      children: [
                        // Background Gradient
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                colorScheme.primary,
                                Color.lerp(colorScheme.primary, colorScheme.onSurface, 0.3)!,
                              ],
                            ),
                          ),
                        ),
                        // Decorative Circles
                        Positioned(
                          top: -50.h,
                          right: -50.w,
                          child: CircleAvatar(
                            radius: 100.r,
                            backgroundColor: colorScheme.onPrimary.withValues(alpha: 0.05),
                          ),
                        ),
                        // Content
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 50.h),
                            Hero(
                              tag: 'app_logo',
                              child: Container(
                                padding: EdgeInsets.all(12.r),
                                decoration: BoxDecoration(
                                  color: colorScheme.surface,
                                  borderRadius: BorderRadius.circular(24.r),
                                  boxShadow: [
                                    BoxShadow(
                                      color: colorScheme.onSurface.withValues(alpha: 0.15),
                                      blurRadius: 25,
                                      offset: const Offset(0, 10),
                                    ),
                                  ],
                                ),

                                child: Image.asset(
                                  'assets/images/logo.png',
                                  height: 70.h,
                                  errorBuilder: (context, error, stackTrace) => Icon(
                                    Icons.build_circle_rounded,
                                    size: 70.h,
                                    color: colorScheme.primary,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 18.h),
                            Text(
                              'سامانه هوشمند آچار اپ',
                              style: TextStyle(
                                color: colorScheme.onPrimary,
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 0.5,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                              decoration: BoxDecoration(
                                color: colorScheme.onPrimary.withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: Text(
                                'نسخه ۱.۰.۰',
                                style: TextStyle(
                                  color: colorScheme.onPrimary,
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // 2. Main Content
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // About Section
                        _buildSectionHeader('داستان ما', Icons.auto_awesome_rounded, colorScheme),
                        SizedBox(height: 16.h),
                        Container(
                          padding: EdgeInsets.all(20.r),
                          decoration: BoxDecoration(
                            color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                            borderRadius: BorderRadius.circular(24.r),
                            boxShadow: [
                              BoxShadow(
                                color: colorScheme.onSurface.withValues(alpha: 0.03),
                                blurRadius: 20,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),

                          child: Text(
                            'آچار اپ فراتر از یک اپلیکیشن، دستیار هوشمند شما در دنیای خدمات و تعمیرات است. ما با هدف ایجاد پلی مطمئن میان متخصصین حرفه‌ای و صاحبان خودرو، پلتفرمی را طراحی کرده‌ایم که در آن کیفیت، سرعت و شفافیت حرف اول را می‌زند. از تعمیرات تخصصی در محل تا تامین قطعات یدکی اصلی، آچار اپ همیشه در کنار شماست تا خیالتان از بابت سلامت فنی خودرو راحت باشد.',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: colorScheme.onSurface,
                              height: 1.9,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        
                        SizedBox(height: 36.h),
                        
                        // Contact Section
                        _buildSectionHeader('راه‌های ارتباطی', Icons.contact_support_rounded, colorScheme),
                        SizedBox(height: 16.h),
                        _buildContactCard(
                          context,
                          icon: Icons.phone_in_talk_rounded,
                          title: 'مرکز تماس مشتریان',
                          value: '۰۹۱۹۰۶۱۶۸۲۰',
                          subtitle: 'پاسخگویی ۲۴ ساعته',
                          color: StatusColors.of(context).info,
                          onTap: () => _launchUrl('tel:09190616820'),
                        ),
                        _buildContactCard(
                          context,
                          icon: Icons.email_rounded,
                          title: 'ایمیل پشتیبانی',
                          value: 'support@achrapp.ir',
                          subtitle: 'info@achrapp.ir',
                          color: colorScheme.error,
                          onTap: () => _launchUrl('mailto:support@achrapp.ir'),
                        ),
                        _buildContactCard(
                          context,
                          icon: Icons.public_rounded,
                          title: 'وب‌سایت آچار اپ',
                          value: 'www.achrapp.ir',
                          subtitle: 'آخرین اخبار و اطلاعیه‌ها',
                          color: StatusColors.of(context).success,
                          onTap: () => _launchUrl('https://www.achrapp.ir'),
                        ),
                        _buildContactCard(
                          context,
                          icon: Icons.location_on_rounded,
                          title: 'نشانی دفتر مرکزی',
                          value: 'چهارمحال و بختیاری، شهرکرد، خیابان کاشانی، پارک علم و فناوری',
                          subtitle: 'ساختمان مرکزی آچار اپ',
                          color: colorScheme.primary,
                          isMultiLine: true,
                        ),


                        SizedBox(height: 36.h),

                        // Social Section
                        _buildSectionHeader('همراه ما باشید', Icons.share_rounded, colorScheme),
                        SizedBox(height: 18.h),
                        Column(
                          children: [
                            _buildSocialTile(
                              context,
                              icon: Icons.send_rounded,
                              label: 'تلگرام آچار اپ',
                              username: '@achrapp',
                              color: StatusColors.of(context).info,
                              onTap: () => _launchUrl('https://t.me/achrapp'),
                            ),
                            SizedBox(height: 12.h),
                            _buildSocialTile(
                              context,
                              icon: Icons.camera_alt_rounded,
                              label: 'اینستاگرام آچار اپ',
                              username: 'achrapp',
                              color: colorScheme.error,
                              onTap: () => _launchUrl('https://instagram.com/achrapp'),
                            ),
                            SizedBox(height: 12.h),
                            _buildSocialTile(
                              context,
                              icon: Icons.chat_rounded,
                              label: 'واتس‌اپ پشتیبانی',
                              username: '۰۹۱۹۰۶۱۶۸۲۰',
                              color: StatusColors.of(context).success,
                              onTap: () => _launchUrl('https://wa.me/989190616820'),
                            ),
                          ],
                        ),
                        SizedBox(height: 40.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionHeader(String title, IconData icon, ColorScheme colorScheme) {
    return Row(
      children: [
        Icon(icon, size: 20.sp, color: colorScheme.primary),
        SizedBox(width: 10.w),
        Text(
          title,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w900,
            color: colorScheme.onSurface,
          ),
        ),

      ],
    );
  }

  Widget _buildContactCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String value,
    required String subtitle,
    required Color color,
    VoidCallback? onTap,
    bool isMultiLine = false,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(24.r),
          boxShadow: [
            BoxShadow(
              color: colorScheme.onSurface.withValues(alpha: 0.02),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),

        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(24.r),
            child: Padding(
              padding: EdgeInsets.all(18.r),
              child: Row(
                children: [
                  Container(
                    width: 54.w,
                    height: 54.w,
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(18.r),
                    ),
                    child: Icon(icon, size: 26.sp, color: color),
                  ),
                  SizedBox(width: 18.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: colorScheme.onSurfaceVariant,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          value,
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w800,
                            color: colorScheme.onSurface,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          subtitle,
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: colorScheme.outline,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (onTap != null)
                    Container(
                      padding: EdgeInsets.all(8.r),
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 12.sp,
                        color: colorScheme.outline,
                      ),
                    ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialTile(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String username,
    required Color color,
    required VoidCallback onTap,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: colorScheme.onSurface.withValues(alpha: 0.02),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),

      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(24.r),
          child: Padding(
            padding: EdgeInsets.all(16.r),
            child: Row(
              children: [
                Container(
                  width: 52.w,
                  height: 52.w,
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Icon(icon, color: color, size: 28.sp),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        label,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w900,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        username,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }
}
