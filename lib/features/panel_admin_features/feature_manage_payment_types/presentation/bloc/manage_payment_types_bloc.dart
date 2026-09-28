import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../../core/bloc/base/base_bloc.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../domain/entity/payment_type_entity.dart';
import '../../domain/repository/manage_payment_types_repository.dart';

part 'manage_payment_types_event.dart';
part 'manage_payment_types_state.dart';

class ManagePaymentTypesBloc extends BaseBloc<ManagePaymentTypesEvent, ManagePaymentTypesState> {
  final ManagePaymentTypesRepository _repository;

  ManagePaymentTypesBloc(this._repository) : super(ManagePaymentTypesInitial()) {
    on<FetchPaymentTypesEvent>(_onFetchPaymentTypes);
    on<ChangePaymentTypeStatusEvent>(_onChangeStatus);
  }

  Future<void> _onFetchPaymentTypes(FetchPaymentTypesEvent event, Emitter<ManagePaymentTypesState> emit) async {
    emit(ManagePaymentTypesLoading());
    final dataState = await _repository.fetchPaymentTypes(event.params);
    if (dataState is DataSuccess) {
      emit(PaymentTypesLoaded(dataState.data!));
    } else {
      emit(ManagePaymentTypesError(dataState.error ?? "خطا در دریافت اطلاعات"));
    }
  }

  Future<void> _onChangeStatus(ChangePaymentTypeStatusEvent event, Emitter<ManagePaymentTypesState> emit) async {
    final currentState = state;
    if (currentState is PaymentTypesLoaded) {
      emit(currentState.copyWith(processingId: event.id, clearMessages: true));
    }
    
    final dataState = await _repository.changePaymentTypeStatus(event.id);
    
    final lastState = state;
    if (lastState is PaymentTypesLoaded) {
      if (dataState is DataSuccess) {
        emit(lastState.copyWith(
          clearProcessingId: true,
          successMessage: "وضعیت با موفقیت تغییر یافت",
        ));
      } else {
        emit(lastState.copyWith(
          clearProcessingId: true,
          errorMessage: dataState.error ?? "خطا در تغییر وضعیت",
        ));
      }
    } else {
      // Fallback for unexpected state transitions
      if (dataState is DataSuccess) {
        emit(const PaymentTypeActionSuccess("وضعیت با موفقیت تغییر یافت"));
      } else {
        emit(ManagePaymentTypesError(dataState.error ?? "خطا در تغییر وضعیت"));
      }
    }
  }
}
