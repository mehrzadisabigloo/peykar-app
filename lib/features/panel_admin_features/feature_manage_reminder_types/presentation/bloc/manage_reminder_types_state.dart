part of 'manage_reminder_types_bloc.dart';

abstract class ManageReminderTypesState extends Equatable {
  final List<ManageReminderTypeEntity> reminderTypes;
  final int page;
  final bool hasMore;
  final String? errorMessage;
  final String? successMessage;
  final String? processingId;
  final String? deletingId;
  final String? editingId;
  final bool isSubmitting;
  final bool submissionSuccess;

  const ManageReminderTypesState({
    this.reminderTypes = const [],
    this.page = 1,
    this.hasMore = true,
    this.errorMessage,
    this.successMessage,
    this.processingId,
    this.deletingId,
    this.editingId,
    this.isSubmitting = false,
    this.submissionSuccess = false,
  });

  @override
  List<Object?> get props => [
    reminderTypes,
    page,
    hasMore,
    errorMessage,
    successMessage,
    processingId,
    deletingId,
    editingId,
    isSubmitting,
    submissionSuccess,
  ];
}

class ManageReminderTypesInitial extends ManageReminderTypesState {
  const ManageReminderTypesInitial();
}

class ManageReminderTypesLoading extends ManageReminderTypesState {
  const ManageReminderTypesLoading({
    super.reminderTypes,
    super.page,
    super.hasMore,
  });
}

class ManageReminderTypesLoaded extends ManageReminderTypesState {
  const ManageReminderTypesLoaded({
    required super.reminderTypes,
    required super.page,
    required super.hasMore,
    super.errorMessage,
    super.successMessage,
    super.processingId,
    super.deletingId,
    super.editingId,
    super.isSubmitting,
    super.submissionSuccess,
  });

  ManageReminderTypesLoaded copyWith({
    List<ManageReminderTypeEntity>? reminderTypes,
    int? page,
    bool? hasMore,
    String? errorMessage,
    String? successMessage,
    String? processingId,
    String? deletingId,
    String? editingId,
    bool? isSubmitting,
    bool? submissionSuccess,
    bool clearMessages = false,
    bool clearProcessingId = false,
    bool clearDeletingId = false,
    bool clearEditingId = false,
  }) {
    return ManageReminderTypesLoaded(
      reminderTypes: reminderTypes ?? this.reminderTypes,
      page: page ?? this.page,
      hasMore: hasMore ?? this.hasMore,
      errorMessage: errorMessage ?? (clearMessages ? null : this.errorMessage),
      successMessage: successMessage ?? (clearMessages ? null : this.successMessage),
      processingId: processingId ?? (clearProcessingId ? null : this.processingId),
      deletingId: deletingId ?? (clearDeletingId ? null : this.deletingId),
      editingId: editingId ?? (clearEditingId ? null : this.editingId),
      isSubmitting: isSubmitting ?? this.isSubmitting,
      submissionSuccess: submissionSuccess ?? this.submissionSuccess,
    );
  }
}

class ManageReminderTypesFailed extends ManageReminderTypesState {
  final String message;
  const ManageReminderTypesFailed(this.message, {
    super.reminderTypes,
    super.page,
    super.hasMore,
  });

  @override
  List<Object?> get props => [...super.props, message];
}
