import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/bloc/base/base_bloc.dart';
import '../../../../../core/resources/data_state.dart';
import '../../domain/repository/manage_addresses_repository.dart';
import '../../data/model/address_model.dart';

part 'manage_addresses_event.dart';
part 'manage_addresses_state.dart';

class ManageAddressesBloc extends BaseBloc<ManageAddressesEvent, ManageAddressesState> {
  final ManageAddressesRepository repository;

  ManageAddressesBloc(this.repository) : super(const ManageAddressesInitial()) {
    on<FetchManageAddressesEvent>(_onFetchAddresses);
    on<DeleteAddressEvent>(_onDeleteAddress);
  }

  Future<void> _onFetchAddresses(FetchManageAddressesEvent event, Emitter<ManageAddressesState> emit) async {
    emit(const ManageAddressesLoading());
    final dataState = await repository.listAddresses();
    if (dataState is DataSuccess) {
      emit(ManageAddressesLoaded(dataState.data!.addresses ?? []));
    } else {
      emit(ManageAddressesError(dataState.error ?? "خطا در دریافت اطلاعات"));
    }
  }

  Future<void> _onDeleteAddress(DeleteAddressEvent event, Emitter<ManageAddressesState> emit) async {
    final currentState = state;
    if (currentState is! ManageAddressesLoaded) return;

    emit(currentState.copyWith(deletingId: event.id, clearMessages: true));

    final dataState = await repository.deleteAddress(event.id);
    
    if (dataState is DataSuccess) {
      emit(currentState.copyWith(successMessage: "آدرس با موفقیت حذف شد", clearDeletingId: true));
      add(const FetchManageAddressesEvent());
    } else {
      emit(currentState.copyWith(
        errorMessage: dataState.error ?? "خطا در حذف آدرس",
        clearDeletingId: true,
      ));
    }
  }
}
