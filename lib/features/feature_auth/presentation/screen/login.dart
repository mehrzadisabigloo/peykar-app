import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/bloc/app/app_bloc.dart';
import '../../../../core/bloc/error/error_bloc.dart';
import '../../../../core/services/locator.dart';
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.message), backgroundColor: colorError),
      );
    } else if (state is Loaded) {
      setState(() => _isLoading = false);
      
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

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
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
                              color: primaryColor.withAlpha((0.3 * 255).toInt()),
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
                              color: Colors.white.withAlpha((0.2 * 255).toInt()),
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
                            color: const Color(0xffFFCA28),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 15.h,
                        right: 5.w,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color(0xff4CAF50),
                            shape: BoxShape.circle,
                          ),
                          padding: EdgeInsets.all(5.w),
                          child: Icon(Icons.check, color: Colors.white, size: 22.sp),
                        ),
                      ),
                      Positioned(
                        top: 25.h,
                        left: 10.w,
                        child: _coinDecoration(15),
                      ),
                      Positioned(
                        top: 45.h,
                        right: 5.w,
                        child: _coinDecoration(20),
                      ),
                      Positioned(
                        bottom: 50.h,
                        left: 0,
                        child: _coinDecoration(18),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50.h),
                Text(
                  'لطفا شماره موبایل خود را وارد کنید',
                  style: textTheme.bodyMedium?.copyWith(
                    fontSize: 14.sp,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 35.h),
                // Phone Input Field
                Container(
                  height: 60.h,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                    color: const Color(0xffF8F8F8),
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: const Color(0xffEEEEEE)),
                  ),
                  child: Row(
                    children: [
                      Text(
                        '+98',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        child: Container(width: 1.5, height: 24.h, color: Colors.black12),
                      ),
                      Expanded(
                        child: TextField(
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          textAlign: TextAlign.end,
                          style: TextStyle(fontSize: 17.sp, letterSpacing: 1.5, fontWeight: FontWeight.w600),
                          decoration: InputDecoration(
                            hintText: '0912 123 4567',
                            hintTextDirection: TextDirection.ltr,

                            hintStyle: TextStyle(color: Colors.black26, fontSize: 17.sp, letterSpacing: 1.5),
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            contentPadding: EdgeInsets.zero,
                            fillColor: Colors.transparent,
                          ),
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
                      ? SizedBox(height: 24.h, width: 24.h, child: CircularProgressIndicator(strokeWidth: 2.5, color: Colors.white))
                      : Text('ادامه', style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 35.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'حسابی ندارید؟',
                      style: textTheme.bodyMedium?.copyWith(color: Colors.black54),
                    ),
                    TextButton(
                      onPressed: () {
                        context.pushNamed('signup', extra: {'mobile': _phoneController.text});
                      },
                      child: Text(
                        'ثبت نام',
                        style: TextStyle(
                          color: theme.primaryColor,
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
                    style: textTheme.bodySmall?.copyWith(fontSize: 11.sp, height: 1.8, color: Colors.black38),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _coinDecoration(double size) {
    return Container(
      width: size.w,
      height: size.w,
      decoration: BoxDecoration(
        color: const Color(0xffFFB74D).withAlpha((0.6 * 255).toInt()),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
      ),
    );
  }
}
