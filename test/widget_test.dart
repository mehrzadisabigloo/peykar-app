import 'package:flutter_test/flutter_test.dart';
import 'package:chaharmahal_shop_front/core/resources/consts.dart';

void main() {
  group('Core Consts Tests', () {
    test('baseApiUrl should end with /api/v1/', () {
      expect(Consts.baseApiUrl, endsWith('/api/v1/'));
    });

    test('baseFileUrl should be correctly derived from baseApiUrl', () {
      expect(Consts.baseFileUrl, equals('${Consts.baseApiUrl}upload/file/'));
    });
  });
}
