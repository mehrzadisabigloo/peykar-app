part of 'manage_addresses_bloc.dart';

abstract class ManageAddressesState extends Equatable {
  const ManageAddressesState();

  @override
  List<Object?> get props => [];
}

class ManageAddressesInitial extends ManageAddressesState {
  const ManageAddressesInitial();
}

class ManageAddressesLoading extends ManageAddressesState {
  const ManageAddressesLoading();
}

class ManageAddressesLoaded extends ManageAddressesState {
  final List<AddressModel> addresses;
  final String? deletingId;
  const ManageAddressesLoaded(this.addresses, {this.deletingId});

  @override
  List<Object?> get props => [addresses, deletingId];
}

class ManageAddressesError extends ManageAddressesState {
  final String message;
  const ManageAddressesError(this.message);

  @override
  List<Object?> get props => [message];
}
