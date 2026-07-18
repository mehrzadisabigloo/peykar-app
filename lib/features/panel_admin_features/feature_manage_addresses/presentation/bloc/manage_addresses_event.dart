part of 'manage_addresses_bloc.dart';

abstract class ManageAddressesEvent extends Equatable {
  const ManageAddressesEvent();

  @override
  List<Object?> get props => [];
}

class FetchManageAddressesEvent extends ManageAddressesEvent {
  const FetchManageAddressesEvent();
}

class DeleteAddressEvent extends ManageAddressesEvent {
  final String id;
  const DeleteAddressEvent(this.id);

  @override
  List<Object?> get props => [id];
}
