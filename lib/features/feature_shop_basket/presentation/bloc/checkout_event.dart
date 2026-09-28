import 'package:equatable/equatable.dart';

abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();
  @override
  List<Object?> get props => [];
}

class FetchCheckoutInitialDataEvent extends CheckoutEvent {
  final List<String> repairmanIds;
  const FetchCheckoutInitialDataEvent(this.repairmanIds);
  @override
  List<Object?> get props => [repairmanIds];
}

class SelectAddressEvent extends CheckoutEvent {
  final String repairmanId;
  final String addressId;
  const SelectAddressEvent(this.repairmanId, this.addressId);
  @override
  List<Object?> get props => [repairmanId, addressId];
}

class SelectShopPaymentMethodEvent extends CheckoutEvent {
  final String repairmanId;
  final int paymentTypeId;
  const SelectShopPaymentMethodEvent(this.repairmanId, this.paymentTypeId);
  @override
  List<Object?> get props => [repairmanId, paymentTypeId];
}

class ApplyDiscountEvent extends CheckoutEvent {
  final String repairmanId;
  final String code;
  const ApplyDiscountEvent(this.repairmanId, this.code);
  @override
  List<Object?> get props => [repairmanId, code];
}

class SubmitShopOrderEvent extends CheckoutEvent {
  final String repairmanId;
  const SubmitShopOrderEvent(this.repairmanId);
  @override
  List<Object?> get props => [repairmanId];
}
