import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import '../../../../core/bloc/base/base_bloc.dart';
import '../../../../core/utils/jalali_date.dart';
import '../../domain/repository/create_time_slot_repository.dart';
import '../../../../core/resources/data_state.dart';
import '../../data/model/time_slot_model.dart';
import '../../domain/entity/create_time_slot_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'create_time_slot_event.dart';
part 'create_time_slot_state.dart';

class CreateTimeSlotBloc extends BaseBloc<CreateTimeSlotEvent, CreateTimeSlotState> {
  final CreateTimeSlotRepository createTimeSlotRepository;

  CreateTimeSlotBloc(this.createTimeSlotRepository)
      : super(CreateTimeSlotInitial(selectedDate: Jalali.fromDateTime(DateTime.now()))) {
    
    on<ChangeSelectedDateEvent>(_onChangeSelectedDate);
    on<AddTimeSlotEvent>(_onAddTimeSlot);
    on<FetchTimeSlotsEvent>(_onFetchTimeSlots);
    on<DeleteTimeSlotEvent>(_onDeleteTimeSlot);
    on<ToggleDayStatusEvent>(_onToggleDayStatus);
    on<ToggleCalendarEvent>(_onToggleCalendar);
    on<ChangeDateStepEvent>(_onChangeDateStep);
  }

  void _onToggleCalendar(ToggleCalendarEvent event, Emitter<CreateTimeSlotState> emit) {
    if (state is CreateTimeSlotInitial) {
      final currentState = state as CreateTimeSlotInitial;
      emit(currentState.copyWith(showCalendar: !currentState.showCalendar));
    }
  }

  void _onChangeDateStep(ChangeDateStepEvent event, Emitter<CreateTimeSlotState> emit) {
    if (state is CreateTimeSlotInitial) {
      final currentState = state as CreateTimeSlotInitial;
      final currentDateTime = currentState.selectedDate.toDateTime();
      final newDateTime = event.next
          ? currentDateTime.add(const Duration(days: 1))
          : currentDateTime.subtract(const Duration(days: 1));
      final newJalali = Jalali.fromDateTime(newDateTime);
      emit(currentState.copyWith(selectedDate: newJalali, clearStatus: true));
      add(FetchTimeSlotsEvent(_formatJalali(newJalali)));
    }
  }

  void _onChangeSelectedDate(ChangeSelectedDateEvent event, Emitter<CreateTimeSlotState> emit) {
    if (state is CreateTimeSlotInitial) {
      final currentState = state as CreateTimeSlotInitial;
      emit(currentState.copyWith(selectedDate: event.date, showCalendar: false, clearStatus: true));
      add(FetchTimeSlotsEvent(_formatJalali(event.date)));
    }
  }

  Future<void> _onAddTimeSlot(AddTimeSlotEvent event, Emitter<CreateTimeSlotState> emit) async {
    if (state is CreateTimeSlotInitial) {
      final currentState = state as CreateTimeSlotInitial;
      emit(currentState.copyWith(isLoading: true, clearStatus: true));

      final dateStr = _formatJalali(currentState.selectedDate);
      final timeSlotsReq = [
        {
          'start_time': event.startTime,
          'end_time': event.endTime,
          'capacity': event.capacity,
        }
      ];

      final dataState = await createTimeSlotRepository.createTimeSlots(
        date: dateStr,
        timeSlots: timeSlotsReq,
      );

      if (dataState is DataSuccess) {
        emit(currentState.copyWith(
          successMessage: dataState.data?['message'] ?? "زمان‌بندی با موفقیت ثبت شد",
          isLoading: false,
        ));
        add(FetchTimeSlotsEvent(dateStr));
      } else {
        emit(currentState.copyWith(
          error: dataState.error,
          isFetchError: false,
          isLoading: false,
        ));
      }
    }
  }

  Future<void> _onFetchTimeSlots(FetchTimeSlotsEvent event, Emitter<CreateTimeSlotState> emit) async {
    if (state is CreateTimeSlotInitial) {
      final currentState = state as CreateTimeSlotInitial;
      
      if (event.isRefresh) {
        emit(currentState.copyWith(isLoading: true, clearStatus: true, remoteSlots: []));
      } else {
        if (!currentState.hasNextPage) return;
        emit(currentState.copyWith(isLoading: true));
      }

      final dataState = await createTimeSlotRepository.getRepairmanTimeSlots(
        date: event.date,
        status: 'active',
        page: event.page,
        isPaginate: true,
      );

      if (dataState is DataSuccess) {
        final List<dynamic> rawData = dataState.data?['data'] ?? [];
        final List<TimeSlotEntity> newSlots = rawData.map((json) => TimeSlotModel.fromJson(json).toEntity()).toList();
        
        final List<TimeSlotEntity> updatedRemoteSlots = event.isRefresh 
            ? newSlots 
            : [...currentState.remoteSlots, ...newSlots];

        emit(currentState.copyWith(
          remoteSlots: updatedRemoteSlots,
          isLoading: false,
          currentPage: dataState.data?['current_page'] ?? event.page,
          hasNextPage: dataState.data?['next_page_url'] != null,
        ));
      } else {
        emit(currentState.copyWith(
          error: dataState.error,
          isFetchError: true,
          isLoading: false,
        ));
      }
    }
  }

  Future<void> _onDeleteTimeSlot(DeleteTimeSlotEvent event, Emitter<CreateTimeSlotState> emit) async {
    if (state is CreateTimeSlotInitial) {
      final currentState = state as CreateTimeSlotInitial;
      emit(currentState.copyWith(isDeleting: true, deletingSlotId: event.timeSlotId, clearStatus: true));

      final dataState = await createTimeSlotRepository.deleteTimeSlot(event.timeSlotId);

      if (dataState is DataSuccess) {
        emit(currentState.copyWith(
          successMessage: "بازه زمانی با موفقیت حذف شد",
          isDeleting: false,
          deletingSlotId: null,
        ));
        add(FetchTimeSlotsEvent(_formatJalali(currentState.selectedDate)));
      } else {
        emit(currentState.copyWith(
          error: dataState.error,
          isFetchError: false,
          isDeleting: false,
          deletingSlotId: null,
        ));
      }
    }
  }

  Future<void> _onToggleDayStatus(ToggleDayStatusEvent event, Emitter<CreateTimeSlotState> emit) async {
    if (state is CreateTimeSlotInitial) {
      final currentState = state as CreateTimeSlotInitial;
      emit(currentState.copyWith(isLoading: true, clearStatus: true));

      final dateStr = _formatJalali(currentState.selectedDate);
      final dataState = event.activate
          ? await createTimeSlotRepository.activateDay(dateStr)
          : await createTimeSlotRepository.deactivateDay(dateStr);

      if (dataState is DataSuccess) {
        emit(currentState.copyWith(
          successMessage: event.activate ? "روز با موفقیت فعال شد" : "روز با موفقیت غیرفعال شد",
          isLoading: false,
        ));
        add(FetchTimeSlotsEvent(dateStr));
      } else {
        emit(currentState.copyWith(
          error: dataState.error,
          isFetchError: false,
          isLoading: false,
        ));
      }
    }
  }

  String _formatJalali(Jalali date) {
    return "${date.year}/${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}";
  }
}
