part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object?> get props => [];
}

class FetchAuthentication extends AuthenticationEvent {
  final String mobile;
  final bool loginBySms;
  const FetchAuthentication(this.mobile, this.loginBySms);

  @override
  List<Object?> get props => [mobile, loginBySms];
}

class LoginWithPassword extends AuthenticationEvent {
  final String mobile;
  final String password;
  const LoginWithPassword(this.mobile, this.password);

  @override
  List<Object?> get props => [mobile, password];
}

class LoginWithSms extends AuthenticationEvent {
  final String mobile;
  final String confirmCode;
  const LoginWithSms(this.mobile, this.confirmCode);

  @override
  List<Object?> get props => [mobile, confirmCode];
}

class ResendCode extends AuthenticationEvent {
  final String mobile;
  const ResendCode(this.mobile);

  @override
  List<Object?> get props => [mobile];
}

class SetPasswordEvent extends AuthenticationEvent {
  final String password;
  final String passwordConfirmation;
  const SetPasswordEvent(this.password, this.passwordConfirmation);

  @override
  List<Object?> get props => [password, passwordConfirmation];
}

class ForgetPasswordEvent extends AuthenticationEvent {
  final String mobile;
  final String code;
  final String password;
  const ForgetPasswordEvent(this.mobile, this.code, this.password);

  @override
  List<Object?> get props => [mobile, code, password];
}

class ChangePasswordEvent extends AuthenticationEvent {
  final String currentPassword;
  final String newPassword;
  final String newPasswordConfirmation;
  const ChangePasswordEvent(this.currentPassword, this.newPassword, this.newPasswordConfirmation);

  @override
  List<Object?> get props => [currentPassword, newPassword, newPasswordConfirmation];
}

class RegisterUserEvent extends AuthenticationEvent {
  final Map<String, dynamic> userData;
  const RegisterUserEvent(this.userData);

  @override
  List<Object?> get props => [userData];
}

class RegisterRepairmanEvent extends AuthenticationEvent {
  final Map<String, dynamic> repairmanData;
  const RegisterRepairmanEvent(this.repairmanData);

  @override
  List<Object?> get props => [repairmanData];
}

class FetchOccupations extends AuthenticationEvent {
  const FetchOccupations();
}
