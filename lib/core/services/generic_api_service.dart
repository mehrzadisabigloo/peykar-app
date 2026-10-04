import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../resources/consts.dart';
import 'auth_notifier.dart';

class LoggingInterceptor extends Interceptor {
  static const storage = FlutterSecureStorage();

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    String? token = await storage.read(key: 'token');

    options.headers.addAll({
      "Content-Type": "application/json",
      'Cache-Control': 'no-cache',
      if (Consts.apiKey.isNotEmpty) 'X-API-KEY': Consts.apiKey,
    });

    if (token != null) {
      options.headers.addAll({
        "Authorization": "Bearer $token",
      });
    }

    if (kDebugMode) {
      debugPrint('--> [HTTP ${options.method}] ${options.uri}');
      if (options.data != null && !_containsSensitiveData(options.path)) {
        debugPrint('    Body: ${options.data}');
      }
    }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint('<-- [HTTP ${response.statusCode}] ${response.requestOptions.uri}');
      debugPrint('    Response: ${response.data}');
    }
    handler.next(response);
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    if (kDebugMode) {
      debugPrint('<-- [HTTP Error ${err.response?.statusCode}] ${err.requestOptions.uri}');
      if (err.response?.data != null) {
        debugPrint('    Response Error Body: ${err.response?.data}');
      }
    }

    if (err.response?.statusCode == 401 || err.response?.statusCode == 402) {
      await removeToken();
    }

    handler.next(err);
  }

  bool _containsSensitiveData(String path) {
    final lower = path.toLowerCase();
    return lower.contains('login') ||
        lower.contains('password') ||
        lower.contains('auth') ||
        lower.contains('token');
  }

  Future<void> removeToken() async {
    const storage = FlutterSecureStorage();
    await storage.delete(key: 'token');
    await storage.delete(key: 'status');
    if (kDebugMode) {
      debugPrint('Auth storage cleared');
    }
    AuthNotifier.instance.notifyTokenCleared();
  }
}

class DioClient {
  static final DioClient _instance = DioClient._internal();
  late Dio dio;

  DioClient._internal() {
    dio = Dio(BaseOptions(
      baseUrl: Consts.baseApiUrl,
      connectTimeout: const Duration(milliseconds: 10000),
      // receiveTimeout: const Duration(milliseconds: 10000),
    ));

    // Add interceptors only once
    dio.interceptors.add(LoggingInterceptor());
  }

  factory DioClient() {
    return _instance;
  }

  Dio getDio() {
    return dio;
  }
}

class GenericApiService {
  final Dio dio = DioClient().getDio();

  Future<dynamic> post(String url, Map<String, dynamic> params) async {
    try {
      final response = await dio.post(url, data: params);
      return response;
    } on DioException catch (e) {
      final response = e.response;
      if (response != null) {
        return response;
      } else {
        return response;
      }
    }
  }

  Future<dynamic> get(String url) async {
    try {
      final response = await dio.get(url);
      return response;
    } on DioException catch (e) {
      final response = e.response;
      if (response != null) {
        return response;
      } else {
        return response;
      }
    }
  }

  Future<dynamic> put(String url, Map<String, dynamic> params) async {
    try {
      final response = await dio.put(url, data: params);
      return response;
    } on DioException catch (e) {
      final response = e.response;
      if (response != null) {
        return response;
      } else {
        return response;
      }
    }
  }

  Future<dynamic> patch(String url, Map<String, dynamic> params) async {
    try {
      final response = await dio.patch(url, data: params);
      return response;
    } on DioException catch (e) {
      final response = e.response;
      if (response != null) {
        return response;
      } else {
        return response;
      }
    }
  }

  Future<dynamic> delete(String url) async {
    try {
      final response = await dio.delete(url);
      return response;
    } on DioException catch (e) {
      final response = e.response;
      if (response != null) {
        return response;
      } else {
        return response;
      }
    }
  }

  Future<dynamic> deleteMessages(String url, Map<String, dynamic> params) async {
    try {
      final response = await dio.delete(url, data: params);
      return response;
    } on DioException catch (e) {
      final response = e.response;
      if (response != null) {
        return response;
      } else {
        return response;
      }
    }
  }
}
