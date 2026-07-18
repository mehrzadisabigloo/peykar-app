import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/bloc/base/base_bloc.dart';
import '../../domain/entity/reminders_entity.dart';
import '../../domain/repository/reminders_repository.dart';
import '../../../../core/resources/data_state.dart';
import '../../data/model/reminder_request_models.dart';
import 'package:equatable/equatable.dart';

part 'reminders_event.dart';
part 'reminders_state.dart';

class RemindersBloc extends BaseBloc<RemindersEvent, RemindersState> {
  final RemindersRepository remindersRepository;

  RemindersBloc(this.remindersRepository) : super(const RemindersInitial()) {
    on<FetchRemindersEvent>(_onFetchReminders);
    on<FilterRemindersEvent>(_onFilterReminders);
    on<AddReminderEvent>(_onAddReminder);
  }

  Future<void> _onFetchReminders(FetchRemindersEvent event, Emitter<RemindersState> emit) async {
    emit(const RemindersLoading());
    final request = event.request ?? ListUserRemindersRequest(isPaginate: false);
    final dataState = await remindersRepository.fetchReminders(request);

    if (dataState is DataSuccess) {
      emit(RemindersLoaded(
        allReminders: dataState.data!,
        filteredReminders: dataState.data!,
      ));
    } else {
      emit(RemindersError(dataState.error ?? "خطا در دریافت یادآورها"));
    }
  }

  void _onFilterReminders(FilterRemindersEvent event, Emitter<RemindersState> emit) {
    if (state is RemindersLoaded) {
      final currentState = state as RemindersLoaded;
      List<RemindersEntity> filtered;
      if (event.type == null) {
        filtered = currentState.allReminders;
      } else {
        filtered = currentState.allReminders.where((r) => r.type == event.type).toList();
      }
      emit(RemindersLoaded(
        allReminders: currentState.allReminders,
        filteredReminders: filtered,
        currentType: event.type,
      ));
    }
  }

  Future<void> _onAddReminder(AddReminderEvent event, Emitter<RemindersState> emit) async {
    emit(const AddReminderLoading());
    final dataState = await remindersRepository.addReminder(event.request);

    if (dataState is DataSuccess) {
      emit(AddReminderSuccess(dataState.data));
    } else {
      emit(AddReminderError(dataState.error ?? "خطا در ثبت یادآور"));
    }
  }
}
