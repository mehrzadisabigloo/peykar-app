import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/bloc/base/base_bloc.dart';
import '../../domain/entity/appointments_entity.dart';
import '../../domain/repository/appointments_repository.dart';
import '../../../../core/resources/data_state.dart';

part 'appointments_event.dart';
part 'appointments_state.dart';

class AppointmentsBloc extends BaseBloc<AppointmentsEvent, AppointmentsState> {
  final AppointmentsRepository appointmentsRepository;
  String _currentDate = 'شنبه ۱۵ اردیبهشت ۱۴۰۳';

  AppointmentsBloc(this.appointmentsRepository) : super(const AppointmentsInitial()) {
    on<FetchAppointmentsEvent>(_onFetchAppointments);
    on<ChangeDateEvent>(_onChangeDate);
  }

  Future<void> _onFetchAppointments(FetchAppointmentsEvent event, Emitter<AppointmentsState> emit) async {
    emit(const AppointmentsLoading());
    final dataState = await appointmentsRepository.fetchAppointments();

    if (dataState is DataSuccess) {
      emit(AppointmentsLoaded(
        appointments: dataState.data!,
        currentDate: _currentDate,
      ));
    } else {
      emit(AppointmentsError(dataState.error ?? "خطا در دریافت نوبت‌ها"));
    }
  }

  void _onChangeDate(ChangeDateEvent event, Emitter<AppointmentsState> emit) {
    if (state is AppointmentsLoaded) {
      // Simple mock date change logic preserved
      _currentDate = event.next ? 'یکشنبه ۱۶ اردیبهشت ۱۴۰۳' : 'جمعه ۱۴ اردیبهشت ۱۴۰۳';
      emit(AppointmentsLoaded(
        appointments: (state as AppointmentsLoaded).appointments,
        currentDate: _currentDate,
      ));
    }
  }
}
