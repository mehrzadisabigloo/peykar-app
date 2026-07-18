import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/bloc/base/base_bloc.dart';
import '../../domain/repository/manage_services_repository.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/entity/manage_services_entity.dart';

part 'manage_services_event.dart';
part 'manage_services_state.dart';

class ManageServicesBloc extends BaseBloc<ManageServicesEvent, ManageServicesState> {
  final ManageServicesRepository manageServicesRepository;

  ManageServicesBloc(this.manageServicesRepository) : super(const ManageServicesInitial()) {
    on<FetchManageServicesDataEvent>(_onFetchManageServicesData);
  }

  Future<void> _onFetchManageServicesData(FetchManageServicesDataEvent event, Emitter<ManageServicesState> emit) async {
    emit(const ManageServicesLoading());
    
    final dataState = await manageServicesRepository.fetchManageServicesData();

    if (dataState is DataSuccess) {
      emit(ManageServicesLoaded(dataState.data ?? []));
    } else {
      emit(ManageServicesError(dataState.error ?? "خطا در دریافت لیست خدمات"));
    }
  }
}
