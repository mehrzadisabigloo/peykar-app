import 'package:dio/dio.dart';
import 'package:resturant_app/core/resources/data_state.dart';
import 'package:resturant_app/features/feature_upload_file/data/data_source/remote/api_provider.dart';
import 'package:resturant_app/features/feature_upload_file/data/model/upload_file_model.dart';
import 'package:resturant_app/features/feature_upload_file/domain/entity/upload_file_entity.dart';

import '../../domain/repository/upload_file_repository.dart';

class UploadFileRepositoryImpl extends UploadFileRepository {
  final UploadFileApiProvider uploadFileApiProvider;
  UploadFileRepositoryImpl(this.uploadFileApiProvider);

  @override
  Future<DataState<UploadFileEntity>> fetchUploadFile(
      String path, String type, Function(int, int) onSendProgress) async {
    try {
      Response response = await uploadFileApiProvider.uploadFile(path, type, onSendProgress);
      if (response.statusCode == 200) {
        // Parsing the nested structure: response.data['data']['data']
        final dynamic nestedData = response.data['data']?['data'] ?? response.data['data'] ?? response.data;
        UploadFileEntity uploadFileEntity = UploadFileModel.fromJson(nestedData);
        return DataSuccess(uploadFileEntity);
      } else if (response.statusCode == 401 || response.statusCode == 402) {
        return const DataFailed('401');
      } else {
        return DataFailed(response.data['message']);
      }
    } catch (e) {
      return const DataFailed("پاسخی از سرور دریافت نشد. مجددا تلاش کنید");
    }
  }
}
