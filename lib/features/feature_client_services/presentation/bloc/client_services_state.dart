part of 'client_services_bloc.dart';


abstract class ClientServicesState extends Equatable {
  const ClientServicesState();

  @override
  List<Object?> get props => [];
}

class ClientServicesInitial extends ClientServicesState {
  const ClientServicesInitial();
}

class ClientServicesLoading extends ClientServicesState {
  const ClientServicesLoading();
}

class ClientServicesLoaded extends ClientServicesState {
  final ClientServicesEntity entity;
  const ClientServicesLoaded(this.entity);

  @override
  List<Object?> get props => [entity];
}

class ClientServicesError extends ClientServicesState {
  final String message;
  const ClientServicesError(this.message);

  @override
  List<Object?> get props => [message];
}
