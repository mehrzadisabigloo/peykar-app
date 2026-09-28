part of 'create_time_slot_bloc.dart';

abstract class CreateTimeSlotEvent extends Equatable {
  const CreateTimeSlotEvent();
  @override
  List<Object?> get props => [];
}

class ChangeSelectedDateEvent extends CreateTimeSlotEvent {
  final Jalali date;
  const ChangeSelectedDateEvent(this.date);
  @override
  List<Object?> get props => [date];
}

class AddTimeSlotEvent extends CreateTimeSlotEvent {
  final String startTime;
  final String endTime;
  final int capacity;
  const AddTimeSlotEvent({
    required this.startTime,
    required this.endTime,
    required this.capacity,
  });
  @override
  List<Object?> get props => [startTime, endTime, capacity];
}

class FetchTimeSlotsEvent extends CreateTimeSlotEvent {
  final String date;
  final int page;
  final bool isRefresh;
  const FetchTimeSlotsEvent(this.date, {this.page = 1, this.isRefresh = true});
  @override
  List<Object?> get props => [date, page, isRefresh];
}

class DeleteTimeSlotEvent extends CreateTimeSlotEvent {
  final String timeSlotId;
  const DeleteTimeSlotEvent(this.timeSlotId);
  @override
  List<Object?> get props => [timeSlotId];
}

class ToggleCalendarEvent extends CreateTimeSlotEvent {
  const ToggleCalendarEvent();
}

class ChangeDateStepEvent extends CreateTimeSlotEvent {
  final bool next;
  const ChangeDateStepEvent({required this.next});
  @override
  List<Object?> get props => [next];
}

class ToggleDayStatusEvent extends CreateTimeSlotEvent {
  final bool activate;
  const ToggleDayStatusEvent({required this.activate});
  @override
  List<Object?> get props => [activate];
}
