part of 'client_services_bloc.dart';


abstract class ClientServicesEvent extends Equatable {
  const ClientServicesEvent();

  @override
  List<Object?> get props => [];
}

class FetchClientServicesDataEvent extends ClientServicesEvent {
  const FetchClientServicesDataEvent();
}
