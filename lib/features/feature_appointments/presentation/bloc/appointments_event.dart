part of 'appointments_bloc.dart';

abstract class AppointmentsEvent extends Equatable {
  const AppointmentsEvent();

  @override
  List<Object?> get props => [];
}

class FetchAppointmentsEvent extends AppointmentsEvent {
  const FetchAppointmentsEvent();
}

class ChangeDateEvent extends AppointmentsEvent {
  final bool next;
  const ChangeDateEvent({required this.next});

  @override
  List<Object?> get props => [next];
}
