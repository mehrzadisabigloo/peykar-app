
import 'package:dio/dio.dart';

import '../../../../../core/services/generic_api_service.dart';



class AuthApiProvider {

  Future<dynamic> getLoginCode(String mobile, bool loginBySms) async {

    GenericApiService genericApiService = GenericApiService();
    Response response;

    final params = {
        'mobile': mobile,
        'loginBySms': loginBySms,
      };

    response = await genericApiService.post("/auth/check/mobile",params);
    return response;

  }

  Future<dynamic> loginWithPassword(String mobile, String password) async {
    GenericApiService genericApiService = GenericApiService();
    final params = {
      'mobile': mobile,
      'password': password,
    };
    return await genericApiService.post("/auth/login/password", params);
  }

  Future<dynamic> loginWithSms(String mobile, String confirmCode) async {
    GenericApiService genericApiService = GenericApiService();
    final params = {
      'mobile': mobile,
      'confirmCode': confirmCode,
    };
    return await genericApiService.post("/auth/login/sms", params);
  }

  Future<dynamic> resendConfirmCode(String mobile) async {
    GenericApiService genericApiService = GenericApiService();
    final params = {
      'mobile': mobile,
    };
    return await genericApiService.post("/auth/resend/confirmcode", params);
  }

  Future<dynamic> setPassword(String password, String passwordC) async {
    GenericApiService genericApiService = GenericApiService();
    final params = {
      'password': password,
      'passwordC': passwordC,
    };
    return await genericApiService.put("/auth/set/password", params);
  }

  Future<dynamic> forgetPassword(String mobile, String code, String password) async {
    GenericApiService genericApiService = GenericApiService();
    final params = {
      'mobile': mobile,
      'mobile_verification_code': code,
      'password': password,
    };
    return await genericApiService.post("/auth/forget-password", params);
  }

  Future<dynamic> changePassword(String currentPassword, String newPassword, String newPasswordConfirmation) async {
    GenericApiService genericApiService = GenericApiService();
    final params = {
      'current_password': currentPassword,
      'new_password': newPassword,
      'new_password_confirmation': newPasswordConfirmation,
    };
    return await genericApiService.post("/v1/auth/change-password", params);
  }

  Future<dynamic> registerUser(Map<String, dynamic> userData) async {
    GenericApiService genericApiService = GenericApiService();
    return await genericApiService.post("/auth/register-user", userData);
  }

  Future<dynamic> registerRepairman(Map<String, dynamic> repairmanData) async {
    GenericApiService genericApiService = GenericApiService();
    return await genericApiService.post("/auth/register-repairman", repairmanData);
  }
}

