part of 'reminders_bloc.dart';


abstract class RemindersState extends Equatable {
  const RemindersState();

  @override
  List<Object?> get props => [];
}

class RemindersInitial extends RemindersState {
  const RemindersInitial();
}

class RemindersLoading extends RemindersState {
  const RemindersLoading();
}

class RemindersLoaded extends RemindersState {
  final List<RemindersEntity> allReminders;
  final List<RemindersEntity> filteredReminders;
  final ReminderType? currentType;

  const RemindersLoaded({
    required this.allReminders,
    required this.filteredReminders,
    this.currentType,
  });

  @override
  List<Object?> get props => [allReminders, filteredReminders, currentType];
}

class RemindersError extends RemindersState {
  final String message;
  const RemindersError(this.message);

  @override
  List<Object?> get props => [message];
}

class AddReminderLoading extends RemindersState {
  const AddReminderLoading();
}

class AddReminderSuccess extends RemindersState {
  final dynamic result;
  const AddReminderSuccess(this.result);

  @override
  List<Object?> get props => [result];
}

class AddReminderError extends RemindersState {
  final String message;
  const AddReminderError(this.message);

  @override
  List<Object?> get props => [message];
}
