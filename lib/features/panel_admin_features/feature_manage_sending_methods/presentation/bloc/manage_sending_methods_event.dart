part of 'manage_sending_methods_bloc.dart';

abstract class ManageSendingMethodsEvent extends Equatable {
  const ManageSendingMethodsEvent();

  @override
  List<Object?> get props => [];
}

class FetchSendingMethodsEvent extends ManageSendingMethodsEvent {
  const FetchSendingMethodsEvent();
}

class DeleteSendingMethodEvent extends ManageSendingMethodsEvent {
  final String id;
  const DeleteSendingMethodEvent(this.id);

  @override
  List<Object?> get props => [id];
}

class ChangeSendingMethodStatusEvent extends ManageSendingMethodsEvent {
  final String id;
  const ChangeSendingMethodStatusEvent(this.id);

  @override
  List<Object?> get props => [id];
}
