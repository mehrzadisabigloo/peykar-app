part of 'reminders_bloc.dart';


abstract class RemindersEvent extends Equatable {
  const RemindersEvent();

  @override
  List<Object?> get props => [];
}

class FetchRemindersEvent extends RemindersEvent {
  final ListUserRemindersRequest? request;
  const FetchRemindersEvent({this.request});

  @override
  List<Object?> get props => [request];
}

class FilterRemindersEvent extends RemindersEvent {
  final ReminderType? type;
  const FilterRemindersEvent(this.type);

  @override
  List<Object?> get props => [type];
}

class AddReminderEvent extends RemindersEvent {
  final AddReminderRequest request;
  const AddReminderEvent(this.request);

  @override
  List<Object?> get props => [request];
}
