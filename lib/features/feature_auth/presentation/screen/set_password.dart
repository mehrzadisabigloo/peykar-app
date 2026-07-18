import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/bloc/app/app_bloc.dart';
import '../../../../core/bloc/error/error_bloc.dart';
import '../../../../core/services/locator.dart';
import '../base/base_auth_stateful_widget_state.dart';
import '../bloc/authentication_bloc.dart';

class SetPasswordPage extends StatefulWidget {
  final String phoneNumber;
  const SetPasswordPage({super.key, required this.phoneNumber});

  @override
  State<SetPasswordPage> createState() => _SetPasswordPageState();
}

class _SetPasswordPageState extends BaseAuthStatefulWidgetState<SetPasswordPage, AuthenticationBloc> {
  _SetPasswordPageState() : super(locator<AuthenticationBloc>());

  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();
  bool _obscure1 = true;
  bool _obscure2 = true;
  bool _isLoading = false;

  bool _isMin8 = false;
  bool _hasMixed = false;
  bool _hasUpper = false;

  @override
  void initState() {
    super.initState();
    _passController.addListener(_validatePassword);
    _confirmPassController.addListener(_validatePassword);
  }

  @override
  void dispose() {
    _passController.dispose();
    _confirmPassController.dispose();
    super.dispose();
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.message), backgroundColor: Colors.red),
      );
    } else if (state is AuthSuccess) {
      setState(() => _isLoading = false);
      context.goNamed('home');
    }
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
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10.h),
              Text(
                'تعریف رمز عبور',
                style: textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'لطفا رمز عبور خود را تعیین کنید',
                style: textTheme.bodyMedium?.copyWith(
                  color: Colors.black54,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 40.h),
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
              SizedBox(height: 50.h),
              ElevatedButton(
                onPressed: (_isMin8 &&
                        _hasMixed &&
                        _hasUpper &&
                        _passController.text.isNotEmpty &&
                        _confirmPassController.text.isNotEmpty &&
                        !_isLoading)
                    ? () {
                        if (_passController.text == _confirmPassController.text) {
                          bloc.add(SetPasswordEvent(_passController.text, _confirmPassController.text));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('رمز عبور و تکرار آن مطابقت ندارند')),
                          );
                        }
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: (_isMin8 &&
                          _hasMixed &&
                          _hasUpper &&
                          _passController.text.isNotEmpty &&
                          _confirmPassController.text.isNotEmpty)
                      ? colorScheme.primary
                      : const Color(0xffEEEEEE),
                  minimumSize: Size(double.infinity, 56.h),
                ),
                child: _isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('ثبت و ادامه'),
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _passwordField(String label, bool obscure, Function(bool) onToggle, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 13.sp, color: Colors.black54),
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
                color: Colors.black26,
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
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        children: [
          Icon(
            Icons.check_circle,
            color: isMet ? const Color(0xff4CAF50) : const Color(0xffE0E0E0),
            size: 20.sp,
          ),
          SizedBox(width: 12.w),
          Text(
            text,
            style: TextStyle(
              fontSize: 13.sp,
              color: isMet ? Colors.black87 : Colors.black26,
            ),
          ),
        ],
      ),
    );
  }
}
