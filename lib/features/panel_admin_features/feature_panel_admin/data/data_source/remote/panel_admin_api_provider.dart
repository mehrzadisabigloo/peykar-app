import 'package:dio/dio.dart';

class PanelAdminApiProvider {
  final Dio _dio = Dio(); // Consider injecting or using global dio

  Future<Response> getPanelAdminData() async {
    // return await _dio.get('YOUR_ENDPOINT');
    throw UnimplementedError();
  }
}
