import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/bloc/app/app_bloc.dart';
import '../../../../core/bloc/error/error_bloc.dart';
import '../../../../core/services/locator.dart';
import '../../l10n/auth_localizations.dart';
import '../base/base_auth_stateful_widget_state.dart';
import '../bloc/authentication_bloc.dart';

class LoginPasswordPage extends StatefulWidget {
  final String phoneNumber;
  const LoginPasswordPage({super.key, required this.phoneNumber});

  @override
  State<LoginPasswordPage> createState() => _LoginPasswordPageState();
}

class _LoginPasswordPageState extends BaseAuthStatefulWidgetState<LoginPasswordPage, AuthenticationBloc> {
  _LoginPasswordPageState() : super(locator<AuthenticationBloc>());

  final TextEditingController _passwordController = TextEditingController();
  bool _obscure = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
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
                AuthLocalizations.of(context)!.login,
                style: textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                ),
              ),
              SizedBox(height: 40.h),
              _inputField(AuthLocalizations.of(context)!.phoneNumber, widget.phoneNumber, isReadOnly: true),
              SizedBox(height: 24.h),
              _passwordField(AuthLocalizations.of(context)!.password, _passwordController),
              SizedBox(height: 12.h),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    bloc.add(ResendCode(widget.phoneNumber));
                    context.pushNamed('forget-password', extra: {'phoneNumber': widget.phoneNumber});
                  },
                  child: Text(
                    AuthLocalizations.of(context)!.forgetPassword,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              ElevatedButton(
                onPressed: _isLoading
                    ? null
                    : () {
                        if (_passwordController.text.isNotEmpty) {
                          bloc.add(LoginWithPassword(widget.phoneNumber, _passwordController.text));
                        }
                      },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 56.h),
                ),
                child: _isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : Text(AuthLocalizations.of(context)!.login),
              ),
              SizedBox(height: 30.h),
              Row(
                children: [
                  Expanded(child: Divider(color: const Color(0xffEEEEEE), thickness: 1)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text('یا', style: TextStyle(color: Colors.black26, fontSize: 13.sp)),
                  ),
                  Expanded(child: Divider(color: const Color(0xffEEEEEE), thickness: 1)),
                ],
              ),
              SizedBox(height: 30.h),
              OutlinedButton(
                onPressed: () {
                  bloc.add(ResendCode(widget.phoneNumber));
                  context.pushNamed(
                    'verify',
                    extra: {
                      'phoneNumber': widget.phoneNumber,
                      'hasPass': true,
                    },
                  );
                },
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(double.infinity, 56.h),
                ),
                child: Text(AuthLocalizations.of(context)!.loginWithSms),
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _inputField(String label, String value, {bool isReadOnly = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 13.sp, color: Colors.black54),
        ),
        SizedBox(height: 8.h),
        TextField(
          readOnly: isReadOnly,
          controller: TextEditingController(text: value),
          style: TextStyle(fontSize: 16.sp, color: isReadOnly ? Colors.black45 : Colors.black),
          decoration: const InputDecoration(),
        ),
      ],
    );
  }

  Widget _passwordField(String label, TextEditingController controller) {
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
          obscureText: _obscure,
          style: TextStyle(fontSize: 16.sp),
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(
                _obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                color: Colors.black26,
                size: 22.sp,
              ),
              onPressed: () => setState(() => _obscure = !_obscure),
            ),
          ),
        ),
      ],
    );
  }
}
