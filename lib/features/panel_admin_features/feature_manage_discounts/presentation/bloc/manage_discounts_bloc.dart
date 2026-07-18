import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/bloc/base/base_bloc.dart';
import '../../../../../core/resources/data_state.dart';
import '../../domain/repository/manage_discounts_repository.dart';
import '../../data/model/discount_model.dart';

part 'manage_discounts_event.dart';
part 'manage_discounts_state.dart';

class ManageDiscountsBloc extends BaseBloc<ManageDiscountsEvent, ManageDiscountsState> {
  final ManageDiscountsRepository repository;

  ManageDiscountsBloc(this.repository) : super(const ManageDiscountsInitial()) {
    on<FetchDiscountsEvent>(_onFetchDiscounts);
    on<DeleteDiscountEvent>(_onDeleteDiscount);
    on<ChangeDiscountStatusEvent>(_onChangeDiscountStatus);
  }

  Future<void> _onFetchDiscounts(FetchDiscountsEvent event, Emitter<ManageDiscountsState> emit) async {
    emit(const ManageDiscountsLoading());
    final dataState = await repository.listDiscounts();
    if (dataState is DataSuccess) {
      emit(ManageDiscountsLoaded(dataState.data!.discounts ?? []));
    } else {
      emit(ManageDiscountsError(dataState.error ?? "خطا در دریافت اطلاعات"));
    }
  }

  Future<void> _onDeleteDiscount(DeleteDiscountEvent event, Emitter<ManageDiscountsState> emit) async {
    final currentState = state;
    if (currentState is ManageDiscountsLoaded) {
      emit(ManageDiscountsLoaded(currentState.discounts, processingId: event.id));
    }

    final dataState = await repository.deleteDiscount(event.id);
    
    if (dataState is DataSuccess) {
      add(const FetchDiscountsEvent());
    } else {
      if (state is ManageDiscountsLoaded) {
        emit(ManageDiscountsLoaded((state as ManageDiscountsLoaded).discounts));
      }
      emit(ManageDiscountsError(dataState.error ?? "خطا در حذف"));
    }
  }

  Future<void> _onChangeDiscountStatus(ChangeDiscountStatusEvent event, Emitter<ManageDiscountsState> emit) async {
    final currentState = state;
    if (currentState is ManageDiscountsLoaded) {
      emit(ManageDiscountsLoaded(currentState.discounts, processingId: event.id));
    }

    final dataState = await repository.changeStatus(event.id);
    
    if (dataState is DataSuccess) {
      add(const FetchDiscountsEvent());
    } else {
      if (state is ManageDiscountsLoaded) {
        emit(ManageDiscountsLoaded((state as ManageDiscountsLoaded).discounts));
      }
      emit(ManageDiscountsError(dataState.error ?? "خطا در تغییر وضعیت"));
    }
  }
}
