import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../../core/bloc/base/base_bloc.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../domain/repository/manage_sending_methods_repository.dart';
import '../../data/model/sending_method_model.dart';

part 'manage_sending_methods_event.dart';
part 'manage_sending_methods_state.dart';

class ManageSendingMethodsBloc extends BaseBloc<ManageSendingMethodsEvent, ManageSendingMethodsState> {
  final ManageSendingMethodsRepository repository;

  ManageSendingMethodsBloc(this.repository) : super(const ManageSendingMethodsInitial()) {
    on<FetchSendingMethodsEvent>(_onFetchSendingMethods);
    on<DeleteSendingMethodEvent>(_onDeleteSendingMethod);
    on<ChangeSendingMethodStatusEvent>(_onChangeSendingMethodStatus);
  }

  Future<void> _onFetchSendingMethods(FetchSendingMethodsEvent event, Emitter<ManageSendingMethodsState> emit) async {
    emit(const ManageSendingMethodsLoading());
    final dataState = await repository.listSendingMethods();
    if (dataState is DataSuccess) {
      emit(ManageSendingMethodsLoaded(dataState.data!.sendingMethods ?? []));
    } else {
      emit(ManageSendingMethodsError(dataState.error ?? "خطا در دریافت اطلاعات"));
    }
  }

  Future<void> _onDeleteSendingMethod(DeleteSendingMethodEvent event, Emitter<ManageSendingMethodsState> emit) async {
    final currentState = state;
    if (currentState is ManageSendingMethodsLoaded) {
      emit(ManageSendingMethodsLoaded(currentState.methods, processingId: event.id));
    }

    final dataState = await repository.deleteSendingMethod(event.id);
    
    if (dataState is DataSuccess) {
      add(const FetchSendingMethodsEvent());
    } else {
      if (state is ManageSendingMethodsLoaded) {
        emit(ManageSendingMethodsLoaded((state as ManageSendingMethodsLoaded).methods));
      }
      emit(ManageSendingMethodsError(dataState.error ?? "خطا در حذف"));
    }
  }

  Future<void> _onChangeSendingMethodStatus(ChangeSendingMethodStatusEvent event, Emitter<ManageSendingMethodsState> emit) async {
    final currentState = state;
    if (currentState is ManageSendingMethodsLoaded) {
      emit(ManageSendingMethodsLoaded(currentState.methods, processingId: event.id));
    }

    final dataState = await repository.changeStatus(event.id);
    
    if (dataState is DataSuccess) {
      add(const FetchSendingMethodsEvent());
    } else {
      if (state is ManageSendingMethodsLoaded) {
        emit(ManageSendingMethodsLoaded((state as ManageSendingMethodsLoaded).methods));
      }
      emit(ManageSendingMethodsError(dataState.error ?? "خطا در تغییر وضعیت"));
    }
  }
}
