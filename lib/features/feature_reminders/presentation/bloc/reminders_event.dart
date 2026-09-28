part of 'reminders_bloc.dart';


abstract class RemindersEvent extends Equatable {
  const RemindersEvent();

  @override
  List<Object?> get props => [];
}

class FetchRemindersEvent extends RemindersEvent {
  final req.ListUserRemindersRequest? request;
  const FetchRemindersEvent({this.request});

  @override
  List<Object?> get props => [request];
}

class LoadMoreRemindersEvent extends RemindersEvent {
  const LoadMoreRemindersEvent();
}

class ClearReminderErrorToastEvent extends RemindersEvent {
  const ClearReminderErrorToastEvent();
}

class FilterRemindersEvent extends RemindersEvent {
  final ReminderType? type;
  const FilterRemindersEvent(this.type);

  @override
  List<Object?> get props => [type];
}

class AddReminderEvent extends RemindersEvent {
  final req.AddReminderRequest request;
  const AddReminderEvent(this.request);

  @override
  List<Object?> get props => [request];
}

class CompleteReminderEvent extends RemindersEvent {
  final String id;
  const CompleteReminderEvent(this.id);

  @override
  List<Object?> get props => [id];
}

class DeleteReminderEvent extends RemindersEvent {
  final String id;
  const DeleteReminderEvent(this.id);

  @override
  List<Object?> get props => [id];
}

class GetReminderEvent extends RemindersEvent {
  final String id;
  const GetReminderEvent(this.id);

  @override
  List<Object?> get props => [id];
}

class EditReminderEvent extends RemindersEvent {
  final String id;
  final req.AddReminderRequest request;
  const EditReminderEvent(this.id, this.request);

  @override
  List<Object?> get props => [id, request];
}

class AddKilometerLogEvent extends RemindersEvent {
  final String id;
  final req.KilometerLog log;
  const AddKilometerLogEvent(this.id, this.log);

  @override
  List<Object?> get props => [id, log];
}

class AddTimeLogEvent extends RemindersEvent {
  final String id;
  final req.TimeLog log;
  const AddTimeLogEvent(this.id, this.log);

  @override
  List<Object?> get props => [id, log];
}

class FetchServicesForReminderEvent extends RemindersEvent {
  const FetchServicesForReminderEvent();
}

class FetchActiveReminderTypesEvent extends RemindersEvent {
  const FetchActiveReminderTypesEvent();
}

class FetchSubItemsByReminderTypeEvent extends RemindersEvent {
  final String reminderTypeId;
  const FetchSubItemsByReminderTypeEvent(this.reminderTypeId);

  @override
  List<Object?> get props => [reminderTypeId];
}
