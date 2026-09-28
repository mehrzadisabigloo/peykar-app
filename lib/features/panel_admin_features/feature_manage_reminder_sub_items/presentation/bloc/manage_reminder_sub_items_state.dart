part of 'manage_reminder_sub_items_bloc.dart';

abstract class ManageReminderSubItemsState extends Equatable {
  final List<ManageReminderSubItemEntity> subItems;
  final int page;
  final bool hasMore;
  final String? errorMessage;
  final String? successMessage;
  final String? processingId;
  final String? deletingId;
  final String? editingId;
  final bool isSubmitting;
  final bool submissionSuccess;
  final String? reminderTypeId;

  const ManageReminderSubItemsState({
    this.subItems = const [],
    this.page = 1,
    this.hasMore = true,
    this.errorMessage,
    this.successMessage,
    this.processingId,
    this.deletingId,
    this.editingId,
    this.isSubmitting = false,
    this.submissionSuccess = false,
    this.reminderTypeId,
  });

  @override
  List<Object?> get props => [
    subItems,
    page,
    hasMore,
    errorMessage,
    successMessage,
    processingId,
    deletingId,
    editingId,
    isSubmitting,
    submissionSuccess,
    reminderTypeId,
  ];
}

class ManageReminderSubItemsInitial extends ManageReminderSubItemsState {
  const ManageReminderSubItemsInitial();
}

class ManageReminderSubItemsLoading extends ManageReminderSubItemsState {
  const ManageReminderSubItemsLoading({
    super.subItems,
    super.page,
    super.hasMore,
    super.reminderTypeId,
  });
}

class ManageReminderSubItemsLoaded extends ManageReminderSubItemsState {
  const ManageReminderSubItemsLoaded({
    required super.subItems,
    required super.page,
    required super.hasMore,
    super.errorMessage,
    super.successMessage,
    super.processingId,
    super.deletingId,
    super.editingId,
    super.isSubmitting,
    super.submissionSuccess,
    super.reminderTypeId,
  });

  ManageReminderSubItemsLoaded copyWith({
    List<ManageReminderSubItemEntity>? subItems,
    int? page,
    bool? hasMore,
    String? errorMessage,
    String? successMessage,
    String? processingId,
    String? deletingId,
    String? editingId,
    bool? isSubmitting,
    bool? submissionSuccess,
    String? reminderTypeId,
    bool clearMessages = false,
    bool clearProcessingId = false,
    bool clearDeletingId = false,
    bool clearEditingId = false,
  }) {
    return ManageReminderSubItemsLoaded(
      subItems: subItems ?? this.subItems,
      page: page ?? this.page,
      hasMore: hasMore ?? this.hasMore,
      errorMessage: errorMessage ?? (clearMessages ? null : this.errorMessage),
      successMessage: successMessage ?? (clearMessages ? null : this.successMessage),
      processingId: processingId ?? (clearProcessingId ? null : this.processingId),
      deletingId: deletingId ?? (clearDeletingId ? null : this.deletingId),
      editingId: editingId ?? (clearEditingId ? null : this.editingId),
      isSubmitting: isSubmitting ?? this.isSubmitting,
      submissionSuccess: submissionSuccess ?? this.submissionSuccess,
      reminderTypeId: reminderTypeId ?? this.reminderTypeId,
    );
  }
}

class ManageReminderSubItemsFailed extends ManageReminderSubItemsState {
  final String message;
  const ManageReminderSubItemsFailed(this.message, {
    super.subItems,
    super.page,
    super.hasMore,
    super.reminderTypeId,
  });

  @override
  List<Object?> get props => [...super.props, message];
}
