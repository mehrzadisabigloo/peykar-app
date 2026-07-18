import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/bloc/app/app_bloc.dart';
import '../../../../../core/bloc/error/error_bloc.dart';
import '../../../../../core/services/locator.dart';
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

    return Container(
      color: const Color(0xFFF8F9FB),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20.w, 24.h, 20.w, 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10.r),
                        decoration: BoxDecoration(
                          color: colorScheme.primary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Icon(
                          Icons.admin_panel_settings_rounded,
                          color: colorScheme.primary,
                          size: 24.sp,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'پنل مدیریت سیستم',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w900,
                                color: colorScheme.onSurface,
                              ),
                            ),
                            Text(
                              'کنترل و پیکربندی بخش‌های مختلف',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: colorScheme.onSurface.withValues(alpha: 0.5),
                              ),
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
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 16.h,
                childAspectRatio: 0.9,
              ),
              delegate: SliverChildListDelegate([
                _buildModernCard(
                  context,
                  title: 'مدیریت آدرس‌ها',
                  subtitle: 'افزودن و ویرایش مکان‌ها',
                  icon: Icons.location_on_rounded,
                  color: const Color(0xFF5C6BC0),
                  onTap: () => context.pushNamed('manage_addresses'),
                ),
                // _buildModernCard(
                //   context,
                //   title: 'تنظیمات سیستم',
                //   subtitle: 'پیکربندی پارامترها',
                //   icon: Icons.settings_suggest_rounded,
                //   color: const Color(0xFF66BB6A),
                //   onTap: () {},
                // ),
                // _buildModernCard(
                //   context,
                //   title: 'مدیریت بنرها',
                //   subtitle: 'تغییر تصاویر اسلایدر',
                //   icon: Icons.collections_rounded,
                //   color: const Color(0xFFFFA726),
                //   onTap: () {},
                // ),
                _buildModernCard(
                  context,
                  title: 'کدهای تخفیف',
                  subtitle: 'تعریف و مدیریت تخفیف‌ها',
                  icon: Icons.local_offer_rounded,
                  color: const Color(0xFFE91E63),
                  onTap: () => context.pushNamed('manage_discounts'),
                ),
                // _buildModernCard(
                //   context,
                //   title: 'گزارشات آماری',
                //   subtitle: 'مشاهده عملکرد کلی',
                //   icon: Icons.analytics_rounded,
                //   color: const Color(0xFFEF5350),
                //   onTap: () {},
                // ),
                _buildModernCard(
                  context,
                  title: 'روش‌های ارسال',
                  subtitle: 'مدیریت هزینه‌های پیک',
                  icon: Icons.local_shipping_rounded,
                  color: const Color(0xFF009688),
                  onTap: () => context.pushNamed('manage_sending_methods'),
                ),
                _buildModernCard(
                  context,
                  title: 'حساب‌های بانکی',
                  subtitle: 'مدیریت تسویه حساب‌ها',
                  icon: Icons.account_balance_rounded,
                  color: const Color(0xFF795548),
                  onTap: () => context.pushNamed('manage_bank_accounts'),
                ),
                _buildModernCard(
                  context,
                  title: 'مدیریت مشاغل',
                  subtitle: 'ویرایش لیست شغل‌ها',
                  icon: Icons.work_history_rounded,
                  color: const Color(0xFF607D8B),
                  onTap: () => context.pushNamed('manage_occupations'),
                ),
              ]),
            ),
          ),
          // SliverToBoxAdapter(
          //   child: Padding(
          //     padding: EdgeInsets.all(20.w),
          //     child: Container(
          //       padding: EdgeInsets.all(16.w),
          //       decoration: BoxDecoration(
          //         gradient: LinearGradient(
          //           colors: [
          //             colorScheme.primary,
          //             colorScheme.primary.withValues(alpha: 0.8),
          //           ],
          //         ),
          //         borderRadius: BorderRadius.circular(20.r),
          //         boxShadow: [
          //           BoxShadow(
          //             color: colorScheme.primary.withValues(alpha: 0.3),
          //             blurRadius: 12,
          //             offset: const Offset(0, 6),
          //           ),
          //         ],
          //       ),
          //       child: Row(
          //         children: [
          //           Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Text(
          //                 'به روزرسانی سیستم',
          //                 style: TextStyle(
          //                   color: Colors.white,
          //                   fontSize: 14.sp,
          //                   fontWeight: FontWeight.bold,
          //                 ),
          //               ),
          //               SizedBox(height: 4.h),
          //               Text(
          //                 'آخرین بررسی: ۲ ساعت پیش',
          //                 style: TextStyle(
          //                   color: Colors.white.withValues(alpha: 0.8),
          //                   fontSize: 11.sp,
          //                 ),
          //               ),
          //             ],
          //           ),
          //           const Spacer(),
          //           ElevatedButton(
          //             onPressed: () {},
          //             style: ElevatedButton.styleFrom(
          //               backgroundColor: Colors.white,
          //               foregroundColor: colorScheme.primary,
          //               minimumSize: Size(80.w, 40.h),
          //               elevation: 0,
          //               shape: RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.circular(12.r),
          //               ),
          //               padding: EdgeInsets.symmetric(horizontal: 16.w),
          //             ),
          //             child: Text(
          //               'بررسی',
          //               style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          // SliverToBoxAdapter(child: SizedBox(height: 100.h)),
        ],
      ),
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
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(24.r),
      elevation: 0,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24.r),
        child: Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.r),
            border: Border.all(color: Colors.black.withValues(alpha: 0.03)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.02),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(icon, color: color, size: 22.sp),
              ),
              const Spacer(),
              Text(
                title,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w800,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 10.sp,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
