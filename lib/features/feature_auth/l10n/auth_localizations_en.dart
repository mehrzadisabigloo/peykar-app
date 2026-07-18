// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'auth_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AuthLocalizationsEn extends AuthLocalizations {
  AuthLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get login => 'Login';

  @override
  String get phoneNumber => 'Phone Number';

  @override
  String get password => 'Password';

  @override
  String get forgetPassword => 'Forgot Password?';

  @override
  String get loginWithSms => 'Login with SMS';

  @override
  String get enterVerificationCode => 'Enter Verification Code';

  @override
  String resendCodeIn(Object time) {
    return 'Resend code in $time';
  }

  @override
  String get resendCode => 'Resend Code';

  @override
  String get changePassword => 'Change Password';

  @override
  String get newPassword => 'New Password';

  @override
  String get confirmNewPassword => 'Confirm New Password';
}
