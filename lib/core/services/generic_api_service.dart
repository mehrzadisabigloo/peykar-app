// ignore_for_file: unused_import, avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../resources/consts.dart';

class LoggingInterceptor extends Interceptor {
  static const storage = FlutterSecureStorage();
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    String? token = await storage.read(key: 'token');

    options.headers.addAll({
      "Content-Type": "application/json",
      'Cache-Control': 'no-cache',
    });

    if (token != null) {
      options.headers.addAll(
          {"Authorization": "Bearer $token",}
      );
    }

    print('Request: ${options.uri}');
    print('Request: ${options.data}');
    handler.next(options); // Continue to the next handler
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('Response: ${response.data}');
    print('Response: ${response.statusCode}');
    handler.next(response); // Continue to the next handler
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    print('Error: ${err.response?.data}');

    if (err.response?.statusCode == 401 || err.response?.statusCode == 402) {
      await removeToken();
    }

    handler.next(err);
  }

  Future<void> removeToken() async {
    const storage = FlutterSecureStorage();
    await storage.delete(key: 'token');
    print('Token removed');
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
    // locator<ConnectionCheckerCubit>().checkConnection(url.contains('auth') ? 'auth' : 'home');
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
    // locator<ConnectionCheckerCubit>().checkConnection(url.contains('auth') ? 'auth' : 'home');
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
    // locator<ConnectionCheckerCubit>().checkConnection(url.contains('auth') ? 'auth' : 'home');
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

  Future<dynamic> delete(String url) async {

    // locator<ConnectionCheckerCubit>().checkConnection(url.contains('auth') ? 'auth' : 'home');
    try {
      final response = await dio.delete(url,);
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

    // locator<ConnectionCheckerCubit>().checkConnection(url.contains('auth') ? 'auth' : 'home');
    try {
      final response = await dio.delete(url,data: params);
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
