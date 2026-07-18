import 'package:dio/dio.dart';

class AdminApiProvider {
  final Dio _dio = Dio(); // Consider injecting or using global dio

  Future<Response> getAdminData() async {
    // return await _dio.get('YOUR_ENDPOINT');
    throw UnimplementedError();
  }
}
