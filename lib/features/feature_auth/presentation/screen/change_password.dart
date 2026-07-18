import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/bloc/app/app_bloc.dart';
import '../../../../core/bloc/error/error_bloc.dart';
import '../../../../core/services/locator.dart';
import '../base/base_auth_stateful_widget_state.dart';
import '../bloc/authentication_bloc.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends BaseAuthStatefulWidgetState<ChangePasswordPage, AuthenticationBloc> {
  _ChangePasswordPageState() : super(locator<AuthenticationBloc>());

  final TextEditingController _currentPassController = TextEditingController();
  final TextEditingController _newPassController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();
  
  bool _obscureCurrent = true;
  bool _obscureNew = true;
  bool _obscureConfirm = true;
  bool _isLoading = false;

  bool _isMin8 = false;
  bool _hasMixed = false;
  bool _hasUpper = false;

  @override
  void initState() {
    super.initState();
    _newPassController.addListener(_validatePassword);
  }

  @override
  void dispose() {
    _currentPassController.dispose();
    _newPassController.dispose();
    _confirmPassController.dispose();
    super.dispose();
  }

  void _validatePassword() {
    final val = _newPassController.text;
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
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('رمز عبور با موفقیت تغییر کرد'), backgroundColor: Colors.green),
      );
      // context.go('/');
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
        title: Text(
          'تغییر رمز عبور',
          style: TextStyle(color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
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
              SizedBox(height: 20.h),
              _passwordField(
                'رمز عبور فعلی',
                _obscureCurrent,
                (val) => setState(() => _obscureCurrent = val),
                _currentPassController,
              ),
              SizedBox(height: 24.h),
              _passwordField(
                'رمز عبور جدید',
                _obscureNew,
                (val) => setState(() => _obscureNew = val),
                _newPassController,
              ),
              SizedBox(height: 24.h),
              _passwordField(
                'تکرار رمز عبور جدید',
                _obscureConfirm,
                (val) => setState(() => _obscureConfirm = val),
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
                        _currentPassController.text.isNotEmpty &&
                        _newPassController.text.isNotEmpty &&
                        _confirmPassController.text.isNotEmpty &&
                        !_isLoading)
                    ? () {
                        if (_newPassController.text == _confirmPassController.text) {
                          bloc.add(ChangePasswordEvent(
                            _currentPassController.text,
                            _newPassController.text,
                            _confirmPassController.text,
                          ));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('رمز عبور جدید و تکرار آن مطابقت ندارند')),
                          );
                        }
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 56.h),
                ),
                child: _isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('تغییر رمز عبور'),
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
