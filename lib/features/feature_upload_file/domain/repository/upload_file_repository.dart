
import 'package:resturant_app/features/feature_upload_file/domain/entity/upload_file_entity.dart';

import '../../../../core/resources/data_state.dart';

abstract class UploadFileRepository{

  Future<DataState<UploadFileEntity>> fetchUploadFile(String path,String type,Function(int, int) onSendProgress);

}