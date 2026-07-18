import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_app/core/bloc/base/base_bloc.dart';
import 'package:resturant_app/features/feature_manage_services/domain/repository/manage_services_repository.dart';
import 'package:resturant_app/core/resources/data_state.dart';

part 'add_service_event.dart';
part 'add_service_state.dart';

class AddServiceBloc extends BaseBloc<AddServiceEvent, AddServiceState> {
  final ManageServicesRepository _repository;

  AddServiceBloc(this._repository) : super(const AddServiceInitial()) {
    on<AddServiceSubmitEvent>(_onAddServiceSubmit);
  }

  Future<void> _onAddServiceSubmit(AddServiceSubmitEvent event, Emitter<AddServiceState> emit) async {
    emit(const AddServiceLoading());
    
    final dataState = await _repository.addService(
      title: event.title,
      description: event.description,
      images: event.images,
      keywords: event.keywords,
      priceMin: event.priceMin,
      priceMax: event.priceMax,
    );

    if (dataState is DataSuccess) {
      emit(const AddServiceSuccess());
    } else {
      emit(AddServiceError(dataState.error ?? "خطایی در ثبت خدمت رخ داد"));
    }
  }
}
