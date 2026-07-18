import 'package:dio/dio.dart';

class ShopApiProvider {
  final Dio _dio = Dio(); // Consider injecting or using global dio

  Future<Response> getShopData() async {
    // return await _dio.get('YOUR_ENDPOINT');
    throw UnimplementedError();
  }
}
