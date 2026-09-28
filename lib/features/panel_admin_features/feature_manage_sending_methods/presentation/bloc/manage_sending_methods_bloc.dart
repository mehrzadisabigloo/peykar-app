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
      emit(currentState.copyWith(processingId: event.id, isDeleting: true, clearMessages: true));
    }

    final dataState = await repository.deleteSendingMethod(event.id);
    
    if (dataState is DataSuccess) {
      final updatedMethods = (state as ManageSendingMethodsLoaded).methods.where((m) => m.id != event.id).toList();
      emit(ManageSendingMethodsLoaded(updatedMethods, successMessage: 'روش ارسال با موفقیت حذف شد'));
    } else {
      if (state is ManageSendingMethodsLoaded) {
        emit((state as ManageSendingMethodsLoaded).copyWith(
          processingId: null,
          isDeleting: false,
          errorMessage: dataState.error ?? "خطا در حذف",
        ));
      } else {
        emit(ManageSendingMethodsError(dataState.error ?? "خطا در حذف"));
      }
    }
  }

  Future<void> _onChangeSendingMethodStatus(ChangeSendingMethodStatusEvent event, Emitter<ManageSendingMethodsState> emit) async {
    final currentState = state;
    if (currentState is ManageSendingMethodsLoaded) {
      emit(currentState.copyWith(processingId: event.id, isDeleting: false, clearMessages: true));
    }

    final dataState = await repository.changeStatus(event.id);
    
    if (dataState is DataSuccess) {
      final updatedMethods = (state as ManageSendingMethodsLoaded).methods.map((m) {
        if (m.id == event.id) {
          final newStatus = (m.isActive) ? 'Deactive' : 'Active';
          return m.copyWith(status: newStatus);
        }
        return m;
      }).toList();
      emit(ManageSendingMethodsLoaded(updatedMethods, successMessage: 'وضعیت روش ارسال تغییر کرد'));
    } else {
      if (state is ManageSendingMethodsLoaded) {
        emit((state as ManageSendingMethodsLoaded).copyWith(
          processingId: null,
          isDeleting: false,
          errorMessage: dataState.error ?? "خطا در تغییر وضعیت",
        ));
      } else {
        emit(ManageSendingMethodsError(dataState.error ?? "خطا در تغییر وضعیت"));
      }
    }
  }
}
