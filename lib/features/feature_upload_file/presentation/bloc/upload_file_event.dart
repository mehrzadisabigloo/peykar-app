part of 'upload_file_bloc.dart';


abstract class UploadFileEvent extends Equatable {
  const UploadFileEvent();

  @override
  List<Object?> get props => [];
}

class FetchUploadFile extends UploadFileEvent {
  final String? path;
  final String type;
  final int index;
  final int index2;
  final void Function(int, int) onSendProgress;
  final String? uuid;

  const FetchUploadFile(
    this.path,
    this.type,
    this.index,
    this.index2,
    this.onSendProgress, {
    this.uuid,
  });

  @override
  List<Object?> get props => [path, type, index, index2, uuid];
}
