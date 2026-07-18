import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/bloc/app/app_bloc.dart';
import '../../../../core/bloc/error/error_bloc.dart';
import '../../../../core/services/locator.dart';
import '../base/base_auth_stateful_widget_state.dart';
import '../bloc/authentication_bloc.dart';

class AuthVerifyPage extends StatefulWidget {
  final String phoneNumber;
  final bool hasPass;

  const AuthVerifyPage({
    super.key,
    required this.phoneNumber,
    required this.hasPass,
  });

  @override
  State<AuthVerifyPage> createState() => _AuthVerifyPageState();
}

class _AuthVerifyPageState extends BaseAuthStatefulWidgetState<AuthVerifyPage, AuthenticationBloc> {
  _AuthVerifyPageState() : super(locator<AuthenticationBloc>());

  final List<String> _otp = List.filled(4, '');
  int _currentIndex = 0;
  int _timerSeconds = 45;
  Timer? _timer;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer?.cancel();
    _timerSeconds = 120;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timerSeconds == 0) {
        _timer?.cancel();
        setState(() {});
      } else {
        setState(() {
          _timerSeconds--;
        });
      }
    });
  }

  @override
  void ninoBlocListener(BuildContext context, AppBlocState appState) {}

  void blocListener(BuildContext context, AuthenticationState state) {
    if (state is Loading) {
      setState(() => _isLoading = true);
    } else if (state is Failed) {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.message), backgroundColor: Colors.red),
      );
    } else if (state is AuthSuccess) {
      setState(() => _isLoading = false);
      if (widget.hasPass) {
        print('object');
        context.go('/home');
      } else {
        print('s');
        context.pushNamed('set-password', extra: {'phoneNumber': widget.phoneNumber});
      }
    } else if (state is Loaded) {
       setState(() => _isLoading = false);
       // Resend success or other intermediate loaded state
       ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('کد مجددا ارسال شد')),
      );
    }
  }

  void _onKeyPress(String value) {
    if (_currentIndex < 4) {
      setState(() {
        _otp[_currentIndex] = value;
        _currentIndex++;
      });
      if (_currentIndex == 4) {
        _verifyOtp();
      }
    }
  }

  void _onDelete() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
        _otp[_currentIndex] = '';
      });
    }
  }

  void _verifyOtp() {
    String code = _otp.join();
    bloc.add(LoginWithSms(widget.phoneNumber, code));
  }

  String _formatTime(int seconds) {
    final int minutes = seconds ~/ 60;
    final int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black, size: 24.sp),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: blocListener,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    SizedBox(height: 10.h),
                    Text(
                      'کد تایید',
                      style: textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: textTheme.bodyMedium?.copyWith(
                          color: Colors.black54,
                          fontSize: 14.sp,
                          height: 1.5,
                        ),
                        children: [
                          const TextSpan(text: 'کد ۴ رقمی ارسال شده به\n'),
                          TextSpan(
                            text: widget.phoneNumber,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40.h),
                    if (_isLoading)
                      Padding(
                        padding: EdgeInsets.only(bottom: 20.h),
                        child: const CircularProgressIndicator(),
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(4, (index) => _otpBox(index)),
                    ),
                    SizedBox(height: 30.h),
                    _timerSeconds > 0
                        ? Text(
                            'ارسال مجدد کد در ${_formatTime(_timerSeconds)}',
                            style: textTheme.bodySmall?.copyWith(fontSize: 13.sp),
                          )
                        : TextButton(
                            onPressed: () {
                              bloc.add(ResendCode(widget.phoneNumber));
                              _startTimer();
                            },
                            child: Text(
                              'ارسال مجدد کد',
                              style: TextStyle(
                                color: colorScheme.primary,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                    if (widget.hasPass)
                      TextButton(
                        onPressed: () {
                          context.pushNamed('login-password', extra: {'phoneNumber': widget.phoneNumber});
                        },
                        child: const Text('ورود با رمز عبور'),
                      ),
                  ],
                ),
              ),
            ),
            _numericKeypad(theme),
          ],
        ),
      ),
    );
  }

  Widget _otpBox(int index) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    bool isFocused = _currentIndex == index;

    return Container(
      width: 55.w,
      height: 60.h,
      decoration: BoxDecoration(
        color: const Color(0xffF8F8F8),
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: isFocused ? colorScheme.primary : const Color(0xffE8E8E8),
          width: isFocused ? 2 : 1,
        ),
      ),
      child: Center(
        child: Text(
          _otp[index],
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _numericKeypad(ThemeData theme) {
    return Container(
      padding: EdgeInsets.only(bottom: 30.h, left: 24.w, right: 24.w),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              _key('1', theme), _key('2', theme), _key('3', theme),
            ],
          ),
          Row(
            children: [
              _key('4', theme), _key('5', theme), _key('6', theme),
            ],
          ),
          Row(
            children: [
              _key('7', theme), _key('8', theme), _key('9', theme),
            ],
          ),
          Row(
            children: [
              const Expanded(child: SizedBox()),
              _key('0', theme),
              _key('delete', theme, isIcon: true),
            ],
          ),
        ],
      ),
    );
  }

  Widget _key(String val, ThemeData theme, {bool isIcon = false}) {
    return Expanded(
      child: InkWell(
        onTap: () => isIcon ? _onDelete() : _onKeyPress(val),
        child: Container(
          height: 70.h,
          alignment: Alignment.center,
          child: isIcon
              ? Icon(Icons.backspace_outlined, color: Colors.black, size: 22.sp)
              : Text(
                  val,
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
        ),
      ),
    );
  }
}
