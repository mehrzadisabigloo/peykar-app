import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/bloc/app/app_bloc.dart';
import '../../../../core/widgets/cstm_snakbar.dart';
import '../../../../core/bloc/error/error_bloc.dart';
import '../../../../core/services/locator.dart';
import '../base/base_auth_stateful_widget_state.dart';
import '../bloc/authentication_bloc.dart';
import '../../../../core/themes/theme_main.dart';

class ForgetPasswordPage extends StatefulWidget {
  final String phoneNumber;
  const ForgetPasswordPage({super.key, required this.phoneNumber});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends BaseAuthStatefulWidgetState<ForgetPasswordPage, AuthenticationBloc> {
  _ForgetPasswordPageState() : super(locator<AuthenticationBloc>());

  final TextEditingController _otpController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();
  
  bool _obscure1 = true;
  bool _obscure2 = true;
  bool _isLoading = false;

  bool _isMin8 = false;
  bool _hasMixed = false;
  bool _hasUpper = false;

  int _timerSeconds = 120;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _passController.addListener(_validatePassword);
    _startTimer();
  }

  @override
  void dispose() {
    _otpController.dispose();
    _passController.dispose();
    _confirmPassController.dispose();
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

  void _validatePassword() {
    final val = _passController.text;
    setState(() {
      _isMin8 = val.length >= 8;
      _hasMixed = RegExp(r'(?=.*[a-zA-Z])(?=.*[0-9])').hasMatch(val);
      _hasUpper = RegExp(r'(?=.*[A-Z])').hasMatch(val);
    });
  }

  @override
  void ninoBlocListener(BuildContext context, AppBlocState appState) {}

  void blocListener(BuildContext context, AuthenticationState state) {
    if (state is Loading) {
      setState(() => _isLoading = true);
    } else if (state is Failed) {
      setState(() => _isLoading = false);
      CstmSnackBar.showError(context, state.message);
    } else if (state is AuthSuccess) {
      setState(() => _isLoading = false);
      CstmSnackBar.showSuccess(context, 'رمز عبور با موفقیت تغییر کرد');
      context.goNamed('login');
    } else if (state is Loaded) {
      setState(() => _isLoading = false);
      CstmSnackBar.showSuccess(context, 'کد مجددا ارسال شد');
    }
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
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colorScheme.onSurface, size: 24.sp),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: blocListener,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10.h),
              Text(
                'فراموشی رمز عبور',
                style: textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'کد تایید ارسال شده به ${widget.phoneNumber} را وارد کنید',
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurface.withValues(alpha: 0.54),
                  fontSize: 14.sp,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32.h),
              _inputField('کد تایید', _otpController, keyboardType: TextInputType.number),
              SizedBox(height: 12.h),
              Align(
                alignment: Alignment.centerRight,
                child: _timerSeconds > 0
                    ? Text(
                        'ارسال مجدد کد در ${_formatTime(_timerSeconds)}',
                        style: textTheme.bodySmall?.copyWith(fontSize: 12.sp),
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
                            fontSize: 13.sp,
                          ),
                        ),
                      ),
              ),
              SizedBox(height: 24.h),
              _passwordField(
                'رمز عبور جدید',
                _obscure1,
                (val) => setState(() => _obscure1 = val),
                _passController,
              ),
              SizedBox(height: 24.h),
              _passwordField(
                'تکرار رمز عبور',
                _obscure2,
                (val) => setState(() => _obscure2 = val),
                _confirmPassController,
              ),
              SizedBox(height: 32.h),
              _requirementRow('حداقل ۸ کاراکتر', _isMin8),
              _requirementRow('شامل عدد و حروف انگلیسی', _hasMixed),
              _requirementRow('شامل حرف بزرگ', _hasUpper),
              SizedBox(height: 40.h),
              ElevatedButton(
                onPressed: (_isMin8 &&
                        _hasMixed &&
                        _hasUpper &&
                        _otpController.text.isNotEmpty &&
                        _passController.text.isNotEmpty &&
                        _confirmPassController.text.isNotEmpty &&
                        !_isLoading)
                    ? () {
                        if (_passController.text == _confirmPassController.text) {
                          bloc.add(ForgetPasswordEvent(
                            widget.phoneNumber,
                            _otpController.text,
                            _passController.text,
                          ));
                        } else {
                          CstmSnackBar.showError(context, 'رمز عبور و تکرار آن مطابقت ندارند');
                        }
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 56.h),
                ),
                child: _isLoading
                    ? CircularProgressIndicator(color: colorScheme.surface)
                    : const Text('تغییر رمز عبور'),
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _inputField(String label, TextEditingController controller, {TextInputType? keyboardType}) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 13.sp, color: theme.colorScheme.onSurface.withValues(alpha: 0.54)),
        ),
        SizedBox(height: 8.h),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          style: TextStyle(fontSize: 16.sp),
          decoration: const InputDecoration(),
        ),
      ],
    );
  }

  Widget _passwordField(String label, bool obscure, Function(bool) onToggle, TextEditingController controller) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 13.sp, color: theme.colorScheme.onSurface.withValues(alpha: 0.54)),
        ),
        SizedBox(height: 8.h),
        TextField(
          controller: controller,
          obscureText: obscure,
          style: TextStyle(fontSize: 16.sp),
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(
                obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                color: theme.colorScheme.onSurface.withValues(alpha: 0.26),
                size: 22.sp,
              ),
              onPressed: () => onToggle(!obscure),
            ),
          ),
        ),
      ],
    );
  }

  Widget _requirementRow(String text, bool isMet) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        children: [
          Icon(
            Icons.check_circle,
            color: isMet ? StatusColors.of(context).success : theme.colorScheme.outlineVariant,
            size: 20.sp,
          ),
          SizedBox(width: 12.w),
          Text(
            text,
            style: TextStyle(
              fontSize: 13.sp,
              color: isMet ? theme.colorScheme.onSurface.withValues(alpha: 0.87) : theme.colorScheme.onSurface.withValues(alpha: 0.26),
            ),
          ),
        ],
      ),
    );
  }
}
