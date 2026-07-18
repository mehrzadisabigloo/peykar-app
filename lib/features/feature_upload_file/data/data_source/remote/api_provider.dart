import 'package:dio/dio.dart';

import '../../../../../core/services/generic_api_service.dart';

class UploadFileApiProvider {
  // Use the global singleton Dio instance
  final Dio dio = DioClient().getDio();

  // Method to upload a file
  Future<dynamic> uploadFile(String path, String type, Function(int, int) onSendProgress) async {
    try {
      // Create FormData with the file and type
      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(path, filename: 'hi'),
        'type': type,
      });

      // Post the file data with progress callback
      final response = await dio.post(
        "/upload/file", // Endpoint relative to the baseUrl
        data: formData,
        onSendProgress: onSendProgress,
      );
      return response;
    } on DioException catch (e) {
      return e.response;
    }
  }
}
