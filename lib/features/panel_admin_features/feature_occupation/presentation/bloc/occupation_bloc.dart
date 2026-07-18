import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/bloc/base/base_bloc.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../domain/repository/occupation_repository.dart';
import 'occupation_event.dart';
import 'occupation_state.dart';

class OccupationBloc extends BaseBloc<OccupationEvent, OccupationState> {
  final OccupationRepository _repository;

  OccupationBloc(this._repository) : super(OccupationInitial()) {
    on<FetchOccupationsEvent>(_onFetchOccupations);
    on<ChangeOccupationStatusEvent>(_onChangeStatus);
    on<MoveOccupationUpEvent>(_onMoveUp);
    on<MoveOccupationDownEvent>(_onMoveDown);
  }

  Future<void> _onFetchOccupations(FetchOccupationsEvent event, Emitter<OccupationState> emit) async {
    emit(OccupationLoading());
    final dataState = await _repository.fetchOccupations(event.params);
    if (dataState is DataSuccess) {
      emit(OccupationsLoaded(dataState.data!));
    } else {
      emit(OccupationError(dataState.error ?? "خطا در دریافت اطلاعات"));
    }
  }

  Future<void> _onChangeStatus(ChangeOccupationStatusEvent event, Emitter<OccupationState> emit) async {
    emit(OccupationLoading());
    final dataState = await _repository.changeOccupationStatus(event.id);
    if (dataState is DataSuccess) {
      emit(OccupationActionSuccess("وضعیت شغل با موفقیت تغییر یافت", dataState.data!));
    } else {
      emit(OccupationError(dataState.error ?? "خطا در تغییر وضعیت"));
    }
  }

  Future<void> _onMoveUp(MoveOccupationUpEvent event, Emitter<OccupationState> emit) async {
    emit(OccupationLoading());
    final dataState = await _repository.moveOccupationUp(event.id);
    if (dataState is DataSuccess) {
      emit(OccupationActionSuccess("اولویت شغل با موفقیت بالا رفت", dataState.data!));
    } else {
      emit(OccupationError(dataState.error ?? "خطا در جابجایی"));
    }
  }

  Future<void> _onMoveDown(MoveOccupationDownEvent event, Emitter<OccupationState> emit) async {
    emit(OccupationLoading());
    final dataState = await _repository.moveOccupationDown(event.id);
    if (dataState is DataSuccess) {
      emit(OccupationActionSuccess("اولویت شغل با موفقیت پایین آمد", dataState.data!));
    } else {
      emit(OccupationError(dataState.error ?? "خطا در جابجایی"));
    }
  }
}
