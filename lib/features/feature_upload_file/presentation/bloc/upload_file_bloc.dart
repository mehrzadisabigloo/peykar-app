import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_app/core/bloc/base/base_bloc.dart';
import 'package:resturant_app/core/resources/data_state.dart';
import 'package:resturant_app/features/feature_upload_file/domain/entity/upload_file_entity.dart';
import 'package:resturant_app/features/feature_upload_file/domain/repository/upload_file_repository.dart';
import 'package:equatable/equatable.dart';

part 'upload_file_event.dart';
part 'upload_file_state.dart';

class UploadFileBloc extends BaseBloc<UploadFileEvent, UploadFileState> {
  final UploadFileRepository uploadFileRepository;

  UploadFileBloc(this.uploadFileRepository) : super(const UploadFileInitial()) {
    on<FetchUploadFile>(_onFetchUploadFile);
  }

  Future<void> _onFetchUploadFile(FetchUploadFile event, Emitter<UploadFileState> emit) async {
    emit(UploadFileLoading(event.index, event.index2, uuid: event.uuid));
    
    final dataState = await uploadFileRepository.fetchUploadFile(
      event.path!,
      event.type,
      event.onSendProgress,
    );

    if (dataState is DataSuccess) {
      emit(UploadFileLoaded(dataState.data, event.index, event.index2, uuid: event.uuid));
    } else {
      emit(UploadFileFailed(dataState.error, event.index, event.index2, uuid: event.uuid));
    }
  }
}
