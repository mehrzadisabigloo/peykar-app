import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturant_app/core/services/locator.dart';
import 'package:resturant_app/core/themes/theme_main.dart';
import 'package:resturant_app/features/feature_home/presentation/bloc/main_home_page_bloc.dart';
import 'package:resturant_app/core/widgets/cstm_snakbar.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PendingApprovalScreen extends StatelessWidget {
  const PendingApprovalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocConsumer<MainHomePageBloc, MainHomePageState>(
        listener: (context, state) {
          if (state.statusCheckSuccess == true && state.status == 'Draft') {
            CstmSnackBar.showInfo(context, 'حساب شما هنوز تایید نشده است.');
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  SizedBox(height: 40.h),
                  
                  // 1. Animated Header Icon
                  _buildAnimatedHeader(colorScheme),
                  
                  SizedBox(height: 32.h),

                  // 2. Title & Main Description
                  Text(
                    'در انتظار تایید مدیریت',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w900,
                      color: colorScheme.onSurface.withValues(alpha: 0.87),
                      fontFamily: 'BonyadeKoodak',
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Text(
                      'درخواست همکاری شما با موفقیت ثبت شد. کارشناسان ما در حال بررسی مدارک و اطلاعات شما هستند.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: colorScheme.onSurface.withValues(alpha: 0.54),
                        height: 1.6,
                        fontFamily: 'BonyadeKoodak',
                      ),
                    ),
                  ),

                  SizedBox(height: 48.h),

                  // 3. Progress Timeline
                  _buildTimeline(colorScheme),

                  SizedBox(height: 48.h),

                  // 4. Action Buttons
                  _buildActionButtons(context, state, colorScheme),

                  SizedBox(height: 40.h),
                ],
              ),
            ),
          );
        },
      );

  }

  Widget _buildAnimatedHeader(ColorScheme colorScheme) {
    return Container(
      width: 140.w,
      height: 140.w,
      decoration: BoxDecoration(
        color: colorScheme.primary.withValues(alpha: 0.1),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Container(
          width: 100.w,
          height: 100.w,
          decoration: BoxDecoration(
            color: colorScheme.primary.withValues(alpha: 0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.verified_user_rounded,
            size: 50.w,
            color: colorScheme.primary,
          ),
        ),
      ),
    );
  }

  Widget _buildTimeline(ColorScheme colorScheme) {
    return Container(
      padding: EdgeInsets.all(24.r),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: colorScheme.onSurface.withValues(alpha: 0.03),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildTimelineStep(
            title: 'ثبت‌نام و تکمیل اطلاعات',
            subtitle: 'اطلاعات شما با موفقیت دریافت شد',
            icon: Icons.check_circle_rounded,
            isCompleted: true,
            isCurrent: false,
            showLine: true,
            colorScheme: colorScheme,
          ),
          _buildTimelineStep(
            title: 'بررسی مدارک هویتی و فنی',
            subtitle: 'کارشناسان در حال تطبیق اطلاعات هستند',
            icon: Icons.manage_search_rounded,
            isCompleted: false,
            isCurrent: true,
            showLine: true,
            colorScheme: colorScheme,
          ),
          _buildTimelineStep(
            title: 'تایید نهایی و شروع فعالیت',
            subtitle: 'دسترسی کامل به پنل تعمیرکاران',
            icon: Icons.rocket_launch_rounded,
            isCompleted: false,
            isCurrent: false,
            showLine: false,
            colorScheme: colorScheme,
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineStep({
    required String title,
    required String subtitle,
    required IconData icon,
    required bool isCompleted,
    required bool isCurrent,
    required bool showLine,
    required ColorScheme colorScheme,
  }) {
    final theme = ThemeData(); // Temporary to get context indirectly if needed, but we should use passed colorScheme
    // Wait, I need context for StatusColors.of(context).
    // I'll assume context is available in the scope where this is called (it is, but not passed here).
    // Actually, I can just use the colors directly if I update the signature or use Theme.of(context).
    
    return Builder(
      builder: (context) {
        final Color stepColor = isCompleted 
            ? StatusColors.of(context).success 
            : isCurrent 
                ? colorScheme.primary 
                : colorScheme.outlineVariant;

        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Step Icon & Line
              Column(
                children: [
                  Container(
                    width: 32.w,
                    height: 32.w,
                    decoration: BoxDecoration(
                      color: stepColor.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                      border: Border.all(color: stepColor, width: 2),
                    ),
                    child: Icon(icon, size: 18.sp, color: stepColor),
                  ),
                  if (showLine)
                    Expanded(
                      child: Container(
                        width: 2,
                        color: stepColor.withValues(alpha: 0.3),
                      ),
                    ),
                ],
              ),
              SizedBox(width: 16.w),
              
              // Step Text
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(bottom: showLine ? 24.h : 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: isCurrent || isCompleted ? colorScheme.onSurface.withValues(alpha: 0.87) : colorScheme.onSurface.withValues(alpha: 0.38),
                          fontFamily: 'BonyadeKoodak',
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: isCurrent || isCompleted ? colorScheme.onSurface.withValues(alpha: 0.45) : colorScheme.onSurface.withValues(alpha: 0.26),
                          fontFamily: 'BonyadeKoodak',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );
  }

  Widget _buildActionButtons(BuildContext context, MainHomePageState state, ColorScheme colorScheme) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 56.h,
          child: ElevatedButton(
            onPressed: state.isLoading
                ? null
                : () {
                    context.read<MainHomePageBloc>().add(const CheckAccountStatus());
                  },
            style: ElevatedButton.styleFrom(
              backgroundColor: colorScheme.primary,
              foregroundColor: colorScheme.surface,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
              elevation: 8,
              shadowColor: colorScheme.primary.withValues(alpha: 0.3),
            ),
            child: state.isLoading
                ? LoadingAnimationWidget.threeArchedCircle(
                    color: colorScheme.surface,
                    size: 30,
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.refresh_rounded, size: 22.sp),
                      SizedBox(width: 12.w),
                      Text(
                        'بررسی مجدد وضعیت',
                        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
          ),
        ),
        
        SizedBox(height: 24.h),
        
        // Logout Option
        InkWell(
          onTap: () async {
            final storage = locator<FlutterSecureStorage>();
            await storage.delete(key: 'token');
            await storage.delete(key: 'status');
            if (context.mounted) {
              context.go('/');
            }
          },
          borderRadius: BorderRadius.circular(12.r),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.logout_rounded, color: colorScheme.error, size: 20),
                SizedBox(width: 8.w),
                 Text(
                  'خروج از حساب کاربری',
                  style: TextStyle(
                    color: colorScheme.error,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
