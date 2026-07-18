import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/bloc/base/base_bloc.dart';
import '../../domain/repository/dashboard_repository.dart';
import '../../../../core/resources/data_state.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends BaseBloc<DashboardEvent, DashboardState> {
  final DashboardRepository dashboardRepository;

  DashboardBloc(this.dashboardRepository) : super(const DashboardInitial()) {
    on<FetchDashboardDataEvent>(_onFetchDashboardData);
  }

  Future<void> _onFetchDashboardData(FetchDashboardDataEvent event, Emitter<DashboardState> emit) async {
    emit(const DashboardLoading());
    final dataState = await dashboardRepository.fetchDashboardData();

    if (dataState is DataSuccess) {
      emit(const DashboardLoaded());
    } else {
      emit(DashboardError(dataState.error ?? "خطا در دریافت اطلاعات"));
    }
  }
}
