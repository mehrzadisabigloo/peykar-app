part of 'manage_reminder_types_bloc.dart';

abstract class ManageReminderTypesEvent extends Equatable {
  const ManageReminderTypesEvent();

  @override
  List<Object?> get props => [];
}

class FetchReminderTypes extends ManageReminderTypesEvent {
  final bool isRefresh;
  final String? title;

  const FetchReminderTypes({
    this.isRefresh = false,
    this.title,
  });

  @override
  List<Object?> get props => [isRefresh, title];
}

class LoadMoreReminderTypes extends ManageReminderTypesEvent {
  const LoadMoreReminderTypes();
}

class ChangeReminderTypeStatus extends ManageReminderTypesEvent {
  final String id;

  const ChangeReminderTypeStatus(this.id);

  @override
  List<Object?> get props => [id];
}

class DeleteReminderType extends ManageReminderTypesEvent {
  final String id;

  const DeleteReminderType(this.id);

  @override
  List<Object?> get props => [id];
}

class AddReminderTypeEvent extends ManageReminderTypesEvent {
  final String title;

  const AddReminderTypeEvent(this.title);

  @override
  List<Object?> get props => [title];
}

class EditReminderTypeEvent extends ManageReminderTypesEvent {
  final String id;
  final String title;

  const EditReminderTypeEvent(this.id, this.title);

  @override
  List<Object?> get props => [id, title];
}
