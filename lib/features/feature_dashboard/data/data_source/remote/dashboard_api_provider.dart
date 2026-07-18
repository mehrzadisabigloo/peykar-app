import 'package:dio/dio.dart';

class DashboardApiProvider {
  final Dio _dio = Dio(); // Consider injecting or using global dio

  Future<Response> getDashboardData() async {
    // return await _dio.get('YOUR_ENDPOINT');
    throw UnimplementedError();
  }
}
