part of 'manage_reminder_sub_items_bloc.dart';

abstract class ManageReminderSubItemsEvent extends Equatable {
  const ManageReminderSubItemsEvent();

  @override
  List<Object?> get props => [];
}

class FetchReminderSubItems extends ManageReminderSubItemsEvent {
  final bool isRefresh;
  final String? reminderTypeId;
  final String? title;

  const FetchReminderSubItems({
    this.isRefresh = false,
    this.reminderTypeId,
    this.title,
  });

  @override
  List<Object?> get props => [isRefresh, reminderTypeId, title];
}

class LoadMoreReminderSubItems extends ManageReminderSubItemsEvent {
  const LoadMoreReminderSubItems();
}

class ChangeSubItemStatus extends ManageReminderSubItemsEvent {
  final String id;

  const ChangeSubItemStatus(this.id);

  @override
  List<Object?> get props => [id];
}

class DeleteSubItem extends ManageReminderSubItemsEvent {
  final String id;

  const DeleteSubItem(this.id);

  @override
  List<Object?> get props => [id];
}

class AddSubItemEvent extends ManageReminderSubItemsEvent {
  final String reminderTypeId;
  final String title;

  const AddSubItemEvent(this.reminderTypeId, this.title);

  @override
  List<Object?> get props => [reminderTypeId, title];
}

class AddSubItemsBulkEvent extends ManageReminderSubItemsEvent {
  final String reminderTypeId;
  final List<String> titles;

  const AddSubItemsBulkEvent(this.reminderTypeId, this.titles);

  @override
  List<Object?> get props => [reminderTypeId, titles];
}

class EditSubItemEvent extends ManageReminderSubItemsEvent {
  final String id;
  final String title;

  const EditSubItemEvent(this.id, this.title);

  @override
  List<Object?> get props => [id, title];
}
