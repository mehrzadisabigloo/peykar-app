import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:chaharmahal_shop_front/core/enums/user_role.dart';

import 'locator.dart';

class JwtDecoder {
  Future<String> getToken() async {
    final storage = locator<FlutterSecureStorage>();
    String? token = await storage.read(key: 'token') ?? '';
    return token;
  }

  Future<UserRole> getRole() async {
    final String token = await getToken();
    if (token.isEmpty) return UserRole.user;

    Map<String, dynamic> payload = Jwt.parseJwt(token);
    String roleStr = payload['scopes']?[0] ?? 'user';

    // Check stored status for override
    final status = await getStatus();
    if (status == 'Draft') {
      return UserRole.repairman;
    }

    return UserRole.fromString(roleStr);
  }

  Future<String> getRule() async {
    final role = await getRole();
    return role.value;
  }

  Future<String?> getStatus() async {
    final storage = locator<FlutterSecureStorage>();
    return await storage.read(key: 'status');
  }
}
