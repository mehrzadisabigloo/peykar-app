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
    if (token.isEmpty) return 'user';

    Map<String, dynamic> payload = Jwt.parseJwt(token);
    String role = payload['scopes'][0] ?? 'user';

    // Check stored status for override
    final status = await getStatus();
    if (status == 'Draft') {
      return 'repairman';
    }

    return role;
  }

  Future<String?> getStatus() async {
    final storage = locator<FlutterSecureStorage>();
    return await storage.read(key: 'status');
  }


}