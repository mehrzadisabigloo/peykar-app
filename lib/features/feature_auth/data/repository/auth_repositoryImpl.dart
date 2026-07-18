// ignore_for_file: unused_import

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/services/locator.dart';
import '../../domain/entity/auth_entity.dart';
import '../../domain/repository/auth_repository.dart';
import '../data_source/remote/api_provider.dart';
import '../model/auth_model.dart';


class AuthRepositoryImpl extends AuthRepository{

  AuthApiProvider authApiProvider;
  AuthRepositoryImpl(this.authApiProvider);

  @override
  Future<DataState<AuthEntity>> fetchAuth(String mobile, bool loginBySms) async {
    try{
      Response response = await authApiProvider.getLoginCode(mobile, loginBySms);
      return _handleResponse(response);
    }catch(e){
      return const DataFailed("پاسخی از سرور دریافت نشد. مجددا تلاش کنید");
    }
  }

  @override
  Future<DataState<AuthEntity>> loginWithPassword(String mobile, String password) async {
    try {
      Response response = await authApiProvider.loginWithPassword(mobile, password);
      return _handleResponse(response);
    } catch (e) {
      return const DataFailed("خطایی در ورود با رمز عبور رخ داد");
    }
  }

  @override
  Future<DataState<AuthEntity>> loginWithSms(String mobile, String confirmCode) async {
    try {
      Response response = await authApiProvider.loginWithSms(mobile, confirmCode);
      return _handleResponse(response);
    } catch (e) {
      return const DataFailed("خطایی در ورود با کد تایید رخ داد");
    }
  }

  @override
  Future<DataState<AuthEntity>> resendConfirmCode(String mobile) async {
    try {
      Response response = await authApiProvider.resendConfirmCode(mobile);
      return _handleResponse(response);
    } catch (e) {
      return const DataFailed("خطایی در ارسال مجدد کد رخ داد");
    }
  }

  @override
  Future<DataState<AuthEntity>> setPassword(String password, String passwordConfirmation) async {
    try {
      Response response = await authApiProvider.setPassword(password, passwordConfirmation);
      return DataSuccess(AuthModel.fromJson(response.data));
    } catch (e) {
      print(e);
      return const DataFailed("خطایی در ثبت رمز عبور رخ داد");
    }
  }

  @override
  Future<DataState<AuthEntity>> forgetPassword(String mobile, String code, String password) async {
    try {
      Response response = await authApiProvider.forgetPassword(mobile, code, password);
      return _handleResponse(response);
    } catch (e) {
      return const DataFailed("خطایی در بازیابی رمز عبور رخ داد");
    }
  }

  @override
  Future<DataState<AuthEntity>> changePassword(String currentPassword, String newPassword, String newPasswordConfirmation) async {
    try {
      Response response = await authApiProvider.changePassword(currentPassword, newPassword, newPasswordConfirmation);
      return _handleResponse(response);
    } catch (e) {
      return const DataFailed("خطایی در تغییر رمز عبور رخ داد");
    }
  }

  @override
  Future<DataState<AuthEntity>> registerUser(Map<String, dynamic> userData) async {
    try {
      Response response = await authApiProvider.registerUser(userData);
      return _handleResponse(response);
    } catch (e) {
      return const DataFailed("خطایی در ثبت‌نام کاربر رخ داد");
    }
  }

  @override
  Future<DataState<AuthEntity>> registerRepairman(Map<String, dynamic> repairmanData) async {
    try {
      Response response = await authApiProvider.registerRepairman(repairmanData);
      return _handleResponse(response);
    } catch (e) {
      return const DataFailed("خطایی در ثبت‌نام تعمیرکار رخ داد");
    }
  }

  DataState<AuthEntity> _handleResponse(Response response) {
    if (response.statusCode == 200) {
      print('qqq');
      AuthEntity authEntity = AuthModel.fromJson(response.data);
      if(response.data['data'] != null){
        if (authEntity.token != null) {
          final storage = locator<FlutterSecureStorage>();
          storage.write(key: 'token', value: authEntity.token);
        }
      }



      return DataSuccess(authEntity);
    } else if (response.statusCode == 401 || response.statusCode == 402) {
      return const DataFailed('401');
    } else {
      return DataFailed(response.data['message'] ?? 'خطای نامشخص');
    }
  }

}

