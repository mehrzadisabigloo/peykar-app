part of 'manage_services_bloc.dart';


abstract class ManageServicesEvent extends Equatable {
  const ManageServicesEvent();

  @override
  List<Object?> get props => [];
}

class FetchManageServicesDataEvent extends ManageServicesEvent {
  const FetchManageServicesDataEvent();
}
