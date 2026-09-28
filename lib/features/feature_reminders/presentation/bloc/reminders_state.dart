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
  final bool hasMore;
  final int total;
  final String? errorToastMessage;

  const RemindersLoaded({
    required this.allReminders,
    required this.filteredReminders,
    this.currentType,
    this.hasMore = false,
    this.total = 0,
    this.errorToastMessage,
  });

  RemindersLoaded copyWith({
    List<RemindersEntity>? allReminders,
    List<RemindersEntity>? filteredReminders,
    ReminderType? currentType,
    bool? hasMore,
    int? total,
    String? errorToastMessage,
    bool clearErrorToast = false,
    bool overrideType = false, // Add this flag
  }) {
    return RemindersLoaded(
      allReminders: allReminders ?? this.allReminders,
      filteredReminders: filteredReminders ?? this.filteredReminders,
      currentType: overrideType ? currentType : (currentType ?? this.currentType),
      hasMore: hasMore ?? this.hasMore,
      total: total ?? this.total,
      errorToastMessage: clearErrorToast ? null : (errorToastMessage ?? this.errorToastMessage),
    );
  }

  @override
  List<Object?> get props => [allReminders, filteredReminders, currentType, hasMore, total, errorToastMessage];
}

class RemindersLoadingMore extends RemindersState {
  final List<RemindersEntity> allReminders;
  final List<RemindersEntity> filteredReminders;
  final ReminderType? currentType;
  final bool hasMore;
  final int total;

  const RemindersLoadingMore({
    required this.allReminders,
    required this.filteredReminders,
    this.hasMore = false,
    this.total = 0,
    this.currentType,
  });

  @override
  List<Object?> get props => [allReminders, filteredReminders, currentType, hasMore, total];
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

class CompleteReminderLoading extends RemindersState {
  const CompleteReminderLoading();
}

class CompleteReminderSuccess extends RemindersState {
  final dynamic result;
  const CompleteReminderSuccess(this.result);

  @override
  List<Object?> get props => [result];
}

class CompleteReminderError extends RemindersState {
  final String message;
  const CompleteReminderError(this.message);

  @override
  List<Object?> get props => [message];
}

class DeleteReminderLoading extends RemindersState {
  const DeleteReminderLoading();
}

class DeleteReminderSuccess extends RemindersState {
  final dynamic result;
  const DeleteReminderSuccess(this.result);

  @override
  List<Object?> get props => [result];
}

class DeleteReminderError extends RemindersState {
  final String message;
  const DeleteReminderError(this.message);

  @override
  List<Object?> get props => [message];
}

class GetReminderLoading extends RemindersState {
  const GetReminderLoading();
}

class GetReminderSuccess extends RemindersState {
  final RemindersEntity reminder;
  const GetReminderSuccess(this.reminder);

  @override
  List<Object?> get props => [reminder];
}

class GetReminderError extends RemindersState {
  final String message;
  const GetReminderError(this.message);

  @override
  List<Object?> get props => [message];
}

class EditReminderLoading extends RemindersState {
  const EditReminderLoading();
}

class EditReminderSuccess extends RemindersState {
  final dynamic result;
  const EditReminderSuccess(this.result);

  @override
  List<Object?> get props => [result];
}

class EditReminderError extends RemindersState {
  final String message;
  const EditReminderError(this.message);

  @override
  List<Object?> get props => [message];
}

class AddLogLoading extends RemindersState {
  const AddLogLoading();
}

class AddLogSuccess extends RemindersState {
  final dynamic result;
  const AddLogSuccess(this.result);

  @override
  List<Object?> get props => [result];
}

class AddLogError extends RemindersState {
  final String message;
  const AddLogError(this.message);

  @override
  List<Object?> get props => [message];
}

class ServicesForReminderLoaded extends RemindersState {
  final List<dynamic> services;
  const ServicesForReminderLoaded(this.services);

  @override
  List<Object?> get props => [services];
}

class ServicesForReminderError extends RemindersState {
  final String message;
  const ServicesForReminderError(this.message);

  @override
  List<Object?> get props => [message];
}

class ActiveReminderTypesLoaded extends RemindersState {
  final List<ReminderTypeEntity> reminderTypes;
  const ActiveReminderTypesLoaded(this.reminderTypes);

  @override
  List<Object?> get props => [reminderTypes];
}

class ActiveReminderTypesError extends RemindersState {
  final String message;
  const ActiveReminderTypesError(this.message);

  @override
  List<Object?> get props => [message];
}

class SubItemsByReminderTypeLoaded extends RemindersState {
  final List<ReminderSubItemEntity> subItems;
  const SubItemsByReminderTypeLoaded(this.subItems);

  @override
  List<Object?> get props => [subItems];
}

class SubItemsByReminderTypeError extends RemindersState {
  final String message;
  const SubItemsByReminderTypeError(this.message);

  @override
  List<Object?> get props => [message];
}
