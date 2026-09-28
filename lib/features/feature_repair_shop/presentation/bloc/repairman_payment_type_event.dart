part of 'repairman_payment_type_bloc.dart';

abstract class RepairmanPaymentTypeEvent extends Equatable {
  const RepairmanPaymentTypeEvent();

  @override
  List<Object?> get props => [];
}

class FetchMyPaymentTypesEvent extends RepairmanPaymentTypeEvent {}

class FetchAllActivePaymentTypesEvent extends RepairmanPaymentTypeEvent {}

class AddPaymentTypeEvent extends RepairmanPaymentTypeEvent {
  final int paymentTypeId;
  const AddPaymentTypeEvent(this.paymentTypeId);

  @override
  List<Object?> get props => [paymentTypeId];
}

class RemovePaymentTypeEvent extends RepairmanPaymentTypeEvent {
  final int paymentTypeId;
  const RemovePaymentTypeEvent(this.paymentTypeId);

  @override
  List<Object?> get props => [paymentTypeId];
}
