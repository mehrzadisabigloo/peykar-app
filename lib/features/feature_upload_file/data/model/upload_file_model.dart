

import '../../domain/entity/upload_file_entity.dart';

class UploadFileModel extends UploadFileEntity {
  UploadFileModel({
      super.id,
      });


  factory UploadFileModel.fromJson(dynamic json){
    return UploadFileModel(
      id: json['id'],
    );
  }

}

