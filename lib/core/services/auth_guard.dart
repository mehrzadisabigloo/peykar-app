import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'locator.dart';

class AuthGuard {
  static const _tokenKey = 'token';

  static Future<bool> isLoggedIn() async {
    final storage = locator<FlutterSecureStorage>();
    final token = await storage.read(key: _tokenKey);
    return token != null && token.isNotEmpty;
  }
}
