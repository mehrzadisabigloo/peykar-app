// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'auth_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class AuthLocalizationsFa extends AuthLocalizations {
  AuthLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String get login => 'ورود';

  @override
  String get phoneNumber => 'شماره موبایل';

  @override
  String get password => 'رمز عبور';

  @override
  String get forgetPassword => 'رمز عبور را فراموش کرده‌اید؟';

  @override
  String get loginWithSms => 'ورود با کد تایید';

  @override
  String get enterVerificationCode => 'کد تایید را وارد کنید';

  @override
  String resendCodeIn(Object time) {
    return 'ارسال مجدد کد در $time';
  }

  @override
  String get resendCode => 'ارسال مجدد کد';

  @override
  String get changePassword => 'تغییر رمز عبور';

  @override
  String get newPassword => 'رمز عبور جدید';

  @override
  String get confirmNewPassword => 'تکرار رمز عبور جدید';
}
