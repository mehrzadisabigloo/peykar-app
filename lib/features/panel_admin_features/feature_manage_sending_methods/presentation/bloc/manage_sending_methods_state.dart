part of 'manage_sending_methods_bloc.dart';

abstract class ManageSendingMethodsState extends Equatable {
  const ManageSendingMethodsState();

  @override
  List<Object?> get props => [];
}

class ManageSendingMethodsInitial extends ManageSendingMethodsState {
  const ManageSendingMethodsInitial();
}

class ManageSendingMethodsLoading extends ManageSendingMethodsState {
  const ManageSendingMethodsLoading();
}

class ManageSendingMethodsLoaded extends ManageSendingMethodsState {
  final List<SendingMethodModel> methods;
  final String? processingId;
  final bool isDeleting;
  final String? errorMessage;
  final String? successMessage;

  const ManageSendingMethodsLoaded(
    this.methods, {
    this.processingId,
    this.isDeleting = false,
    this.errorMessage,
    this.successMessage,
  });

  ManageSendingMethodsLoaded copyWith({
    List<SendingMethodModel>? methods,
    String? processingId,
    bool? isDeleting,
    String? errorMessage,
    String? successMessage,
    bool clearMessages = false,
  }) {
    return ManageSendingMethodsLoaded(
      methods ?? this.methods,
      processingId: processingId ?? this.processingId,
      isDeleting: isDeleting ?? this.isDeleting,
      errorMessage: errorMessage ?? (clearMessages ? null : this.errorMessage),
      successMessage: successMessage ?? (clearMessages ? null : this.successMessage),
    );
  }

  @override
  List<Object?> get props => [methods, processingId, isDeleting, errorMessage, successMessage];
}

class ManageSendingMethodsError extends ManageSendingMethodsState {
  final String message;
  const ManageSendingMethodsError(this.message);

  @override
  List<Object?> get props => [message];
}
