import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/bloc/base/base_bloc.dart';
import '../../../domain/repository/manage_services_repository.dart';
import '../../../../../core/resources/data_state.dart';
import '../../../domain/entity/manage_services_entity.dart';

part 'service_detail_event.dart';
part 'service_detail_state.dart';

class ServiceDetailBloc extends BaseBloc<ServiceDetailEvent, ServiceDetailState> {
  final ManageServicesRepository manageServicesRepository;

  ServiceDetailBloc(this.manageServicesRepository) : super(const ServiceDetailInitial()) {
    on<FetchServiceDetail>(_onFetchServiceDetail);
  }

  Future<void> _onFetchServiceDetail(FetchServiceDetail event, Emitter<ServiceDetailState> emit) async {
    emit(const ServiceDetailLoading());
    
    final dataState = await manageServicesRepository.fetchServiceById(event.serviceId);

    if (dataState is DataSuccess) {
      emit(ServiceDetailLoaded(dataState.data!));
    } else {
      emit(ServiceDetailError(dataState.error ?? "خطا در دریافت جزئیات خدمت"));
    }
  }
}
