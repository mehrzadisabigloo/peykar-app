import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/bloc/app/app_bloc.dart';
import '../../../../core/bloc/error/error_bloc.dart';
import '../../../../core/services/locator.dart';
import '../../../../core/widgets/cstm_snakbar.dart';
import '../../../../core/themes/theme_main.dart';
import '../base/base_auth_stateful_widget_state.dart';
import '../bloc/authentication_bloc.dart';

class DesignedLoginPage extends StatefulWidget {
  final bool force;
  const DesignedLoginPage({super.key, required this.force});

  @override
  State<DesignedLoginPage> createState() => _DesignedLoginPageState();
}

class _DesignedLoginPageState extends BaseAuthStatefulWidgetState<DesignedLoginPage, AuthenticationBloc> {
  _DesignedLoginPageState() : super(locator<AuthenticationBloc>());

  final TextEditingController _phoneController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  void ninoBlocListener(BuildContext context, AppBlocState appState) {
    // Handle app states if needed
  }

  void blocListener(BuildContext context, AuthenticationState state) {
    if (state is Loading) {
      setState(() => _isLoading = true);
    } else if (state is Failed) {
      setState(() => _isLoading = false);
      // Base class handles errors if we use errorBloc, but here it's still using AuthenticationState for errors.
      // We can either let BaseScreenState handle it via errorBloc or keep this listener.
      CstmSnackBar.showError(context, state.message);
    } else if (state is Loaded || state is AuthenticationInitial) {
      setState(() => _isLoading = false);

      if (state is Loaded) {
        if (state.authEntity.isLogin == false) {
          context.pushNamed(
            'signup',
            extra: {
              'mobile': _phoneController.text,
            },
          );
        } else {
          if (state.authEntity.hasPass == true) {
            context.pushNamed(
              'login-password',
              extra: {
                'phoneNumber': _phoneController.text,
              },
            );
          } else {
            print('ddddddddd');
            CstmSnackBar.showSuccess(context, 'کد تایید پیامک شد');
            context.pushNamed(
              'verify',
              extra: {
                'phoneNumber': _phoneController.text,
                'hasPass': state.authEntity.hasPass,
              },
            );
          }
        }
      }
    }
  }

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: blocListener,
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: Column(
              children: [
                SizedBox(height: 60.h),
                Text(
                  'ورود / ثبت نام',
                  style: textTheme.headlineMedium?.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                SizedBox(height: 50.h),
                // Wallet Illustration
                SizedBox(
                  height: 180.h,
                  width: 180.w,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 120.h,
                        width: 140.w,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(25.r),
                          boxShadow: [
                            BoxShadow(
                              color: primaryColor.withValues(alpha: 0.3),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            )
                          ],
                        ),
                        child: Center(
                          child: Container(
                            width: 30.w,
                            height: 30.w,
                            decoration: BoxDecoration(
                              color: theme.colorScheme.surface.withValues(alpha: 0.2),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 15.h,
                        child: Container(
                          height: 40.h,
                          width: 70.w,
                          decoration: BoxDecoration(
                            color: StatusColors.of(context).warning,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 15.h,
                        right: 5.w,
                        child: Container(
                          decoration: BoxDecoration(
                            color: StatusColors.of(context).success,
                            shape: BoxShape.circle,
                          ),
                          padding: EdgeInsets.all(5.w),
                          child: Icon(Icons.check, color: theme.colorScheme.surface, size: 22.sp),
                        ),
                      ),
                      Positioned(
                        top: 25.h,
                        left: 10.w,
                        child: _coinDecoration(15, theme),
                      ),
                      Positioned(
                        top: 45.h,
                        right: 5.w,
                        child: _coinDecoration(20, theme),
                      ),
                      Positioned(
                        bottom: 50.h,
                        left: 0,
                        child: _coinDecoration(18, theme),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50.h),
                Text(
                  'لطفا شماره موبایل خود را وارد کنید',
                  style: textTheme.bodyMedium?.copyWith(
                    fontSize: 14.sp,
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.54),
                  ),
                ),
                SizedBox(height: 35.h),
                // Phone Input Field
                Container(
                  height: 60.h,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainer,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: theme.colorScheme.outlineVariant),
                  ),
                  child: Row(
                    children: [

                      Expanded(
                        child: TextField(
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          textAlign: TextAlign.end,
                          style: TextStyle(fontSize: 17.sp, letterSpacing: 1.5, fontWeight: FontWeight.w600, color: theme.colorScheme.onSurface),
                          decoration: InputDecoration(
                            hintText: '4567 123 0912',
                            hintTextDirection: TextDirection.rtl,

                            hintStyle: TextStyle(color: theme.colorScheme.onSurface.withValues(alpha: 0.26), fontSize: 17.sp, letterSpacing: 1.5),
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            contentPadding: EdgeInsets.zero,
                            fillColor: Colors.transparent,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        child: Container(width: 1.5, height: 24.h, color: theme.colorScheme.onSurface.withValues(alpha: 0.12)),
                      ),
                      Text(
                        '+98',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 35.h),
                ElevatedButton(
                  onPressed: _isLoading
                      ? null
                      : () {
                          if (_phoneController.text.length >= 10) {
                            bloc.add(
                                  FetchAuthentication(
                                    _phoneController.text,
                                    widget.force,
                                  ),
                                );
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    minimumSize: Size(double.infinity, 56.h),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                  ),
                  child: _isLoading
                      ? SizedBox(height: 24.h, width: 24.h, child: CircularProgressIndicator(strokeWidth: 2.5, color: theme.colorScheme.surface))
                      : Text('ادامه', style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 35.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'حسابی ندارید؟',
                      style: textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.54)),
                    ),
                    TextButton(
                      onPressed: () {
                        context.pushNamed('signup', extra: {'mobile': _phoneController.text});
                      },
                      child: Text(
                        'ثبت نام',
                        style: TextStyle(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 35.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    'با ورود یا ثبت نام، قوانین و شرایط استفاده و حفظ حریم خصوصی را می‌پذیرم.',
                    textAlign: TextAlign.center,
                    style: textTheme.bodySmall?.copyWith(fontSize: 11.sp, height: 1.8, color: theme.colorScheme.onSurface.withValues(alpha: 0.38)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _coinDecoration(double size, ThemeData theme) {
    return Container(
      width: size.w,
      height: size.w,
      decoration: BoxDecoration(
        color: StatusColors.of(context).warning.withValues(alpha: 0.6),
        shape: BoxShape.circle,
        border: Border.all(color: theme.colorScheme.surface, width: 2),
      ),
    );
  }
}
