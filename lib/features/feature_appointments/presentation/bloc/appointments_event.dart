part of 'appointments_bloc.dart';

abstract class AppointmentsEvent extends Equatable {
  const AppointmentsEvent();

  @override
  List<Object?> get props => [];
}

class FetchAppointmentsEvent extends AppointmentsEvent {
  final String? role;
  final String? repairmanId;
  final DateTime? initialDate;
  const FetchAppointmentsEvent({this.role, this.repairmanId, this.initialDate});

  @override
  List<Object?> get props => [role, repairmanId, initialDate];
}

class LoadMoreAppointmentsEvent extends AppointmentsEvent {
  final String? role;
  final String? repairmanId;
  const LoadMoreAppointmentsEvent({this.role, this.repairmanId});

  @override
  List<Object?> get props => [role, repairmanId];
}

class ChangeDateEvent extends AppointmentsEvent {
  final bool next;
  final String? role;
  const ChangeDateEvent({required this.next, this.role});

  @override
  List<Object?> get props => [next, role];
}

class SelectDateEvent extends AppointmentsEvent {
  final DateTime date;
  const SelectDateEvent(this.date);

  @override
  List<Object?> get props => [date];
}

class ToggleDatePickerEvent extends AppointmentsEvent {
  const ToggleDatePickerEvent();
}

class CompleteAppointmentEvent extends AppointmentsEvent {
  final String appointmentId;
  const CompleteAppointmentEvent(this.appointmentId);

  @override
  List<Object?> get props => [appointmentId];
}

class AcceptAppointmentEvent extends AppointmentsEvent {
  final String appointmentId;
  const AcceptAppointmentEvent(this.appointmentId);

  @override
  List<Object?> get props => [appointmentId];
}

class DeclineAppointmentEvent extends AppointmentsEvent {
  final String appointmentId;
  const DeclineAppointmentEvent(this.appointmentId);

  @override
  List<Object?> get props => [appointmentId];
}

class SubmitRatingEvent extends AppointmentsEvent {
  final String repairmanId;
  final int score;
  final String description;

  const SubmitRatingEvent({
    required this.repairmanId,
    required this.score,
    required this.description,
  });

  @override
  List<Object?> get props => [repairmanId, score, description];
}

class ClearErrorToastEvent extends AppointmentsEvent {
  const ClearErrorToastEvent();
}
