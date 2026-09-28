import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/bloc/base/base_bloc.dart';
import '../../../../core/resources/data_state.dart';
import '../../../panel_admin_features/feature_manage_payment_types/data/model/payment_type_model.dart';
import '../../domain/repository/repairman_payment_type_repository.dart';

part 'repairman_payment_type_event.dart';
part 'repairman_payment_type_state.dart';

class RepairmanPaymentTypeBloc extends BaseBloc<RepairmanPaymentTypeEvent, RepairmanPaymentTypeState> {
  final RepairmanPaymentTypeRepository _repository;

  RepairmanPaymentTypeBloc(this._repository) : super(RepairmanPaymentTypeInitial()) {
    on<FetchMyPaymentTypesEvent>(_onFetchMyPaymentTypes);
    on<AddPaymentTypeEvent>(_onAddPaymentType);
    on<RemovePaymentTypeEvent>(_onRemovePaymentType);
  }

  Future<void> _onFetchMyPaymentTypes(FetchMyPaymentTypesEvent event, Emitter<RepairmanPaymentTypeState> emit) async {
    emit(RepairmanPaymentTypeLoading());
    
    final results = await Future.wait([
      _repository.getMyPaymentTypes(),
      _repository.getAllActivePaymentTypes(),
    ]);

    final myDataState = results[0] as DataState<List<PaymentTypeModel>>;
    final allDataState = results[1] as DataState<List<PaymentTypeModel>>;

    if (myDataState is DataSuccess && allDataState is DataSuccess) {
      emit(RepairmanPaymentTypeLoaded(
        myPaymentTypes: myDataState.data ?? [],
        allActivePaymentTypes: allDataState.data ?? [],
      ));
    } else {
      emit(RepairmanPaymentTypeError(myDataState.error ?? allDataState.error ?? "خطا در دریافت اطلاعات"));
    }
  }

  Future<void> _onAddPaymentType(AddPaymentTypeEvent event, Emitter<RepairmanPaymentTypeState> emit) async {
    final currentState = state;
    if (currentState is RepairmanPaymentTypeLoaded) {
      emit(currentState.copyWith(isActionLoading: true, clearMessages: true));
      
      final dataState = await _repository.addPaymentType(event.paymentTypeId);
      
      if (dataState is DataSuccess) {
        // Refresh the list
        final myDataState = await _repository.getMyPaymentTypes();
        if (myDataState is DataSuccess) {
          emit(currentState.copyWith(
            myPaymentTypes: myDataState.data ?? [],
            isActionLoading: false,
            successMessage: "روش پرداخت با موفقیت اضافه شد",
          ));
        } else {
          emit(currentState.copyWith(
            isActionLoading: false,
            successMessage: "روش پرداخت با موفقیت اضافه شد",
          ));
        }
      } else {
        emit(currentState.copyWith(
          isActionLoading: false,
          errorMessage: dataState.error ?? "خطا در اضافه کردن روش پرداخت",
        ));
      }
    }
  }

  Future<void> _onRemovePaymentType(RemovePaymentTypeEvent event, Emitter<RepairmanPaymentTypeState> emit) async {
    final currentState = state;
    if (currentState is RepairmanPaymentTypeLoaded) {
      emit(currentState.copyWith(processingId: event.paymentTypeId, clearMessages: true));
      
      final dataState = await _repository.removePaymentType(event.paymentTypeId);
      
      if (dataState is DataSuccess) {
        // Refresh the list
        final myDataState = await _repository.getMyPaymentTypes();
        if (myDataState is DataSuccess) {
          emit(currentState.copyWith(
            myPaymentTypes: myDataState.data ?? [],
            clearProcessingId: true,
            successMessage: "روش پرداخت با موفقیت حذف شد",
          ));
        } else {
          emit(currentState.copyWith(
            clearProcessingId: true,
            successMessage: "روش پرداخت با موفقیت حذف شد",
          ));
        }
      } else {
        emit(currentState.copyWith(
          clearProcessingId: true,
          errorMessage: dataState.error ?? "خطا در حذف روش پرداخت",
        ));
      }
    }
  }
}
