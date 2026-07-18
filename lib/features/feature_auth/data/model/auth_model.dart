

import '../../domain/entity/auth_entity.dart';

class AuthModel extends AuthEntity {
  AuthModel({
      super.message,
      super.hasPass,
      super.force,
      super.token,
      super.isLogin,});


  factory AuthModel.fromJson(dynamic json){
    return AuthModel(
      message: json['message'] ?? '',
      hasPass: json['data'] == null || json['data'].length == 0 ? false : json['data']?['hasPassword'],
      force: json['data'] == null || json['data'].length == 0 ? false : json['data']?['forceLoginSmsm'],
      token: json['data'] == null || json['data'].length == 0 ? '' : json['data']?['token'],
      isLogin: json['data'] == null || json['data'].length == 0 ? false : json['data']?['login'] ?? true,
    );
  }

}

