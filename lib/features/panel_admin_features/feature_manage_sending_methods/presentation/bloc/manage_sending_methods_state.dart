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
  const ManageSendingMethodsLoaded(this.methods, {this.processingId});

  @override
  List<Object?> get props => [methods, processingId];
}

class ManageSendingMethodsError extends ManageSendingMethodsState {
  final String message;
  const ManageSendingMethodsError(this.message);

  @override
  List<Object?> get props => [message];
}
