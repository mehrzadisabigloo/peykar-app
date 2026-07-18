import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decode/jwt_decode.dart';

import 'locator.dart';

class JwtDecoder{

  Future<String> getToken() async {
    final storage = locator<FlutterSecureStorage>();

    String? token = await storage.read(key: 'token') ?? '';
    return token;
  }

  Future<String> getRule() async {

    final String token = await getToken();

    Map<String, dynamic> payload = Jwt.parseJwt(token);
    return payload['scopes'][0];
  }


}