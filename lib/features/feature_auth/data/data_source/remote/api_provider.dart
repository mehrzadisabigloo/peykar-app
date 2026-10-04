import 'package:dio/dio.dart';
import '../../../../../core/services/generic_api_service.dart';

class AuthApiProvider {
  final GenericApiService _genericApiService;

  AuthApiProvider(this._genericApiService);

  Future<dynamic> getLoginCode(String mobile, bool loginBySms) async {
    Response response;
    final params = {
      'mobile': mobile,
      'loginBySms': loginBySms,
    };
    response = await _genericApiService.post("/auth/check/mobile", params);
    return response;
  }

  Future<dynamic> loginWithPassword(String mobile, String password) async {
    final params = {
      'mobile': mobile,
      'password': password,
    };
    return await _genericApiService.post("/auth/login/password", params);
  }

  Future<dynamic> loginWithSms(String mobile, String confirmCode) async {
    final params = {
      'mobile': mobile,
      'confirmCode': confirmCode,
    };
    return await _genericApiService.post("/auth/login/sms", params);
  }

  Future<dynamic> resendConfirmCode(String mobile) async {
    final params = {
      'mobile': mobile,
    };
    return await _genericApiService.post("/auth/resend/confirmcode", params);
  }

  Future<dynamic> setPassword(String password, String passwordC) async {
    final params = {
      'password': password,
      'passwordC': passwordC,
    };
    return await _genericApiService.put("/auth/set/password", params);
  }

  Future<dynamic> forgetPassword(String mobile, String code, String password) async {
    final params = {
      'mobile': mobile,
      'mobile_verification_code': code,
      'password': password,
    };
    return await _genericApiService.post("/auth/forget-password", params);
  }

  Future<dynamic> changePassword(String currentPassword, String newPassword, String newPasswordConfirmation) async {
    final params = {
      'current_password': currentPassword,
      'new_password': newPassword,
      'new_password_confirmation': newPasswordConfirmation,
    };
    return await _genericApiService.post("/auth/change-password", params);
  }

  Future<dynamic> registerUser(Map<String, dynamic> userData) async {
    return await _genericApiService.post("/auth/register-user", userData);
  }

  Future<dynamic> registerRepairman(Map<String, dynamic> repairmanData) async {
    return await _genericApiService.post("/auth/register-repairman", repairmanData);
  }
}
