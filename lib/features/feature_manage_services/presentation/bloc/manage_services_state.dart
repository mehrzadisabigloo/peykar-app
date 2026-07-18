part of 'manage_services_bloc.dart';


abstract class ManageServicesState extends Equatable {
  const ManageServicesState();

  @override
  List<Object?> get props => [];
}

class ManageServicesInitial extends ManageServicesState {
  const ManageServicesInitial();
}

class ManageServicesLoading extends ManageServicesState {
  const ManageServicesLoading();
}

class ManageServicesLoaded extends ManageServicesState {
  final List<ManageServicesEntity> services;
  const ManageServicesLoaded(this.services);

  @override
  List<Object?> get props => [services];
}

class ManageServicesError extends ManageServicesState {
  final String message;
  const ManageServicesError(this.message);

  @override
  List<Object?> get props => [message];
}
