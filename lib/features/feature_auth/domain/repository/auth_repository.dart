

import '../../../../core/resources/data_state.dart';
import '../entity/auth_entity.dart';

abstract class AuthRepository{

  Future<DataState<AuthEntity>> fetchAuth(String mobile, bool loginBySms);
  Future<DataState<AuthEntity>> loginWithPassword(String mobile, String password);
  Future<DataState<AuthEntity>> loginWithSms(String mobile, String confirmCode);
  Future<DataState<AuthEntity>> resendConfirmCode(String mobile);
  Future<DataState<AuthEntity>> setPassword(String password, String passwordConfirmation);
  Future<DataState<AuthEntity>> forgetPassword(String mobile, String code, String password);
  Future<DataState<AuthEntity>> changePassword(String currentPassword, String newPassword, String newPasswordConfirmation);
  Future<DataState<AuthEntity>> registerUser(Map<String, dynamic> userData);
  Future<DataState<AuthEntity>> registerRepairman(Map<String, dynamic> repairmanData);

}