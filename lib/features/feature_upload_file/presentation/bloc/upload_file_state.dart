part of 'upload_file_bloc.dart';


abstract class UploadFileState extends Equatable {
  const UploadFileState();

  @override
  List<Object?> get props => [];
}

class UploadFileInitial extends UploadFileState {
  const UploadFileInitial();
}

class UploadFileLoading extends UploadFileState {
  final int index;
  final int index2;
  final String? uuid;

  const UploadFileLoading(this.index, this.index2, {this.uuid});

  @override
  List<Object?> get props => [index, index2, uuid];
}

class UploadFileProgress extends UploadFileState {
  final double progress;
  final int index;
  final int index2;
  final String? uuid;

  const UploadFileProgress(this.progress, this.index, this.index2, {this.uuid});

  @override
  List<Object?> get props => [progress, index, index2, uuid];
}

class UploadFileLoaded extends UploadFileState {
  final UploadFileEntity? uploadFileEntity;
  final int index;
  final int index2;
  final String? uuid;

  const UploadFileLoaded(this.uploadFileEntity, this.index, this.index2, {this.uuid});

  @override
  List<Object?> get props => [uploadFileEntity, index, index2, uuid];
}

class UploadFileFailed extends UploadFileState {
  final String? error;
  final int index;
  final int index2;
  final String? uuid;

  const UploadFileFailed(this.error, this.index, this.index2, {this.uuid});

  @override
  List<Object?> get props => [error, index, index2, uuid];
}
