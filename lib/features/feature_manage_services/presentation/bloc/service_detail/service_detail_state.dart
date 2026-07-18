part of 'service_detail_bloc.dart';


abstract class ServiceDetailState extends Equatable {
  const ServiceDetailState();

  @override
  List<Object?> get props => [];
}

class ServiceDetailInitial extends ServiceDetailState {
  const ServiceDetailInitial();
}

class ServiceDetailLoading extends ServiceDetailState {
  const ServiceDetailLoading();
}

class ServiceDetailLoaded extends ServiceDetailState {
  final ManageServicesEntity service;
  const ServiceDetailLoaded(this.service);

  @override
  List<Object?> get props => [service];
}

class ServiceDetailError extends ServiceDetailState {
  final String message;
  const ServiceDetailError(this.message);

  @override
  List<Object?> get props => [message];
}
