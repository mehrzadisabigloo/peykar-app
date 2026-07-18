import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/bloc/base/base_bloc.dart';
import '../../domain/repository/client_services_repository.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/entity/client_services_entity.dart';

part 'client_services_event.dart';
part 'client_services_state.dart';

class ClientServicesBloc extends BaseBloc<ClientServicesEvent, ClientServicesState> {
  final ClientServicesRepository clientServicesRepository;

  ClientServicesBloc(this.clientServicesRepository) : super(const ClientServicesInitial()) {
    on<FetchClientServicesDataEvent>(_onFetchClientServicesData);
  }

  Future<void> _onFetchClientServicesData(FetchClientServicesDataEvent event, Emitter<ClientServicesState> emit) async {
    emit(const ClientServicesLoading());
    final dataState = await clientServicesRepository.fetchClientServicesData();

    if (dataState is DataSuccess) {
      emit(ClientServicesLoaded(dataState.data!));
    } else {
      emit(ClientServicesError(dataState.error ?? "خطا در دریافت اطلاعات خدمات مشتریان"));
    }
  }
}
