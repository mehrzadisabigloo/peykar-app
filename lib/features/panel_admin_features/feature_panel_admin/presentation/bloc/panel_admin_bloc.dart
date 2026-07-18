import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/bloc/base/base_bloc.dart';
import '../../../../../core/resources/data_state.dart';
import '../../domain/repository/panel_admin_repository.dart';
import 'package:equatable/equatable.dart';

part 'panel_admin_event.dart';
part 'panel_admin_state.dart';

class PanelAdminBloc extends BaseBloc<PanelAdminEvent, PanelAdminState> {
  final PanelAdminRepository panelAdminRepository;

  PanelAdminBloc(this.panelAdminRepository) : super(const PanelAdminInitial()) {
    on<FetchPanelAdminDataEvent>(_onFetchPanelAdminData);
  }

  Future<void> _onFetchPanelAdminData(FetchPanelAdminDataEvent event, Emitter<PanelAdminState> emit) async {
    emit(const PanelAdminLoading());
    final dataState = await panelAdminRepository.fetchPanelAdminData();

    if (dataState is DataSuccess) {
      emit(const PanelAdminLoaded());
    } else {
      emit(PanelAdminError(dataState.error ?? "خطا در دریافت اطلاعات پنل مدیریت"));
    }
  }
}
