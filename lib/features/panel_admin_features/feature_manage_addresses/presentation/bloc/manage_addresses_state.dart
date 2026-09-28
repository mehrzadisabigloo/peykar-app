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
  final String? successMessage;
  final String? errorMessage;

  const ManageAddressesLoaded(
    this.addresses, {
    this.deletingId,
    this.successMessage,
    this.errorMessage,
  });

  ManageAddressesLoaded copyWith({
    List<AddressModel>? addresses,
    String? deletingId,
    String? successMessage,
    String? errorMessage,
    bool clearDeletingId = false,
    bool clearMessages = false,
  }) {
    return ManageAddressesLoaded(
      addresses ?? this.addresses,
      deletingId: deletingId ?? (clearDeletingId ? null : this.deletingId),
      successMessage: successMessage ?? (clearMessages ? null : this.successMessage),
      errorMessage: errorMessage ?? (clearMessages ? null : this.errorMessage),
    );
  }

  @override
  List<Object?> get props => [addresses, deletingId, successMessage, errorMessage];
}

class ManageAddressesError extends ManageAddressesState {
  final String message;
  const ManageAddressesError(this.message);

  @override
  List<Object?> get props => [message];
}
